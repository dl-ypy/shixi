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
		<tr style="border-bottom: 2px solid #D61821;">
           <th style="text-align: center;">指标</th>
           <th style="text-align: center;">单位</th>
           <th width='15%'>本年累计</th>
           <th width='15%'>同比增长</th>
           <th width='15%'>增幅</th>
           <th width='15%'>排名</th>
        </tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" onclick="getPart5Line('<s:property value="KPI_ID"/>', '<s:property value="KPI_NAME"/>')" width="16%" align="left">
					<a href='###'><s:property escapeHtml="false" value="KPI_NAME"/></a>
				</td>
				<td align="center" width='15%'><s:property escapeHtml="false" value="RST1"/></td>
				<td align="center" width='15%'><s:property escapeHtml="false" value="%{kpiFmt(VALUE_L,'###,###,##0')}" /></td>
				<td align="center" width='15%'><s:property escapeHtml="false" value="%{kpiFmt(VALUE_TB,'###,###,##0')}" /></td>
				<td align="center" width='15%'><s:property escapeHtml="false" value="%{kpiFmt(VALUE_ZF,'###,###,##0.00%')}" /></td>
			    <td align="center" width='15%'><s:property escapeHtml="false" value="%{kpiFmt(PM,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
