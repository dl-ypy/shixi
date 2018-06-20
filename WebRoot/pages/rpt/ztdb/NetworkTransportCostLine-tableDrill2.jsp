<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid" style="width:99%;" >
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<s:if test="HAVE_CHILDREN == 1">
					<td nowrap="nowrap" id='bisAccountKpiTreeRootORG_${KPI_ID}' onclick="queryAccountTableDrill(this, '<s:property value="KPI_ID"/>')"  width="9%" align="left">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-right.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###'  onclick="linkage2('<s:property value="KPI_ID"/>' , '<s:property value="KPI_NAME"/>', '<s:property value="LEVEL_ID"/>' )" class="part1Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:if>
				<s:else>
					<td nowrap="nowrap" width="9%" align="left">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-null.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###'  onclick="linkage2('<s:property value="KPI_ID"/>' , '<s:property value="KPI_NAME"/>', '<s:property value="LEVEL_ID"/>' )" class="part1Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:else>
				<s:if test="BM_LEVEL==2">
					<td style="text-align: center;width: 10px;cursor: pointer;border-right: 1px solid #D61821;"></td>
				</s:if>
				<s:else>
				<td style="text-align: center;width: 10px;cursor: pointer;border-right: 1px solid #D61821;" onclick="drillTableByOrg2(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')" onmouseover="dyo_mouseOver(this)" onmouseout="dyo_mouseOut(this)">
					<img class="dyo_span" src="<%=contextPath%>/resources/img/xxjt.png" alt="" style="display: none;width: 15px;height: 15px;">
					<img class="dyo_span_zw" src="<%=contextPath%>/resources/img/zw.png" alt="" style="display: block;width: 15px;height: 15px;">	    
				</td>
				</s:else>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0.00')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0','-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_13,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_14,'###,###,##0','-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_15,'###,###,##0.00')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_16,'###,###,##0.00')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_17,'###,###,##0','-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
