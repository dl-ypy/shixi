<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="hq" uri="/hq-tags" %>

<div style="width:100%;">
<table class="b-table-1" style="width:99%;" >
	<thead>
		<tr>
			<th width="30%" align="center">Sheet</th>
			<th width="30%" align="center">数据表</th>
			<th width="30%" align="center">导入行数</th>
		</tr>
	</thead>
</table>
</div>
<div style="width:100%;height:300px;overflow-y:auto;">
   <table class="b-table-1" style="width:99%;">
        <tbody>
			<s:if test="list.size() == 0">
				<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
					<td colspan="3" align="center">无正确导入记录</td>
				</tr>
			</s:if>
			<s:else>
			    <s:iterator value="list" var="data">
					<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
						<td width="30%" align="center" ><s:property value="SHEET_NAME"/></td>
						<td width="30%" align="center" ><s:property value="TABLE_NAME"/></td>
						<td width="30%" align="center" ><s:property value="TABLE_ROWS"/></td>
					</tr>
				</s:iterator>
			</s:else>
		</tbody>
   </table>
   <br/>
</div>