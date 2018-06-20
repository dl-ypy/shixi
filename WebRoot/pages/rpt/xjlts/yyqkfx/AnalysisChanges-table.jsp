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
			<th align="center" width="20%" rowspan='2'>单位</th>
			<th align="center" width="80%" colspan='7'>营业欠款变动幅度</th>
		</tr>
		<tr>
			<th align="center" width="11%">-10%以下</th>
			<th align="center" width="11%">-10%~-5%</th>
			<th align="center" width="11%">-5%~0%</th>
			<th align="center" width="11%">0%~5%</th>
			<th align="center" width="11%">5%~10%</th>
			<th align="center" width="11%">10%以上</th>
			<th align="center" width="11%">营业厅合计</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="list" var="data" status="status">
		    <tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td  width="20%" align="left" onclick="tableClick('<s:property value="LEVEL_ID"/>')" >
					<a href='###'><s:property escapeHtml="false" value="LEVEL_NAME"/>
					</a>
				</td>
				<td  width="11%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td  width="11%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td  width="11%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td  width="11%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0')}" /></td>
				<td  width="11%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td  width="11%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
				<td  width="11%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
