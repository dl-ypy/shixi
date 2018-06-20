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
</head>
<body>
	<b:appletBox title="用户角色" showMM="false" />
	
	<s:form action="UserRole">
		<table class="form">
			<tr>
				<td>登录ID:<s:textfield name="loginId" /></td>
				<td>用户名:<s:textfield name="userName" /></td>
				<td><s:hidden name="roleId" /></td>
			</tr>
			<tr>
				<td>所属机构:
				   <s:textfield id="orgTextField" name="orgName"   readonly="true" />
			       <input id="orgId" type="hidden" name="orgId" value="${orgId }">
				</td>
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>
	
	<div class="operation-container">
		<a class="icon-vcard-delete" id="del-btn">收回</a>
	</div>
	
	<s:actionerror />
	<s:actionmessage/>
	
	<form action="UserRole!deletePemission.action"id="listForm">
		<s:hidden name="roleId" />
		<table class="grid">
			<thead>
				<b:gHead action="UserRole">
					<tr>
						<th><input type="checkbox" id="checkAll"/></th>
						<th style="width:40px">全选</th>
						<th><b:gh col="loginId">登录ID</b:gh></th>
						<th><b:gh col="userName">用户名</b:gh></th>
						<th>角色ID</th>
						<th></th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
			    <s:if test="null==dataList||dataList.size()==0">
			       <tr><td colspan="5" style="text-align:center;">没有符合条件的用户。</td></tr>
			    </s:if>
			    <s:else>
					<s:iterator value="dataList" status="rowstatus">
						<tr class="${rowstatus.odd?'odd':'even'}">
							<td align="center"><input type="checkbox" value="${userId}" name="ids" /></td>
							<td class="text-center grid-row-number">${rowstatus.index+1}.</td>
							<td>${loginId}</td>
							<td>${userName}</td>
							<td>${roleId}</td>
						</tr>
					</s:iterator>
			    </s:else>
			</tbody>
		</table>
	</form>
	<b:pagiLink action="UserRole"/>
	<script type="text/javascript">
		$j('#checkAll').bindCheckAll(':checkbox[name="ids"]');
		$j('#del-btn').bindCommitBatch('#listForm :checkbox[name="ids"]','请选择您要收回权限的用户!','您确认要收回这些用户的权限吗？');
		<%
		Object tree = request.getAttribute("orgTree");  
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
</body>
</html>