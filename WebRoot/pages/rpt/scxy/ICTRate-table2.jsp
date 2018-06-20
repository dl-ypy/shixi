<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; height:420px; overflow-y: scroll;">
<table class="grid" style="width:99%;" >
	<thead>
		<b:gHead target="tableDiv">
		<tr>
			<th width="9%" align="center" rowspan="2">地市</th>
			<th width="7%" align="center" rowspan="2">回款率</th>
			<th width="7%" align="center" rowspan="2">排名</th>
			<th width="7%" align="center" colspan="2">本地业务</th>
			<th width="7%" align="center" colspan="2">系统集成+运营公司</th>
			<th width="7%" align="center" colspan="3">合计</th>
		</tr>
		<tr>
			<th width="7%" align="center">到期回款额</th>
			<th width="7%" align="center">已回款</th>
			
			<th width="7%" align="center">到期回款额</th>
			<th width="7%" align="center">已回款</th>
			
			<th width="7%" align="center">到期回款额</th>
			<th width="7%" align="center">已回款</th>
			<th width="7%" align="center">未收款</th>
		</tr>
		</b:gHead>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
	    	<tr>
	    		<td nowrap="nowrap" width="7%" align="center" onclick="getLineChart2('<s:property value="AREA_NO"/>')" class="part2Table">
					<a href="###"><s:property value="AREA_DESC"/></a>
				</td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0', '-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0', '-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0', '-')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0', '-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
