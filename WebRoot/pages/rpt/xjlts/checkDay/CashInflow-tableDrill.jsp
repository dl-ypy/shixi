<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid_line" style="width:99%;" >
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<s:if test="IS_PARENT>0">
					<td id='bisKpiTreeRootORG_${LEVEL_ID}' nowrap="nowrap" onclick="getSubList(this, '${LEVEL_ID}')" width="7%" align="left"><img id='IMG_${LEVEL_ID }' src="<%=contextPath%>/resources/frame/DrillTable/icon-right.png" width="17" height="17" border="0"  class="topTableTr" />&nbsp;<a href='###'><s:property value="LEVEL_NAME"/></a></td>
				</s:if>
				<s:else>
					 <td  class='tbData' style="width:7%" nowrap="nowrap" align="left"><s:property value="LEVEL_NAME" /></td>
				</s:else>
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
