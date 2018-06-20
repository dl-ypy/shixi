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
			<th width="16%" align="center">指标</th>
			<th width="14%" align="center">本月完成</th>
			<th width="12%" align="center">环比</th>
			<th width="14%" align="center">本年累计</th>
			<th width="12%" align="center">同比</th>
			<th width="10%" align="center"> </th>
			<th width="12%" align="center">增幅</th>
			<th width="10%" align="center">排名</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'"
				<s:if test="RST5 == 1">
					style="border-top: 2px solid #FF7F7F;"
				</s:if>
			>
				<td nowrap="nowrap" onclick="part1TableClick('<s:property value="KPI_ID"/>', '<s:property value="KPI_NAME"/>')" width="16%" align="left">
					<a href='###'><s:property escapeHtml="false" value="KPI_NAME_SHOW"/></a>
				</td>
				<td align="center" width="14%"><s:property escapeHtml="false" value="%{kpiFmt(THIS_VALUE, RST2, '-')}" /></td>
				<td align="center" width="12%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_HB, RST3, '-')}" /></td>
				<td align="center" width="14%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_L, RST2, '-')}" /></td>
				<td align="center" width="12%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_L_HB, RST3, '-')}" /></td>
				<td align="center" width="10%">
					<s:if test="VALUE_L_ZF > 0">
						<span class="glyphicon glyphicon-triangle-top" aria-hidden="true" style="color: <s:property value="RST1"/>"></span>
					</s:if>
					<s:else>
						<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true" style="color: <s:property value="RST1"/>"></span>
					</s:else>
				</td>
				<td align="center" width="12%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_L_ZF, RST4, '-')}" /></td>
				<td align="center" width="10%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_L_ORD,'###,###,##0', '-')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
