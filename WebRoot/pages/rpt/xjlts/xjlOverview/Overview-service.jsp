<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String contextPath = request.getContextPath();
%>
<div class="row" style="margin-top:1%;">
	<div class="col-xs-6 col-sm-6 col-md-6">
		<table class="grid" style="width: 99%;">
			<thead>
				<tr>
					<th align="center" nowrap="nowrap">指标</th>
					<th align="center" nowrap="nowrap">本年累计</th>
					<th align="center" nowrap="nowrap">年初</th>
					<th align="center" nowrap="nowrap">增幅</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="list" var="data">
					<tr onMouseOut="this.bgColor=''"
						onMouseOver="this.bgColor='#DFEfFf'">
						<td nowrap="nowrap" width="7%" align="left"><s:property
								value="KPI_NAME" /></td>
						<td align="right" width="7%"><s:property escapeHtml="false"
								value="%{kpiFmt(KPI_01,'###,###,##0.00')}" /></td>
						<td align="right" width="7%"><s:property escapeHtml="false"
								value="%{kpiFmt(KPI_02,'###,###,##0.00')}" /></td>
						<td align="right" width="7%"><s:property escapeHtml="false"
								value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<div class="col-xs-5 col-sm-5 col-md-5">
		<span style="color: red; float: left; margin-left: 10px;">预警： </span><br>
		<div>
			<table
				style="width: 99%; font-size: 14px; margin-left: 15px;margin-top:10px;">
				<thead>
				</thead>
				<tbody>
					<s:if test="areaNo=='root'">
						<s:iterator value="list1" var="data">
							<tr>
								<td align="left" width="7%"><s:property
										value="KPI_NAME+'的有  '+KPI_01+'个，其中前三是：'+FIRST_THREE" /></td>
							</tr>
						</s:iterator>
					</s:if>
					<s:if test="areaNo!='root'">
						<s:iterator value="list1" var="data">
							<tr>
								<td align="left" width="7%"><s:property
										value="KPI_NAME+'，全省排名第：'+KPI_03" /></td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
		</div>
	</div>
</div>