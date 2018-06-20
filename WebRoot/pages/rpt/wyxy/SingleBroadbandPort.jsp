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
    <title>单宽带端口年化产出同比变动</title>
    
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
	function table1() {
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/wyxy/SingleBroadbandPort!getSingleBroadbandPortFirstLine.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				var month = monthId.substring(5);
				if(month == 1){
					month = "";
				}else{
					month = "-"+month;
				}
				var firstLineList;
				var str;
				if(data.firstLineList != null && data.firstLineList.length > 0){
					firstLineList = data.firstLineList[0];
					if (firstLineList.KPI_03.trim().substring(0,1) == '-') {
						str = "下降";
					} else {
						str = "提升";
					}
					var firstLineDiv = "<div align='left' style='font-weight:bold; font-size:14px; padding-top:1%;'>1"+month+"月全省宽带单端口年化产出"+firstLineList.KPI_02+"元/个，同比"+str+Math.abs(firstLineList.KPI_03)+"元/个。</div>";
					jQuery("#firstLineDiv").html(firstLineDiv);
				}else{
					var firstLineDiv = "<div>暂无数据!</div>";
					jQuery("#firstLineDiv").html(firstLineDiv);
				}
			}
		});
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/wyxy/SingleBroadbandPort!getSingleBroadbandPortRanking.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				var rankingList;
				if(data.rankingList != null && data.rankingList.length > 0){
					rankingList = data.rankingList[0];
					var rankingDiv = "<div align='left' style='font-size:14px; padding-left:2%'><span style='color:red'>"+rankingList.LAST_THREE+"</span>同比改善幅度排名后三；<span style='color:red'>"+rankingList.FIRST_THREE+"</span>排名前三。</div>";
					jQuery("#rankingDiv").html(rankingDiv);
				}else{
					var rankingDiv = "<div>暂无数据！</div>";
					jQuery("#rankingDiv").html(rankingDiv);
				}
			}
		});
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/wyxy/SingleBroadbandPort!getSingleBroadbandPortTable.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			cache:false,
			success:function(html) {
				jQuery("#part1TableDiv").html(html);
			}
		});
	}
	function part1TableClick(AREA_NO, AREA_DESC){
		jQuery("#lastLineDiv").empty();
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/wyxy/SingleBroadbandPort!getSingleBroadbandPortLastLine.action',
			type:"POST",
		    data: {
				"monthId": monthId,
				"areaNo": AREA_NO
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				jQuery("#lastLineDiv").show();
				var lastlist;
				if(data.lastLineList != null && data.lastLineList.length > 0){
					lastlist = data.lastLineList[0];
					var str;
					if (lastlist.KPI_03.trim().substring(0,1) == '-') {
						str = "下降";
					} else {
						str = "提升";
					}
					if (lastlist.KPI_05 == '') {
						var lastLine = "<div>"+lastlist.AREA_DESC+"较上年同期"+str+Math.abs(lastlist.KPI_03)+"元。</div>";
						jQuery("#lastLineDiv").html(lastLine);
					} else if(lastlist.KPI_02-lastlist.KPI_05 > 0){
						var lastLine = "<div>"+lastlist.AREA_DESC+"较上年同期"+str+Math.abs(lastlist.KPI_03)+"元,高于全省均值"+Math.abs((lastlist.KPI_02-lastlist.KPI_05).toFixed(2))+"元</div>";
						jQuery("#lastLineDiv").html(lastLine);
					}else if(lastlist.KPI_02-lastlist.KPI_05 < 0){
						var lastLine = "<div>"+lastlist.AREA_DESC+"较上年同期"+str+Math.abs(lastlist.KPI_03)+"元,低于全省均值"+Math.abs((lastlist.KPI_02-lastlist.KPI_05).toFixed(2))+"元</div>";
						jQuery("#lastLineDiv").html(lastLine);
					} else {
						var lastLine = "<div>"+lastlist.AREA_DESC+"较上年同期"+str+Math.abs(lastlist.KPI_03)+"元。</div>";
						jQuery("#lastLineDiv").html(lastLine);
					}
				}else{
					var lastLine = "<div>暂无数据！</div>";
					jQuery("#lastLineDiv").html(lastLine);
				}
				
			}
		});
	}
	function getBarChart1(){
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/wyxy/SingleBroadbandPort!getSingleBroadbandPortBarChart.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				barChart(data,"","part1BarDiv");
			}
		});
	}
	function barChart(data, chartName, chartDivId) {
		var bar1List = data.barList;
		var bar1Data = [];
		var line1Data = [];
		var line2Data = [];
		var xData = [];
		for (var i = 0; i < bar1List.length; i++) {
			bar1Data.push(bar1List[i].KPI_03);
			line1Data.push((bar1List[i].KPI_02 * 1).toFixed(2));
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
			        data:['同比增减','本年累计']
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
			            name: '同比增减',
			            axisLabel: {
			                formatter: '{value}'
			            }
			        },
			        {
			            type: 'value',
			            name: '本年累计',
			            axisLabel: {
			                formatter: '{value}'
			            }
			        }
			    ],
			    series: [
			        {
			            name:'同比增减',
			            type:'bar',
			            data:bar1Data,
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
			            name:'本年累计',
			            type:'line',
			            data:line1Data,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#EE7600' 
								},
								color:'#EE7600'
							}  
						},
						label: {
			                normal: {
			                    show: true,
			                    position: 'top'
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
	function searchItem(){
		monthId = jQuery("#monthId").val();
		table1();
		getBarChart1();
		jQuery("#lastLineDiv").hide();
	}
	jQuery(document).ready(function(){
    	monthId = jQuery("#monthId").val();
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });
    	table1();
    	getBarChart1();
    	jQuery("#lastLineDiv").hide();
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
	 <div class="container" style="width: 98%;margin-top: 2%;" id="homeframe-container">
	 	<div class="row" style="height: 30px;margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">单宽带端口年化产出同比变动</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12" id="firstLineDiv">
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<hr style="border:none;border-top:2px solid #FF6A6A;"/>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div align='left' style='font-weight:bold; font-size:14px'>
					从分市完成情况看：
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12" id="rankingDiv">
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<hr style="border:none;border-top:1px solid #FF0000;"/>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-4 col-sm-4 col-md-4" id="part1TableDiv"></div>
			<div class="col-xs-8 col-sm-8 col-md-8" id="part1BarDiv" style="height: 380px; margin-top: 25px; padding:10px;"></div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12" id="lastLineDiv" 
				style='background:#FCD5B5; padding:20px; height:50px; width:80%;margin-left:10%;margin-top:2%;margin-bottom:3%;font-size:14px'
			
			>
			</div>
		</div>
	</div>
  </body>
</html>
