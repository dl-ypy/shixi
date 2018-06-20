<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<script type="text/javascript">
jQuery(document).ready(function() {
	 var dataList=${test};
	 var areaNo="${areaNo}";
	 var data;
	 if(dataList.list1.length>0){
		 if(areaNo=="root"){
			var firstthree = dataList.firstThree;
			var lastthree  =  dataList.lastThree;
			var targetcity =  dataList.target;
			 //data="省公司：现金收入比为 ";
			  data = "省公司：现金收入比为 "+dataList.list1[0].KPI_01+"%，北十第 "+dataList.list1[0].KPI_02+"，前三为："+firstthree+"，后三为："+lastthree+"，低于预算目标的有："+targetcity+"。";
		 }else{
			  data = "市公司：现金收入比为"+dataList.list1[0].KPI_01+"%，全省第 "+dataList.list1[0].KPI_02+"， "+dataList.list1[0].TARGET+dataList.list1[0].KPI+" PP。"
		 } 
	 }else{
		 data = "暂时没有数据显示。";
	 } 
	
	// document.getElementById("target").innerHTML = "目标值为 "+dataList.KPI; 
	 document.getElementById("Provice").innerHTML = data;
});
</script>
<div class="row" >
   <span style="float:left;margin-left:30px;" id="Provice"></span>
</div>
<div style="width:100%;">
<table class="grid" style="width:99%;margin-top:2%;" >
	<thead>
		<tr>
			<th align="center" nowrap="nowrap">指标</th>
			<th align="center" nowrap="nowrap">本月</th>
			<th align="center" nowrap="nowrap">上月</th>
			<th align="center" nowrap="nowrap">环比</th>
			<th align="center" nowrap="nowrap">本年累计</th>
			<th align="center" nowrap="nowrap">同比</th>
		</tr>
	</thead>
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" onclick="getChart(this, '${KPI_ID}','${KPI_NAME}','${RST1}','${RST2}')" width="7%" align="left"  class="topTableTr"><a href="###" ><s:property value="KPI_NAME"/></a></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.00')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0.00')}" /></td>
			    <td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0.00%')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
