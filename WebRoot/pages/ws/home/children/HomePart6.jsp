<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
String contextPath = request.getContextPath();
%>
<style type="text/css">
    .part1Text{
    	color: red;
    }
</style>
<div class="row">
	<div class="col-xs-5 col-sm-5 col-md-5" id="part6TableDiv"></div>
	<div class="col-xs-4 col-sm-4 col-md-4">
		<div id="part6ChartName" style="text-align: left; font-weight: bold;"></div>
		<div id="part6MapDiv" style="height: 320px"></div>
		<div style="position:absolute; top: 270px; left: 30px;">
			<table>
				<tr>
					<td><div style="width: 20px; height: 10px; background-color: #FECDE6"></div></td>
					<td><div style="font-size: 11px">&nbsp;&nbsp;前三</div></td>
				</tr>
				<tr>
					<td><div style="width: 20px; height: 10px; background-color: #B0A2FA"></div></td>
					<td><div style="font-size: 11px">&nbsp;&nbsp;后三</div></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="col-xs-3 col-sm-3 col-md-3">
		<div style="height: 50px"></div>
		<div id="part6LineDiv" style="height: 270px"></div>
	</div>
</div>

<script type="text/javascript">
function part6Table(){
	jQuery.ajax({
		url: '<%=contextPath%>/ws/home/children/HomePart6!table.action',
		type:"POST",
	    data: {
			"monthId": monthId, 
			"areaNo": areaNo
		},
		cache:false,
		success:function(html) {
			jQuery("#part6TableDiv").html(html);
			jQuery(".part6TableTd")[0].click();
		}
	});
}

function part6TableClick(kpiId, kpiName){
	jQuery.ajax({
		url: '<%=contextPath%>/ws/home/children/HomePart6!chart.action',
		type:"POST",
	    data: {
			"monthId": monthId, 
			"areaNo": areaNo,
			"kpiId": kpiId
		},
		dataType: "json",
		cache:false,
		success:function(data) {
			jQuery("#part6ChartName").html(kpiName);
			part6MapChart(data, kpiName);
			part6LineChart(data, kpiName);
		}
	});
}

function part6MapChart(data, kpiName) {
	var mapList = data.mapList;
	var top3Value = (data.top3Value * 100).toFixed(2);
	var last3Value = (data.last3Value * 100).toFixed(2);

	var jsonData = [];
	for (var i = 0; i < mapList.length; i++) {
		var subJsonData = {"name": mapList[i].AREA_DESC, "value": (mapList[i].VALUE_BH * 100).toFixed(2)};
		jsonData.push(subJsonData);
	}

	jQuery("#part6MapDiv").empty();
	jQuery("#part6MapDiv").removeAttr("_echarts_instance_");

	var installMessage = data.installMessage;

	var mapChart = echarts.init(document.getElementById('part6MapDiv'));
	var mapOption = {
			tooltip : {
				trigger: 'item'
			},
			visualMap: [
				{
					show: false,
					splitNumber: 2,
					min: parseFloat(last3Value),
					max: parseFloat(top3Value),
					minOpen: true,
					maxOpen: true,
					itemWidth: 30,
					itemHeight: 10,
					left: 0,
					bottom: 20,
					inRange: {
						color: ['#B0A2FA','#98E3FD','#FECDE6']
					},
					textStyle:{
						fontSize: 10
					}
				}
				],
			series : [
				{
					name: '变动',
					type: 'map',
					map: '河南',
					roam: false,
					left: '20%',
					label: {
					    normal: {
							show: true,
							textStyle: {
								fontSize: 10
							}
						},
						emphasis: {
							textStyle: {
								fontSize: 10
							}
						}
					},
					itemStyle: {
						normal: {
							color: '#B0AFB7'
						},
						emphasis: {
							color: "#1E81E1",
							areaColor: "#1E81E1"
						}
					},
					data: jsonData
				}
			]
		};
	mapChart.setOption(mapOption);
}

function part6LineChart(data, kpiName) {
	var line1List = data.lastYearLine;
	var line1Data = [];
	for (var i = 0; i < line1List.length; i++) {
		if (line1List[i].VALUE_L) {
			line1Data.push((line1List[i].VALUE_L * 1).toFixed(2));
		} else {
			line1Data.push('');
		}
	}
	var line2List = data.thisYearLine;
	var line2Data = [];
	for (var i = 0; i < line2List.length; i++) {
		if (line2List[i].VALUE_L) {
			line2Data.push((line2List[i].VALUE_L * 1).toFixed(2));
		} else {
			line2Data.push('');
		}
	}

	jQuery("#part6LineDiv").empty();
	jQuery("#part6LineDiv").removeAttr("_echarts_instance_");

    // 基于准备好的dom，初始化echarts实例
    var lineChart = echarts.init(document.getElementById("part6LineDiv"));
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
   		            	 if(value >= 100000000 || value <= -100000000){
   		            		valueTemp = value/100000000;
   		            		valueTemp = valueTemp + "亿";
   		            	 }else if(value >= 10000 || value <= -10000){
   		            		valueTemp = value/10000;
   		            		valueTemp = valueTemp + "万";
   		            	 }
   		            	 // return valueTemp;
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
		        	 stack: kpiName,
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
		        	 stack: kpiName,
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

part6Table();

</script>
