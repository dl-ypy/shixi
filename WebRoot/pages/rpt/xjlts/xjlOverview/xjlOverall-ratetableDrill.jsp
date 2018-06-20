<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; overflow: auto;">
<table class="grid" style="width:99%;" >
	 <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" width="7%" align="left" >&nbsp;&nbsp;&nbsp;&nbsp;<s:property escapeHtml="false" value="AREA_NAME"/></td>
				<td style="text-align: center;width: 2%;" ></td>
				<s:if test="PART_ID== 2 && KPI_ID=='KPI_004'">
				<td style="text-align: right;width: 2%;" >%</td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00%')}" /></td>
				</s:if>
				<s:else>
				<td style="text-align: right;width: 2%;" >万元</td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00')}" /></td>
				</s:else>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.00%')}" /></td>
				<s:if test="PART_ID== 2 && KPI_ID=='KPI_004'">
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
				</s:if>
				<s:else>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00')}" /></td>
				</s:else>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0.00%')}" /></td>
			    <td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
