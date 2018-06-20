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
			<th width="10%" align="center" style="border-right: 1px solid #D61821;">地市</th>
			<th width="8%" align="center">IDC收入</th>
			<th width="8%" align="center">市场线成本</th>
			<th width="8%" align="center">网络线成本</th>
			<th width="7%" align="center" style="border-right: 1px solid #D61821;">折旧</th>
			<th width="8%" align="center">税全及附加</th>
			<th width="8%" align="center">IDC利润</th>
			<th width="8%" align="center">利润率</th>
			<th width="7%" align="center" style="border-right: 1px solid #D61821;">排名</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" onclick="table1click('<s:property value="AREA_NO"/>' , '<s:property value="AREA_DESC"/>' )" width="10%" align="left" class="part1Table" 
				    id="part1Table<s:property value="AREA_NO"/>" style="border-right: 1px solid #D61821;">
					<a href='###'><s:property escapeHtml="false" value="AREA_DESC"/></a>
				</td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0', '-')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0', '-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
