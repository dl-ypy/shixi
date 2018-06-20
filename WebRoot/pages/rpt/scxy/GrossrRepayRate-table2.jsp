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
		<tr  >
			<th align="center" rowspan="2" style="border-right: 1px solid #D61821;">地市</th>
			<th align="center" rowspan="2" >回款率</th>
			<th align="center" rowspan="2" >排名</th>
			<th align="center" colspan="2" >本地业务</th>
			<th align="center" colspan="2" >云数据+运营公司</th>
			<th align="center" colspan="3" >合计</th>
		</tr>
		<tr>
			<th align="center" nowrap="nowrap">到期回款率</th>
			<th align="center" nowrap="nowrap">已回款</th>
			<th align="center" nowrap="nowrap">到期回款额</th>
			<th align="center" nowrap="nowrap">已回款</th>
			<th align="center" nowrap="nowrap">到期回款额</th>
			<th align="center" nowrap="nowrap">已回款</th>
			<th align="center" nowrap="nowrap">未收款</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" onclick="table2click('<s:property value="AREA_NO"/>' , '<s:property value="AREA_DESC"/>' )" width="10%" align="left" class="part2Table" 
				    id="part2Table<s:property value="AREA_NO"/>" style="border-right: 1px solid #D61821;">
					<a href='###'><s:property escapeHtml="false" value="AREA_DESC"/></a>
				</td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00%')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
				<td align="center" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0', '-')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0')}" /></td>
				<td align="center" width="8%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
