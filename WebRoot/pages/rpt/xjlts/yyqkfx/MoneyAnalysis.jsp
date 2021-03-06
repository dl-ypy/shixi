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
    <title>营业沉淀资金分析</title>
    
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
	.tw {border-right:1px solid #D61821 ;border-width:medium}
</style>
<script type="text/javascript">
	var areaNo; 
	var monthId;

	/* 
	*获取表格的data,方法有query,table
	 */
    jQuery(document).ready(function(){
    	areaNo = jQuery("#areaNo").val(); 
    	
    	monthId = jQuery("#monthId").val();
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });
        
    	query();
    });
   
    function query() {
		areaNo = jQuery("#areaNo").val();
    	monthId = jQuery("#monthId").val();
		/*  表格*/
    	table();

    	/*  条形图*/
    	queryChart();
    }

    /*  获取表格数据*/
    function table() {
        
    	monthId = jQuery("#monthId").val();
    	jQuery.ajax({
    		url: '<%=contextPath%>/rpt/xjlts/yyqkfx/MoneyAnalysis!table.action',
    		type:"POST",
    	    data: {
    			"areaNo":areaNo,
    	    	"monthId": monthId
    		},
    		
    		cache:false,
    		success:function(html) {
    			jQuery("#table").html(html);
    		}
    	});
    }

    
    /* 获取条形图，折线图的信息的信息 */
	function queryChart(){
		monthId = jQuery("#monthId").val();
	 	jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/xjlts/yyqkfx/MoneyAnalysis!queryMoneyChart.action',
	 	    type: "POST",
	 	    data: {
		 	    "monthId":monthId,
	 		},
	 		dataType: "json",
	 		cache:false,
	 		success:function(data){
		 		console.log(data);
	 			LineChart(data,"","chartDiv");	
		  }
	 	});
	}

	 
	function LineChart(data, chartName, chartDivId) {

		var dataList = data.dataList;
		var lineData = [];
		var barData  = [];
		var xData = [];

		for (var i = 0; i < dataList.length; i++) {
			barData.push(dataList[i].KPI_09);
			lineData.push(dataList[i].KPI_11);
			xData.push(dataList[i].AREA_DESC);
		}

		
		jQuery("#" + chartDivId).empty();
		jQuery("#" + chartDivId).removeAttr("_echarts_instance_");

	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById(chartDivId));
	    lineChart.showLoading({text: '正在努力加载中...'});
	    
	    // 指定图表的配置项和数据
		option = {
				title: {
			    	left: 'center',
			        text:chartName,
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
			        data:['合计环比','环比变动-合计']
			    },
			    grid: {
			    	left: '0%',
			        right: '4%',
			        top: '10%',
			        bottom: '15%',
			        containLabel: true
			    },
			    toolbox: {
			     
			    },
			    xAxis: {
			        type: 'category',
			        data: xData,
			        axisLabel:{
			        	interval:0,
			        	rotate:-30
			        }
			    },
			    yAxis: {
			    	  type: 'value'
			    },
			    series: [
			        {
			            name:'合计环比',
			            type:'line',
			            data:lineData,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#C25552' 
								},
								color:'#C25552'
							}  
						},
			        },
			        {
			            name:'环比变动-合计',
			            type:'bar',
			            barWidth:'70%',
			            data:barData,
			            itemStyle : {  
							normal : {  
								lineStyle:{  
									color:'#3A5FCD' 
								},
								color:'#3A5FCD'
							}  
						},
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
		  
		  <!-- 右上角时间切换  -->
		  <div class="col-xs-6 col-sm-6 col-md-6" > 
		      <form class="form-inline"  style="margin: 0px;float:right;" >
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
	 
	 <!-- 第一部分汉字 -->
	 <div class="container" style="width: 98%;margin-top:2%;" id="homeframe-container">
	 	
	 	<div class="row" style="height: 30px;margin-top:10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">营业沉淀资金分析</td>
					</tr>
				</table>
			</div>
		</div>
		
		<!-- 表格主题 -->
		<div class="row" style="height: 30px;margin-top: 10px;">
			<!-- table表格 -->
			<div id="table" class="col-xs-12 col-sm-12 col-md-12"  style="padding: 0px;"></div>
			<!--条形图  -->
			<div id="chartDiv" class="col-xs-12 col-sm-12 col-md-12"  style="width:1000px;height:500px; padding: 0px;margin-top:40px"></div>
	    </div>
	
  </body>
</html>
