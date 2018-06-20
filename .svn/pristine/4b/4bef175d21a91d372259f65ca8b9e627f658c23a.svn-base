<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>

<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>劳动生产率预算完成</title>
    
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
</style>
<script type="text/javascript">

	var monthId;
	var areaNo;

	
    jQuery(document).ready(function(){
    	areaNo = jQuery("#areaNo").val();
    	monthId = jQuery("#monthId").val();
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });

      query();
    });

	function query(){

		/*获得title  */
		querytitle1();
		
		/* 获取表格的数据 */
		querytable1();

		/* 获取柱状图的数据 */
		getBarChart1();

		/* 获取折线图 */
		getSubList("","root"); 
	}

    /* 获取题目的信息 */
	function querytitle1(){
		var monthId = jQuery('#monthId').val();
		jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/rlzyxy/DoPlanRate!queryTitle1.action',
	 	    type: "POST",
	 	    data: {
	 			"monthId": monthId
	 		},
	 		dataType: "json",
	 		cache:false,
	 		success:function(data){
	 			 var monthId1 = jQuery('#monthId').val();
		    	 var mon = monthId1.substr(4);
		    	 if(mon!=01){
		    		 mon ="01"+mon;
		    	 }else{
		    		 mon="01";
		    	 }
		    	 document.getElementById("partdiv1").innerHTML = mon;
		    	 if(data.list.length>0){
	 			    var title = data.list[0];
	 			    document.getElementById("part1").innerHTML = title.KPI_01;
	 			    document.getElementById("part2").innerHTML = title.KPI_03;
		    	 }else{
		    		document.getElementById("part1").innerHTML = "--";
		    		document.getElementById("part2").innerHTML = "--";
				      
		    	 }
	 		}
	 	});
		
	}
	

    /*  获取表格1数据*/
    function querytable1(){
        
    	monthId = jQuery("#monthId").val();
    	jQuery.ajax({
    		url: '<%=contextPath%>/rpt/rlzyxy/DoPlanRate!queryTable1.action',
    		type:"POST",
    	    data: {
    	    	"monthId": monthId
    		},
    		cache:false,
    		success:function(html) {
    			jQuery("#TableDiv1").html(html);
    			
    		}
    	});
    }

    
    /* 得到bar的柱状图 */
    function getBarChart1(){
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/rlzyxy/DoPlanRate!queryBar1.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				if(data.barList != null && data.barList.length > 0){
					barChart(data,"","part1BarDiv");
				}else{
					jQuery("#part1BarDiv").empty();
				}
			}
		});
	}
    function barChart(data, chartName, chartDivId) {
		var barList = data.barList;
		var bar1Data = [];
		var bar2Data = [];
		var xData = [];
		for (var i = 0; i < barList.length; i++) {
			bar1Data.push(barList[i].KPI_01);
			bar2Data.push(barList[i].KPI_02);
			xData.push(barList[i].AREA_DESC);
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
			        left: '0%',
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
			        data:['劳动生产产率','目标'],
			        y: 'top'
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
			            name: '劳动生产产率',
			            axisLabel: {
			                formatter: '{value}'
			            }
			        },
			        {
			            type: 'value',
			            name: '目标',
			            axisLabel: {
			                formatter: '{value}'
			            }
			        }
			    ],
			    series: [
			        {
			            name:'劳动生产产率',
			            type:'bar',
			            barGap:0,
			            data:bar1Data,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#3A5FCD' 
								},
								color:'#3A5FCD'
							}  
						}
			        },
			        {
			            name:'目标',
			            type:'bar',
			            data:bar2Data,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#EE7600' 
								},
								color:'#EE7600'
							}  
						},
						yAxisIndex: 1
			        }
			    ]
			};

	    // 使用刚指定的配置项和数据显示图表。
		lineChart.setOption(option);
		lineChart.hideLoading();
	}

    
    /* 得到line的折线图 */
    function getSubList(obj,regionId){
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/rlzyxy/DoPlanRate!queryLine1.action',
			type:"POST",
		    data: {
				"monthId": monthId,
				"areaNo":regionId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				console.log(data);
				lineChart(data,"","part1LineDiv");
				
			}
		});
	}
    function lineChart(data, chartName, chartDivId) {
		var line1List = data.thisYearLine;
		var line2List = data.lastYearLine;
		var Line1Data = [];
		var Line2Data = [];

		for (var i = 0; i < line1List.length; i++) {
			Line1Data.push(line1List[i].KPI_03);
		}

		for (var i = 0; i < line2List.length; i++) {
			Line2Data.push(line2List[i].KPI_03);
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
			        left: '0%',
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
			        data:['今年','去年'],
			        y: 'top'
			    },
			    xAxis: {
			    	type: 'category',
			    	data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
			    },
			    yAxis: [
			        {
			            type: 'value',
			            name: '完成比例',
			            axisLabel: {
			                formatter: '{value}'
			            }
			        }
			    ],
			    series: [
			        {
			            name:'今年',
			            type:'line',
			            data:Line1Data,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#3A5FCD' 
								},
								color:'#3A5FCD'
							}  
						}
			        },
			        {
			            name:'去年',
			            type:'line',
			            data:Line2Data,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'red' 
								},
								color:'red'
							}  
						}
			        }
			    ]
			};

	    // 使用刚指定的配置项和数据显示图表。
		lineChart.setOption(option);
		lineChart.hideLoading();
	}
    
</script>
  </head>
  
  <body>
  <!-- 第一行的div -->
    <div class="container" style="width: 98%;margin-top: 5px;height: 0px;">
        <div class="row" style="height: 0px;">
		  <div class="col-xs-10 col-sm-10 col-md-10"></div>
		  <div class="col-xs-2 col-sm-2 col-md-2" > 
		      <form class="form-inline"  style="margin: 0px;"> 
		         <div class="form-group">
		             <label for="monthId">时间</label>
                     <input type="text" class="form-control workinput" id="monthId" value="${monthId}" style="width: 70px;height: 25px;font-size: 12px;padding: 0px;">
		         </div>
		         <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="query()">查询</button>
		      </form>
		  </div>
		</div>
	 </div>
	 
	 
	 <div class="container" style="width: 98%;margin-top: 2%;" id="homeframe-container">
	 	<!--第一个div单纯的显示表头  -->
	 	<div class="row" style="height: 30px;margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">劳动生产率预算完成</td>
					</tr>
				</table>
			</div>
		</div>
		
		<!-- 第二行title -->
		<hr style="border:none;border-top:2px solid #FF6A6A;"/>
		<div class="row" style="text-align: left;margin-left:5px;font-weight: bold;font-size: 14px;padding-top:1%;">
		    <span id="partdiv1"></span>月，全省劳动生产率为 <span id="part1">---</span>万人，目标完成率<span id="part2">---</span>%<br>
			<%-- <span id="partdiv2"></span>月，全省百元人工成本创利为 <span id="part3">---</span>万人，目标完成率<span id="part4">---</span>%<br> --%>
		</div>
		<hr style="border:none;border-top:1px solid #FF6A6A;"/>
		
		<!-- 第三个div显示表格 -->
		<div class="row" style="margin-top:20px;">
			<div class="col-xs-5 col-sm-5 col-md-5" id="TableDiv1"></div>
			
			<div class="col-xs-7 col-sm-7 col-md-7">
			   <div id="part1BarDiv" style="height: 300px; margin-top: 0px; padding:10px;"></div>
			   <div id="part1LineDiv" style="height: 270px; margin-top: 0px"></div>
		   </div>
			
		</div>

	</div>
  </body>
</html>
