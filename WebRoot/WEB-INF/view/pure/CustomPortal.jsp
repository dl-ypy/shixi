<%@ page contentType="text/html;charset=UTF-8" language="java" import="net.sf.json.JsonConfig,net.sf.json.*,net.sf.json.JSONObject,net.sf.json.processors.JsonBeanProcessor,com.bonc.pure.domain.CustomPortalBasic,com.bonc.pure.PureUtils"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<b:doctype/>
<html>
<head>
<title>工作台管理</title>
<s:head />
<s:head template="head_ext.ftl" />
<body>
<b:appletBox title="工作台管理" showMM="false" />
<s:form action="CustomPortal">
	<table class="form">
		<tr>
			<td>名称:<s:textfield name="customPortalBasic.name" /></td>
			<td>状态:
				<s:select name="customPortalBasic.status" listKey="key" listValue="value" 
					list="@com.bonc.pure.PureUtils@YesNoOptions" headerKey="" headerValue="全部"/>
			</td>
			<td><b:datetimepicker formatPattern="yyyy-MM-dd"
						id="customPortalBasic.createTime" name="customPortalBasic.createTime" readonly="true" 
						label="创建时间" maxDate="#F{$dp.$D(\\\'createEndTime\\\')}" /> -
				<b:datetimepicker formatPattern="yyyy-MM-dd" id="createEndTime"
						name="createEndTime" readonly="true"
						minDate="#F{$dp.$D(\\\'customPortalBasic.createTime\\\')}" />
			</td>
			<td>创建人:<s:textfield name="customPortalBasic.creator.userName"></s:textfield></td>
			<td align="right"><input type="submit" class="submit" value="查询" /></td>
		</tr>
	</table>
</s:form>

<div class="operation-container">
	<p:auth resourcesId="PURE_CUSTOMPORTAL" optType="<%=PureUtils.AUTH_CREATE %>">
		<a href=<s:url value='CustomPortal!createPage.action'/> class="icon-vcard-add" target="_blank">新增</a>
	</p:auth>
	<p:auth resourcesId="PURE_CUSTOMPORTAL" optType="<%=PureUtils.AUTH_DELETE %>">
		<a class="icon-vcard-delete" id="del-btn">批量删除</a>
	</p:auth>
</div>

<s:actionerror />
<s:actionmessage/>

<form <p:auth resourcesId="PURE_CUSTOMPORTAL" optType="<%=PureUtils.AUTH_DELETE %>">action="CustomPortal!doDelete.action"</p:auth> id="listForm">
	<table class="grid">
		<thead>
			<b:gHead action="CustomPortal">
				<tr>
					<p:auth resourcesId="PURE_CUSTOMPORTAL" optType="<%=PureUtils.AUTH_DELETE %>">
						<th style="width:30px"><input type="checkbox" id="checkAll"/></th></p:auth>
						<th style="width:40px">
							<p:auth resourcesId="PURE_CUSTOMPORTAL" optType="<%=PureUtils.AUTH_DELETE %>">全选</p:auth>
						</th>
				    <th align="center"><b:gh col="name">编码</b:gh></th>
					<th align="center"><b:gh col="name">名称</b:gh></th>
					<th><b:gh col="remark" >描述</b:gh></th>
					<th style="width:50px"><b:gh col="status">启用</b:gh></th>
					<th style="width:180px"><b:gh col="createTime">创建时间</b:gh></th>
					<th style="width:180px"><b:gh col="updateTime">修改时间</b:gh></th>
					<th style="width:100px"><b:gh col="creator">创建人</b:gh></th>
					<th style="width:200px;"></th>
				</tr>
			</b:gHead>
		</thead>
		<tbody>
		  <s:if test="dataList==null||dataList.size()==0">
		     <tr><td colspan="12" style="text-align:center;">没有符合条件的工作台信息</td></tr>
		  </s:if>
		  <s:else>
			<s:iterator value="dataList" status="rowstatus">
				<tr class="${rowstatus.odd?'odd':'even'}">
					<p:auth resourcesId="PURE_USER" optType="<%=PureUtils.AUTH_DELETE %>">
						<td align="center"><input type="checkbox" value="${id}" name="ids"/></td>
					</p:auth>
					<td class="text-center grid-row-number">${pagiParam.firstResult+rowstatus.index+1}.</td>
					<td align="center">${id}</td>
					<td align="center">${name}</td>
					<td title="${remark}" style="width:50px !important;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;">
						<s:property value="@com.bonc.pure.PureUtils@clipString(remark)" /></td>
					<td><s:property value="@com.bonc.pure.PureUtils@YesNoOptions.{?#this.key== #attr.status}[0].value"/></td>
					<td class="date"><fmt:formatDate value="${createTime}" type="date" pattern="yyyy-MM-dd"/></td>
					<td class="date"><fmt:formatDate value="${updateTime}" type="date" pattern="yyyy-MM-dd"/></td>
				    <td>${creator.userName}</td>
					<td class="text-center operation-data-row">
						<s:if test="status==1">
							<p:auth resourcesId="PURE_CUSTOMPORTAL" optType="<%=PureUtils.AUTH_UPDATE %>">
								<a href="CustomPortal!updatePage.action?customPortalBasic.id=${id}" class="icon-vcard-edit" target="_blank">编辑</a>
							</p:auth>
							<a href="CustomPortal!viewPage.action?customPortalBasic.id=${id}" class="icon-vcard-edit" target="_blank">查看</a>
							<a disid="${id}" class="icon-vcard-delete">停用</a>
						</s:if>
						<s:else>
							<a enid="${id}" class="icon-vcard-add">启用</a>
						</s:else>
						<a class="icon-vcard-delete" id="vcard-delete" uid="${id}">删除</a>				
					</td>
				</tr>
			</s:iterator>
		  </s:else>
		</tbody>
	</table>
</form>
<b:pagiLink action="CustomPortal" />
<script type="text/javascript">    
	$j('#checkAll').bindCheckAll(':checkbox[name="ids"]');
	$j('#listForm').delegate('a.icon-vcard-delete[disid]','click',function(){
		if(confirm('门户停用后将不能查看.您确认要停用所选择门户吗?')){
			location.href='CustomPortal!doDisable.action?ids='+this.getAttribute('disid');
		}
	});
	$j('#listForm').delegate('a.icon-vcard-add[enid]','click',function(){
		if(confirm('您确认要启用所选择门户吗?')){
			location.href='CustomPortal!doEnable.action?ids='+this.getAttribute('enid');
		}
	});
	$j('#listForm').delegate('#vcard-delete','click',function(){
		if(confirm('门户删除后将不能恢复.\n您确认要删除所选门户吗?')){
			location.href='CustomPortal!doDelete.action?ids='+this.getAttribute('uid');
		}
	});
	$j('#del-btn').bindCommitBatch('#listForm :checkbox[name="ids"]','请选择您要删除的门户！','门户删除后将不能恢复.\n您确认要删除所选门户吗?');
</script>
</body>
</html>

