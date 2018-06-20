<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid_line" style="width:99%;" >
	<thead>
		<tr>
			<th align="center" rowspan="2">组织机构</th>
			<th align="center" colspan="9">主营业务收入</th>
			<th align="center" colspan="3">应收帐款</th>
			<th align="center" colspan="2">预存帐款</th>
			<th align="center" colspan="5">发展渠道主营现金流入</th>
			<th align="center" colspan="5">收款渠道主营现金流入</th>
		</tr>
		<tr>
			<th align="center" style="border-left: 1px solid #C00;" nowrap="nowrap">出帐收入</th>
			<th align="center" nowrap="nowrap">省内、省际结算收入</th>
			<th align="center" nowrap="nowrap">网间结算收入</th>
			<th align="center" nowrap="nowrap">公众价值摊销收入</th>
			<th align="center" nowrap="nowrap">一次性营业收入</th>
			<th align="center" nowrap="nowrap">负项收入</th>
			<th align="center" nowrap="nowrap">协议类收入</th>
			<th align="center" nowrap="nowrap">其他收入</th>
			<th align="center" style="border-right: 1px solid #C00;" nowrap="nowrap">主营业务收入合计</th>
			<th align="center" nowrap="nowrap">期初欠费</th>
			<th align="center" nowrap="nowrap">期末欠费</th>
			<th align="center" style="border-right: 1px solid #C00;" nowrap="nowrap">坏账核销</th>
			<th align="center" nowrap="nowrap">期初预存</th>
			<th align="center" nowrap="nowrap">期末预存</th>
			<th align="center" style="border-right: 1px solid #C00;" nowrap="nowrap">欠款回收</th>
			<th align="center" nowrap="nowrap">当月缴费</th>
			<th align="center" nowrap="nowrap">当月预存</th>
			<th align="center" nowrap="nowrap">一次性销售收款</th>
			<th align="center" style="border-right: 1px solid #C00;" nowrap="nowrap">收款合计</th>
			<th align="center"  nowrap="nowrap">当地自收</th>
			<th align="center" nowrap="nowrap">其他地市代收</th>
			<th align="center" nowrap="nowrap">省分一点收</th>
			<th align="center" nowrap="nowrap">集团一点收</th>
			<th align="center" nowrap="nowrap">收款合计</th>
		</tr>
	</thead>
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td id='bisKpiTreeRootORG_${REGION_ID}' nowrap="nowrap" onclick="getSubList(this, '${LEVEL_ID}')" width="7%" align="left"><img id='IMG_${LEVEL_ID }' src="<%=contextPath%>/resources/frame/DrillTable/icon-right.png" width="17" height="17" border="0"  class="topTableTr" />&nbsp;<a href='###'><s:property value="LEVEL_NAME"/></a></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_13,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_14,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_15,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_16,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_17,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_18,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_19,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_20,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_21,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_22,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_23,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_24,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_25,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
