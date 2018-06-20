<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="b-table-1" style="width:99%;" >
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<s:if test="IS_PARENT>0">
					<td id='bisKpiTreeRootORG_${LEVEL_ID}' nowrap="nowrap" onclick="getSubList(this, '${LEVEL_ID}')" width="7%" align="left"><img id='IMG_${LEVEL_ID }' src="<%=contextPath%>/resources/frame/DrillTable/icon-right.png" width="17" height="17" border="0"  />&nbsp;<a href='###'><s:property value="LEVEL_NAME"/></a></td>
				</s:if>
				<s:else>
					 <td  class='tbData' style="width:7%" nowrap="nowrap" align="left"><s:property value="LEVEL_NAME" /></td>
				</s:else>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(ESS_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(BSS_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(CBSS_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(ZZZD_FLAG,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(FAVOURABLE_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(RETURNS_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(DISCOUNT_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%" style="border-right: 2px solid #C00;"><s:property escapeHtml="false" value="%{kpiFmt(RECEIVABLE_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(CASH_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(TRANSFER_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(BANKPOS_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(MISPOS_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(OTHER_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(PAID_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%" style="border-right: 2px solid #C00;"><s:property escapeHtml="false" value="%{kpiFmt(PAID_DIFF_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(MONEY_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(MONEY_DIFF_FEE,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(CAPITAL_LIMIT_FEE,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
