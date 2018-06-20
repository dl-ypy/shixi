<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th width="33%" align="center">编码</th>
			<th width="33%" align="center">名称</th>
			<th width="33%" align="center">排序</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td align="center" width="33%"><s:property escapeHtml="false" value="LEVEL_ID"/></td>
				<td align="center" width="33%"><s:property escapeHtml="false" value="LEVEL_NAME"/></td>
				<td align="center" width="33%"><s:property escapeHtml="false" value="ORD"/></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
