<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; overflow: auto;">
<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th width="4%" align="center" rowspan="2">单位</th>
			<th width="24%" align="center" colspan="4">本月</th>
			<th width="24%" align="center" colspan="4">上月</th>
			<th width="24%" align="center" colspan="4">本年累计</th>
			<th width="24%" align="center" colspan="4">上年同期</th>
		</tr>
		<tr>
			<th width="6%" align="center">主营业务收入</th>
			<th width="6%" align="center">预收净增</th>
			<th width="6%" align="center">应收净增</th>
			<th width="6%" align="center">现金收入比</th>
			<th width="6%" align="center">主营业务收入</th>
			<th width="6%" align="center">预收净增</th>
			<th width="6%" align="center">应收净增</th>
			<th width="6%" align="center">现金收入比</th>
			<th width="6%" align="center">主营业务收入</th>
			<th width="6%" align="center">预收净增</th>
			<th width="6%" align="center">应收净增</th>
			<th width="6%" align="center">现金收入比</th>
			<th width="6%" align="center">主营业务收入</th>
			<th width="6%" align="center">预收净增</th>
			<th width="6%" align="center">应收净增</th>
			<th width="6%" align="center">现金收入比</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" onclick="part1TableClick('<s:property value="AREA_NO"/>', '<s:property value="AREA_DESC"/>')" width="4%" align="left" class="part1TableTd">
					<a href='###'><s:property escapeHtml="false" value="AREA_DESC"/></a>
				</td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0.00%')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0.00%')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0.00%')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_13,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_14,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_15,'###,###,##0')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_16,'###,###,##0.00%')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
