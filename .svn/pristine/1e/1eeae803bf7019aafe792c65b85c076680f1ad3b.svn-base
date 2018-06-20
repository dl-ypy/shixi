<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
String contextPath = request.getContextPath();
%>
<div class="row">
	<div class="col-xs-6 col-sm-6 col-md-6" id="part8TableDiv">
	</div>
	<div class="col-xs-2 col-sm-2 col-md-2" id="part8PieDiv" style="height: 200px;padding: 0px;">饼图</div>
	<div class="col-xs-2 col-sm-2 col-md-2" id="part8Line1Div" style="height: 200px;padding: 0px;">线图1</div>
	<div class="col-xs-2 col-sm-2 col-md-2" id="part8Line2Div" style="height: 200px;padding: 0px;">线图2</div>
</div>
<script type="text/javascript">
function part8Table() {
	jQuery.ajax({
		url: '<%=contextPath%>/ws/home/children/HomePart8!table.action',
		type:"POST",
	    data: {
			"monthId": monthId, 
			"areaNo": areaNo
		},
		cache:false,
		success:function(html) {
			jQuery("#part8TableDiv").html(html);
			//part1TableClick("KPI_012", "收入利润率");
		}
	});
}

function part8Pie() {
	part8PieChart('3', "资产负债率");
}

function part8Line1() {
	part8Chart('1','ROE(净资产回报率)');
}

function part8Line2() {
	part8Chart('2','总资产周转率');
}

function part8Chart(kpiId,kpiName) {
	jQuery.ajax({
		url: '<%=contextPath%>/ws/home/children/HomePart8!chart.action',
		type:"POST",
	    data: {
			"monthId": monthId, 
			"areaNo": areaNo,
			"kpiId":kpiId
		},
		dataType: "json",
		cache:false,
		success:function(data) {
			var line1List = data.lastYearLine;
			var line1Data = [];
			for (var i = 0; i < line1List.length; i++) {
				if (line1List[i].THIS_VALUE) {
					line1Data.push(line1List[i].THIS_VALUE);
				} else {
					line1Data.push('-');
				}
			}
			var line2List = data.thisYearLine;
			var line2Data = [];
			for (var i = 0; i < line2List.length; i++) {
				if (line2List[i].THIS_VALUE) {
					line2Data.push(line2List[i].THIS_VALUE);
				} else {
					line2Data.push('-');
				}
			}
			if(kpiId=='1'){
				part8ChartDraw('part8Line1Div', kpiName, line1Data, line2Data);
			}else{
				part8ChartDraw('part8Line2Div', kpiName, line1Data, line2Data);
			}
		}
	});
}

function part8ChartDraw(chartDivId, chartName, line1Data, line2Data) {
	jQuery("#" + chartDivId).empty();
	jQuery("#" + chartDivId).removeAttr("_echarts_instance_");

    // 基于准备好的dom，初始化echarts实例
    var lineChart = echarts.init(document.getElementById(chartDivId));
    lineChart.showLoading({text: '正在努力加载中...'});
    // 指定图表的配置项和数据
	var lineChartOption = {
			title: {
				text:chartName,
				x: "center", //标题水平方向位置
		        show: true,
		        textStyle: {
    				fontSize:12
    			}
		    },
		    tooltip: {
		        trigger: 'axis',
		        formatter: "{b}月<br />{a0}:{c0}<br />{a1}:{c1}"
		    },
		    legend: {
		        show: false,
		        data: ['去年', '今年']
		    },
		    grid: {
		        left: '5%',
		        right: '5%',
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
		    	show : false,
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
   		            	// return valueTemp;
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

function part8PieChart(kpiId,kpiName) {
	jQuery.ajax({
		url: '<%=contextPath%>/ws/home/children/HomePart8!piechart.action',
		type:"POST",
	    data: {
			"monthId": monthId, 
			"areaNo": areaNo,
			"kpiId":kpiId
		},
		dataType: "json",
		cache:false,
		success:function(data) {
			// console.info(data);
			part8RingChar(data);
		}
	});
}

function part8RingChar(data){
	var ringChart = echarts.init(document.getElementById('part8PieDiv'));	
	option = {
		tooltip : {
			formatter: "{a} <br/>{b} : {c}%"
		},
	    series: [
	        {
	            name: '',
	            type: 'gauge',
	            radius : 80,
	            axisLine: {
	                lineStyle: {
	                    color:[['0.68', '#ED7D31'],[1, '#bfbfbf']],
	                    width: 17
	                }
	            },
	            detail: {
	                formatter:'{value}%',
	                offsetCenter: [0, '-10%'],       // x, y，单位px
	            },
	            axisTick: {            // 坐标轴小标记
	                splitNumber: 0,   // 每份split细分多少段
	                length :44        // 属性length控制线长
	            },
	            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
	             
	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    color: '#fff',
	                    fontSize: 12
	                }
	            },
	             pointer : {
	                length : 0,
	                width :0,
	                color : 'auto'
	            },
	            title : {
	                show : true,
	                offsetCenter: [0, '60%'],       // x, y，单位px
	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    color: '#0f0f0f',
	                    fontSize: 16
	                }
	            },
	            data: [{value:data.FZL, name: '资产负债率'}]
	        }
	    ]
	};
	ringChart.setOption(option, true);
}

jQuery(document).ready(function(){
	part8Table();
	part8Pie();
	part8Line1();
	part8Line2();
});
</script>
