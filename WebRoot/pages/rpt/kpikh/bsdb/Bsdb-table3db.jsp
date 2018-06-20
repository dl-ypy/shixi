<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th width="8%" align="center" rowspan="3">省份</th>
			<th width="10%" align="center" colspan="3">${thisMonth}月</th>
			<th width="10%" align="center" colspan="3">${lastMonth}月</th>
			<th width="10%" align="center" colspan="3">差异</th>
		</tr>
		<tr>
			<th width="10%" align="center" colspan="3">${table3dbNum}</th>
			<th width="10%" align="center" colspan="3">${table3dbNum}</th>
			<th width="10%" align="center" colspan="3">${table3dbNum}</th>
		</tr>
		<tr>
			<th width="5%" align="center">得分</th>
			<th width="5%" align="center">分南北排名</th>
			<th width="5%" align="center">全国排名</th>
			<th width="5%" align="center">得分</th>
			<th width="5%" align="center">分南北排名</th>
			<th width="5%" align="center">全国排名</th>
			<th width="5%" align="center">得分</th>
			<th width="5%" align="center">分南北排名</th>
			<th width="5%" align="center">全国排名</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'"
				<s:if test='ORG_ID == "076"'>
				    style="background-color: #FFFF99;"
				</s:if>
			>
				<td align="center" width="8%"><s:property escapeHtml="false" value="ORG_NAME"/></td>
				<td align="center" width="5%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_001,'###,###,##0.00')}" /></td>
				<td align="center" width="5%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_002,'###,###,##0','-')}" /></td>
				<td align="center" width="5%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_003,'###,###,##0','-')}" /></td>
				<td align="center" width="5%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_004,'###,###,##0.00')}" /></td>
				<td align="center" width="5%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_005,'###,###,##0','-')}" /></td>
				<td align="center" width="5%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_006,'###,###,##0','-')}" /></td>
				<td align="center" width="5%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_007,'###,###,##0.00')}" /></td>
				<td align="center" width="5%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_008,'###,###,##0','-')}" /></td>
				<td align="center" width="5%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_009,'###,###,##0','-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
