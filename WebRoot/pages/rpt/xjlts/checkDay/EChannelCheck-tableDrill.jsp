<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="b-table-1" style="width:99%;" >
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
