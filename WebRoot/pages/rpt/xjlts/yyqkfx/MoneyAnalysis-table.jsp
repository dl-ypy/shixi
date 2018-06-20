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
			<th align="center" rowspan="2" style="border-right: 1px solid #D61821;">单位</th>
			<th align="center" colspan="5" style="border-right: 1px solid #D61821;">本月</th>
			<th align="center" colspan="5" style="border-right: 1px solid #D61821;">环比变动</th>
		</tr>
		
		<tr>
			<th align="center">营业款结算</th>
			<th align="center">应收账款-代办单位营业款</th>
			<th align="center">合计</th>
			<th align="center">占收比</th>
			<th align="center" style="border-right: 1px solid #D61821;">排名</th>
			
			<th align="center">营业款结算</th>
			<th align="center">应收账款-代办单位营业款</th>
			<th align="center">本月合计</th>
			<th align="center">合计环比</th>
			<th align="center" style="border-right: 1px solid #D61821;">占收比</th>
			
		</tr>
	</thead>
	<tbody>
		<s:iterator value="list" var="data" status="status">
		    <tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" width="7%" align="left" style="border-right: 1px solid #D61821;"><s:property value="AREA_DESC"/></td>
			
				<td width="7%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0')}" /></td>
				<td width="7%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
				<td width="7%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0')}" /></td>
				<td width="7%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0.00%')}" /></td>
				<td width="7%" align="center" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_13,'###,###,##0')}" /></td>
				
					
				<td width="7%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0')}" /></td>
				<td width="7%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0')}" /></td>
				<td width="7%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0')}" /></td>
				<td width="7%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0.00%')}" /></td>
				<td width="7%" align="center" style="border-right: 1px solid #D61821;"><s:property escapeHtml="false" value="%{kpiFmt(KPI_14,'###,###,##0.00%')}" /></td>
				
			</tr>
		</s:iterator>
	</tbody>
	
</table>
</div>
