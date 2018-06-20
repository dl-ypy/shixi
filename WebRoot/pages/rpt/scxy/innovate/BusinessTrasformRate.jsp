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
    <title>2l2C业务转换率同比变动</title>
    
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
     var monthId ;
	 jQuery(document).ready(function(){
	    	jQuery("#monthId").jeDate({
	       	   format:"YYYY-MM"
	        });
	    	$("#Describle").hide();
	    	querytitle();
	    	querytable();
	    	queryChart();
	    });
	 function query(){
		 $("#Describle").hide();
		 querytitle();
	     querytable();
	     queryChart();
	 }
function querytitle(){
	var monthId = jQuery('#monthId').val();
	jQuery.ajax({
 		url: '<%=contextPath%>/rpt/scxy/innovate/BusinessTrasformRate!querytitle.action',
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
	    	 document.getElementById("part").innerHTML = mon;
	    	 if(data.list.length>0){
 			    var title = data.list[0];
 			        document.getElementById("part1").innerHTML = title.KPI_01;
 			        if(title.KPI_03<=0){
 				      title.KPI_03 =  "增加 "+Math.abs(title.KPI_03);
 			        }else if(title.KPI_03>0){
 				      title.KPI_03 =  "减少 "+Math.abs(title.KPI_03);
 			        }
 			        document.getElementById("part2").innerHTML = title.KPI_03;
 			        
 			        document.getElementById("part3").innerHTML = title.FIRST_THREE;
 			        document.getElementById("part4").innerHTML = title.LAST_THREE;
	    	 }else{
	    		    document.getElementById("part1").innerHTML = "--";
	    		    document.getElementById("part2").innerHTML = "--";
			        document.getElementById("part3").innerHTML = "--";
			        document.getElementById("part4").innerHTML = "--";
	    	 }
 		}
 	});
}
	 function querytable(){
	 	var monthId = jQuery('#monthId').val();
	 	jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/scxy/innovate/BusinessTrasformRate!queryOutTable.action',
	 	    type: "POST",
	 	    data: {
	 			"monthId": monthId
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
			url: '<%=contextPath%>/rpt/scxy/innovate/BusinessTrasformRate!queryOutLineChart.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				barChart(data,"","LineDiv");
			}
		});
	}
	function barChart(data, chartName, chartDivId) {
		var barList = data.barList;
		var line1Data = [];
		var line2Data = [];
		var xData = [];
		for (var i = 0; i < barList.length; i++) {
			line1Data.push(barList[i].KPI_01);
			line2Data.push(barList[i].KPI_02);
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
			        data:['本月累计','上年同期']
			    },
			    xAxis: {
			    	type: 'category',
			        data: xData,
			        axisLabel:{
			        	rotate:45,
			        	interval:0
			        }
			    },
			    yAxis: [
			        {
			            type: 'value',
			            name: '本月累计',
			            axisLabel: {
			                formatter: '{value}%'
			            }
			        },
			        {
			            type: 'value',
			            name: '上年同期',
			            axisLabel: {
			                formatter: "{value}%"
			            }
			        }
			    ],
			    series: [
			           {
			            name:'本月累计',
			            type:'line',
			            data:line1Data,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#EE7600',
									width: 2
									},
								color:'#EE7600'
								}  
			            	}
			            },
						{
							name:'上年同期',
				            type:'line',
				            data:line2Data,
				            itemStyle : {  
								normal : {  
									lineStyle:{  
										color:'#3FA7DC',
										width: 2
									},
									color:'#3FA7DC'
								}  
						    }
						}
						
			    ]
			};

	    // 使用刚指定的配置项和数据显示图表。
		lineChart.setOption(option);
		lineChart.hideLoading();
	}  
	function getSubList(obj,regionId){
		console.info(regionId);
		var monthId = jQuery('#monthId').val();
	 	jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/scxy/innovate/BusinessTrasformRate!getLastInfo.action',
	 	    type: "POST",
	 	    data: {
	 			"monthId": monthId,
	 			"areaNo":regionId
	 		},
	 		dataType: "json",
	 		cache:false,
	 		success:function(data){
	 			$("#Describle").show();
	 			var list = data.lastlist[0];
	 			if(list.KPI_03<=0){
	 				list.KPI_03 = "较上年同期下降"+Math.abs(list.KPI_03)+"%"; 
	 			}else if(list.KPI_03>0){
	 				list.KPI_03 ="较上年同期提升"+Math.abs(list.KPI_03)+"%";
	 			}
	 			if(list.KPI_05<0){
	 				list.KPI_05 = "，高于全省均值"+Math.abs(list.KPI_05)+" pp。";
	 			}else if(list.KPI_05>0){
	 				list.KPI_05 = "，低于全省均值"+Math.abs(list.KPI_05)+" pp。";
	 			}else{
	 				list.KPI_05="";
	 			}
	 			 document.getElementById("de1").innerHTML = list.AREA_DESC+list.KPI_03;
	 			 document.getElementById("de2").innerHTML = list.KPI_05;
	 		}
	 	});
	}
</script>
  </head>
  <body>
     <div class="container" style="width: 98%;margin-top:15px;height: 0px;">
        <div class="row" style="height: 0px;">
		  <div style="float:right;" > 
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
		<div class="row" style="height: 30px;margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">2l2C业务转换率同比变动</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row" style="text-align: left;margin-left:5px;font-weight: bold;font-size: 14px;padding-top:1%;">
		      <span id="part"></span>月，全省2I2C业务毛利率为 <span id="part1">---</span>%，同比<span id="part2">---</span> PP<br>
		 </div>
		   <hr style="border:none;border-top:2px solid #FF6A6A;"/>
		   <div class="row" style="text-align: left;;margin-left:5px;margin-top:10px;font-size: 13px;">   
		       <span style="font-weight: bold;">从分市情况看：</span><br>
		      &nbsp; &nbsp; &nbsp; &nbsp;<span id="part3" style="color:EE7600;">---</span>同比改善幅度排名后三；&nbsp;&nbsp;<span id="part4" style="color:EE7600;">---</span>排名前三。
		  
		   </div>
		   <hr style="border:none;border-top:1px solid #FF6A6A;"/>
		<div class="row" style="margin-top:20px;">
			<div class="col-xs-5 col-sm-5 col-md-5" id="TableDiv"></div>
			<div class="col-xs-7 col-sm-7 col-md-7">
				<div id="LineDiv" style="height: 380px; margin-top: 50px; padding:20px;"></div>
			</div>
		</div>
		<div class="row" id="Describle" style='background:#FCD5B5; padding:20px; height:50px; width:80%;margin-left:10%;margin-top:2%;margin-bottom:3%;font-size:14px'>
				<div  style="float:center;margin-left:20px;">
				<span id="de1"></span><span id="de2"></span>
				</div>
		</div>
	 </div>
  </body>
</html>
