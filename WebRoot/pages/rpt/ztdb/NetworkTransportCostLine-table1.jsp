<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;height:410px;overflow-x: auto; overflow-y: auto">
<table class="grid" style="width:99%;" >
	<thead>
		<b:gHead target="CumulativeTableDiv">
			<tr>
				<th align="center" nowrap="nowrap">项目</th>
				<th align="center" style="border-right: 1px solid #D61821;"></th>
				<th align="center" nowrap="nowrap">本月完成</th>
				<th align="center" nowrap="nowrap" style="border-right: 1px solid #D61821;"><b:gh col="KPI_02">环比增长</b:gh></th>
				<th align="center" nowrap="nowrap">累计完成</th>
				<th align="center" nowrap="nowrap"><b:gh col="KPI_04">同比增长</b:gh></th>
				<th align="center" nowrap="nowrap"><b:gh col="KPI_05">同比增幅</b:gh></th>
				<th align="center" nowrap="nowrap" style="border-right: 1px solid #D61821;"><b:gh col="KPI_06">排名</b:gh></th>
				<th align="center" nowrap="nowrap">序时目标</th>
				<th align="center" nowrap="nowrap">完成比例</th>
				<th align="center" nowrap="nowrap"><b:gh col="KPI_09">排名</b:gh></th>
			</tr>
		</b:gHead>
	</thead>
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'"
				<s:if test="RST1 == 1">
					style="border-top: 2px solid #FF7F7F;"
				</s:if>
			>
				<s:if test="HAVE_CHILDREN == 1">
					<td nowrap="nowrap" id='bisCumulativeKpiTreeRootORG_${KPI_ID}' onclick="queryCumulativeTableDrill(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')"  width="9%" align="left">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-right.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###'  onclick="linkage1('<s:property value="KPI_ID"/>' , '<s:property value="KPI_NAME"/>' )" class="part1Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:if>
				<s:else>
					<td nowrap="nowrap" width="9%" align="left">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-null.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###'  onclick="linkage1('<s:property value="KPI_ID"/>' , '<s:property value="KPI_NAME"/>' )" class="part1Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:else>
				<td style="text-align: center;width: 10px;cursor: pointer;border-right: 1px solid #D61821;" onclick="drillTableByOrg1(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')" onmouseover="dyo_mouseOver(this)" onmouseout="dyo_mouseOut(this)">
					<img class="dyo_span" src="<%=contextPath%>/resources/img/xxjt.png" alt="" style="display: none;width: 15px;height: 15px;">
					<img class="dyo_span_zw" src="<%=contextPath%>/resources/img/zw.png" alt="" style="display: block;width: 15px;height: 15px;">	    
				</td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0','-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0','-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
