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
					<td nowrap="nowrap" id='bisKpiTreeRootORG_${KPI_ID}' onclick="queryTableDrill2(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')"  width="9%" align="left">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-right.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###'  onclick="tableClick2('<s:property value="KPI_ID"/>' , '<s:property value="KPI_NAME"/>' )" class="part2Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:if>
				<s:else>
					<td nowrap="nowrap" width="9%" align="left">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-null.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###'  onclick="tableClick2('<s:property value="KPI_ID"/>' , '<s:property value="KPI_NAME"/>' )" class="part2Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:else>
				<s:if test="DOWN== 'ORG'">	
				<td  style="text-align: center;width: 25px;cursor: pointer; border-right: 1px solid #D61821;" ></td>
				</s:if>
				<s:else>
				<td style="text-align: center;width: 25px;cursor: pointer; border-right: 1px solid #D61821;" onclick="drillTableByOrg2(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')" onmouseover="dyo_mouseOver(this)" onmouseout="dyo_mouseOut(this)">
				    <img class="dyo_span" src="<%=contextPath%>/resources/img/xxjt.png" alt="" style="display: none;width: 15px;height: 15px;">
				    <img class="dyo_span_zw" src="<%=contextPath%>/resources/img/zw.png" alt="" style="display: block;width: 15px;height: 15px;">
				</td>
				</s:else>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_13,'###,###,##0.00pp')}" /></td>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_14,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_15,'###,###,##0', '-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_16,'###,###,##0.00pp', '-')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_17,'###,###,##0', '-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
