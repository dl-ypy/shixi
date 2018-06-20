<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; overflow: auto;">
<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th width="4%" align="center" rowspan="2">单位</th>
			<th width="24%" align="center" colspan="4">市场毛利率（不含2I2C）预算完成</th>
		</tr>
		<tr>
			<th width="6%" align="center">本年累计</th>
			<th width="6%" align="center">预算目标</th>
			<th width="6%" align="center">超出预算</th>
			<th width="6%" align="center">排名</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" onclick="part1TableClick('<s:property value="AREA_NO"/>', '<s:property value="AREA_DESC"/>')" width="4%" align="left" class="part1TableTd">
					<a href='###'><s:property escapeHtml="false" value="AREA_DESC"/></a>
				</td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00%')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.00%')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
				<td align="center" width="6%">
					<s:if test="AREA_NO != 'root'">
						<s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0','-')}" />
					</s:if>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
