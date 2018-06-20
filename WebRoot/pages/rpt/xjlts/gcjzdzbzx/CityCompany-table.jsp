<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<%-- <style>
 .tw {border-right:1px solid #D61821 ;border-width:medium}

</style> --%>
<div style="width:100%; overflow: auto;">
<table class="grid" style="width:99%" >
	<thead>
		<tr> 
			<th width="14%" align="center" rowspan="2">地市</th>
			<th width="24%" align="center" colspan="3" style="border-right: 1px solid #D61821;">现金收入比</th>
			<th width="24%" align="center" colspan="3" style="border-right: 1px solid #D61821;">营业欠款占收比</th>
			<th width="24%" align="center" colspan="3">缴款及时率</th>
		</tr>
		<tr>
			<th width="8%" align="center">完成</th>
			<th width="8%" align="center">预算</th>
			<th width="8%" align="center" style="border-right: 1px solid #D61821;">差额</th>
			<th width="8%" align="center">完成</th>
			<th width="8%" align="center">预算</th>
			<th width="8%" align="center" style="border-right: 1px solid #D61821;">差额</th>
			<th width="8%" align="center">完成</th>
			<th width="8%" align="center">预算</th>
			<th width="8%" align="center">差额</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td align="center" width="14%"><s:property escapeHtml="false" value="BM_DESC" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00%')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.00%')}" /></td>
				<td align="center" width="8%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0.00%')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0.00%')}" /></td>
				<td align="center" width="8%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0.00%')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0.00%')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0.00%')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0.00%')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
