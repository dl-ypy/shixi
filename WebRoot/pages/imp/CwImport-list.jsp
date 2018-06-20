<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="hq" uri="/hq-tags" %>

<div style="width:100%;">
<table class="b-table-1" style="width:99%;" >
	<thead>
		<tr>
			<th width="8%" align="center">账期</th>
			<th width="8%" align="center">文件类型</th>
			<th width="8%" align="center">上传人</th>
			<th width="8%" align="center">上传时间</th>
			<th width="8%" align="center">上传文件</th>
			<th width="8%" align="center">入库状态</th>
			<th width="8%" align="center">入库结果</th>
			<th width="8%" align="center">操作</th>
		</tr>
	</thead>
</table>
</div>
<div style="width:100%;height:370px;overflow-y:auto;">
   <table class="b-table-1" style="width:99%;">
        <tbody>
		    <s:iterator value="list" var="data">
				<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
					<td width="7%" align="center" ><s:property value="MONTH_ID"/></td>
					<td width="7%" align="center" ><s:property value="EXCEL_NAME"/></td>
					<td width="7%" align="center" ><s:property value="USER_NAME"/></td>
					<td width="7%" align="center" ><s:property value="UP_TIME"/></td>
					<td width="7%" align="center" >《<s:property value="UP_EXCEL_NAME"/>》</td>
					<td width="7%" align="center" ><s:property value="IMP_STATUS_DESC"/></td>
					<td width="7%" align="center" ><s:property value="IMP_RESULT"/></td>
					<td width="7%" align="center" >
						<s:if test="IMP_STATUS == 1 || IMP_STATUS == 5">
							<a href="###" onclick="showImpResult('<s:property value="LOG_ID"/>','<s:property value="EXCEL_ID"/>')">查看</a>
						</s:if>
						<s:else>
							--
						</s:else>
					</td>
				</tr>
			</s:iterator>
		</tbody>
   </table>
<div align="right" style="width:96%"><b:pagiLink action="CwImport!queryList" target="mainDiv" xa="true"/></div>
</div>