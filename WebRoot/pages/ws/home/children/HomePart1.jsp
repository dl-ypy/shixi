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
    .part1TopText{
    	color: red;
    }
    .part1LastText{
    	color: green;
    }
</style>
<div class="row">
	<!-- 
	<div class="col-xs-12 col-sm-12 col-md-12" style="text-align: left; font-weight: bold;">财务运营概况：</div>
	 -->
	<div class="col-xs-12 col-sm-12 col-md-12" id="part1TextDiv" style="text-align: left;">
	&nbsp;&nbsp;&nbsp;&nbsp;①主营业务收入（含2I2C）累计完成<span id="part1Text1" class="part1Text">--</span>万元，
	同比增长<span id="part1Text2" class="part1Text">--</span>万元，
	增幅<span id="part1Text3" class="part1Text">--</span>%
	<!-- 
	（前三<span id="part1Text4" class="part1TopText">×、×、×</span>，后三<span id="part1Text5" class="part1LastText">×、×、×</span>）
	 -->
	，
	<s:if test="areaNo == 'root'">居北十</s:if>第<span id="part1Text6" class="part1Text">--</span>位，
	序时预算目标完成比例<span id="part1Text7" class="part1Text">--</span>%
	<!-- 
	（前三<span id="part1Text8" class="part1TopText">×、×、×</span>，后三<span id="part1Text9" class="part1LastText">×、×、×</span>）
	 -->
	，
	<s:if test="areaNo == 'root'">居北十</s:if>第<span id="part1Text10" class="part1Text">--</span>位；<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;②利润总额累计完成<span id="part1Text11" class="part1Text">--</span>万元，
	同比增长<span id="part1Text12" class="part1Text">--</span>万元，
	序时预算目标完成比例<span id="part1Text13" class="part1Text">--</span>%
	<!-- 
	（前三<span id="part1Text14" class="part1TopText">×、×、×</span>，后三<span id="part1Text15" class="part1LastText">×、×、×</span>）
	 -->
	，
	<s:if test="areaNo == 'root'">居北十</s:if>第<span id="part1Text16" class="part1Text">--</span>位；<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;③现金收入比<span id="part1Text17" class="part1Text">--</span>%
	<!-- 
	（前三<span id="part1Text18" class="part1TopText">×、×、×</span>，后三<span id="part1Text19" class="part1LastText">×、×、×</span>）
	 -->
	，
	<s:if test="areaNo == 'root'">居北十</s:if>第<span id="part1Text20" class="part1Text">--</span>位，
	较预算目标高<span id="part1Text21" class="part1Text">--</span>pp；<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;④收入利润率<span id="part1Text22" class="part1Text">--</span>%
	<!-- 
	（前三<span id="part1Text23" class="part1TopText">×、×、×</span>，后三<span id="part1Text24" class="part1LastText">×、×、×</span>）
	 -->
	，
	<s:if test="areaNo == 'root'">居北十</s:if>第<span id="part1Text25" class="part1Text">--</span>位，
	同比提升<span id="part1Text26" class="part1Text">--</span>pp
	<!-- 
	（前三<span id="part1Text27" class="part1Text">×、×、×</span>，后三<span id="part1Text28" class="part1LastText">×、×、×</span>）
	 -->
	，
	<s:if test="areaNo == 'root'">居北十</s:if>第<span id="part1Text29" class="part1Text">--</span>位；<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;⑤自由现金流完成<span id="part1Text30" class="part1Text">--</span>万元，
	同比增幅<span id="part1Text31" class="part1Text">--</span>%
	<!-- 
	（前三<span id="part1Text32" class="part1TopText">×、×、×</span>，后三<span id="part1Text33" class="part1LastText">×、×、×</span>）
	 -->
	，
	<s:if test="areaNo == 'root'">居北十</s:if>第<span id="part1Text34" class="part1Text">--</span>位。
	</div>
</div>
<div class="row">
	<div class="col-xs-5 col-sm-5 col-md-5" id="part1TableDiv"></div>
	<div class="col-xs-4 col-sm-4 col-md-4" style="padding: 0px">
		<div id="part1ChartName" style="text-align: right; font-weight: bold;"></div>
		<div id="part1MapDiv" style="height: 330px;"></div>
		<div style="position:absolute; top: 270px; left: 10px">
			<table>
				<tr>
					<td><div style="width: 20px; height: 10px; background-color: #FECDE6"></div></td>
					<td><div style="font-size: 11px">&nbsp;&nbsp;<span class="part1MapType">增幅</span>前三：<span style="font-size: 11px" id="part1MapTop3Span"></span></div></td>
				</tr>
				<tr>
					<td><div style="width: 20px; height: 10px; background-color: #B0A2FA"></div></td>
					<td><div style="font-size: 11px">&nbsp;&nbsp;<span class="part1MapType">增幅</span>后三：<span style="font-size: 11px" id="part1MapLast3Span"></span></div></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="col-xs-3 col-sm-3 col-md-3" style="padding: 0px;">
		<div style="height: 50px"></div>
		<div id="part1LineDiv" style="height: 300px"></div>
	</div>
</div>

<script type="text/javascript">
function part1Text(){
	jQuery.ajax({
		url: '<%=contextPath%>/ws/home/children/HomePart1!text.action',
		type:"POST",
	    data: {
			"monthId": monthId, 
			"areaNo": areaNo
		},
		dataType: "json",
		cache:false,
		success:function(data) {
			jQuery("#part1Text1").html((data.KPI_01 * 1).toFixed(0));
			jQuery("#part1Text2").html((data.KPI_02 * 1).toFixed(0));
			jQuery("#part1Text3").html((data.KPI_03 * 100).toFixed(2));
			jQuery("#part1Text4").html(data.KPI_04);
			jQuery("#part1Text5").html(data.KPI_05);
			jQuery("#part1Text6").html((data.KPI_06 * 1).toFixed(0));
			jQuery("#part1Text7").html((data.KPI_07 * 100).toFixed(2));
			jQuery("#part1Text8").html(data.KPI_08);
			jQuery("#part1Text9").html(data.KPI_09);
			jQuery("#part1Text10").html((data.KPI_10 * 1).toFixed(0));
			jQuery("#part1Text11").html((data.KPI_11 * 1).toFixed(0));
			jQuery("#part1Text12").html((data.KPI_12 * 1).toFixed(0));
			jQuery("#part1Text13").html((data.KPI_13 * 100).toFixed(2));
			jQuery("#part1Text14").html(data.KPI_14);
			jQuery("#part1Text15").html(data.KPI_15);
			jQuery("#part1Text16").html((data.KPI_16 * 1).toFixed(0));
			jQuery("#part1Text17").html((data.KPI_17 * 100).toFixed(2));
			jQuery("#part1Text18").html(data.KPI_18);
			jQuery("#part1Text19").html(data.KPI_19);
			jQuery("#part1Text20").html((data.KPI_20 * 1).toFixed(0));
			jQuery("#part1Text21").html((data.KPI_21 * 100).toFixed(2));
			jQuery("#part1Text22").html((data.KPI_22 * 100).toFixed(2));
			jQuery("#part1Text23").html(data.KPI_23);
			jQuery("#part1Text24").html(data.KPI_24);
			jQuery("#part1Text25").html((data.KPI_25 * 1).toFixed(0));
			jQuery("#part1Text26").html((data.KPI_26 * 100).toFixed(2));
			jQuery("#part1Text27").html(data.KPI_27);
			jQuery("#part1Text28").html(data.KPI_28);
			jQuery("#part1Text29").html((data.KPI_29 * 1).toFixed(0));
			jQuery("#part1Text30").html((data.KPI_30 * 1).toFixed(0));
			jQuery("#part1Text31").html((data.KPI_31 * 100).toFixed(2));
			jQuery("#part1Text32").html(data.KPI_32);
			jQuery("#part1Text33").html(data.KPI_33);
			jQuery("#part1Text34").html((data.KPI_34 * 1).toFixed(0));
		}
	});
}

function part1Table(){
	jQuery.ajax({
		url: '<%=contextPath%>/ws/home/children/HomePart1!table.action',
		type:"POST",
	    data: {
			"monthId": monthId, 
			"areaNo": areaNo
		},
		cache:false,
		success:function(html) {
			jQuery("#part1TableDiv").html(html);
			part1TableClick("KPI_012", "收入利润率");
		}
	});
}

function part1TableClick(kpiId, kpiName){
	jQuery.ajax({
		url: '<%=contextPath%>/ws/home/children/HomePart1!chart.action',
		type:"POST",
	    data: {
			"monthId": monthId, 
			"areaNo": areaNo,
			"kpiId": kpiId
		},
		dataType: "json",
		cache:false,
		success:function(data) {
			jQuery("#part1ChartName").html(kpiName);
			if (kpiId == "KPI_013") {
				jQuery(".part1MapType").html('本年累计');
			} else {
				jQuery(".part1MapType").html('增幅');
			}
			jQuery("#part1MapTop3Span").html(data.top3Area);
			jQuery("#part1MapLast3Span").html(data.last3Area);
			part1MapChart(data, kpiName);
			part1LineChart(data, kpiName);
		}
	});
}

function part1MapChart(data, kpiName) {
	var mapList = data.mapList;
	var top3Value = (data.top3Value * 100).toFixed(2);
	var last3Value = (data.last3Value * 100).toFixed(2);

	// alert(top3Value);
	// alert(last3Value);

	var jsonData = [];
	for (var i = 0; i < mapList.length; i++) {
		var subJsonData = {"name": mapList[i].AREA_DESC, "value": (mapList[i].VALUE_L_ZF * 100).toFixed(2)};
		jsonData.push(subJsonData);
	}

	jQuery("#part1MapDiv").empty();
	jQuery("#part1MapDiv").removeAttr("_echarts_instance_");

	var installMessage = data.installMessage;

	var mapChart = echarts.init(document.getElementById('part1MapDiv'));
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
					name: kpiName,
					type: 'map',
					map: '河南',
					roam: false,
					left: '20%',
					top:'3%',
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

function part1LineChart(data, kpiName) {
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

	jQuery("#part1LineDiv").empty();
	jQuery("#part1LineDiv").removeAttr("_echarts_instance_");

    // 基于准备好的dom，初始化echarts实例
    var lineChart = echarts.init(document.getElementById("part1LineDiv"));
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

part1Text();
part1Table();

</script>
