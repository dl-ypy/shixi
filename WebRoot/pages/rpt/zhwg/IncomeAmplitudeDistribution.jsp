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
    <title>收入增幅分布情况</title>
    
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
	jQuery(document).ready(function(){
    	monthId = jQuery("#monthId").val();
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });
    	table1();
    	getBarChart1("root");
    });
	function table1() {
		/* 首行ajax */
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/zhwg/IncomeAmplitudeDistribution!getIncomeAmplitudeDistributionFirstLine.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				var month = monthId.substring(5);
				if(month.substring(0,1) == '0'){
					month = month.substr(-1);
				}
				var firstLineList;
				if(data.firstLineList != null && data.firstLineList.length > 0){
					firstLineList = data.firstLineList[0];
					var firstLineDiv = "<div align='left' style='font-weight:bold; font-size:14px; padding-top:1%;'>"+month+"月，全省"+firstLineList.KPI_07+"个综合网格，收入增幅在0%~5%之间的有"+firstLineList.KPI_04+"个，5%~10%之间的有"+
					firstLineList.KPI_05+"个，10%以上的有"+firstLineList.KPI_06+"个，-5%~0%之间的有"+firstLineList.KPI_03+"个、-10%~-5%之间的有"+firstLineList.KPI_02+"个、-10%以下的有"+firstLineList.KPI_01+"个。</div>";
					jQuery("#firstLineDiv").html(firstLineDiv);
				}else{
					var firstLineDiv = "<div>暂无数据!</div>";
					jQuery("#firstLineDiv").html(firstLineDiv);
				}
			}
		});
		/* 表格ajax */
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/zhwg/IncomeAmplitudeDistribution!getIncomeAmplitudeDistributionTable.action',
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
	
	/* 图表 */
	function getBarChart1(areaNo){
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/zhwg/IncomeAmplitudeDistribution!getIncomeAmplitudeDistributionBar.action',
			type:"POST",
		    data: {
				"monthId": monthId,
				"areaNo":areaNo
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				barChart(data,data.barList[0]!=null?data.barList[0].AREA_DESC+"收入增幅分布":"暂无数据","part1BarDiv");
			}
		});
	}
	
	function barChart(data, chartName, chartDivId) {
		var barData = [];
		if (data.barList[0] != null) {
			barData.push(data.barList[0].KPI_01);
			barData.push(data.barList[0].KPI_02);
			barData.push(data.barList[0].KPI_03);
			barData.push(data.barList[0].KPI_04);
			barData.push(data.barList[0].KPI_05);
			barData.push(data.barList[0].KPI_06);
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
			        data:['网格数量'],
			        y:'bottom'
			    },
			    xAxis: {
			    	type: 'category',
			        data: ['-10%以下','-10%~-5%','-5%~0%','0%~5%','5%~10%','10%以上'],
			        axisLabel:{
			        	interval:0
			        }
			    },
			    yAxis: [
			        {
			            type: 'value',
			            name: '网格数量',
			            axisLabel: {
			                formatter: '{value}'
			            }
			        }
			    ],
			    series: [
			        {
			            name:'网格数量',
			            type:'bar',
			            barWidth: '30%',
			            data:barData,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#3FA7DC' 
								},
								color:'#3FA7DC'
							}  
						},
						label: {
						      normal: {
						          show: true,
						          position: 'top',
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
		getBarChart1('root');
	}
	
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
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">收入增幅分布情况</td>
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
				<div align='left' style='font-weight:bold; font-size:14px'>
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
			<div class="col-xs-5 col-sm-5 col-md-5" id="part1TableDiv"></div>
			<div class="col-xs-7 col-sm-7 col-md-7" id="part1BarDiv" style="height: 380px; margin-top: 25px; padding:10px;"></div>
		</div>
	</div>
  </body>
</html>
