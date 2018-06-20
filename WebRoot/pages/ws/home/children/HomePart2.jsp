<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
String contextPath = request.getContextPath();
%>
<div class="row" id="part2KpiDiv">
</div>

<script type="text/javascript">
function part2Kpi() {
	jQuery.ajax({
		url: '<%=contextPath%>/ws/home/children/HomePart2!kpi.action',
		type:"POST",
	    data: {
			"monthId": monthId, 
			"areaNo": areaNo
		},
		cache:false,
		success:function(html) {
			jQuery("#part2KpiDiv").html(html);
		}
	});
}

function part2Chart(kpiId, kpiName) {
	jQuery.ajax({
		url: '<%=contextPath%>/ws/home/children/HomePart2!chart.action',
		type:"POST",
	    data: {
			"monthId": monthId, 
			"areaNo": areaNo,
			"kpiId": kpiId
		},
		dataType: "json",
		cache:false,
		success:function(data) {
			var line1List = data.lastYearLine;
			var line1Data = [];
			for (var i = 0; i < line1List.length; i++) {
				if (line1List[i].THIS_VALUE) {
					line1Data.push((line1List[i].THIS_VALUE * 1).toFixed(2));
				} else {
					line1Data.push('');
				}
			}
			var line2List = data.thisYearLine;
			var line2Data = [];
			for (var i = 0; i < line2List.length; i++) {
				if (line2List[i].THIS_VALUE) {
					line2Data.push((line2List[i].THIS_VALUE * 1).toFixed(2));
				} else {
					line2Data.push('');
				}
			}
			part2ChartDraw('part2LineDiv' + kpiId, kpiName, line1Data, line2Data);
		}
	});
}

function part2ChartDraw(chartDivId, chartName, line1Data, line2Data) {
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
		        show: false,
		        data: ['今年', '去年']
		    },
		    grid: {
		        left: '5%',
		        right: '5%',
		        bottom: '10%',
		        containLabel: true
		    },
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
				splitLine : {
					show : false
				},
				axisTick : {
					show : false
				},
				axisLabel:{
		        	interval:0
		        },
		        data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
		    },
		    yAxis: {
		    	show : false,
		        type: 'value',
		        axisLabel: {
   		            formatter: function(value){
   		            	return 1;
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
		        	 stack: '总量',
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
		        	 stack: '总量',
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
	part2Kpi();
});
</script>
