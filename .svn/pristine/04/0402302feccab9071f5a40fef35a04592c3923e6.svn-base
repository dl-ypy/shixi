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
			<th width="10%" align="center" style="border-right: 1px solid #D61821;">省分</th>
			<th width="8%" align="center">本月完成</th>
			<th width="8%" align="center">环比增长</th>
			<th width="8%" align="center">环比增幅</th>
			<th width="7%" align="center" style="border-right: 1px solid #D61821;">排名</th>
			<th width="8%" align="center">累计完成</th>
			<th width="8%" align="center">同比增长</th>
			<th width="8%" align="center">同比增幅</th>
			<th width="7%" align="center" style="border-right: 1px solid #D61821;">排名</th>
			<th width="8%" align="center">时序进度目标</th>
			<th width="8%" align="center">完成比例</th>
			<th width="7%" align="center">排名</th>
			<th width="8%" align="center">时序目标缺口(负数表示缺口)</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" onclick="table2click('<s:property value="ORG_ID"/>' , '<s:property value="ORG_NAME"/>' )" width="10%" align="left" class="part2Table" id="part2Table<s:property value="ORG_ID"/>" style="border-right: 1px solid #D61821;">
					<a href='###'><s:property escapeHtml="false" value="ORG_NAME"/></a>
				</td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0', '-')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0', '-')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0', '-')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
