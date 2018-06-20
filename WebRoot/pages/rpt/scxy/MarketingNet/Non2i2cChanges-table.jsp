<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th align="center" rowspan="2" >单位</th>
			<th align="center" colspan="4" >市场毛利率（不含2I2C）同比变动</th>
		</tr>
		<tr>
			<th align="center" nowrap="nowrap">本年累计</th>
			<th align="center" nowrap="nowrap">上年同期</th>
			<th align="center" nowrap="nowrap">同比变动</th>
			<th align="center" nowrap="nowrap">排名</th>
		</tr>
	</thead>
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap"  onclick="getSubList(this, '${ORG_ID}')" width="7%" align="left">
					<a href='###'><s:property value="LEVEL_NAME"/></a>
				</td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0','-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
