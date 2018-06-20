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
			<th width="10%" align="center">单位</th>
			<th width="7%" align="center">现金</th>
			<th width="7%" align="center">转账</th>
			<th width="7%" align="center">银行POS</th>
			<th width="8%" align="center">代理商<br/>资金归集</th>
			<th width="8%" align="center">第三方<br/>代收费</th>
			<th width="8%" align="center">MISPOS</th>
			<th width="8%" align="center">沃受理</th>
			<th width="8%" align="center">微信</th>
			<th width="8%" align="center">支付宝</th>
			<th width="8%" align="center">一点结算 </th>
			<th width="8%" align="center">基它</th>
			<th width="8%" align="center">收款合计</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data" status="status">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" width="10%" align="center" 
				    onclick="tableClick('<s:property value="LEVEL_ID"/>')" >
					<a href='###'><s:property escapeHtml="false" value="LEVEL_NAME"/></a>
				</td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>