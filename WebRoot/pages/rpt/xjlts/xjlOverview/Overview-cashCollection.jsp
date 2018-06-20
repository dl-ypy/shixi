<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery(".topTableTr")[0].click();
});


 function getLineChart(org,kpiId,kpiName,unit){
	 jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/xjlts/xjlOverview/Overview!queryCollectChart.action',
	 	    type: "post",
	 	    data: {
	 			"areaNo": areaNo,
	 			"kpiCode":kpiId,
	 			"monthId":monthId
	 		},
	 		dataType: "json",
	 		success:function(data){
	 			lineChart(data,kpiName,'chart',unit);
	 		}
	 	});
 }
</script>
<div class="row" style="height:300px;">
  <div class="col-xs-6 col-sm-6 col-md-6">
    <table class="grid" style="width:99%;margin-top:3%;" >
	  <thead>
		<tr>
			<th align="center" nowrap="nowrap">指标</th>
			<th align="center" nowrap="nowrap">当月</th>
			<th align="center" nowrap="nowrap">上月</th>
			<th align="center" nowrap="nowrap">环比</th>
		</tr>
	  </thead>
      <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" onclick="getLineChart(this, '${KPI_ID}','${KPI_NAME}','${RST1}')" width="7%" align="left" class="topTableTr"><a href="###"><s:property value="KPI_NAME"/></a></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.00')}" /></td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
			</tr>
		</s:iterator>
	  </tbody>
    </table>
  </div>
  <div class="col-xs-6 col-sm-6 col-md-6" >
      <div id="chart" style="height:290px;margin-top:10px;"></div>
   </div>
</div>
