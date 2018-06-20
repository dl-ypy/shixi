<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; height:300px;">
<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th width="10%" align="center">地域</th>
			<th width="10%" align="center">指标值</th>
			<th width="10%" align="center">变化量</th>
			<th width="9%" align="center">排名</th>
			<th width="10%" align="center">排名变化量</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td align="center" width="10%"><s:property escapeHtml="false" value="ORG_NAME"/></td>
				<td align="center" width="10%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00')}" /></td>
				<td align="center" width="10%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0.00')}" /></td>
				<td align="center" width="9%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0','-')}" /></td>
				<td align="center" width="10%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0','-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
