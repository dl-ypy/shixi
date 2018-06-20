<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <div class="container" style="width: 100%;margin-top: 10px;">
    	<div class="row" style="height: 30px;">
    		<div class="col-xs-7 col-sm-7 col-md-7">
    			<div id='tableDiv'  style='text-align:left; height:220px;'></div>
    		</div>
    		<div id='lineCharDiv' class="col-xs-5 col-sm-5 col-md-5" style='height:240px;'>
    		
    		</div>
    	</div>
    </div>
<script type="text/javascript">
	jQuery(document).ready(function() {
		getPart5RingCharData();
		getPar5RootTableData();
		// getP5LineCharData('KPI_001', '自由现金流');
		getPart5Line('KPI_001', '自由现金流');
	});
	function getPar5RootTableData() {
		jQuery.ajax({
			url: '<%=path%>/ws/home/children/HomePart5!getTableData.action',
			type:"POST",
		    data: {
				"monthId": monthId, 
				"areaNo": areaNo
			},
			cache:false,
			success:function(data) {
				jQuery('#tableDiv').html(data);
			}
		});
	}
	function getP5LineCharData(kpiId, kpiName) {
		jQuery.ajax({
			url: '<%=path%>/ws/home/children/HomePart5!getLineCharData.action',
			type:"POST",
		    data: {
				"monthId": monthId, 
				"areaNo": areaNo,
				"kpiId"	:kpiId,
				"kpiName"	:kpiName
			},
			cache:false,
			success:function(data) {
				drawP5LineChar(data);
			}
		});
	}
	function drawP5LineChar(data) {
		var lineChart = echarts.init(document.getElementById('lineCharDiv'));
		var arr = data.split('_');
		var leg = arr[1].split(',');
		var xCol = arr[2].split(',');
		var yCol1 = arr[3].split(',');
		var yCol2 = arr[4].split(',');
		
		option = {
		    title : {
		        text: arr[0] + '(万)',
		        textStyle: {
					fontWeight: 'normal',
					fontSize:12,
					color: '#666666'
				},
				y:'5'
		    },
		    color	: ['#FF0000', '#0000FF'],
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:[leg[0], leg[1]],
		         y:'bottom'
		    },

    		calculable : true,
    		grid:{x:30, y:50, x2:10, y2:50, borderWidth:0},
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : xCol
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel : {
		                formatter: '{value}'
		            }
		        }
		    ],
    series : [
        {
            name:leg[0],
            type:'line',
            data:yCol1,
            itemStyle:{
	          	normal:{
	            	 lineStyle:{
	                 	width:1,
	                 	type:'dotted'
	                 }
	            }
            }
        },
        {
            name:leg[1],
            type:'line',
            data:yCol2,
            itemStyle:{
	          	normal:{
	            	 lineStyle:{
	                 	width:1
	                 	
	                 }
	            }
            }
        }
    ]
};
                    
		
		
		lineChart.setOption(option, true);
	}
	function getPart5RingCharData() {
		jQuery.ajax({
			url: '<%=path%>/ws/home/children/HomePart5!getRingCharData.action',
			type:"POST",
		    data: {
				"monthId": monthId, 
				"areaNo": areaNo
			},
			cache:false,
			success:function(data) {
				ringChar(data);
			}
		});
	}
	function ringChar(data){
		jQuery("#ringCharDiv").empty();
		jQuery("#ringCharDiv").removeAttr("_echarts_instance_");
		var ringChart = echarts.init(document.getElementById('ringCharDiv'));
		var arr = data.split(',');
		jQuery('#tarValue').html(arr[1]);

		var option = {
			tooltip : {
				formatter: "{a} <br/>{b} : {c}%"
			},
		    series: [
		        {
		            name: '',
		            type: 'gauge',
		            radius : 90,
		            axisLine: {
		                lineStyle: {
		                    color: [[arr[0], '#ED7D31'],[1, '#bfbfbf']],
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
		            data: [{value: arr[3], name: arr[2]}]
		        }
		    ]
		};
    	ringChart.setOption(option, true);
    }
	
	function getPart5Line(kpiId, kpiName) {
		jQuery.ajax({
			url: '<%=path%>/ws/home/children/HomePart5!lineChart.action',
			type:"POST",
		    data: {
				"monthId": monthId, 
				"areaNo": areaNo,
				"kpiId"	:kpiId,
				"kpiName":kpiName
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				part5LineChart(data, kpiName);
			}
		});
	}

	function part5LineChart(data, kpiName) {
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

		jQuery("#lineCharDiv").empty();
		jQuery("#lineCharDiv").removeAttr("_echarts_instance_");

	    // 基于准备好的dom，初始化echarts实例
	    var lineChart = echarts.init(document.getElementById("lineCharDiv"));
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
			    	type : 'category',
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
</script>
