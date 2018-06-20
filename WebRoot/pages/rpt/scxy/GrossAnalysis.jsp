<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	String contextPath = request.getContextPath();
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>市场业务毛利分析</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/bootstrap/3.3.6/bootstrap.min.css"
	media="screen">
<link rel="stylesheet" type="text/css"
	href="../../resources/frame/jedate-6.0.2/skin/jedate.css">
<link
	href="<s:url value="/struts/pure/css/grey.css?ver=1.5.1-SNAPSHOT"/>"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="../../resources/js/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript"
	src="../../resources/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script type="text/javascript"
	src="../../resources/frame/jedate-6.0.2/jquery.jedate.min.js"></script>
<script type="text/javascript"
	src="../../resources/frame/echarts-3.8.4/echarts.min.js"></script>
<script type="text/javascript"
	src="../../resources/frame/echarts-3.8.4/map/henan.js"></script>
<script type="text/javascript"
	src="../../resources/frame/DrillTable/DrillTable.js"></script>

<style type="text/css">
html, body {
	width: 100%;
	text-align: center;
}

div {
	margin: 0px;
	padding: 0px;
}
</style>
<script type="text/javascript">
	var monthId;
	var areaNo;
	jQuery(document).ready(function() {
		jQuery("#monthId").jeDate({
			format : "YYYY-MM"
		});
		monthId = $("#monthId").val();
		areaNo = $("#areaNo").val();
		query();
	});
	function query(){
		monthId = $("#monthId").val();
		areaNo = $("#areaNo").val();
		grosstable();
		getLinechart();
	}
	function getLinechart(){
		jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/scxy/GrossAnalysis!queryGrossChart.action',
	 	    type: "post",
	 	    data: {
	 			"monthId": monthId, 
	 			"areaNo": areaNo
	 		},
	 		dataType: "json",
	 		success:function(data){
	 			setLinechart(data);
	 		}
	 	});
		
	}

  function setLinechart(data){
	  var dataList = data.list;
		var data1=[];
		var data2=[];
		var data3=[];
		var data4=[];
				data1.push((dataList[0].KPI_02 * 1).toFixed(2));
				data1.push((dataList[0].KPI_04 * 1).toFixed(2));
				data2.push((dataList[1].KPI_02 * 1).toFixed(2));
				data2.push((dataList[1].KPI_04 * 1).toFixed(2));
				data3.push((dataList[2].KPI_02 * 1).toFixed(2));
				data3.push((dataList[2].KPI_04 * 1).toFixed(2));
				data4.push((dataList[3].KPI_02 * 1).toFixed(2));
				data4.push((dataList[3].KPI_04 * 1).toFixed(2));
				
	
		jQuery("#grosschart").empty();
		jQuery("#grosschart").removeAttr("_echarts_instance_");

	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById('grosschart'));
	    lineChart.showLoading({text: '正在努力加载中...'});
	    // 指定图表的配置项和数据
		var   option={
		tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	        data: ['ICT业务', 'IDC业务','2I2C业务','基础业务收入']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	   yAxis:  {
	        type: 'value',
	        name:'占比 （%）'
	    },
	    xAxis: {
	        type: 'category',
	        data: ['市场收入占比','市场毛利占比']
	    },
	    series: [
	        {
	            name: 'ICT业务',
	            type: 'bar',
	            barWidth:40,
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            data: data3
	        },
	        {
	            name: 'IDC业务',
	            type: 'bar',
	            barWidth:40,
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            data: data4
	        },
	        {
	            name: '2I2C业务',
	            type: 'bar',
	            barWidth:40,
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            data:data2
	        },
	        {
	            name: '基础业务收入',
	            type: 'bar',
	            barWidth:40,
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            data:data1
	        }
	    ]
	};

	    // 使用刚指定的配置项和数据显示图表。
		lineChart.setOption(option);
		lineChart.hideLoading();
	}
	function grosstable(){
		jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/scxy/GrossAnalysis!queryGrossTable.action',
					type : "post",
					data : {
						"monthId" : monthId,
						"areaNo" : areaNo
					},
					success : function(html) {
						jQuery("#grosstable").html(html);
						//jQuery(".topTableTr")[0].click();
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
		var url= '<%=basePath%>/rpt/scxy/GrossAnalysis!queryDrill.action';
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
	
</script>
</head>
<body>
	<div class="container"
		style="width: 98%; margin-top: 5px; height: 0px;">
		<div class="row" style="height: 0px;">
			<form class="form-inline" style="margin-top: 10px; float: right;">
				<div class="form-group">
					<label for="areaNo">地域</label>
					<s:select id="areaNo" cssClass="form-control" list="list"
						listKey="AREA_NO" listValue="AREA_DESC"
						cssStyle="width: 100px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
				</div>
				<div class="form-group">
					<label for="monthId">时间</label> <input type="text"
						class="form-control workinput" id="monthId"
						value="<s:property value="monthId"/>"
						style="width: 100px; height: 25px; margin-right: 10px; font-size: 12px; padding: 0px;">
				</div>
				<button type="button" class="btn btn-info btn-sm"
					style="width: 60px; height: 25px; line-height: 10px;"
					onclick="query()">查询</button>
			</form>
		</div>
	</div>
	<div class="container" style="width: 98%; margin-top: 20px;"
		id="homeframe-container">
		<div class="row" style="height: 30px; margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table
					style="border-collapse: collapse; height: 28px; padding: 0px; margin: auto; width: 100%;">
					<tr>
						<td style="background-color: #C00000; width: 28px;"></td>
						<td style="width: 3px;"></td>
						<td
							style="background-color: #BFBFBF; text-align: left; padding-left: 10px; font-weight: bold; font-size: 14px;">市场业务毛利分析</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row" style="height: 350px; margin-top: 10px;">
			<div id="grosstable" class="col-xs-7 col-sm-7 col-md-7" style=" margin-top: 10px;"></div>
			<div id="grosschart" class="col-xs-5 col-sm-5 col-md-5"
				style="height: 300px;margin-top:10px;"></div>
		</div>
	</div>
</body>
</html>