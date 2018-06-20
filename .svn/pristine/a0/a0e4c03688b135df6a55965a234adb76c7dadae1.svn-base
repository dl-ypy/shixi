<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String contextPath = request.getContextPath();
%>
<script type="text/javascript">
var monthId;
var areaNo;
	jQuery(document).ready(function() {
		monthId="${monthId}";
		areaNo="${areaNo}";
		var data = ${test};
		var level = "${level}";
		if (areaNo == 'root') {
			jQuery("#KPI").html("全省");
			jQuery("#kpi1").html("全省");
		} else if (level == '2') {
			jQuery("#KPI").html("全市 ");
			jQuery("#kpi1").html("全市 ");

		} else {
			jQuery("#KPI").html("全区县 ");
			jQuery("#kpi1").html("全区县 ");
		}
		if (data.length > 0) {
			for (var i = 0; i < data.length; i++) {
				jQuery("#KPI_01").html(data[i].KPI_01);
				jQuery("#KPI_02").html(data[i].KPI_02);
				jQuery("#KPI_03_1").html(data[i].KPI_03_1);
				jQuery("#KPI_03_2").html(data[i].KPI_03_2);
				jQuery("#KPI_03_3").html(data[i].KPI_03_3);
				jQuery("#KPI_04").html(data[i].KPI_04);
				jQuery("#KPI_05").html(data[i].KPI_05);
				jQuery("#KPI_06").html(data[i].KPI_06);
				jQuery("#KPI_07_1").html(data[i].KPI_07_1);
				jQuery("#KPI_07_2").html(data[i].KPI_07_2);
				jQuery("#KPI_07_3").html(data[i].KPI_07_3);
				jQuery("#KPI_08_1").html(data[i].KPI_08_1);
				jQuery("#KPI_08_2").html(data[i].KPI_08_2);
				jQuery("#KPI_08_3").html(data[i].KPI_08_3);
				jQuery("#KPI_09").html(data[i].KPI_09);
				jQuery("#KPI_10").html(data[i].KPI_10);
				jQuery("#KPI_11_1").html(data[i].KPI_11_1);
				jQuery("#KPI_11_2").html(data[i].KPI_11_2);
				jQuery("#KPI_11_3").html(data[i].KPI_11_3);
			}
		}
		part1TableClick("KPI_01","营业收款占收比");
	});
	
	function part1TableClick(kpiId, kpiName){
		jQuery.ajax({
			url: '<%=contextPath%>/rpt/xjlts/xjlOverview/Overview!getMapMap.action',
			type:"POST",
		    data: {
				"monthId": monthId, 
				"areaNo": areaNo,
				"kpiCode": kpiId
			},
			dataType: "json",
			cache:false,
			success:function(data) {
				jQuery("#kpiname").html(kpiName);
				MapChart(data, kpiId,kpiName);
			}
		});
	}
	function MapChart(data,kpiId,kpiName) {
		var mapList = data.mapList;
		var jsonData = [];
		if(kpiId=='KPI_01'){
			for (var i = 0; i < mapList.length; i++) {
				var subJsonData = {"name": mapList[i].ORG_NAME, "value": mapList[i].KPI_01};
				jsonData.push(subJsonData);
			}
		}else if(kpiId=='KPI_04'){
			for (var i = 0; i < mapList.length; i++) {
				var subJsonData = {"name": mapList[i].ORG_NAME, "value": mapList[i].KPI_04};
				jsonData.push(subJsonData);
			}
		}else{
			for (var i = 0; i < mapList.length; i++) {
				var subJsonData = {"name": mapList[i].ORG_NAME, "value": mapList[i].KPI_09};
				jsonData.push(subJsonData);
			}
		}
		jQuery("#mapDiv").empty();
		jQuery("#mapDiv").removeAttr("_echarts_instance_");
		var mapChart = echarts.init(document.getElementById('mapDiv'));
		var mapOption = {
				tooltip : {
					trigger: 'item'
				},
				visualMap: [
					{
						show: false,
						splitNumber: 2,
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

</script>
<div class="row">
	<div class="col-xs-5 col-sm-5 col-md-5">
		<span style="float: left; color: red; margin-left: 30px;" id="kpiname"></span>
		<div id= "mapDiv" style="height:300px;"></div>
	</div>
	<div class="col-xs-7 col-sm-7 col-md-7"  style="margin-top:3%;">
		<table>
			<thead>
				<tr style="color: red; font-size: 14px;">
					<th>预警：</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div id="province1" style="float: left; margin-top: 10px;font-size: 14px;">
							1.<span id="KPI"></span>营业收款占收比为：<a href="###" Onclick="part1TableClick('KPI_01','营业收款占收比')"><span
								id="KPI_01"></span>%</a>，其中前三是：<span
								id="KPI_02"></span>，分别占收比：<span id="KPI_03_1"></span>% 、<span
								id="KPI_03_2"></span>%和<span id="KPI_03_3"></span>%。
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="province2" style="float: left; margin-top: 10px;font-size: 14px;">
							2.<span id="kpi1"></span>营业欠款超限额营业厅合计：<a href="###" Onclick="part1TableClick('KPI_04','营业欠款超限营业厅数')"><span
								id="KPI_04"></span></a>个，超限<span id="KPI_05"></span>万元；其中前三是：<span
								id="KPI_06"></span>，<br> &nbsp; &nbsp; 分别是：<span
								id="KPI_07_1"></span>、<span id="KPI_07_2"></span>和<span
								id="KPI_07_3"></span>个，金额分别为：<span id="KPI_08_1"></span> 万元、<span
								id="KPI_08_2"></span>万元和<span id="KPI_08_3"></span>万元。
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="province3" style="float: left; margin-top: 10px;font-size: 14px;">
							3.营业欠款变动绝对值超5%营业厅合计：<a href="###" Onclick="part1TableClick('KPI_09','营业欠款变动绝对值超5%营业厅数')"><span
								id="KPI_09"></span></a>个，其中前三为：<span id="KPI_10"></span>，分别为： <span
								id="KPI_11_1"></span>、<span id="KPI_11_2"></span>和<span
								id="KPI_11_3"></span>个。
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>