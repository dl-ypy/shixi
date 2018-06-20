<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%; overflow: auto;height:380px">
<table class="grid" style="width:99%;" >
	<thead>
		<tr>
			<th align="center" width="28%">指标</th>
			<th align="center" width="4%"></th>
			<th align="center" width="15%">单位</th>
			<th align="center" width="15%">当月</th>
			<th align="center" width="15%">上月</th>
			<th align="center" width="15%">环比</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="list" var="data" status="status">
		    <tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td  width="35%" align="left" onclick="table2Click('<s:property value="KPI_ID"/>', '<s:property value="KPI_NAME"/>', '<s:property value="ORG_ID"/>')" >
					<a href='###'><s:property escapeHtml="false" value="KPI_NAME"/>
					</a>
				</td>
				<td style="text-align: center;width: 5px;cursor: pointer;" onclick="drillTableByOrg2(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')" onmouseover="dyo_mouseOver(this)" onmouseout="dyo_mouseOut(this)">
					<img class="dyo_span" src="<%=contextPath%>/resources/img/xxjt.png" alt="" style="display: none;width: 15px;height: 15px;">
					<img class="dyo_span_zw" src="<%=contextPath%>/resources/img/zw.png" alt="" style="display: block;width: 15px;height: 15px;">	    
				</td>
				<td style="text-align: center;width: 5px;cursor: pointer;font-size:10px">万元</td>
				<td  width="13%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				<td  width="13%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0')}" /></td>
				<td  width="13%" align="center" ><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
