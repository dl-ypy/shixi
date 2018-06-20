<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid_line" style="width:99%;" >
	<thead>
		<tr >
			<th align="center" rowspan="2" >渠道名称</th>
			<th align="center" colspan="8" style="border-right: 2px solid #C00;">应缴</th>
			<th align="center" colspan="3">实缴</th>
		</tr>
		<tr>
			<th align="center" nowrap="nowrap">ESS</th>
			<th align="center" nowrap="nowrap">BSS</th>
			<th align="center" nowrap="nowrap">CBSS</th>
			<th align="center" nowrap="nowrap">自助终端</th>
			<th align="center" nowrap="nowrap">优惠减免</th>
			<th align="center" nowrap="nowrap">退费</th>
			<th align="center" nowrap="nowrap">折扣折让</th>
			<th align="center" style="border-right: 2px solid #C00;" nowrap="nowrap">净应收合计</th>
			<th align="center" nowrap="nowrap">本期实缴</th>
			<th align="center" nowrap="nowrap">实缴差异</th>
			<th align="center" nowrap="nowrap">在途资金限额</th>
		</tr>
	</thead>
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" width="7%" align="left"><s:property escapeHtml="false" value="DEPART_NAME"/></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(ESS_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(BSS_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(CBSS_FEE,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property value="ZZZD_FLAG" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(FAVOURABLE_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(RETURNS_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(DISCOUNT_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%" style="border-right: 2px solid #C00;"><s:property escapeHtml="false" value="%{kpiFmt(RECEIVABLE_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(PAY_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(PAY_DIFF_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(CAPITAL_LIMIT_FEE,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
