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
			<th width="25%" align="center">名称</th>
			<th align="center"></th>
			<th width="25%" align="center">编码</th>
			<th width="25%" align="center">排序</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<s:if test="HAVE_CHILDREN == 1">
					<td align="left" width="25%" onclick="drillTable(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')" style="cursor: pointer;" class="drillTd" nowrap="nowrap">
						<img id='IMG_${KPI_ID}_${ORG_ID}' src="<%=contextPath%>/resources/frame/DrillTable/icon-right.png" width="17" height="17" border="0" />&nbsp;
						<a href='###' ><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:if>
				<s:else>
					<td align="left" width="25%" nowrap="nowrap">
						<img id='IMG_${KPI_ID}_${ORG_ID}'' src="<%=contextPath%>/resources/frame/DrillTable/icon-null.png" width="17" height="17" border="0" />&nbsp;
						<a href='###' ><s:property escapeHtml="false" value="KPI_NAME"/></a>
					</td>
				</s:else>
				<td style="text-align: center;width: 25px;cursor: pointer;" onclick="drillTableByOrg(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>')" onmouseover="dyo_mouseOver(this)" onmouseout="dyo_mouseOut(this)">
				    <img class="dyo_span" src="<%=contextPath%>/resources/img/xxjt.png" alt="" style="display: none;width: 15px;height: 15px;">
				    <img class="dyo_span_zw" src="<%=contextPath%>/resources/img/zw.png" alt="" style="display: block;width: 15px;height: 15px;">
				</td>
				<td align="center" width="25%"><s:property escapeHtml="false" value="KPI_ID"/></td>
				<td align="center" width="25%"><s:property escapeHtml="false" value="HAVE_CHILDREN"/></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
