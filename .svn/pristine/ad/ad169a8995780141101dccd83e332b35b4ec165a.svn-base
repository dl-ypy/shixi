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
    <title>IDC毛利率及回款率</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="../../resources/css/bootstrap/3.3.6/bootstrap.min.css" media="screen">
	<link rel="stylesheet" type="text/css" href="../../resources/frame/jedate-6.0.2/skin/jedate.css">
	<link href="<s:url value="/struts/pure/css/grey.css?ver=1.5.1-SNAPSHOT"/>" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="../../resources/js/jquery/1.12.0/jquery.min.js"></script>
    <script type="text/javascript" src="../../resources/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../resources/frame/jedate-6.0.2/jquery.jedate.min.js"></script>
    <script type="text/javascript" src="../../resources/frame/echarts-3.8.4/echarts.min.js"></script>
    <script type="text/javascript" src="../../resources/frame/echarts-3.8.4/map/henan.js"></script>

<style type="text/css">
    html,body{
       width: 100%;
       text-align: center;
    }
    div{
       margin: 0px;
       padding: 0px;
    }

</style>
<script type="text/javascript">
var monthId;

function table1() {
	jQuery.ajax({
		url: '<%=contextPath%>/rpt/scxy/GrossrRepayRate!table1.action',
		type:"POST",
	    data: {
			"monthId": monthId
		},
		cache:false,
		success:function(html) {
			jQuery("#part1TableDiv").html(html);
			// jQuery(".part1Table")[0].click();
			jQuery("#part1Tableroot").click();
		}
	});
}

function table1click(orgId, chartName) {
	jQuery.ajax({
		url: '<%=contextPath%>/rpt/scxy/GrossrRepayRate!chart1.action',
		type:"POST",
	    data: {
			"monthId": monthId,
			"orgId": orgId
		},
		dataType: "json",
		cache:false,
		success:function(data) {
			lineChart(data, chartName, 'part1LineDiv', 'part1LineNameDiv');
		}
	});
}

function table2(){
	jQuery.ajax({
		url: '<%=contextPath%>/rpt/scxy/GrossrRepayRate!table2.action',
		type:"POST",
	    data: {
			"monthId": monthId
		},
		cache:false,
		success:function(html){
			jQuery("#part2TableDiv").html(html);
			// jQuery(".part2Table")[0].click();
			jQuery("#part2Tableroot").click();
		}
	});
}

function table2click(orgId, chartName) {
	jQuery.ajax({
		url: '<%=contextPath%>/rpt/scxy/GrossrRepayRate!chart2.action',
		type:"POST",
	    data: {
			"monthId": monthId,
			"orgId": orgId
		},
		dataType: "json",
		cache:false,
		success:function(data) {
			lineChart2(data, chartName, 'part2LineDiv', 'part2LineNameDiv');
		}
	});
}


function lineChart(data, chartName, chartDivId, chartNameDivId) {
	jQuery("#" + chartNameDivId).html(chartName);
	var line1List = data.lastYearLine;
	var line1Data = [];
	for (var i = 0; i < line1List.length; i++) {
		line1Data.push(line1List[i].KPI_07);
	}
	var line2List = data.thisYearLine;
	var line2Data = [];
	for (var i = 0; i < line2List.length; i++) {
		line2Data.push(line2List[i].KPI_07);
	}

	jQuery("#" + chartDivId).empty();
	jQuery("#" + chartDivId).removeAttr("_echarts_instance_");

    // 基于准备好的dom，初始化echarts实例
    var lineChart = echarts.init(document.getElementById(chartDivId));
    lineChart.showLoading({text: '正在努力加载中...'});
    // 指定图表的配置项和数据
	var lineChartOption = {
			title: {
		        show: false
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		        data: ['今年', '去年']
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
   		            formatter: '{value}'
   		            },
	                textStyle: {
	                    color: '#76787d'
	                }
	            
		    },
		    series: [
		         {
		        	 name:'去年',
		        	 type:'line',
		        	 stack: chartName,
		        	 lineStyle: {
			        	 normal: {
				        	 color: '#DE0000',
				        	 width: 2
				         }
			         },
		        	 data: line1Data
		         },
		         {
		        	 name:'今年',
		        	 type:'line',
		        	 stack: chartName,
		        	 lineStyle: {
			        	 normal: {
				        	 color: '#0075C2',
				        	 width: 2
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

	/* 折线图2 */
	function lineChart2(data, chartName, chartDivId, chartNameDivId) {
		jQuery("#" + chartNameDivId).html(chartName);
		var line1List = data.lastYearLine;
		var line1Data = [];
		for (var i = 0; i < line1List.length; i++) {
			line1Data.push(line1List[i].KPI_01);
		}
		var line2List = data.thisYearLine;
		var line2Data = [];
		for (var i = 0; i < line2List.length; i++) {
			line2Data.push(line2List[i].KPI_01);
		}
	
		jQuery("#" + chartDivId).empty();
		jQuery("#" + chartDivId).removeAttr("_echarts_instance_");
	
	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById(chartDivId));
	    lineChart.showLoading({text: '正在努力加载中...'});
	    // 指定图表的配置项和数据
		var lineChartOption = {
				title: {
			        show: false
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data: ['今年', '去年']
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
	   		            formatter: '{value}'
	   		            },
		                textStyle: {
		                    color: '#76787d'
		                }
		            
			    },
			    series: [
			         {
			        	 name:'去年',
			        	 type:'line',
			        	 stack: chartName,
			        	 lineStyle: {
				        	 normal: {
					        	 color: '#DE0000',
					        	 width: 2
					         }
				         },
			        	 data: line1Data
			         },
			         {
			        	 name:'今年',
			        	 type:'line',
			        	 stack: chartName,
			        	 lineStyle: {
				        	 normal: {
					        	 color: '#0075C2',
					        	 width: 2
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

	/* queryTitle的加载 */
	function queryTitle(){
	var monthId = jQuery('#monthId').val();
	jQuery.ajax({
 		url: '<%=contextPath%>/rpt/scxy/GrossrRepayRate!title.action',
 	    type: "POST",
 	    data: {
 			"monthId": monthId
 		},
 		dataType: "json",
 		cache:false,
 		success:function(data){
 			var info = '';
 			var info2= '';
			if (data.list1.length == 0) {
				$("#part1").text("无");
			} else {
				for (var i=0; i<data.list1.length; i++) {
					info += (data.list1[i].AREA_DESC+'、');
				}
				$("#part1").text(info.substring(0,info.length-1));
					info = '';
			}
			if (data.list2.length == 0) {
				$("#part2").text("无");
			} else {
				for (var i=0; i<data.list2.length; i++) {
					info2 += (data.list2[i].AREA_DESC+'、');
				}
				$("#part2").text(info2.substring(0,info2.length-1));
				    info2 = '';
			}
 		}
 	});
}


	


    jQuery(document).ready(function(){
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });
    	query();
    });

    
    function query() {
    	monthId = jQuery("#monthId").val();
    	table1();
    	table2();
    	queryTitle();
    }
    
</script>
  </head>
  <body>
  
  	<!--时间 -->
     <div class="container" style="width: 98%;margin-top: 5px;height: 0px;">
        <div class="row" style="height: 0px;">
		  <div class="col-xs-6 col-sm-6 col-md-6"></div>
		  <div class="col-xs-6 col-sm-6 col-md-6" > 
		      <form class="form-inline"  style="margin: 0px;float:right;" >
		         <div class="form-group">
		             <label for="monthId">时间</label>
                     <input type="text" class="form-control workinput" id="monthId" value="${monthId}" style="width: 70px;height: 25px;font-size: 12px;padding: 0px;">
		         </div>
				 <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="query()">查询</button>
		      </form>
		  </div>
		 </div>
	 </div>
	 
	 <!-- 第一部分表格 -->
	 <div class="container" style="width: 98%;" id="homeframe-container">
		<div class="row" style="height: 30px;margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">IDC业务毛利分析</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		<div class="row">
			<div class="col-xs-8 col-sm-8 col-md-8" id="part1TableDiv"></div>
			<div class="col-xs-4 col-sm-4 col-md-4">
				<div style="text-align: left; font-weight: bold;"><span id="part1LineNameDiv"></span>IDC业务毛利分析</div>
				<div id="part1LineDiv" style="height: 300px"></div>
			</div>
		</div>
		
		
		<div class="row" style="height: 30px;margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">IDC业务回款率</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8 col-sm-8 col-md-8" id="part2TableDiv"></div>
			<div class="col-xs-4 col-sm-4 col-md-4">
				<div style="text-align: left; font-weight: bold;"><span id="part2LineNameDiv"></span>IDC业务回款率</div>
				<div id="part2LineDiv" style="height: 300px"></div>
				<div id="partInfoDiv" style="height: 150px; margin-top: 5px">
					<div style="text-align: left; font-weight: bold;font-size: 15;color:#C00000;">预警:</div><br>
					<div style="text-align: left; font-weight: bold;font-size: 15">
						1:未回收款金额超过1000万的公司如下:<br>
						<span id="part1" style="font-size: 15;">---</span>
					</div> 
					<div style="text-align: left; font-weight: bold;font-size: 15">
						2:回款率后三名:<br>
						<span id="part2" style="font-size: 15;">---</span>
					</div>
				</div>
			</div>

		</div>
		
		
  </body>
</html>
