<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; overflow: auto;">
<table class="grid_line" style="width:99%;" >
	<thead>
		<tr>
			<th align="center" rowspan="2" nowrap="nowrap">单位名称</th>
			<th align="center" rowspan="2">权责收入 </th>
			
			<th align="center" colspan="3">应收账款</th>
			<th align="center" colspan="2">预存账款</th>
			<th align="center" colspan="5">发展渠道</th>
			<th align="center" colspan="5">收款渠道现金流入</th>
		</tr>
		<tr>
			<th align="center" nowrap="nowrap">期初欠费</th>
			<th align="center" nowrap="nowrap">期末欠费</th>
			<th align="center" nowrap="nowrap">坏账<br/>核销</th>
			
			<th align="center" nowrap="nowrap">期初预存</th>
			<th align="center" nowrap="nowrap">期末预存</th>
			
			<th align="center" nowrap="nowrap">欠款回收</th>
			<th align="center" nowrap="nowrap">当月缴费</th>
			<th align="center" nowrap="nowrap">预存</th>
			<th align="center" nowrap="nowrap">一次性<br/>销售收款</th>
			<th align="center" nowrap="nowrap">收款合计</th>
			
			<th align="center" nowrap="nowrap">当地自收</th>
			<th align="center" nowrap="nowrap">其他地<br/>市代收</th>
			<th align="center" nowrap="nowrap">省分一点收</th>
			<th align="center" nowrap="nowrap">集团<br/>一点收</th>
			<th align="center" nowrap="nowrap">收款合计</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="list" var="data" status="status">
		    <tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td align="center" ><s:property escapeHtml="false" value="LEVEL_NAME"/></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_13,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_14,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_15,'###,###,##0')}" /></td>
				<td align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_16,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>