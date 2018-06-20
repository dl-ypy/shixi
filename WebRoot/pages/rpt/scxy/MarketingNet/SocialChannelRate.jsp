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
    <title>社会渠道毛利率</title>
    
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
</style>
<script type="text/javascript">
	var monthId;
	var areaNo;
	
    jQuery(document).ready(function(){

    	monthId = jQuery("#monthId").val();
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });

      query();
    });

	function query(){

		/* 获取表格的数据 */
		table();

	    /* 获取折线图的数据 */
	    getSubList("","root");
	}
    
    /*  获取表格数据*/
    function table() {
        
    	monthId = jQuery("#monthId").val();
    	jQuery.ajax({
    		url: '<%=contextPath%>/rpt/scxy/MarketingNet/SocialChannelRate!queryTable.action',
    		type:"POST",
    	    data: {
    	    	"monthId": monthId
    		},
    		
    		cache:false,
    		success:function(html) {
    			jQuery("#table").html(html);
    		}
    	});
    }
    
    /*点击郑州的查找项  */
	function getSubList(obj,regionId){
/* 		console.info(regionId); */
		monthId = jQuery("#monthId").val();
	 	jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/scxy/MarketingNet/SocialChannelRate!queryChart.action',
	 	    type: "POST",
	 	    data: {
		 	    "monthId":monthId,
	 			"areaNo":regionId
	 		},
	 		dataType: "json",
	 		cache:false,
	 		success:function(data){
		 		console.log(data);
	 			LineChart(data,"","chart");	
		  }
	 	});
	}
	 
	function LineChart(data, chartName, chartDivId) {

		/*  thisYear的数据*/
		var line1List = data.thisYearLine;
		var line1Data = [];
		for (var i = 0; i < line1List.length; i++) {
			if (line1List[i].KPI_01 != null) {
				line1Data.push((line1List[i].KPI_01*100).toFixed(2));
			} else {
				line1Data.push('');
			}
			
		}

		/* lastYear的数据 */
		var line2List = data.lastYearLine;
		var line2Data = [];
		for (var i = 0; i < line2List.length; i++) {
			if (line2List[i].KPI_01 != null) {
				line2Data.push(line2List[i].KPI_01);
			} else {
				line2Data.push('');
			}
		}

		jQuery("#" + chartDivId).empty();
		jQuery("#" + chartDivId).removeAttr("_echarts_instance_");

	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById(chartDivId));
	    lineChart.showLoading({text: '正在努力加载中...'});
	    
	    // 指定图表的配置项和数据
		option = {
			    title: {
			        text: chartName
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['今年','去年']
			    },
			    grid: {
			        containLabel: true
			    },
			    toolbox: {
			    
			    },
			    xAxis: {
			        type: 'category',
			        boundaryGap: false,
			        data: ['1月','2月','3月','4月',
				           	'5月','6月','7月','8月',
				           	'9月','10月','11月','12月'],
			    },
			    yAxis: {
		            type: 'value',
		            axisLabel: {
		            	show :'false',
		                formatter: '{value}'
		            }
			    },
			    series: [
			        {
			            name:'今年',
			            type:'line',
			            data:line1Data
			        },
			        {
			            name:'去年',
			            type:'line',
			            data:line2Data
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
		  <div class="col-xs-10 col-sm-10 col-md-10"></div>
		  <div class="col-xs-2 col-sm-2 col-md-2" > 
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
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">社会渠道毛利率</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="row">
			<!--左侧的表格  -->
			<div class="col-xs-4 col-sm-4 col-md-4" id="table"></div>
			
			<!--右侧的折线图 -->
			<div class="col-xs-8 col-sm-8 col-md-8" id="chart" style="height: 380px; margin-top: 25px; padding:10px;"></div>
		</div>

	</div>
  </body>
</html>
