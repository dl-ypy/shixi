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
    <title>收入增幅对标</title>
    
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
	var monthId ;
	var areaNo;
	jQuery(document).ready(function(){
	   	jQuery("#monthId").jeDate({
	      	   format:"YYYY-MM"
	       });
	   	querytitle();
	   	querytable();
	   	queryChart(); 
	   });
	function query(){
		 querytitle();
		 querytable();
	     queryChart();
	 }
	function querytitle(){
		monthId = jQuery('#monthId').val();
		jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/zhwg/IncomeIncreaseDB!querytitle.action',
	 	    type: "POST",
	 	    data: {
	 			"monthId": monthId,
	 			"areaNo": 'root'
	 		},
	 		dataType: "json",
	 		cache:false,
	 		success:function(data){
		    	 var monthId_ = monthId.substr(5);
		    	 document.getElementById("part").innerHTML = monthId_;
		    	 if(data.list.length>0){
		 			    var title = data.list[0];
		 			        document.getElementById("part1").innerHTML = title.KPI_01;
		 			        document.getElementById("part2").innerHTML = title.KPI_02;
		 			        if(title.KPI_1_2>0){
		 			        document.getElementById("part3").innerHTML = "高"+Math.abs(title.KPI_1_2);
		 			        }else if(title.KPI_1_2<0){
		 			        document.getElementById("part3").innerHTML = "低"+Math.abs(title.KPI_1_2);
		 			        }
			    	 }else{
			    		    document.getElementById("part1").innerHTML = "--";
			    		    document.getElementById("part2").innerHTML = "--";
					        document.getElementById("part3").innerHTML = "--";
			    	 }
	 		}
	 	});
	}
	function querytable(){
	 	var monthId = jQuery('#monthId').val();
	 	var areaNo = jQuery('#areaNo option:selected').val();
	 	jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/zhwg/IncomeIncreaseDB!queryOutTable.action',
	 	    type: "POST",
	 	    data: {
	 			"monthId": monthId,
	 			"areaNo": areaNo
	 		},
	 		cache:false,
	 		success:function(html){
	 			jQuery("#TableDiv").html(html);
	 		}
	 	});
	 }
	function queryChart(){
		var monthId = jQuery('#monthId').val();
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/zhwg/IncomeIncreaseDB!queryOutChart.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				scatterChart(data,"","ChartDiv");
			}
		});
	}
	function scatterChart(data, chartName, chartDivId) {
		var scatterList = data.list;
		var chart1 = [];
		var chart2= [];
		var y='';
		var x='';
		for (var i = 0; i < scatterList.length; i++) {
			chart1.push(scatterList[i].KPI_01);
			chart1.push(scatterList[i].KPI_02);
			chart1.push(scatterList[i].LEVEL_NAME);
			chart1.push(scatterList[i].KPI_03);
			chart1.push(scatterList[i].KPI_04);
			chart2.push(chart1);
			chart1=[];
		}
		for (var i = 0; i < scatterList.length; i++) {
			if(i=scatterList.length-1){
				y=scatterList[i].KPI_02;
				x=scatterList[i].KPI_01;
			}
		}
		jQuery("#" + chartDivId).empty();
		jQuery("#" + chartDivId).removeAttr("_echarts_instance_");

	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById(chartDivId));
	    lineChart.showLoading({text: '正在努力加载中...'});
	    // 指定图表的配置项和数据
		var	option = {
		    animation: false,
		    tooltip: {
		        show:true,
			 	trigger: 'item',
			 	formatter:function(param) {
		            var nameStr = param.data[2];
		            return nameStr + ':</br>' +
	                   '网格收入增幅%：'+ param.data[0] + '</br>' +
	                   '整体收入增幅%：'+ param.data[1]+ '</br>' +
	                   '差距%：'+ param.data[3]+ '</br>' +
	                   '排名：'+ param.data[4];
	        	}
		    },
		    xAxis: {
		        type: 'value',
		        min: 'dataMin',
		        max: 'dataMax',
		        splitLine: {
		            show: true
		        },
		        axisLine:{
		            show:false
		        },
		        axisTick:{
		            show:false
		        }
		    },
		    yAxis: {
		        type: 'value',
		        min: 'dataMin',
		        max: 'dataMax',
		        splitLine: {
		            show: true
		        },
		        axisLine:{
		            show:false
		        },
		        axisTick:{
		            show:false
		        }
		    },
		    series: [
		        {
		            name: 'scatter',
		            type: 'scatter',
		            label: {
		                normal:{
		                    show:true,
		                    formatter:function(param) {
		                        var nameStr = param.data[2];
		                        nameStr = nameStr.substring(0,1)
		                        return nameStr;
		                    }
		                }
		            },
		            itemStyle:{
		                normal:{
		                    color:'#3FA7DC'
		                }
		            },
		            symbolSize:18,
		            markLine:{
		                silent:true,
		                data : [
		                    {  yAxis: y, 
		                       lineStyle:{
		                            normal:{
		                                type:'solid'
		                            }
		                        }
		                    },
		                    {   xAxis: x,
		                        lineStyle:{
		                            normal:{
		                                type:'solid'
		                            }
		                        }
		                    },
		                    
		                ]
		            },
		            data: chart2
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
	 <div class="container" style="width: 98%;margin-top: 2%;" id="homeframe-container">
	 	<div class="row" style="height: 30px;margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
						<td style="background-color: #C00000;width: 28px;"></td>
						<td style="width: 3px;"></td>
						<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">收入增幅对标</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row" style="text-align: left;margin-left:5px;font-weight: bold;font-size: 14px;padding-top:1%;">
		      <span id="part"></span>月，全省综合网格收入完成较基数增幅<span id="part1">---</span>%,全省整体收入较基数增幅<span id="part2">---</span>%,综合网格收入增幅较整体<span id="part3">---</span>PP<br>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<hr style="border:none;border-top:1px solid #FF0000;"/>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-5 col-sm-5 col-md-5" id="TableDiv"></div>
			<div class="col-xs-7 col-sm-7 col-md-7">
				<div id="ChartDiv" style="height: 380px; margin-top: 25px; padding:20px;"></div>
			</div>
		</div>
	</div>
  </body>
</html>
