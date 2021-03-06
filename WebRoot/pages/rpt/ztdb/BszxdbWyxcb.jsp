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
    <title>网运线执行成本情况</title>
    
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
    <script type="text/javascript" src="../../resources/frame/DrillTable/DrillTable.js"></script>

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
var areaNo;
var monthId;
var projectPath = "<%=contextPath%>";

function dyo_mouseOver(o){
	jQuery(o).find(".dyo_span_zw").hide();
	jQuery(o).find(".dyo_span").show();
}

function dyo_mouseOut(o){
	jQuery(o).find(".dyo_span").hide();
	jQuery(o).find(".dyo_span_zw").show();
}
function table() {
	jQuery.ajax({
		url: '<%=contextPath%>/rpt/ztdb/BszxdbWyxcb!table.action',
		type:"POST",
	    data: {
			"monthId": monthId,
			"orgId": areaNo
		},
		cache:false,
		success:function(html) {
			jQuery("#tableDiv").html(html);
			jQuery(".part1Table")[0].click();
			jQuery("#bisKpiTreeRootORG_KPI_001").click();
		}
	});
}

function tableClick(kpiId, chartName,orgId) {
	var areaNo_link =orgId==(null || "") ? areaNo : orgId;
	jQuery.ajax({
		url: '<%=contextPath%>/rpt/ztdb/BszxdbWyxcb!chart.action',
		type:"POST",
	    data: {
			"monthId": monthId,
			"orgId": areaNo_link,
			"kpiId": kpiId
		},
		dataType: "json",
		cache:false,
		success:function(data) {
			var line1List = data.lastYearLine;
			var line1Data1 = [];
			var line2Data1 = [];
			for (var i = 0; i < line1List.length; i++) {
				line1Data1.push(line1List[i].KPI_01);
				line2Data1.push((line1List[i].KPI_08 * 100).toFixed(2));
			}
			var line2List = data.thisYearLine;
			var line1Data2 = [];
			var line2Data2 = [];
			for (var i = 0; i < line2List.length; i++) {
				line1Data2.push(line2List[i].KPI_01);
				line2Data2.push((line2List[i].KPI_08 * 100).toFixed(2));
			}
			lineChart(line1Data1, line1Data2, chartName, 'line1Div', 'lineNameDiv');
			lineChart(line2Data1, line2Data2, chartName, 'line2Div', 'lineNameDiv');
		}
	});
}

function lineChart(line1Data, line2Data, chartName, chartDivId, chartNameDivId) {
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

    jQuery(document).ready(function(){
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });
    	query();
    });
    
    function query() {
    	areaNo = jQuery("#areaNo").val();
    	monthId = jQuery("#monthId").val();
    	table();
    }

    function queryTableDrill(obj, kpiId,orgId){
    	var url= '<%=contextPath%>/rpt/ztdb/BszxdbWyxcb!table.action';
    	var param = "monthId=" + monthId + "&orgId=" + areaNo + "&kpiId=" + kpiId;
    	action({
    		td : obj,
    		url : url,
    		mode : 'drill',
    		parameters : param,
    		onComplete : function(data) {
    		}
    	});
    	plusClick(kpiId + '_' + orgId);
    }

    function plusClick(id) {
    	var src = jQuery("#IMG_"+id).attr("src");
    	if(src==undefined){
    		return ;
    	}
    	if(src.indexOf("icon-down.png")==-1){
    		jQuery("#IMG_"+id).attr("src",projectPath+"/resources/frame/DrillTable/icon-down.png");
    	}else{
    		jQuery("#IMG_"+id).attr("src",projectPath+"/resources/frame/DrillTable/icon-right.png");
    	}
    }
 // 按组织机构下钻
    function drillTableByOrg(obj, kpiId, orgId){
    	var url= '<%=contextPath%>/rpt/ztdb/BszxdbWyxcb!drillTableByOrg.action';
    	var param =  "monthId=" + monthId + "&orgId=" + areaNo + "&kpiId=" + kpiId;
    	action({
    		td : obj,
    		url : url,
    		mode : 'drill',
    		parameters : param,
    		onComplete : function(data) {
    		}
    	});
    	plusClick(kpiId + '_' + orgId);
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
                     <s:select id="areaNo" cssClass="form-control" list="list" listKey="ORG_ID" listValue="ORG_NAME" cssStyle="width: 66px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
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
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">网运线执行成本情况</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8 col-sm-8 col-md-8" id="tableDiv"></div>
			<div class="col-xs-4 col-sm-4 col-md-4">
				<div style="text-align: left; font-weight: bold;"><span class="lineNameDiv"></span>完成值变化趋势</div>
				<div id="line1Div" style="height: 200px"></div>
				<div style="text-align: left; font-weight: bold;"><span class="lineNameDiv"></span>占收比变化趋势</div>
				<div id="line2Div" style="height: 200px"></div>
			</div>
		</div>
	 </div>
  </body>
</html>
