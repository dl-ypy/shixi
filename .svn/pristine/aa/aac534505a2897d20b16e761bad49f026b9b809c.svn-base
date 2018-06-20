<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>

<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
String contextPath = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <title>营业欠款超限分析</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap/3.3.6/bootstrap.min.css" media="screen">
		<link rel="stylesheet" type="text/css" href="../../../resources/frame/jedate-6.0.2/skin/jedate.css">
		<link href="<s:url value="/struts/pure/css/grey.css?ver=1.5.1-SNAPSHOT"/>" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="../../../resources/js/jquery/1.12.0/jquery.min.js"></script>
	    <script type="text/javascript" src="../../../resources/js/bootstrap/3.3.6/bootstrap.min.js"></script>
	    <script type="text/javascript" src="../../../resources/frame/jedate-6.0.2/jquery.jedate.min.js"></script>
	    <script type="text/javascript" src="../../../resources/frame/echarts-3.8.4/echarts.min.js"></script>
	    <script type="text/javascript" src="../../../resources/frame/echarts-3.8.4/map/henan.js"></script>
	  	<script type="text/javascript">
	  		var monthId;
	  		var areaNo;
	  		/* 页面初始化 */
	  		jQuery(document).ready(function(){
	  	    	areaNo = jQuery("#areaNo").val();
	  	    	monthId = jQuery("#monthId").val();
	  	    	jQuery("#monthId").jeDate({
	  	       	   format:"YYYY-MM"
	  	        });
	  	    	select();
	  	    });
	  		
	  		/* 点击查询 */
	  		function select() {
	  			monthId = jQuery("#monthId").val();
	  			areaNo = jQuery("#areaNo").val();
	  			table();
	  			getMapChart();
	  			tableDetail();
	  			getWarnText();
	  		}
	  		
	  		/* 表格ajax */
	  		function table() {
				
	  			jQuery.ajax({
	  				url:'<%=contextPath%>/rpt/xjlts/yyqkfx/AnalysisOverdue!getTableList.action',
	  				type:'post',
	  				data:{
	  					"monthId":monthId,
	  					"areaNo":areaNo
	  				},
	  				cache:false,
	  				success:function(html) {
	  					jQuery("#table").html(html);
	  				}
	  			});
	  		}
	  		function tableClick(level_id){
	  			jQuery.ajax({
					url: '<%=contextPath%>/rpt/xjlts/yyqkfx/AnalysisOverdue!getWarnText.action',
					type:"POST",
				    data: {
				   /*level_id=orgID  */ 	
						"monthId": monthId,
						"levelId":level_id
					},
					dataType: "json",
					cache:false,
					success:function(data) {
						
						if(data.add.length>0){
						    document.getElementById("KPI").innerHTML = data.add[0];
						}
						if(data.mapList.length>0){
							var title =data.mapList[0];
		 			        document.getElementById("KPI_01").innerHTML = title.KPI_01;
		 			        document.getElementById("KPI_02").innerHTML = title.KPI_02;
		 			        document.getElementById("KPI_03").innerHTML = title.KPI_03;
		 			      	document.getElementById("KPI_04").innerHTML = title.KPI_04;
		 			      	document.getElementById("KPI_05").innerHTML = title.KPI_05;
						}
					}
				});
	  			
	  		}
	  		function getWarnText(){
	  			tableClick("root");
	  		}
	  		
	  		/* 图表 */
			function getMapChart(){
				jQuery.ajax({
					url: '<%=contextPath%>/rpt/xjlts/yyqkfx/AnalysisOverdue!getMapChart.action',
					type:"POST",
				    data: {
						"monthId": monthId,
						"areaNo":areaNo
					},
					dataType: "json",
					cache:false,
					success:function(data) {
						mapChart(data,"map");
					}
				});
			}
		    var areas = [{'areaNo':'root','areaDesc':'全省'},
						{'areaNo':'760','areaDesc':'郑州'},
						{'areaNo':'761','areaDesc':'洛阳'},
						{'areaNo':'762','areaDesc':'开封'},
						{'areaNo':'763','areaDesc':'焦作'},
						{'areaNo':'764','areaDesc':'新乡'},
						{'areaNo':'765','areaDesc':'许昌'},
						{'areaNo':'766','areaDesc':'漯河'},
						{'areaNo':'767','areaDesc':'安阳'},
						{'areaNo':'768','areaDesc':'商丘'},
						{'areaNo':'769','areaDesc':'平顶山'},
						{'areaNo':'770','areaDesc':'周口'},
						{'areaNo':'771','areaDesc':'驻马店'},
						{'areaNo':'772','areaDesc':'三门峡'},
						{'areaNo':'773','areaDesc':'濮阳'},
						{'areaNo':'774','areaDesc':'鹤壁'},
						{'areaNo':'775','areaDesc':'济源'},
						{'areaNo':'776','areaDesc':'信阳'},
						{'areaNo':'777','areaDesc':'南阳'}];

		function mapChart(data,chartDivId) {
			var mapList = data.mapList;
			var jsonData = [];
			for (var i = 0; i < mapList.length; i++) {
				var subJsonData = {"name": mapList[i].AREA_DESC, "value": mapList[i].KPI_01};
				jsonData.push(subJsonData);
			}
			jQuery("#" + chartDivId).empty();
			jQuery("#" + chartDivId).removeAttr("_echarts_instance_");
			var mapChart = echarts.init(document.getElementById(chartDivId));
			var mapOption = {
					tooltip : {
						trigger: 'item'
					},
					visualMap: [
						{
							show: false,
							inRange: {
								color: ['#98E3FD']
							}
						}
						],
					series : [
						{
							name: '营业厅合计',
							type: 'map',
							map: '河南',
							roam: false,
							left: '20%',
							label: {
							    normal: {
									show: true,
									textStyle: {
										fontSize: 10
									}
								},
								emphasis: {
									textStyle: {
										fontSize: 10
									}
								}
							},
							itemStyle: {
								normal: {
									color: '#B0AFB7'
								},
								emphasis: {
									color: "#1E81E1",
									areaColor: "#1E81E1"
								}
							},
							data: jsonData
						}
					]
				};
			mapChart.setOption(mapOption);
			mapChart.on('click', function (params) {
					var areaName = params.name;
					for (var areaIndex = 0; areaIndex < areas.length; areaIndex++) {
						if (areaName == areas[areaIndex].areaDesc) {
							var areaNo_mapClick=areas[areaIndex].areaNo;
							tableDetail(areaNo_mapClick);
						}
					}
			});
		}
		function tableDetail(areaNo_mapClick){
			areaNo_mapClick=areaNo_mapClick== null?areaNo:areaNo_mapClick;
			jQuery.ajax({
  				url:'<%=contextPath%>/rpt/xjlts/yyqkfx/AnalysisOverdue!getTableDetail.action',
  				type:'post',
  				data:{
  					"monthId":monthId,
  					"areaNo_mapClick":areaNo_mapClick
  				},
  				cache:false,
  				success:function(html) {
  					jQuery("#tableDetail").html(html);
  				}
  			});
		}
			
	  	</script>
    </head>  
	<body>
		<div class="container" style="width: 98%;margin-top: 5px;height: 0px;">
	        <div class="row" style="height: 0px;">
			  <div class="col-xs-8 col-sm-8 col-md-8"></div>
			  <div class="col-xs-4 col-sm-4 col-md-4"> 
			      <form class="form-inline"  style="margin: 0px;float:right" >
			         <div class="form-group">
			             <label for="areaNo">地域</label>
	                     <s:select id="areaNo" cssClass="form-control" list="list" listKey="AREA_NO" listValue="AREA_DESC" cssStyle="width: 66px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
			         </div>
			         <div class="form-group">
			             <label for="monthId">时间</label>
	                     <input type="text" class="form-control workinput" id="monthId" value="${monthId}" style="width: 70px;height: 25px;font-size: 12px;padding: 0px;">
			         </div>
			         <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="select()">查询</button>
			      </form>
			  </div>
			</div>
		 </div>
		 <div class="container" style="width: 98%;" id="homeframe-container">
		 	<div class="row" style="height: 30px;margin-top: 10px;">
				<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
					<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
						<tr>
							<td style="background-color: #C00000;width: 28px;"></td>
							<td style="width: 3px;"></td>
							<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">营业欠款超限分析</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row" style="height: 30px;margin-top: 10px;">
				<div class="col-xs-5 col-sm-5 col-md-5"  style="padding: 0px;">
					<div id="table"></div>
					<div  style="margin-top:3%;">
						<table>
							<thead>
								<tr style="color: red; font-size: 14px;">
									<th>预警:</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div style="float: left; margin-top: 10px;font-size: 14px;">
											<span id="KPI">--</span>营业欠款超限额营业厅合计<span id="KPI_01">--</span>个,超过限额
											<span id="KPI_02"></span>万元,其中前三地市<span id="KPI_03">--</span>,分别
											<span id="KPI_04"></span>个,金额<span id="KPI_05"></span>
										</div>
									</td>	
								</tr>
							</tbody>
					    </table>
					</div>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3" style="left:-50px">
					<div id="map" style="height: 450px"></div>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4" style="padding: 0px;" id="tableDetail"></div>
		    </div>	
	   </div>
	</body>
</html>