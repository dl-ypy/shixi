<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; height:450px;overflow-y: auto;">
<table class="grid" style="width:99%;" >
	<thead>

	<b:gHead target="tableDiv">
		<tr>
			<th width="9%" align="center" ><b:gh col="ORD">项目</b:gh></th>
			<th align="center" style="border-right: 1px solid #D61821;"></th>
			<th width="7%" align="center" style="vertical-align: middle;">本月<br/>完成</th>
			<th width="7%" align="center" style="border-right: 1px solid #D61821;">环比<br/>增长</th>
			<th width="7%" align="center">累计完成</th>
			<th width="7%" align="center">同比增长</th>
			<th width="7%" align="center">同比增幅</th>
			<th width="7%" align="center"><b:gh col="KPI_06">区域排<br/>名</b:gh></th>
			<th width="7%" align="center" style="border-right: 1px solid #D61821;"><b:gh col="KPI_07">全国排<br/>名</b:gh></th>
			<th width="7%" align="center">占收比</th>
			<th width="7%" align="center"><b:gh col="KPI_09">区域排<br/>名</b:gh></th>
			<th width="7%" align="center"><b:gh col="KPI_10">全国排<br/>名</b:gh></th>
			<th width="7%" align="center">同比</th>
			<th width="7%" align="center"><b:gh col="KPI_12">区域排<br/>名</b:gh></th>
			<th width="7%" align="center"><b:gh col="KPI_13">全国排<br/>名</b:gh></th>
		</tr>
	</b:gHead>

	<!-- 
		<tr>
			<th width="9%" align="center" style="border-right: 1px solid #D61821;">项目</th>
			<th width="7%" align="center">本月完成</th>
			<th width="7%" align="center" style="border-right: 1px solid #D61821;">环比增长</th>
			<th width="7%" align="center">累计完成</th>
			<th width="7%" align="center">同比增长</th>
			<th width="7%" align="center">同比增幅</th>
			<th width="7%" align="center">区域<br/>排名</th>
			<th width="7%" align="center" style="border-right: 1px solid #D61821;">全国<br/>排名</th>
			<th width="7%" align="center">占收比</th>
			<th width="7%" align="center">区域<br/>排名</th>
			<th width="7%" align="center">全国<br/>排名</th>
			<th width="7%" align="center">同比</th>
			<th width="7%" align="center">区域<br/>排名</th>
			<th width="7%" align="center">全国<br/>排名</th>
		</tr>
	 -->
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'"
			<s:if test="RST1 == 1">
				style="border-top: 2px solid #FF7F7F;"
			</s:if>
			>
				<s:if test="HAVE_CHILDREN == 1">
					<td nowrap="nowrap" id='bisKpiTreeRootORG_${KPI_ID}' onclick="queryTableDrill(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')"  width="9%" align="left">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-right.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###'  onclick="tableClick('<s:property value="KPI_ID"/>' , '<s:property value="KPI_NAME"/>', '<s:property value="ORG_ID"/>' )" class="part1Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:if>
				<s:else>
					<td nowrap="nowrap" width="9%" align="left">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-null.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###'  onclick="tableClick('<s:property value="KPI_ID"/>' , '<s:property value="KPI_NAME"/>' , '<s:property value="ORG_ID"/>')" class="part1Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:else>
				<td style="text-align: center;width: 25px;cursor: pointer; border-right: 1px solid #D61821;" onclick="loadOrgTableDrill(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')" onmouseover="dyo_mouseOver(this)" onmouseout="dyo_mouseOut(this)">
				    <img class="dyo_span" src="<%=contextPath%>/resources/img/xxjt.png" alt="" style="display: none;width: 15px;height: 15px;">
				    <img class="dyo_span_zw" src="<%=contextPath%>/resources/img/zw.png" alt="" style="display: block;width: 15px;height: 15px;">
				</td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0', '-')}" /></td>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0', '-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0.00%', '-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0', '-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0', '-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0.00pp')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0', '-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_13,'###,###,##0', '-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
