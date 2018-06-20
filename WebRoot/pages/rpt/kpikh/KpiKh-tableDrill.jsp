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
				<s:if test="HAVE_CHILDREN == 1">
					<td nowrap="nowrap" id='bisKpiTreeRootORG_${KPI_ID}' onclick="loadKpiKhZbTableDrill(this, '<s:property value="KPI_ID"/>')"  width="20%" align="left" style="border-right: 1px solid #D61821;">
						<img id='IMG_${KPI_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-right.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###'  onclick="kpiKhZbTableClick('<s:property value="KPI_ID"/>' , '<s:property value="KPI_NAME"/>' )" class="part1Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:if>
				<s:else>
					<td nowrap="nowrap" width="20%" align="left" style="border-right: 1px solid #D61821;">
						<img id='IMG_${KPI_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-null.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###'  onclick="kpiKhZbTableClick('<s:property value="KPI_ID"/>' , '<s:property value="KPI_NAME"/>' )" class="part1Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:else>
				<td align="center" width="8%"><s:property escapeHtml="false" value="KPI_UNIT"/></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="RST1"/></td>
				<td align="center" width="16%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.000', '-')}" /></td>
				<td align="center" width="16%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.000', '-')}" /></td>
				<td align="center" width="16%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0', '-')}" /></td>
				<td align="center" width="16%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0', '-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
