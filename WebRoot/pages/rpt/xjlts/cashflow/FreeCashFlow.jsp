<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>自由现金流完成情况</title>
    
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
    html,body{
       width: 100%;
       text-align: center;
    }
</style>
<script type="text/javascript">
	var monthId;
	function table1() {
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/xjlts/cashflow/FreeCashFlow!getFreeCashFlowTable.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			cache:false,
			success:function(html) {
				jQuery("#part1TableDiv").html(html);
				jQuery("#part1LineDiv").empty();
				if(jQuery(".part1TableTd")[0] != undefined){
					jQuery(".part1TableTd")[0].click();
				}
			}
		});
	}
	function part1TableClick(AREA_NO, AREA_DESC){
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/xjlts/cashflow/FreeCashFlow!getCashIncomeRatioLine.action',
			type:"POST",
		    data: {
				"monthId": monthId,
				"areaNo": AREA_NO
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				lineChart(data,"自由现金流变动趋势","part1LineDiv");
			}
		});
	}
	function getBarChart1(){
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/xjlts/cashflow/FreeCashFlow!getCashIncomeRatioBarChart.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				if(data.barList != null && data.barList.length > 0){
					barChart(data,"自由现金流排名","part1BarDiv");
				}else{
					jQuery("#part1BarDiv").empty();
				}
			}
		});
	}
	function lineChart(data, chartName, chartDivId) {
		var line1List = data.lastYearLine;
		var line1Data = [];
		for (var i = 0; i < line1List.length; i++) {
			line1Data.push((line1List[i].KPI_07*1).toFixed(0));
		}
		var line2List = data.thisYearLine;
		var line2Data = [];
		for (var i = 0; i < line2List.length; i++) {
			line2Data.push((line2List[i].KPI_07*1).toFixed(0));
		}

		jQuery("#" + chartDivId).empty();
		jQuery("#" + chartDivId).removeAttr("_echarts_instance_");

	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById(chartDivId));
	    lineChart.showLoading({text: '正在努力加载中...'});
	    // 指定图表的配置项和数据
		var lineChartOption = {
				title: {
			        show: true,
				    left: 'center',
				    text: chartName
			    },
			    tooltip: {
			        trigger: 'axis',
			        formatter: "{b}月<br />{a0}:{c0}<br />{a1}:{c1}"
			    },
			    legend: {
			        data: ['今年', '去年'],
			        y:'bottom'
			    },
			    grid: {
			        left: '0%',
			        right: '4%',
			        top: '10%',
			        bottom: '15%',
			        containLabel: true
			    },
			    xAxis: {
			        type: 'category',
			        boundaryGap: false,
					splitLine : {
						show : false
					},
					axisLabel:{
			        	interval:0
			        },
			        data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
			    },
			    yAxis: {
			        type: 'value',
			        axisLabel: {
	   		            formatter: function(value){
	   		            	var valueTemp = value;
	   		            	if(value >= 10000){
	   		            		valueTemp = value/10000;
	   		            	}else if(value >= 1000){
	   		            		valueTemp = value/1000;
					        }else if(value <= -1000){
					        	valueTemp = value/1000;
					        }else if(value <= -100){
					        	valueTemp = value/100;
					        }
	   		            	//return valueTemp;
	   		            	return value;
	   		            },
		                textStyle: {
		                    color: '#76787d'
		                }
		            }
			    },
			    series: [
			         {
			        	 name:'去年',
			        	 type:'line',
			        	 stack: chartName,
			        	 itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#EE7600',
									width: 2
								},
								color:'#EE7600'
							 }  
						 },
			        	 data: line1Data
			         },
			         {
			        	 name:'今年',
			        	 type:'line',
			        	 stack: chartName,
			        	 itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#3A5FCD',
									width: 2
								},
								color:'#3A5FCD'
							 }  
						 },
			        	 data: line2Data
			         }
			    ]
			};

	    // 使用刚指定的配置项和数据显示图表。
		lineChart.setOption(lineChartOption);
		lineChart.hideLoading();
	}
	function barChart(data, chartName, chartDivId) {
		var bar1List = data.barList;
		var bar1Data = [];
		var bar2Data = [];
		var lineData = [];
		var xData = [];
		for (var i = 0; i < bar1List.length; i++) {
			bar1Data.push((bar1List[i].KPI_01*1).toFixed(0));
			bar2Data.push((bar1List[i].KPI_07*1).toFixed(0));
			lineData.push(bar1List[i].KPI_08);
			xData.push(bar1List[i].AREA_DESC);
		}

		jQuery("#" + chartDivId).empty();
		jQuery("#" + chartDivId).removeAttr("_echarts_instance_");

	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById(chartDivId));
	    lineChart.showLoading({text: '正在努力加载中...'});
	    // 指定图表的配置项和数据
		var option = {
			 	title: {
			        left: 'center',
			        text: chartName,
			    },
				grid: {
			        left: '4%',
			        right: '4%',
			        top: '10%',
			        bottom: '15%',
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
			        data:['经营净现金流入(EBITDA)','自由现金流','增幅（%）'],
			        y: 'bottom'
			    },
			    xAxis: {
			    	type: 'category',
			        data: xData,
			        axisLabel:{
			        	interval:0
			        }
			    },
			    yAxis: [
			        {
			            type: 'value',
			            name: '经营净现金流入(EBITDA)',
			            axisLabel: {
			                formatter: '{value}'
			            }
			        },
			        {
			            type: 'value',
			            name: '自由现金流',
			            axisLabel: {
			                formatter: '{value}'
			            }
			        }
			    ],
			    series: [
			        {
			            name:'经营净现金流入(EBITDA)',
			            type:'bar',
			            barGap:0,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#3A5FCD' 
								},
								color:'#3A5FCD'
							}  
						},
						data:bar1Data
			        },
			        {
			            name:'自由现金流',
			            type:'bar',
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#EE7600' 
								},
								color:'#EE7600'
							}  
						},
						data:bar2Data
			        },
			        {
			            name:'增幅（%）',
			            type:'line',
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#BDBDBD' 
								},
								color:'#BDBDBD'
							}  
						},
						data:lineData,
						yAxisIndex: 1
			        }
			    ]
			};

	    // 使用刚指定的配置项和数据显示图表。
		lineChart.setOption(option);
		lineChart.hideLoading();
	}
	function searchItem(){
		monthId = jQuery("#monthId").val();
		table1();
		getBarChart1();
	}
	jQuery(document).ready(function(){
    	monthId = jQuery("#monthId").val();
    	
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });
    	table1();
    	getBarChart1();
    });
</script>
  </head>
  
  <body>
    <div class="container" style="width: 98%;margin-top: 5px;height: 0px;">
        <div class="row" style="height: 0px;">
		  <div class="col-xs-10 col-sm-10 col-md-10"></div>
		  <div class="col-xs-2 col-sm-2 col-md-2" > 
		      <form class="form-inline"  style="margin: 0px;">
		         <div class="form-group">
		             <label for="monthId">时间</label>
                     <input type="text" class="form-control workinput" id="monthId" value="${monthId}" style="width: 70px;height: 25px;font-size: 12px;padding: 0px;">
		         </div>
		         <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="searchItem()">查询</button>
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
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">自由现金流完成情况</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12" id="part1TableDiv"></div>
		</div>
		<div class="row">
			<div class="col-xs-8 col-sm-8 col-md-8" id="part1BarDiv" style="height: 380px; margin-top: 25px; padding:10px;"></div>
			<div class="col-xs-4 col-sm-4 col-md-4" id="part1LineDiv" style="height: 320px; margin-top: 55px"></div>
		</div>
	</div>	
  </body>
</html>
