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
    <title>营业欠款分析</title>
    
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
  	
  	<script type="text/javascript">
  		var monthId;
  		var areaNo;
  		/* 页面初始化 */
  		jQuery(document).ready(function(){
  	    	areaNo = jQuery("#areaNo").val();
  	    	monthId = jQuery("#monthId").val();
  	    	jQuery("#monthId").jeDate({
  	       	   format:"YYYY-MM"
  	        });
  	    	select();
  	    });
  		
  		/* 点击查询 */
  		function select() {
  			monthId = jQuery("#monthId").val();
  			areaNo = jQuery("#areaNo").val();
  			table();
  			getBarChart1();
  		}
  		
  		/* 表格ajax */
  		function table() {
  			jQuery.ajax({
  				url:'<%=contextPath%>/rpt/xjlts/yyqkfx/BusinessArrears!getTableList.action',
  				type:'post',
  				data:{
  					"monthId":monthId,
  					"areaNo":areaNo
  				},
  				cache:false,
  				success:function(html) {
  					jQuery("#table").html(html);
  				}
  			});
  		}
  		
  		/* 图表 */
		function getBarChart1(){
			jQuery.ajax({
				url: '<%=contextPath%>/rpt/xjlts/yyqkfx/BusinessArrears!getBusinessArrearsBarChart.action',
				type:"POST",
			    data: {
					"monthId": monthId,
					"areaNo":areaNo
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
			var bar2Data = [];
			var line1Data = [];
			var xData = [];
			for (var i = 0; i < bar1List.length; i++) {
				(data.KPI_01 * 1).toFixed(0)
				bar1Data.push((bar1List[i].KPI_10 * 1).toFixed(0));
				bar2Data.push((bar1List[i].KPI_13 * 1).toFixed(0));
				line1Data.push((bar1List[i].KPI_15 * 1).toFixed(2));
				xData.push(bar1List[i].LEVEL_NAME);
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
				        data:['余额','限额','占收比']
				    },
				    xAxis: {
				    	type: 'category',
				        data: xData,
				        axisLabel:{
				        	interval:0,
				        	rotate:-30
				        }
				    },
				    yAxis: [
				        {
				            type: 'value',
				            name: '余额',
				            axisLabel: {
				                formatter: '{value}',
				            }
				        },
				        {
				            type: 'value',
				            name: '占收比',
				            axisLabel: {
				                formatter: '{value}%'
				            },
				        }
				    ],
				    series: [
				        {
				            name:'余额',
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
				            name:'限额',
				            type:'bar',
				            data:bar2Data,
				            itemStyle : {  
								normal : {  
									lineStyle:{  
										color:'#EE7600' 
									},
									color:'#EE7600'
								}  
							}
				        },
				        {
				        	name:'占收比',
				            type:'line',
				            data:line1Data,
				            itemStyle : {  
								normal : {  
									lineStyle:{  
										color:'#C25552' 
									},
									color:'#C25552'
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
  	</script>
  </head>
<body>
	<div class="container" style="width: 98%;margin-top: 5px;height: 0px;">
        <div class="row" style="height: 0px;">
		  <div class="col-xs-8 col-sm-8 col-md-8"></div>
		  <div class="col-xs-4 col-sm-4 col-md-4"> 
		      <form class="form-inline"  style="margin: 0px;float:right" >
		         <div class="form-group">
		             <label for="areaNo">地域</label>
                     <s:select id="areaNo" cssClass="form-control" list="list" listKey="AREA_NO" listValue="AREA_DESC" cssStyle="width: 66px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
		         </div>
		         <div class="form-group">
		             <label for="monthId">时间</label>
                     <input type="text" class="form-control workinput" id="monthId" value="${monthId}" style="width: 70px;height: 25px;font-size: 12px;padding: 0px;">
		         </div>
		         <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="select()">查询</button>
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
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">营业欠款监控</td>
					</tr>
				</table>
			</div>
		</div>
	   <div  id="table" class="row"></div>
	 </div>
	 <div class="row">
	 	<div class="col-xs-12 col-sm-12 col-md-12" id="part1BarDiv" style="height: 380px; margin-top: 25px; padding:10px;"></div>
	 </div>
</body>
</html>