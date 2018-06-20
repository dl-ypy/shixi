<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>现金流整体情况</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap/3.3.6/bootstrap.min.css"
	media="screen">
<link rel="stylesheet" type="text/css"
	href="../../../resources/frame/jedate-6.0.2/skin/jedate.css">
<link
	href="<s:url value="/struts/pure/css/grey.css?ver=1.5.1-SNAPSHOT"/>"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="../../../resources/js/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript"
	src="../../../resources/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script type="text/javascript"
	src="../../../resources/frame/jedate-6.0.2/jquery.jedate.min.js"></script>
<script type="text/javascript"
	src="../../../resources/frame/echarts-3.8.4/echarts.min.js"></script>
<script type="text/javascript"
	src="../../../resources/frame/echarts-3.8.4/map/henan.js"></script>
<script type="text/javascript" src="../../../resources/frame/DrillTable/DrillTable.js"></script>
    
<style type="text/css">
html, body {
	width: 100%;
	text-align: center;
}

div {
	margin: 0px;
	padding: 0px;
}
</style>
<script type="text/javascript">
	var monthId;
	var areaNo;
	jQuery(document).ready(function() {
		jQuery("#monthId").jeDate({
			format : "YYYY-MM"
		});
		monthId = $("#monthId").val();
		areaNo = $("#areaNo").val();
		query();
	});
	function query(){
		monthId = $("#monthId").val();
		areaNo = $("#areaNo").val();
		freecashtable();
		cashratetable();
	}
	function getChart(org,kpiId,kpiName,partId,unit){
		getMapchart(kpiId,kpiName,partId,unit);
		getLinechart(kpiId,kpiName,partId,unit);
		
	}
	function getLinechart(kpiId,kpiName,partId,unit){
		jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/xjlts/xjlOverview/xjlOverall!getLineChart.action',
	 	    type: "post",
	 	    data: {
	 			"monthId": monthId, 
	 			"areaNo": areaNo,
	 			"partId":partId,
	 			"kpiCode":kpiId
	 		},
	 		dataType: "json",
	 		success:function(data){
	 			setLinechart(data,kpiName,unit);
	 		}
	 	});
		
	}
	function loadOrgTableDrill(obj,kpiId,orgId,partId){
		var url= '<%=contextPath%>/rpt/xjlts/xjlOverview/xjlOverall!getOrgList.action';
		var param = "monthId=" + monthId + "&areaNo=" + orgId + "&kpiCode=" + kpiId+"&partId="+partId;
		action({
			td : obj,
			url : url,
			mode : 'drill',
			parameters : param,
			onComplete : function(data) {
			}
		});
	}
	function dyo_mouseOver(o){
		jQuery(o).find(".dyo_span_zw").hide();
		jQuery(o).find(".dyo_span").show();
	}

	function dyo_mouseOut(o){
		jQuery(o).find(".dyo_span").hide();
		jQuery(o).find(".dyo_span_zw").show();
	}
	function getMapchart(kpiId,kpiName,partId,unit){
		jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/xjlts/xjlOverview/xjlOverall!getMap.action',
	 	    type: "post",
	 	    data: {
	 			"monthId": monthId, 
	 			"areaNo": areaNo,
	 			"partId":partId,
	 			"kpiCode":kpiId
	 		},
	 		dataType: "json",
	 		success:function(data){
	 			jQuery("#part1MapTop3").html(data.top3Area);
				jQuery("#part1MapLast3").html(data.last3Area);
	 			setMap(data,kpiName,unit);
	 		}
	 	});
		
	}
  function setMap(data,kpiName,unit){
	  var mapList = data.mapList;
	  var top3Value ;
	  var last3Value;
	  var jsonData = [];
	  if(unit=="%"){
		   top3Value = (data.top3Value*100).toFixed(2);
		   last3Value = (data.last3Value*100).toFixed(2);
		  for (var i = 0; i < mapList.length; i++) {
				var subJsonData = {"name": mapList[i].ORG_NAME, "value": (mapList[i].KPI_03*100).toFixed(2)};
				jsonData.push(subJsonData);
	      } 
	  }else{
		   top3Value = (data.top3Value*1).toFixed(0);
		   last3Value = (data.last3Value*1).toFixed(0);
		  for (var i = 0; i < mapList.length; i++) {
				var subJsonData = {"name": mapList[i].ORG_NAME, "value": (mapList[i].KPI_03*1).toFixed(0)};
				jsonData.push(subJsonData);
	      }
	  }
		jQuery("#mapChart").empty();
		jQuery("#mapChart").removeAttr("_echarts_instance_");
		var mapChart = echarts.init(document.getElementById('mapChart'));
		var mapOption = {
				tooltip : {
					trigger: 'item'
				},
				visualMap: [
					{
						show: false,
						splitNumber: 2,
						min: parseFloat(last3Value),
						max: parseFloat(top3Value),
						minOpen: true,
						maxOpen: true,
						itemWidth: 30,
						itemHeight: 10,
						left: 0,
						bottom: 20,
						inRange: {
							color: ['#B0A2FA','#98E3FD','#FECDE6']
						},
						textStyle:{
							fontSize: 10
						}
					}
				],
				series : [
					{
						name: kpiName+'（'+unit+'）',
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
	  
  }
  function setLinechart(data,kpiName,unit){
	  var lastList = data.lastyear;
		var lastData =[];
		var thisList = data.thisyear;
		var thisData =[];
		if(unit=="%"){
			for (var i = 0; i < lastList.length; i++) {
				if (lastList[i].KPI_01) {
					lastData.push((lastList[i].KPI_01 * 100).toFixed(2));
				} else {
					lastData.push('');
				}
			}
			for (var i = 0; i < thisList.length; i++) {
				if (thisList[i].KPI_01) {
					thisData.push((thisList[i].KPI_01 * 100).toFixed(2));
				} else {
					thisData.push('');
				}
			}	
			
		}else{
			for (var i = 0; i < lastList.length; i++) {
				if (lastList[i].KPI_01) {
					lastData.push((lastList[i].KPI_01 * 1).toFixed(0));
				} else {
					lastData.push('');
				}
			}
			for (var i = 0; i < thisList.length; i++) {
				if (thisList[i].KPI_01) {
					thisData.push((thisList[i].KPI_01 * 1).toFixed(0));
				} else {
					thisData.push('');
				}
			}
		}
		
		jQuery("#cashChart").empty();
		jQuery("#cashChart").removeAttr("_echarts_instance_");

	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById('cashChart'));
	    lineChart.showLoading({text: '正在努力加载中...'});
	    // 指定图表的配置项和数据
		var option = {
			 	title: {
			        left: 'center'
			    },
				grid: {
			        left: '10%',
			        right: '4%',
			        top: '10%',
			        bottom: '10%',
			        containLabel: true
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            type: 'cross',
			            crossStyle: {
			                color: '#999'
			            }
			        }
			    },
			    legend: {
			        data:['今年','去年']
			    },
			    xAxis: {
			    	type : 'category',
			        axisLabel:{
			        	interval:0
			        },
			        data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
			    },
			    yAxis: [
			        {
			            type: 'value',
			            name: kpiName+'（'+unit+'）',
			            axisLabel: {
			                formatter: '{value}'
			            }
			        }
			    ],
			    series: [
			        {
			            name:'去年',
			            type:'line',
			            data:lastData,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#3FA7DC' 
								},
								color:'#3FA7DC'
							}  
						}
			        },
			        {
			            name:'今年',
			            type:'line',
			            data:thisData,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#EE7600' 
								},
								color:'#EE7600'
							}  
						},
			        }
			    ]
			};

	    // 使用刚指定的配置项和数据显示图表。
		lineChart.setOption(option);
		lineChart.hideLoading();
	}
	function freecashtable(){
		jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/xjlts/xjlOverview/xjlOverall!queryCashTable.action',
	 	    type: "post",
	 	    data: {
	 			"monthId": monthId, 
	 			"areaNo": areaNo,
	 			"partId":"1"
	 		},
	 		success:function(html){
	 			jQuery("#freeCashIn").html(html);
	 			jQuery(".topTableTr")[0].click();
	 		}
	 	});
		
	}
	function cashratetable(){
		jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/xjlts/xjlOverview/xjlOverall!queryrateTable.action',
	 	    type: "post",
	 	    data: {
	 			"monthId": monthId, 
	 			"areaNo": areaNo,
	 			"partId":"2"
	 		},
	 		success:function(html){
	 			jQuery("#cashIncomeRate").html(html);
	 		}
	 	});
		
	}
	
</script>
</head>
<body>
	<div class="container"
		style="width: 98%; margin-top: 5px; height: 0px;">
		<div class="row" style="height: 0px;">
			<form class="form-inline" style="margin-top: 10px; float: right;">
				<div class="form-group">
					<label for="areaNo">地域</label>
					<s:select id="areaNo" cssClass="form-control" list="list"
						listKey="AREA_NO" listValue="AREA_DESC"
						cssStyle="width: 100px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
				</div>
				<div class="form-group">
					<label for="monthId">时间</label> <input type="text"
						class="form-control workinput" id="monthId"
						value="<s:property value="monthId"/>"
						style="width: 100px; height: 25px; margin-right: 10px; font-size: 12px; padding: 0px;">
				</div>
				<button type="button" class="btn btn-info btn-sm"
					style="width: 60px; height: 25px; line-height: 10px;"
					onclick="query()">查询</button>
			</form>
		</div>
	</div>
	<div class="container" style="width: 98%; margin-top: 50px;"
		id="homeframe-container">
		<div class="row" style="height: 30px; margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table
					style="border-collapse: collapse; height: 28px; padding: 0px; margin: auto; width: 100%;">
					<tr>
						<td style="background-color: #C00000; width: 28px;"></td>
						<td style="width: 3px;"></td>
						<td
							style="background-color: #BFBFBF; text-align: left; padding-left: 10px; font-weight: bold; font-size: 14px;">现金流情况</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row" >
		  <div class="col-xs-5 col-sm-5 col-md-5" style="height:320px;">
		    <div class="row" style=" margin-left: 10px;">
			  <span style="float: left;">1.自由现金流</span><br>
			</div>
			<div id="freeCashIn" style="height:300px;"></div>
			 <div class="row" style=" margin-left: 10px;">
			  <span style="float: left;">2.现金收入比</span><br>
			</div>
			<div id="cashIncomeRate" style="height:300px;"></div>
		  </div>
		  <div  class="col-xs-3 col-sm-3 col-md-3" >
		    <div id="mapChart"   style=" margin-top: 100px;height:300px;"></div>
		    <div style="position:absolute; top: 400px; left: 40px">
			  <table>
				<tr>
					<td><div style="width: 20px; height: 10px; background-color: #FECDE6"></div></td>
					<td><div style="font-size: 11px">&nbsp;&nbsp;本年累计前三：<span style="font-size: 11px" id="part1MapTop3"></span></div></td>
				</tr>
				<tr>
					<td><div style="width: 20px; height: 10px; background-color: #B0A2FA"></div></td>
					<td><div style="font-size: 11px">&nbsp;&nbsp;本年累计后三：<span style="font-size: 11px" id="part1MapLast3"></span></div></td>
				</tr>
			</table>
		    </div>
		  </div>
		  <div id="cashChart" class="col-xs-4 col-sm-4 col-md-4" style=" margin-top: 120px;height:300px;"></div>
		</div>
	 </div>
</body>
</html>