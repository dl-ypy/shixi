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
			<th align="center" rowspan="2" >单位</th>
			<th align="center" colspan="6" >营业欠款超限</th>
		</tr>
		<tr>
			<th align="center" nowrap="nowrap">超限网点个数</th>
			<th align="center" nowrap="nowrap">排名</th>
			<th align="center" nowrap="nowrap">超限网点营业欠款</th>
			<th align="center" nowrap="nowrap">限额</th>
			<th align="center" nowrap="nowrap">超限金额</th>
			<th align="center" nowrap="nowrap">排名</th>
		</tr>
	</thead>
    <tbody>
	    <s:iterator value="list" var="data">
			<tr>
				<td  width="20%" align="left" onclick="tableClick('<s:property value="LEVEL_ID"/>')" >
					<a href='###'><s:property escapeHtml="false" value="LEVEL_NAME"/>
					</a>
				</td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="KPI_01" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="KPI_02" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="KPI_06" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
