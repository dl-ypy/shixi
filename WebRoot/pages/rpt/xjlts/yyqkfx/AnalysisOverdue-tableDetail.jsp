<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; overflow: auto;">
<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th align="center" width="25%">单位</th>
			<th align="center" width="20%">营业欠款</th>
			<th align="center" width="20%">限额</th>
			<th align="center" width="20%">超限金额</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="list" var="data" status="status">
		    <tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td  width="20%" align="left">
					<s:property escapeHtml="false" value="DEPT_NAME"/>
				</td>
				<td  width="11%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td  width="11%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td  width="11%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<div align="right" style="width:100%"><b:pagiLink target="tableDetail" xa="true"></b:pagiLink></div>
</div>
