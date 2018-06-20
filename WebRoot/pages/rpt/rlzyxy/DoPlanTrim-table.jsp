<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th align="center" rowspan="2" >单位</th>
			<th align="center" colspan="4" >百元人工成本创利</th>
		</tr>
		<tr>
			<th align="center" nowrap="nowrap">百元人工成本创利</th>
			<th align="center" nowrap="nowrap">目标</th>
			<th align="center" nowrap="nowrap">完成比例(年化)</th>
			<th align="center" nowrap="nowrap">排名</th>
		</tr>
	</thead>
    <tbody>
	    <s:iterator value="list" var="data">
			<tr>
				<!--  单位-->
				<td nowrap="nowrap" width="7%" align="left"  onclick="getSubList(this, '${AREA_NO}')">
					<a href="###"><s:property value="AREA_DESC"/>
				</td>
				<!--劳动生产率-->
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00')}" /></td>
				<!--目标  -->
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.00')}" /></td>
				<!--完成比例(年化)  -->
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
				<!--  排名-->
				<td align="right" width="7%"><s:property escapeHtml="false" value="KPI_04" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
