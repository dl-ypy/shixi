<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; overflow-y: auto; height:250px">
<table class="grid" style="width:99%;" >
	<tbody>
		<s:iterator value="list" var="data" status="status">
		    <tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td  width="25%" align="left" onclick="table1Click('<s:property value="KPI_ID"/>', '<s:property value="KPI_NAME"/>', '<s:property value="LEVEL_ID"/>' )" >
					<a href='###'><s:property escapeHtml="false" value="KPI_NAME"/></a>
				</td>
				<td style="text-align: center;width: 10px;cursor: pointer;font-size:10px"></td>
				<td style="text-align: center;width: 10px;cursor: pointer;font-size:10px">万元</td>
				<td  width="15%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td  width="15%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td  width="15%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
