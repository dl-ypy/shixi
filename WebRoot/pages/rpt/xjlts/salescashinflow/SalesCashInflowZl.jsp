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
    <title>销售现金流入情况</title>
    
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
	 <script type="text/javascript" src="../../../resources/frame/DrillTable/DrillTable.js"></script>
<style type="text/css">
    html,body{
       width: 100%;
       text-align: center;
    }
    div{
       margin: 0px;
       padding: 0px;
    }
	.tw {border-right:1px solid #D61821 ;border-width:medium}
</style>
<script type="text/javascript">
	var areaNo;
	var monthId;
	var kpiId='KPI_01';
	var chartName;
	var partId;
    jQuery(document).ready(function(){
    	areaNo = jQuery("#areaNo").val();
    	monthId = jQuery("#monthId").val();
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });
    	query();
    });
    function dyo_mouseOver(o){
		jQuery(o).find(".dyo_span_zw").hide();
		jQuery(o).find(".dyo_span").show();
	}

	function dyo_mouseOut(o){
		jQuery(o).find(".dyo_span").hide();
		jQuery(o).find(".dyo_span_zw").show();
	}
    function query() {
    	areaNo = jQuery("#areaNo").val();
    	monthId = jQuery("#monthId").val();
    	table1();
    	table2();
    	line1();
    	line2();
    	pie1();
    	pie2();
    }
    function table1() {
    	jQuery.ajax({
    		url: '<%=contextPath%>/rpt/xjlts/salescashinflow/SalesCashInflowZl!table1.action',
    		type:"POST",
    	    data: {
    			"areaNo":areaNo,
    	    	"monthId": monthId
    		},
    		cache:false,
    		success:function(html) {
    			jQuery("#table1").html(html);
    		}
    	});
    }
    function table2() {
    	jQuery.ajax({
    		url: '<%=contextPath%>/rpt/xjlts/salescashinflow/SalesCashInflowZl!table2.action',
    		type:"POST",
    	    data: {
    			"areaNo":areaNo,
    	    	"monthId": monthId
    		},
    		cache:false,
    		success:function(html) {
    			jQuery("#table2").html(html);
    		}
    	});
    }
    function line1(levelId){
    	var areaNo_link = levelId!=areaNo ? areaNo : levelId;
    	jQuery.ajax({
    		url: '<%=contextPath%>/rpt/xjlts/salescashinflow/SalesCashInflowZl!line1.action',
    		type:"POST",
    	    data: {
    			"areaNo":areaNo_link,
    	    	"monthId": monthId,
    	    	"kpiId":kpiId
    		},
    		dataType: "json",
			cache:false,
    		success:function(data) {
    			var line1List = data.lastYearLine1;
				var line1Data1 = [];
				for (var i = 0; i < line1List.length; i++) {
					line1Data1.push((line1List[i].KPI_01 * 100).toFixed(0));
				}
				var line2List = data.thisYearLine1;
				var line1Data2 = [];
				for (var i = 0; i < line2List.length; i++) {
					line1Data2.push((line2List[i].KPI_01 * 100).toFixed(0));
				}
				lineChart(line1Data1, line1Data2, 'line1', 'lineNameDiv1');
    		}
    	});
    }
    function line2(levelId){
    	var areaNo_link = levelId!=areaNo ? areaNo : levelId;
    	jQuery.ajax({
    		url: '<%=contextPath%>/rpt/xjlts/salescashinflow/SalesCashInflowZl!line2.action',
    		type:"POST",
    	    data: {
    			"areaNo":areaNo_link,
    	    	"monthId": monthId,
    	    	"kpiId":kpiId
    		},
    		dataType: "json",
			cache:false,
    		success:function(data) {
    			var line1List = data.lastYearLine2;
				var line1Data1 = [];
				for (var i = 0; i < line1List.length; i++) {
					line1Data1.push((line1List[i].KPI_01 * 100).toFixed(0));
				}
				var line2List = data.thisYearLine2;
				var line1Data2 = [];
				for (var i = 0; i < line2List.length; i++) {
					line1Data2.push((line2List[i].KPI_01 * 100).toFixed(0));
				}
				lineChart(line1Data1, line1Data2, 'line2', 'lineNameDiv2');
    		}
    	});
    }
    function lineChart(line1Data, line2Data, chartDivId, chartNameDivId) {
		jQuery("." + chartNameDivId).html(chartName);

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
			        trigger: 'axis',
			        formatter: "{b}月<br />{a0}:{c0}<br />{a1}:{c1}"
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
    function table1Click(kpiId1, chartName1,levelId){
    	kpiId=kpiId1;
    	chartName=chartName1;
    	line1(levelId);
    }
    function table2Click(kpiId2, chartName2,levelId){
    	kpiId=kpiId2;
    	chartName=chartName2;
    	line2(levelId);
    }
    function pie1(){
    	jQuery.ajax({
    		url: '<%=contextPath%>/rpt/xjlts/salescashinflow/SalesCashInflowZl!pie1.action',
    		type:"POST",
    	    data: {
    			"areaNo":areaNo,
    	    	"monthId": monthId
    		},
    		dataType: "json",
			cache:false,
    		success:function(data) {
    			var pie1List=data.pie1List;
    			var legendData1 = [];
    			var pieData1 = [];
    			for(var i=0;i<pie1List.length;i++){
    				legendData1.push(pie1List[i].KPI_NAME);
    				pieData1.push({value:pie1List[i].KPI_01, name:pie1List[i].KPI_NAME});
    			}
    			pieChart(legendData1,pieData1,'pie1');
    		}
    	});
    }
    function pie2(){
    	jQuery.ajax({
    		url: '<%=contextPath%>/rpt/xjlts/salescashinflow/SalesCashInflowZl!pie2.action',
    		type:"POST",
    	    data: {
    			"areaNo":areaNo,
    	    	"monthId": monthId
    		},
    		dataType: "json",
			cache:false,
    		success:function(data) {
    			var pie2List=data.pie2List;
    			var legendData2 = [];
    			var pieData2 = [];
    			for(var i=0;i<pie2List.length;i++){
    				legendData2.push(pie2List[i].KPI_NAME);
    				pieData2.push({value:pie2List[i].KPI_01, name:pie2List[i].KPI_NAME});
    			}
    			pieChart(legendData2,pieData2,'pie2');
    		}
    	});
    }
    function pieChart(legendData,pieData, chartDivId) {
		jQuery("#" + chartDivId).empty();
		jQuery("#" + chartDivId).removeAttr("_echarts_instance_");

		// 基于准备好的dom，初始化echarts实例
	    var pieChart = echarts.init(document.getElementById(chartDivId));
	    // 指定图表的配置项和数据
		var option = {
		    tooltip : {
		        trigger: 'item',
		        formatter: "{b} : {c} ({d}%)"
		    },
		    legend: {
		    	orient:'horizontal',
		        data: legendData,
		        bottom: '15%'
		    },
		    series : [
		        {
		            type: 'pie',
		            radius : '45%',
		            center: ['55%', '38%'],
		            data:pieData,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	    // 使用刚指定的配置项和数据显示图表。
		pieChart.setOption(option);
	}
 // 按组织机构下钻
    function drillTableByOrg1(obj, kpiId, orgId){
    	var url= '<%=contextPath%>/rpt/xjlts/salescashinflow/SalesCashInflowZl!drillTableByOrg1.action';
    	var param = "monthId=" + monthId + "&areaNo=" + areaNo+ "&kpiId=" + kpiId;
    	action({
    		td : obj,
    		url : url,
    		mode : 'drill',
    		parameters : param,
    		onComplete : function(data) {
    		}
    	});
    	accountPlusClick(kpiId + '_' + orgId);
    }
    function drillTableByOrg2(obj, kpiId, orgId){
    	var url= '<%=contextPath%>/rpt/xjlts/salescashinflow/SalesCashInflowZl!drillTableByOrg2.action';
    	var param = "monthId=" + monthId + "&areaNo=" + areaNo+ "&kpiId=" + kpiId;
    	action({
    		td : obj,
    		url : url,
    		mode : 'drill',
    		parameters : param,
    		onComplete : function(data) {
    		}
    	});
    	accountPlusClick(kpiId + '_' + orgId);
    }
    function accountPlusClick(id) {
    	var src = jQuery("#IMG_"+id).attr("src");
    	if(src==undefined){
    		return ;
    	}
    	if(src.indexOf("icon-null.png") > -1){
    		return ;
    	}
    	if(src.indexOf("icon-down.png")==-1){
    		jQuery("#IMG_"+id).attr("src","<%=contextPath%>/resources/frame/DrillTable/icon-down.png");
    	}else{
    		jQuery("#IMG_"+id).attr("src","<%=contextPath%>/resources/frame/DrillTable/icon-right.png");
    	}
    }
</script>
  </head>
  <body>
     <div class="container" style="width: 98%;margin-top: 5px;height: 0px;">
        <div class="row" style="height: 0px;">
		  <div class="col-xs-6 col-sm-6 col-md-6"></div>
		  <div class="col-xs-6 col-sm-6 col-md-6" > 
		      <form class="form-inline"  style="margin: 0px;">
		         <div class="form-group">
		             <label for="areaNo">地域</label>
                     <s:select id="areaNo" cssClass="form-control" list="list" listKey="AREA_NO" listValue="AREA_DESC" cssStyle="width: 66px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
		         </div>
		         <div class="form-group">
		             <label for="monthId">时间</label>
                     <input type="text" class="form-control workinput" id="monthId" value="${monthId}" style="width: 70px;height: 25px;font-size: 12px;padding: 0px;">
		         </div>
		         <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="query()">查询</button>
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
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">自由现金流</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row" style="height: 30px;margin-top: 10px;">
			<div id="table1" class="col-xs-4 col-sm-4 col-md-4"  style="padding-top: 20px;"></div>
			<div class="col-xs-4 col-sm-4 col-md-4"  style="padding-left: 50px;padding-top: 15px;">
				<div style="text-align: left; font-weight: bold;"><span class="lineNameDiv1">欠费回收</span>变化趋势</div>
				<div id="line1" style="height: 200px"></div>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4"  style="padding: 0px;">
				<div id="pie1" style="width:100%;height:300px"></div>
			</div>
		</div>
	 	<div class="row" style="height: 30px;margin-top:10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">现金流入渠道分析</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row" style="height: 30px;margin-top: 10px;">
			<div id="table2" class="col-xs-4 col-sm-4 col-md-4"  style="padding-top: 20px;"></div>
			<div class="col-xs-4 col-sm-4 col-md-4"  style="padding-left: 50px;padding-top: 25px;">
				<div style="text-align: left; font-weight: bold;"><span class="lineNameDiv2">现金</span>变化趋势</div>
				<div id="line2" style="height: 200px"></div>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4"  style="padding: 0px;">
				<div id="pie2" style="width:100%;height:450px"></div>
			</div>
		</div>
	 </div>
  </body>
</html>
