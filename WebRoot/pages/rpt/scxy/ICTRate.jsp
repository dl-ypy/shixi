<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>

<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
String contextPath = request.getContextPath();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ICT毛利率及回款率</title>
    
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
	
	function table() {
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/scxy/ICTRate!table.action',
			type:"POST",
		    data: {
				"monthId": monthId,
				"orgId": areaNo
			},
			cache:false,
			success:function(html) {
				jQuery("#tableDiv").html(html);
				if (jQuery(".part1Table")[0] != undefined) {
					jQuery(".part1Table")[0].click();
				}
			}
		});
	}
	
	function table2() {
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/scxy/ICTRate!table2.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			cache:false,
			success:function(html) {
				jQuery("#table2Div").html(html);
				getTitle();
				if (jQuery(".part2Table")[0] != undefined) {
					jQuery(".part2Table")[0].click();
				}
			}
		});
	}

	/* 折线图1 */
    function getLineChart1(){
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/scxy/ICTRate!getLineChart1.action',
			type:"POST",
		    data: {
				"monthId": monthId,
				"orgId":areaNo
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				lineChart(data,"","line1Div");
			}
		});
	}
	
    function lineChart(data, chartName, chartDivId) {
		var lineList1 = data.thisYearLine;
		var lineList2 = data.lastYearLine;
		var lineData1 = [];
		var lineData2 = [];
		for (var i = 0; i < lineList1.length; i++) {
			lineData1.push(lineList1[i].KPI_05);
		}
		for (var i = 0; i < lineList2.length; i++) {
			lineData2.push(lineList2[i].KPI_05);
		}

		jQuery("#" + chartDivId).empty();
		jQuery("#" + chartDivId).removeAttr("_echarts_instance_");

	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById(chartDivId));
	    lineChart.showLoading({text: '正在努力加载中...'});
	    // 指定图表的配置项和数据
		var option = {
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
			        top: '0%',
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
		                textStyle: {
		                    color: '#76787d'
		                },
		                formatter: '{value}%'
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
			        	 data: lineData2
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
			        	 data: lineData1
			         }
			    ]
			};

	    // 使用刚指定的配置项和数据显示图表。
		lineChart.setOption(option);
		lineChart.hideLoading();
	}

	/* 折线图2 */
    function getLineChart2(areaNo){
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/scxy/ICTRate!getLineChart2.action',
			type:"POST",
		    data: {
				"monthId": monthId,
				"orgId":areaNo
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				lineChart(data,"","line2Div");
			}
		});
	}
    
    function lineChart(data, chartName, chartDivId) {
		var lineList1 = data.thisYearLine;
		var lineList2 = data.lastYearLine;
		var lineData1 = [];
		var lineData2 = [];
		for (var i = 0; i < lineList1.length; i++) {
			lineData1.push(lineList1[i].KPI_01);
		}
		for (var i = 0; i < lineList2.length; i++) {
			lineData2.push(lineList2[i].KPI_01);
		}

		jQuery("#" + chartDivId).empty();
		jQuery("#" + chartDivId).removeAttr("_echarts_instance_");

	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById(chartDivId));
	    lineChart.showLoading({text: '正在努力加载中...'});
	    // 指定图表的配置项和数据
		var option = {
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
			        top: '30%',
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
		                textStyle: {
		                    color: '#76787d'
		                },
		                formatter: '{value}%'
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
			        	 data: lineData2
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
			        	 data: lineData1
			         }
			    ]
			};

	    // 使用刚指定的配置项和数据显示图表。
		lineChart.setOption(option);
		lineChart.hideLoading();
	}
    
    /* 标题 */
    function getTitle() {
    	jQuery.ajax({
			url: '<%=contextPath%>/rpt/scxy/ICTRate!getTitle.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				var addr = '';
				if (data.list1.length == 0) {
					$("#span1").text("无");
				} else {
					for (var i=0; i<data.list1.length; i++) {
						addr += (data.list1[i].AREA_DESC+'、');
					}
					$("#span1").text(addr.substring(0,addr.length-1));
					addr = '';
				}
				if (data.list2.length == 0) {
					$("#span2").text("暂无数据！");
				} else {
					for (var i=0; i<data.list2.length; i++) {
						addr += (data.list2[i].AREA_DESC+'、');
					}
					$("#span2").text(addr.substring(0,addr.length-1));
				}
			}
		});
    }

	/* 鼠标事件的定义 */
	function dyo_mouseOver(o){
		jQuery(o).find(".dyo_span_zw").hide();
		jQuery(o).find(".dyo_span").show();
	}

	function dyo_mouseOut(o){
		jQuery(o).find(".dyo_span").hide();
		jQuery(o).find(".dyo_span_zw").show();
	}

	// 按组织机构下钻
	function drillTableByOrg(obj, kpiId, orgId){
		var url= '<%=basePath%>/rpt/scxy/ICTRate!queryDrill.action';
		var param = "&monthId=" + monthId + "&areaNo=" + areaNo +"&kpiId=" + kpiId ;
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
		if(src.indexOf("icon-null.png") > -1){
			return ;
		}
		if(src.indexOf("icon-down.png")==-1){
			jQuery("#IMG_"+id).attr("src",projectPath+"/resources/frame/DrillTable/icon-down.png");
		}else{
			jQuery("#IMG_"+id).attr("src",projectPath+"/resources/frame/DrillTable/icon-right.png");
		}
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
    	table2();
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
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">ICT业务毛利分析</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8 col-sm-8 col-md-8" id="tableDiv"></div>
			<div class="col-xs-4 col-sm-4 col-md-4">
				<div style="margin-top: 50px"><span>毛利率变化趋势</span></div>
				<div id="line1Div" style="height: 200px"></div>
			</div>
		</div>
		
		<div class="row" style="height: 30px;margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">ICT业务回款率</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8 col-sm-8 col-md-8" id="table2Div"></div>
			<div class="col-xs-4 col-sm-4 col-md-4">
				<div align='left' style='font-weight:bold; font-size:14px'>
					预警：<br/>
					1.未回款金额超过1000万的公司如下：<span id="span1"></span>。<br/>
					2.回款率后三名：<span id="span2"></span>。
				</div>
				<div style="margin-top: 50px"><span>回款率变化趋势</span></div>
				<div id="line2Div" style="height: 300px"></div>
			</div>
		</div>
	 </div>
  </body>
</html>
