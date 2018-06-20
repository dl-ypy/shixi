<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
String contextPath = request.getContextPath();
%>

<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th width="16%" align="center">项目</th>
			<th width="10%" align="center">单位</th>
			<th width="14%" align="center">本期末规模</th>
			<th width="12%" align="center">环比增长</th>
			<th width="14%" align="center">增幅</th>
			<th width="12%" align="center">较年初增长</th>
			<th width="12%" align="center">增幅</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" onclick="part1TableClick('<s:property value="KPI_ID"/>', '<s:property value="KPI_NAME"/>')" width="16%" align="left"><s:property escapeHtml="false" value="KPI_NAME_SHOW"/></td>
				<td align="center" width="10%"><s:property escapeHtml="false" value="RST2" /></td>
				<td align="center" width="14%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_L,'###,###,##0')}" /></td>
				<td align="center" width="12%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_ADD,'###,###,##0')}" /></td>
				<td align="center" width="14%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_ZF,'###,###,##0.00%')}" /></td>
				<td align="center" width="12%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_FIR_ADD,'###,###,##0')}" /></td>
				<td align="center" width="12%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_FIR_ZF,'###,###,##0.00%')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
