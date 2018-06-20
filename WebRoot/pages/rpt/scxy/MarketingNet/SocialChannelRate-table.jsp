<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th align="center" rowspan="2" >单位</th>
			<th align="center" colspan="2" >社会渠道毛利率</th>
		</tr>
		<tr>
			<th align="center" nowrap="nowrap">${monthId}</th>
			<th align="center" nowrap="nowrap">排名</th>
		</tr>
	</thead>
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<!--  单位-->
				<td nowrap="nowrap" onclick="getSubList(this, '${AREA_NO}')" width="7%" align="left" class="part1TableTd">
					<a href="###"><s:property value="AREA_DESC"/></a>
				</td>
				<!--  月份社会渠道的毛利率-->
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00%')}" /></td>
				<!--  排名-->
				<td align="center" width="7%"><s:property escapeHtml="false" value="KPI_02" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
