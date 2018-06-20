<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; height:300px; overflow-y: scroll;">
<table class="grid" style="width:99%;">
	<thead>
		<tr>
			<th width="20%" align="center" style="border-right: 1px solid #D61821;">地域</th>
			<th width="20%" align="center">当月值</th>
			<th width="20%" align="center">变化量</th>
			<th width="20%" align="center">排名</th>
			<th width="20%" align="center">变化量</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
					<td nowrap="nowrap" width="20%" align="left" style="border-right: 1px solid #D61821;">
						<s:property escapeHtml="false" value="AREA_DESC"/>
					</td>
				<td align="center" width="20%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.000', '-')}" /></td>
				<td align="center" width="20%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.000', '-')}" /></td>
				<td align="center" width="20%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0', '-')}" /></td>
				<td align="center" width="20%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0', '-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
