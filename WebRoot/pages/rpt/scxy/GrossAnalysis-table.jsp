<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid" style="width:99%;" >
	<thead>
		<tr  >
			<th align="center" nowrap="nowrap">业务类型</th>
			<th align="center"></th>
			<th align="center" nowrap="nowrap">收入完成</th>
			<th align="center" nowrap="nowrap">收入占比</th>
			<th align="center" nowrap="nowrap">毛利完成</th>
			<th align="center" nowrap="nowrap">毛利占比</th>
			<th align="center" nowrap="nowrap">业务毛利润率</th>
			<th align="center" nowrap="nowrap">对标排名</th>
			<th align="center" nowrap="nowrap">平均水平</th>
		</tr>
	</thead>
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td width="12%" align="left"> <s:property escapeHtml="false" value="KPI_NAME"/></td>
				
				<!--指右侧点击的箭头  -->
				<td align="center" width="7%" style="text-align: center;cursor: pointer;" onmouseover="dyo_mouseOver(this)" onmouseout="dyo_mouseOut(this)"
				    onclick="drillTableByOrg(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')" >
				    <img class="dyo_span" src="<%=contextPath%>/resources/img/xxjt.png" alt="" style="display: none;width: 15px;height: 15px;">
				    <img class="dyo_span_zw" src="<%=contextPath%>/resources/img/zw.png" alt="" style="display: block;width: 15px;height: 15px;">
				</td>
				
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
