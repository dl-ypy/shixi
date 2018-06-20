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
			<th width="16%" align="center">六张网</th>
			<th width="14%" align="center">指标名称</th>
			<th width="14%" align="center">本年累计</th>
			<th width="10%" align="center"> </th>
			<th width="10%" align="center">变动</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<s:if test="RST5 > 0">
					<td nowrap="nowrap"  rowspan="<s:property escapeHtml="false" value="RST5"/>" width="16%" align="left"><s:property escapeHtml="false" value="RST4"/></td>
				</s:if>
			
				<td nowrap="nowrap" onclick="part6TableClick('<s:property value="KPI_ID"/>', '<s:property value="KPI_NAME"/>')" width="16%" align="left" class="part6TableTd">
					<a href='###'><s:property escapeHtml="false" value="KPI_NAME_SHOW"/></a>
				</td>
				<td align="center" width="14%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_L,'###,###,##0.00')}" /></td>
				<td align="center" width="10%">
					<s:if test="VALUE_BH > 0">
						<span class="glyphicon glyphicon-triangle-top" aria-hidden="true" style="color: <s:property value="RST1"/>"></span>
					</s:if>
					<s:else>
						<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true" style="color: <s:property value="RST1"/>"></span>
					</s:else>
				</td>
				<td align="center" width="10%"><s:property escapeHtml="false" value="%{kpiFmt(VALUE_BH,'###,###,##0.00%')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
