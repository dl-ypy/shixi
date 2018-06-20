<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
%>
<%String contextPath = request.getContextPath();%>
<div style="width:100%;">
<table class="grid_line" style="width:99%;" >
	<thead>
		<tr>
			<th width="10%" align="center" rowspan="3" style="border-right: 2px solid #D61821;">省份</th>
			<th width="12%" align="center" rowspan="2" colspan="2" style="border-right: 2px solid #D61821;">合计</th>
			<th width="24%" align="center" colspan="4" style="border-right: 2px solid #D61821;">收入规模类</th>
			<th width="24%" align="center" colspan="4" style="border-right: 2px solid #D61821;">效益价值类</th>
			<th width="30%" align="center" colspan="5" style="border-bottom: 2px solid #D61821;">年度重点类</th>
		</tr>
		<tr>
			<th width="24%" align="center" colspan="4" style="border-right: 2px solid #D61821;">主营业务收入（38）</th>
			<th width="18%" align="center" colspan="3" style="border-right: 2px solid #D61821;">利润总额（38）</th>
			<th width="6%" align="center" rowspan="2" style="border-right: 2px solid #D61821;">EVA（4）</th>
			<th width="12%" align="center" colspan="2" style="border-right: 1px solid #D61821;">移动业务出账用户净增及4G渗透率（8）</th>
			<th width="12%" align="center" colspan="2" style="border-right: 2px solid #D61821;border-top: 2px solid #D61821;">宽带有效用户净增及融合业务渗透率（6）</th>
			<th width="6%" align="center" rowspan="2">申诉率（4）</th>
		</tr>
		<tr>
			<th width="6%" align="center" style="border-right: 1px solid #D61821;">得分</th>
			<th width="6%" align="center" style="border-right: 2px solid #D61821;">区域排名</th>
			<th width="6%" align="center" style="border-right: 1px solid #D61821;">预算完成</th>
			<th width="6%" align="center" style="border-right: 1px solid #D61821;">2I2C业务转化率</th>
			<th width="6%" align="center" style="border-right: 1px solid #D61821;">收入增长率</th>
			<th width="6%" align="center" style="border-right: 2px solid #D61821;">收入贡献度</th>
			<th width="6%" align="center" style="border-right: 1px solid #D61821;">预算完成</th>
			<th width="6%" align="center" style="border-right: 1px solid #D61821;">收入利润率</th>
			<th width="6%" align="center" style="border-right: 2px solid #D61821;">利润贡献度</th>
			<th width="6%" align="center" style="border-right: 1px solid #D61821;">移动业务出账用户净增</th>
			<th width="6%" align="center" style="border-right: 1px solid #D61821;">4G渗透率</th>
			<th width="6%" align="center" style="border-right: 1px solid #D61821;">宽带有效用户净增</th>
			<th width="6%" align="center" style="border-right: 2px solid #D61821;">融合业务渗透率</th>
		</tr>
	</thead>
	<tbody>
	    <s:iterator value="list" var="data">
	          <tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td align="center" width="10%"><s:property escapeHtml="false" value="ORG_NAME"/></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0','-')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_13,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_14,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_15,'###,###,##0.00')}" /></td>
			  </tr>
	     </s:iterator>
	          <tr style="height: 20px;">
				<td align="center" width="10%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
				<td align="center" width="6%"></td>
			  </tr>
	    <s:iterator value="dfList" var="data">
	          <tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td align="center" width="10%"><s:property escapeHtml="false" value="ORG_NAME"/></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0','-')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_06,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_07,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_08,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_09,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_10,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_11,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_12,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_13,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_14,'###,###,##0.00')}" /></td>
				<td align="center" width="6%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_15,'###,###,##0.00')}" /></td>
			  </tr>
		</s:iterator>
	</tbody>
</table>
</div>
