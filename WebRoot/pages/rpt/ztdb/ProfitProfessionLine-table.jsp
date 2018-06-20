<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:99%;height:600px;overflow-y:auto;">
<table class="grid" style="width:99%;" >
	<thead>
	<b:gHead target="profitTable">
		<tr>
			<th align="center"  ><b:gh col="ORD">项目</b:gh></th>
			<th align="center" style="border-right: 1px solid #D61821;"></th>
			<th align="center">本月完成</th>
			<th align="center"  style="border-right: 1px solid #D61821;"><b:gh col="KPI_02">环比增长</b:gh></th>
			<th align="center" >累计完成</th>
			<th align="center" ><b:gh col="KPI_04">同比增<br>长</b:gh></th>
			<th align="center" ><b:gh col="KPI_05">同比增<br>幅</b:gh></th>
			<th align="center"  style="border-right: 1px solid #D61821;"><b:gh col="KPI_06">排名</b:gh></th>
			<th align="center" ><b:gh col="KPI_07">占主营收入比</b:gh></th>
			<th align="center" ><b:gh col="KPI_08">排名</b:gh></th>
			<th align="center">同比</th>
			<th align="center" ><b:gh col="KPI_10">排名</b:gh></th>
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
				<td nowrap="nowrap" id='bisKpiTreeRootORG_${KPI_ID}' onclick="loadKpiKhZbTableDrill(this, '<s:property value="KPI_ID"/>', '<s:property value="KPI_NAME"/>' ,'<s:property value="ORG_ID"/>')"  width="25%" align="left" style="cursor: pointer;">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-right.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###' class="part1Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
			    </td>
				</s:if>
				<s:else>
					<td nowrap="nowrap" width="25%" align="left">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-null.png" width="17" height="17" border="0"  />&nbsp;
						<a href='###' onclick="querychart('<s:property value="KPI_ID"/>', '<s:property value="KPI_NAME"/>' , '<s:property value="ORG_ID"/>')" class="part1Table"><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:else>
				<td style="text-align: center;width: 25px;cursor: pointer; border-right: 1px solid #D61821;" onclick="loadOrgTableDrill(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')" onmouseover="dyo_mouseOver(this)" onmouseout="dyo_mouseOut(this)">
				    <img class="dyo_span" src="<%=contextPath%>/resources/img/xxjt.png" alt="" style="display: none;width: 15px;height: 15px;">
				    <img class="dyo_span_zw" src="<%=contextPath%>/resources/img/zw.png" alt="" style="display: block;width: 15px;height: 15px;">
				</td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="right" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0')}" /></td>
			    <td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0.00%')}" /></td>
			    <td align="right" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
			    <td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0.00%')}" /></td>
			    <td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0')}" /></td>
			    <td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0.00%')}" /></td>
			    <td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
