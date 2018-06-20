<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; height:300px; overflow-y: scroll;">
<table class="grid" style="width:99%;" >
	<thead>
		<b:gHead target="tableDiv">
		<tr>
			<th width="9%" align="center">项目</th>
			<th align="center"></th>
			<th width="7%" align="center">项目收入</th>
			<th width="7%" align="center">项目成本</th>
			<th width="7%" align="center">税金及附加</th>
			<th width="7%" align="center">毛利</th>
			<th width="7%" align="center">毛利率</th>
			<th width="7%" align="center">对标排名</th>
			<th width="6%" align="center">平均水平</th>
		</tr>
		</b:gHead>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
	    	<tr>
	    		<td nowrap="nowrap" width="7%" align="left" onclick="getLineChart1()" class="part1Table">
					<a href="###"><s:property escapeHtml="false" value="KPI_NAME"/></a>
				</td>
				
				<!--指右侧点击的箭头  -->
				<td align="center" width="7%" style="text-align: center;cursor: pointer;" onmouseover="dyo_mouseOver(this)" onmouseout="dyo_mouseOut(this)"
				    onclick="drillTableByOrg(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')" >
				    <img class="dyo_span" src="<%=contextPath%>/resources/img/xxjt.png" alt="" style="display: none;width: 15px;height: 15px;">
				    <img class="dyo_span_zw" src="<%=contextPath%>/resources/img/zw.png" alt="" style="display: block;width: 15px;height: 15px;">
				</td>
				
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0', '-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0', '-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
