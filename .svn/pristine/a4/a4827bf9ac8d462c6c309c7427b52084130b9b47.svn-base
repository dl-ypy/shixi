<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; overflow: auto;">
<table class="grid" style="width:80%;" >
	<thead>
		<tr>
			<th width="10%" align="center">专业线</th>
			<th width="16%" align="center">主管部门</th>
			<th width="16%" align="center">责任中心</th>
			<th width="16%" align="center">考核指标</th>
			<th width="8%" align="center">完成</th>
			<th width="8%" align="center">预算</th>
			<th width="8%" align="center">差额</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td align="left" width="10%"><s:property escapeHtml="false" value="ZYX_DESC" /></td>
				<td align="center" width="16%"><s:property escapeHtml="false" value="BM_DESC" /></td>
				<td align="center" width="16%"><s:property escapeHtml="false" value="ZX_DESC" /></td>
				<td align="center" width="16%"><s:property escapeHtml="false" value="KPI_DESC" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
