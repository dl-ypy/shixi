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
    <title>移动单基站产出同比变动</title>
    
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
			url: '<%=contextPath%>/rpt/wyxy/MobileSingleProduce!getMobileSingleProduceFirstLine.action',
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
				if(data.firstLineList != null && data.firstLineList.length > 0){
					firstLineList = data.firstLineList[0];
					var firstLineDiv = "<div align='left' style='font-weight:bold; font-size:14px; padding-top:1%'>1"+month+"月全省移动单基站产出为"+firstLineList.VALUE_Y+"万元，同比增幅"+firstLineList.VALUE_ADD_RATE+"%</div>";
					jQuery("#firstLineDiv").html(firstLineDiv);
				}else{
					var firstLineDiv = "<div>暂无数据!</div>";
					jQuery("#firstLineDiv").html(firstLineDiv);
				}
			}
		});
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/wyxy/MobileSingleProduce!getMobileSingleProduceRanking.action',
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
					var rankingDiv = "<div align='left' style='font-size:14px;padding-left:3%'><span style='color:red'>"+rankingList.LAST_THREE+"</span>同比改善幅度排名后三；<span style='color:red'>"+rankingList.FIRST_THREE+"</span>排名前三。</div>";
					jQuery("#rankingDiv").html(rankingDiv);
				}else{
					var rankingDiv = "<div>暂无数据！</div>";
					jQuery("#rankingDiv").html(rankingDiv);
				}
			}
		});
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/wyxy/MobileSingleProduce!getMobileSingleProduceTable.action',
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
		jQuery("#lastLineDiv").show();
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/wyxy/MobileSingleProduce!getMobileSingleProduceLastLine.action',
			type:"POST",
		    data: {
				"monthId": monthId,
				"areaNo": AREA_NO
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				var lastlist;
				if(data.lastLineList != null && data.lastLineList.length > 0){
					lastlist = data.lastLineList[0];
					var part1;
					if(lastlist.VALUE_ADD_RATE.trim().substring(0,1) == '-'){
						part1 = "<div style='background:#FCD5B5; padding:20px; height:50px; width:80%;margin-left:10%;margin-top:2%;margin-bottom:3%;font-size:14px'>"+lastlist.ORG_NAME+"同比恶化幅度"+Math.abs(lastlist.VALUE_ADD_RATE)+"%";
					}else{
						part1 = "<div style='background:#FCD5B5; padding:20px; height:50px; width:80%;margin-left:10%;margin-top:2%;margin-bottom:3%;font-size:14px'>"+lastlist.ORG_NAME+"同比改善幅度"+lastlist.VALUE_ADD_RATE+"%";
					}
					if(lastlist.VALUE_ADD_RATE_PP > 0){
						var lastLine = part1+",高于全省均值"+lastlist.VALUE_ADD_RATE_PP+"pp</div>";
						jQuery("#lastLineDiv").html(lastLine);
					}else if(lastlist.VALUE_ADD_RATE_PP.trim().substring(0,1) == '-'){
						var lastLine = part1+",低于全省均值"+Math.abs(lastlist.VALUE_ADD_RATE_PP)+"pp</div>";
						jQuery("#lastLineDiv").html(lastLine);
					}else{
						var lastLine = part1+"</div>";
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
			url: '<%=contextPath%>/rpt/wyxy/MobileSingleProduce!getMobileSingleProduceBarChart.action',
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
			bar1Data.push(bar1List[i].VALUE_Y);
			line1Data.push((bar1List[i].VALUE_Y_AVG * 1).toFixed(0));
			line2Data.push(bar1List[i].VALUE_ADD_RATE);
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
			        data:['单基站产出','单站产出均值','增幅']
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
			            name: '单基站产出',
			            axisLabel: {
			                formatter: '{value}'
			            }
			        },
			        {
			            type: 'value',
			            name: '增幅',
			            axisLabel: {
			                formatter: '{value}%'
			            }
			        }
			    ],
			    series: [
			        {
			            name:'单基站产出',
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
			            name:'单站产出均值',
			            type:'line',
			            data:line1Data,
			            symbol: "none",
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#EE7600',
									type:'dotted'
								},
								color:'#EE7600'
							}  
						}
			        },
			        {
			            name:'增幅',
			            type:'line',
			            data:line2Data,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#C25552' 
								},
								color:'#C25552'
							}  
						},
						yAxisIndex: 1,
					    label: {
			                normal: {
			                    show: true,
			                    position: 'top'
			                }
			            }
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
	  <div class="container" style="width: 98%; margin-top:2%" id="homeframe-container">
	  	<div class="row" style="height: 30px;margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">移动单基站产出同比变动</td>
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
			<div class="col-xs-8 col-sm-8 col-md-8" id="part1BarDiv" style="height: 380px; margin-top: 25px; padding:20px;"></div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12" id="lastLineDiv">
			</div>
		</div>
	</div>	
  </body>
</html>
