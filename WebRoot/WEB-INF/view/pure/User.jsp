<%@page import="java.util.List,net.sf.json.JsonConfig,net.sf.json.*,net.sf.json.JSONObject,net.sf.json.processors.JsonBeanProcessor,com.bonc.pure.domain.*,com.bonc.pure.PureUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<b:doctype/>
<html>
<head>
<s:head />
<s:head template="head_ext.ftl" />
<script type="text/javascript" src="<s:url value="/struts/xheditor/xheditor-zh-cn.min.js"/>"></script>
</head>
<body>
	<b:appletBox title="用户管理" showMM="false" />
	
	<s:form action="User">
		<table class="form">
			<tr>
				<td>用户登录号:<s:textfield name="loginId" /></td>
				<td>用户姓名:<s:textfield name="userName" /></td>
				<td>数据权限:
				   <s:textfield id="orgTextField" name="orgName"   readonly="true" />
			       <input id="orgId" type="hidden" name="orgId" value="${orgId }">
				</td>
				<td>创建人:<s:textfield name="createrName" /></td>
				<td>性别:<s:select name="sex" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@SexOptions" headerKey="" headerValue="全部"/></td>
				<td>用户状态:<s:select name="state" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@getStateOptions()" headerKey="" headerValue="全部"/></td>
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>

	<div class="operation-container">
		<p:auth resourcesId="PURE_USER" optType="<%=PureUtils.AUTH_CREATE %>">
			<a href="User!create.action" class="icon-vcard-add">新增</a>
		</p:auth>
	   <p:auth resourcesId="PURE_USER" optType="<%=PureUtils.AUTH_DELETE %>">
	        <a class="icon-vcard-unlock" id="on-btn">启用</a>
		   <s:if test="@com.bonc.pure.SystemConfigProperty@CHECK_LOCK">
			<a class="icon-vcard-lock" id="lock-btn">锁定</a>
		   </s:if>
			<a class="icon-vcard-delete" id="del-btn">停用</a>
		</p:auth>
	</div>

	<s:actionerror />
	<s:actionmessage/>
	
	<form <p:auth resourcesId="PURE_USER" optType="<%=PureUtils.AUTH_DELETE %>">action="User!delete.action"</p:auth> id="listForm">
		<table class="grid">
			<thead>
				<b:gHead action="User">
					<tr>
						<p:auth resourcesId="PURE_USER" optType="<%=PureUtils.AUTH_DELETE %>"><th style="width:30px"><input type="checkbox" id="checkAll"/></th></p:auth>
						<th style="width:40px">全选</th>
						<th><b:gh col="loginId">登录用户名</b:gh></th>
						<th><b:gh col="userName">用户姓名</b:gh></th>
						<th><b:gh col="org">数据权限</b:gh></th>
						<th style="width:50px"><b:gh col="sex">性别</b:gh></th>
						<th style="width:80px"><b:gh col="state">用户状态</b:gh></th>
						<th style="width:180px"><b:gh col="regDate">注册时间</b:gh></th>
						<th style="width:100px"><b:gh col="creater">创建人</b:gh></th>
						<th style="width:170px;"></th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
			  <s:if test="dataList==null||dataList.size()==0">
			     <tr><td colspan="12" style="text-align:center;">没有符合条件的用户信息</td></tr>
			  </s:if>
			  <s:else>
				<s:iterator value="dataList" status="rowstatus">
					<tr class="${rowstatus.odd?'odd':'even'}">
						<td align="center"><input type="checkbox" value="${userId}" name="ids"/></td>
						<td class="text-center grid-row-number">${pagiParam.firstResult+rowstatus.index+1}.</td>
						<td>${loginId}</td>
						<td>${userName}</td>
						<td>${org.orgName}</td>
						<td><s:property value="@com.bonc.pure.PureUtils@SexOptions.{?#this.key== #attr.sex}[0].value"/></td>
						<td><s:property value="@com.bonc.pure.PureUtils@getStateOptions().{?#this.key== #attr.state}[0].value"/></td>
						<td class="date"><fmt:formatDate value="${regDate}" type="date" pattern="yyyy-MM-dd"/></td>
					    <td><s:if test="creater==null"></s:if><s:else>${creater.userName}</s:else></td>
						<td class="text-center operation-data-row">
							<p:auth resourcesId="PURE_USER" optType="<%=PureUtils.AUTH_UPDATE %>"><a href="User!update.action?id=${userId}" class="icon-vcard-edit">编辑</a></p:auth>
							<p:auth resourcesId="PURE_USER_PERMISSION" optType="<%=PureUtils.AUTH_AUTH %>"><a href="UserPermission.action?userId=${userId}" class="icon-vcard-role">授权</a></p:auth>
						</td>
					</tr>
				</s:iterator>
			  </s:else>
			</tbody>
		</table>
	</form>
	<b:pagiLink action="User" />
	
	<script type="text/javascript">
	<%
	Object tree = request.getAttribute("tree");  
	if(null != tree){
	    JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonBeanProcessor(Org.class,
				new JsonBeanProcessor() {
					public JSONObject processBean(Object o, JsonConfig jsonConfig) {
						if (o==null||!(o instanceof Org)) {
							return new JSONObject(true);
						}
						Org bean = (Org) o;
						JSONObject json = new JSONObject()
								.element("id",bean.getOrgId())
								.element("text", bean.getOrgName())
								.element("parentId", bean.getParentId())
								.element("path", bean.getPath())
								.element("leaf",bean.getChildren()==null)
								.element("children", JSONSerializer.toJSON(bean.getChildren(), jsonConfig).toString());
						return json;
					}
				}
		);
	   %>
		//组织机构树
		var tree=new Bonc.FormExt.TreeClickSelect({
				arg:'post',
				title:'选择机构',
				jsonConfig:true,
				showTbar:true,
			    descInputId:'orgTextField',
				inputId:'orgId',
			    root:new Ext.tree.AsyncTreeNode(<%=JSONSerializer.toJSON(tree, jsonConfig).toString()%>)
		});
	<%}%>
	</script>
	
	<p:auth resourcesId="PURE_USER" optType="<%=PureUtils.AUTH_DELETE %>">
	<script type="text/javascript">    
	$j('#checkAll').bindCheckAll(':checkbox[name="ids"]');
	var submit=function(url,param){
  		var form=jQuery('<form id=\"_submit_window\" action="'+url+'" method="post"></form>');
		for(var key in param){
			if(key=='ids'){
            var val=param[key];		
				for(var i=0;i<val.length;i++){
					var input=jQuery("<input name='"+key+"' type='hidden' value='"+val[i]+"'>");
					form.append(input);
				}
			}else{
				var input=jQuery("<input name='"+key+"' type='hidden' value='"+param[key]+"'>");
			}
			form.append(input);
		}
		jQuery("body").append(form);
		jQuery("#_submit_window").submit();
		jQuery("#_submit_window").remove();
  	};
	//获取选中的行
	var getChecked=function(){
		var userIds=new Array(), ids=jQuery(':checkbox[name="ids"]');
		  for(var i=0;i<ids.length;i++){
		         if(ids[i].checked){
		        	 userIds.push(ids[i].value);
		       }
		    } 
		  return userIds;
	}
	$j('#on-btn').click(function(){
		  var ids=getChecked();
		  if(null==ids||ids.length==0){
			  confirm('请选择要启用的用户!');
		  }else{
		  if (confirm('您确认要启用所选用户吗？')) {
			  submit(Bonc.toFullPath('/pure/User!updateUserState.action'),{'ids':ids,'state':<%=PureUtils.State.ON.getKey()%>});
			}
		  }
	});
	<s:if test="@com.bonc.pure.SystemConfigProperty@CHECK_LOCK">
	$j('#lock-btn').click(function(){
		  var ids=getChecked();
		  if(null==ids||ids.length==0){
			  confirm('请选择要锁定的用户!');
		  }else{
		    if (confirm('您确认要锁定所选用户吗？')) {
			  submit(Bonc.toFullPath('/pure/User!updateUserState.action'),{'ids':ids,'state':<%=PureUtils.State.LOCK.getKey()%>});
			}
		  }
	});
	</s:if>
	$j('#del-btn').click(function(){
		  var ids=getChecked();
		  if(null==ids||ids.length==0){
			  confirm('请选择要停用的用户!');
		  }else{
		  if (confirm('您确认要停用所选用户吗？')) {
			  submit(Bonc.toFullPath('/pure/User!updateUserState.action'),{'ids':ids,'state':<%=PureUtils.State.OFF.getKey()%>});
			}
		  }
	});
	</script>
	</p:auth>
</body>
</html>