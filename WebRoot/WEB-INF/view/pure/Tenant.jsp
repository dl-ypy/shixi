<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.bonc.pure.PureUtils"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype/>
<html>
<head>
<s:head />
</head>
<body>
	<b:appletBox title="租户管理" showMM="false" />
	
	<s:form action="Tenant">
		<table class="form">
			<tr>
				<td>租户编码:<s:textfield name="tenantId" /></td>
				<td>租户名称:<s:textfield name="tenantName" /></td>
				<td>租户URL:<s:textfield name="tenantURL" /></td>
				<td>租户状态:<s:select name="state" listValue="value"  listKey="key"  list="@com.bonc.pure.PureUtils@TenantStateOptions" headerKey="" headerValue="全部"/></td>
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>

	<div class="operation-container">
		<p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_CREATE %>">
			<a href="Tenant!create.action" class="icon-add">新增</a>
		</p:auth>
		<p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_UPDATE %>">
	        <a class="icon-vcard-unlock" id="on-btn">启用</a>
<!-- 			<a class="icon-vcard-lock" id="lock-btn">锁定</a> -->
			<a class="icon-vcard-delete" id="del-btn">停用</a>
		</p:auth>
	</div>
	
	<s:actionerror />
	<s:actionmessage/>
	
	<form  <p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_DELETE %>">action="Tenant!delete.action"</p:auth> id="listForm">
		<table class="grid">
			<thead>
				<b:gHead action="Tenant">
					<tr>
						<p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_DELETE %>"><th style="width:30px"><input type="checkbox" id="checkAll"/></th></p:auth>
						<th style="width:40px"><p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_DELETE %>">全选</p:auth></th>
						<th><b:gh col="tenantId">租户编码</b:gh></th>
						<th><b:gh col="tenantName">租户名称</b:gh></th>
						<th><b:gh col="tenantURL">租户的URL</b:gh></th>
						<th><b:gh col="loginId">用户登录ID</b:gh></th>
						<th><b:gh col="roleRootId">角色根节点ID</b:gh></th>
						<th><b:gh col="orgRootId">组织根节点ID</b:gh></th>
						<th style="width:50px"><b:gh col="state">租户状态</b:gh></th>
						<th style="width:60px"><b:gh col="ord">排序</b:gh></th>
						<th>备注</th>
						<th style="width:120px;"></th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
			   <s:if test="dataList==null||dataList.size()==0">
			     <tr><td colspan="12" style="text-align:center;">没有符合条件的数据</td></tr>
			  </s:if>
			  <s:else>
				<s:iterator value="dataList" status="rowstatus">
					<tr class="${rowstatus.odd?'odd':'even'}">
						<p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_DELETE %>">
							<td align="center"><input type="checkbox" value="${tenantId}" name="ids"/></td>
						</p:auth>
						<td class="text-center grid-row-number">${pagiParam.firstResult+rowstatus.index+1}.</td>
						<td align="center">${tenantId}</td>
						<td align="center">${tenantName}</td>
						<td align="center">${tenantURL}</td>
						<td align="center">${loginId}</td>
						<td align="center">${roleRootId}</td>
						<td align="center">${orgRootId}</td>
						<td align="center"><s:property value="@com.bonc.pure.PureUtils@TenantStateOptions.{?#this.key== #attr.state}[0].value"/></td>
						<td align="center">${ord}</td>
						<td align="center"><s:property value="@com.bonc.pure.PureUtils@clipString(remark)" /></td>
						<td class="text-center operation-data-row">
							<p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_UPDATE %>"><a href="Tenant!update.action?id=${tenantId}" class="icon-edit">编辑</a></p:auth>
<%-- 							<p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_DELETE %>"><a uid="${tenantId}" class="icon-del">停用</a></p:auth> --%>
						</td>
					</tr>
				</s:iterator>
			  </s:else>
			</tbody>
		</table>
	</form>
	<b:pagiLink action="Tenant" />
	
	<p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_UPDATE %>">
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
	  	
		var getChecked=function(){
			var tenantIds=new Array(), ids=jQuery(':checkbox[name="ids"]');
			  for(var i=0;i<ids.length;i++){
			         if(ids[i].checked){
			        	 tenantIds.push(ids[i].value);
			       }
			    } 
			  return tenantIds;
		}
		
		$j('#on-btn').click(function(){
			  var ids=getChecked();
			  if(null==ids||ids.length==0){
				  confirm('请选择要启用的租户!');
			  }else{
			  if (confirm('您确认要启用所选租户吗？')) {
				  submit(Bonc.toFullPath('/pure/Tenant!enableAll.action'),{'ids':ids});
				}
			  }
		});
		

		
		$j('#del-btn').click(function(){
			  var ids=getChecked();
			  if(null==ids||ids.length==0){
				  confirm('请选择要停用的租户!');
			  }else{
			  if (confirm('您确认要停用所选租户吗？')) {
				  submit(Bonc.toFullPath('/pure/Tenant!disableAll.action'),{'ids':ids});
				}
			  }
		});
		</script>
	</p:auth>
	
</body>
</html>