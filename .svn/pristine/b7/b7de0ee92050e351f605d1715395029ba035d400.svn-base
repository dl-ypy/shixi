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
	<b:appletBox title="应用系统管理" showMM="false" />
	
	<s:form action="AppSystem">
		<table class="form">
			<tr>
				<td>系统编码:<s:textfield name="appSystemId" /></td>
				<td>系统名称:<s:textfield name="appSystemName" /></td>
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>

	<div class="operation-container">
		<p:auth resourcesId="PURE_RESOURCESGROUP" optType="<%=PureUtils.AUTH_CREATE %>">
			<a href="AppSystem!create.action" class="icon-add">新增</a>
		</p:auth>
		<p:auth resourcesId="PURE_RESOURCESGROUP" optType="<%=PureUtils.AUTH_DELETE %>">
			<a class="icon-del" id="del-btn">删除</a>
		</p:auth>
	</div>
	
	<s:actionerror />
	<s:actionmessage/>
	
	<form  <p:auth resourcesId="PURE_RESOURCESGROUP" optType="<%=PureUtils.AUTH_DELETE %>">action="AppSystem!delete.action"</p:auth> id="listForm">
		<table class="grid">
			<thead>
				<b:gHead action="AppSystem">
					<tr>
						<p:auth resourcesId="PURE_RESOURCESGROUP" optType="<%=PureUtils.AUTH_DELETE %>"><th style="width:30px"><input type="checkbox" id="checkAll"/></th></p:auth>
						<th style="width:40px"><p:auth resourcesId="PURE_RESOURCESGROUP" optType="<%=PureUtils.AUTH_DELETE %>">全选</p:auth></th>
						<th><b:gh col="appSystemId">系统编码</b:gh></th>
						<th><b:gh col="appSystemName">系统名称</b:gh></th>
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
						<p:auth resourcesId="PURE_RESOURCESGROUP" optType="<%=PureUtils.AUTH_DELETE %>">
							<td align="center"><input type="checkbox" value="${appSystemId}" name="ids"/></td>
						</p:auth>
						<td class="text-center grid-row-number">${pagiParam.firstResult+rowstatus.index+1}.</td>
						<td>${appSystemId}</td>
						<td>${appSystemName}</td>
						<td>${ord}</td>
						<td><s:property value="@com.bonc.pure.PureUtils@clipString(memo)" /></td>
						<td class="text-center operation-data-row">
							<p:auth resourcesId="PURE_RESOURCESGROUP" optType="<%=PureUtils.AUTH_UPDATE %>"><a href="AppSystem!update.action?id=${appSystemId}" class="icon-edit">编辑</a></p:auth>
							<p:auth resourcesId="PURE_RESOURCESGROUP" optType="<%=PureUtils.AUTH_DELETE %>"><a uid="${appSystemId}" class="icon-del">删除</a></p:auth>
						</td>
					</tr>
				</s:iterator>
			  </s:else>
			</tbody>
		</table>
	</form>
	<b:pagiLink action="AppSystem" />
	
	<p:auth resourcesId="PURE_RESOURCESGROUP" optType="<%=PureUtils.AUTH_DELETE %>">
		<script type="text/javascript">
		$j('#checkAll').bindCheckAll(':checkbox[name="ids"]');
		$j('#listForm').delegate('a.icon-del','click',function(){
			if(confirm('删除应用系统，将级联删除所辖资源以及角色的权限！您确认要删除所选项应用系统吗？')){
				location.href='AppSystem!delete.action?ids='+this.getAttribute('uid');
			}
		});
		$j('#del-btn').bindCommitBatch('#listForm :checkbox[name="ids"]','请选择您要删除的应用系统!','删除应用系统同时将级联删除相关权限.\n您确认要删除所选择的应用系统吗？');
		</script>
	</p:auth>
	
</body>
</html>