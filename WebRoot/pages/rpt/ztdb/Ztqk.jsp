<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>整体情况</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	
	<link rel="stylesheet" type="text/css" href="../../resources/css/bootstrap/3.3.6/bootstrap.min.css" media="screen">
	<link rel="stylesheet" type="text/css" href="../../resources/frame/jedate-6.0.2/skin/jedate.css">
	<link href="<s:url value="/struts/pure/css/grey.css?ver=1.5.1-SNAPSHOT"/>" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="../../resources/js/jquery/1.12.0/jquery.min.js"></script>
    <script type="text/javascript" src="../../resources/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../resources/frame/jedate-6.0.2/jquery.jedate.min.js"></script>
    <script type="text/javascript" src="../../resources/frame/echarts-3.8.4/echarts.min.js"></script>
    <script type="text/javascript" src="../../resources/frame/echarts-3.8.4/map/henan.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
    html,body{
       width: 100%;
       text-align: center;
    }
</style>
<script type="text/javascript">
    function initRingChart(){
    	var areaNo = jQuery("#areaNo").val();
    	var monthId = jQuery("#monthId").val();
    	
		jQuery.ajax({
			url: '<%=path%>/rpt/ztdb/Ztqk!initRingChart.action',
			type:"POST",
		    data: {
				"monthId": monthId, 
				"areaNo": areaNo
			},
			cache:false,
			success:function(data) {
				jQuery("#lrWcqkRing").height(280);
		 	    jQuery("#lrWcqkRing").empty();
		 		jQuery("#lrWcqkRing").removeAttr("_echarts_instance_");
				var ringChart = echarts.init(document.getElementById("lrWcqkRing"));
				var arr = data.split(',');
				option = {
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
				                    color: [[arr[1], '#ED7D31'],[1, '#bfbfbf']],
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
				            data: [{value: arr[2], name: arr[0]}]
				        }
				    ]
				};
		    	ringChart.setOption(option, true);
			}
		});
    }

    function initStackChart(dataJSON,divId){
    	var myChart = echarts.init(document.getElementById(divId));
    	var option = {
    		    tooltip : {
    		        trigger: 'axis',
    		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
    		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
    		        },
    		        formatter: function (params) {
    		            var tar;
    		            if (params[1].value != '-') {
    		                tar = params[1];
    		            }
    		            else {
    		                tar = params[2];
    		            }
    		            return tar.name + '<br/>' + tar.value;
    		        }
    		    },
    		    grid: {
    		        left: '3%',
    		        right: '4%',
    		        bottom: '3%',
    		        containLabel: true
    		    },
    		    xAxis: {
    		        type : 'category',
    		        splitLine: {show:false},
    		        axisLabel:{
    		        	interval:0,
    		        	formatter:function(params) {
 	                        var newParamsName = "";
 	                        var paramsNameNumber = params.length;
 	                        var provideNumber = 4;  //一行显示几个字
 	                        var rowNumber = Math.ceil(paramsNameNumber / provideNumber);
 	                        if (paramsNameNumber > provideNumber) {
 	                            for (var p = 0; p < rowNumber; p++) {
 	                                var tempStr = "";
 	                                var start = p * provideNumber;
 	                                var end = start + provideNumber;
 	                                if (p == rowNumber - 1) {
 	                                    tempStr = params.substring(start, paramsNameNumber);
 	                                } else {
 	                                    tempStr = params.substring(start, end) + "\n";
 	                                }
 	                                newParamsName += tempStr;
 	                            }

 	                        } else {
 	                            newParamsName = params;
 	                        }
 	                        return newParamsName
 	                    }
    		        },
    		        data : dataJSON["xAxis"]
    		    },
    		    yAxis: {
    		        type : 'value'
    		    },
    		    series: [
    		        {
    		            name: '辅助',
    		            type: 'bar',
    		            stack: '总量',
    		            itemStyle: {
    		                normal: {
    		                    barBorderColor: 'rgba(0,0,0,0)',
    		                    color: 'rgba(0,0,0,0)'
    		                },
    		                emphasis: {
    		                    barBorderColor: 'rgba(0,0,0,0)',
    		                    color: 'rgba(0,0,0,0)'
    		                }
    		            },
    		            barWidth:'40%',
    		            data: dataJSON["baseStack"]
    		        },
    		        {
    		            name: '收入',
    		            type: 'bar',
    		            stack: '总量',
    		            label: {
    		                normal: {
    		                    show: true,
    		                    position: 'top',
    		                    formatter:function(params) {
    		                    	var newValue = params.value;
    		                    	newValue = Math.abs(newValue);
    		                    	return newValue;
    		                    }
    		                }
    		            },
    		            barWidth:'40%',
    		            itemStyle:{
    		                normal:{
    		                    color:'#ED7D31'
    		                }
    		            },
    		            data: dataJSON["barOne"]
    		        },
    		        {
    		            name: '支出',
    		            type: 'bar',
    		            stack: '总量',
    		            label: {
    		                normal: {
    		                    show: true,
    		                    position: 'top',
    		                    formatter:function(params) {
    		                    	var newValue = params.value;
    		                    	newValue = Math.abs(newValue);
    		                    	return newValue;
    		                    }
    		                }
    		            },
    		            barWidth:'40%',
    		            itemStyle:{
    		                normal:{
    		                    color:'#70AD47'
    		                }
    		            },
    		            data: dataJSON["barTwo"]
    		        }
    		    ]
    		};
    	myChart.setOption(option);
    }
    
    function loadNowYearStackChart(){
    	var areaNo = jQuery("#areaNo").val();
    	var monthId = jQuery("#monthId").val();
    	var parmater = {
    			"areaNo":areaNo,
 				"monthId":monthId
    	};
    	var url = '<%=basePath%>/rpt/ztdb/Ztqk!initNowStackChart.action';
    	jQuery.ajax({
	 	       url: url,
	 	       type: "post",
	 	       data: parmater,
	 	       dataType: "html",
	 	       success: function(data){
	 	    	    var divId = "nowYearStackChart";
	 	    	    var dataJSON = null;
	 	    	    jQuery("#"+divId).height(230);
	 	    	    jQuery("#" + divId).empty();
	 	    		jQuery("#" + divId).removeAttr("_echarts_instance_");
	 	    	    if(data != ""){
		 	    		dataJSON = eval("("+data+")");
	 	    	    }
	 	    	    initStackChart(dataJSON,divId);
	 	       }
    	});
    }
    
    function loadNowYearTable(){
    	var areaNo = jQuery("#areaNo").val();
    	var monthId = jQuery("#monthId").val();
    	var parmater = {
    			"areaNo":areaNo,
 				"monthId":monthId
    	};
    	var url = '<%=basePath%>/rpt/ztdb/Ztqk!initNowTable.action';
    	jQuery("#nowYearTable").load(url,parmater);
    }
    
    function loadLastYearStackChart(){
    	var areaNo = jQuery("#areaNo").val();
    	var monthId = jQuery("#monthId").val();
    	var parmater = {
    			"areaNo":areaNo,
 				"monthId":monthId
    	};
    	var url = '<%=basePath%>/rpt/ztdb/Ztqk!initLastStackChart.action';
    	jQuery.ajax({
	 	       url: url,
	 	       type: "post",
	 	       data: parmater,
	 	       dataType: "html",
	 	       success: function(data){
	 	    	    var divId = "lastYearStackChart";
	 	    	    var dataJSON = null;
	 	    	    jQuery("#"+divId).height(230);
	 	    	    jQuery("#" + divId).empty();
	 	    		jQuery("#" + divId).removeAttr("_echarts_instance_");
	 	    	    if(data != ""){
		 	    		dataJSON = eval("("+data+")");
	 	    	    }
	 	    	    initStackChart(dataJSON,divId);
	 	       }
    	});
    }
    
    function loadLastYearTable(){
    	var areaNo = jQuery("#areaNo").val();
    	var monthId = jQuery("#monthId").val();
    	var parmater = {
    			"areaNo":areaNo,
 				"monthId":monthId
    	};
    	var url = '<%=basePath%>/rpt/ztdb/Ztqk!initLastTable.action';
    	jQuery("#lastYearTable").load(url,parmater);
    }

	function searchItem(){
		areaNo = jQuery("#areaNo").val();
		monthId = jQuery("#monthId").val();
		initRingChart();
    	loadNowYearStackChart();
    	loadNowYearTable();
    	loadLastYearStackChart();
    	loadLastYearTable();
	}
	jQuery(document).ready(function(){
    	areaNo = jQuery("#areaNo").val();
    	monthId = jQuery("#monthId").val();
    	
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });
    	
    	initRingChart();
    	loadNowYearStackChart();
    	loadNowYearTable();
    	loadLastYearStackChart();
    	loadLastYearTable();
    });
</script>
  </head>
  
  <body>
    <div class="container" style="width: 98%;margin-top: 5px;height: 0px;">
        <div class="row" style="height: 0px;">
		  <div class="col-xs-6 col-sm-6 col-md-6"></div>
		  <div class="col-xs-6 col-sm-6 col-md-6" > 
		      <form class="form-inline"  style="margin: 0px;">
		         <div class="form-group">
		             <label for="areaNo">地域</label>
                     <s:select id="areaNo" cssClass="form-control" list="list" listKey="ORG_ID" listValue="ORG_NAME" cssStyle="width: 66px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
		         </div>
		         <div class="form-group">
		             <label for="monthId">时间</label>
                     <input type="text" class="form-control workinput" id="monthId" value="${monthId}" style="width: 70px;height: 25px;font-size: 12px;padding: 0px;">
		         </div>
		         <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="searchItem()">查询</button>
		      </form>
		  </div>
		</div>
	 </div>
	 <div class="container" style="width: 98%;">
	    <div class="row">
	       <div class="col-xs-12 col-sm-12 col-md-12" style="border-bottom: 1px solid red;text-align: left;padding-left: 20px;font-weight: bold;">
	          <span>预算完成影响因素分析</span>
	       </div>
	    </div>
	    <div class="row">
	       <div class="col-xs-3 col-sm-3 col-md-3">
	           <div style="text-align: left;font-size: 12px;font-weight: bold;margin-top: 10px;">
	               <span>利润预算完成情况</span>
	           </div>
	           <div id="lrWcqkRing"></div>
	       </div>
	       <div class="col-xs-9 col-sm-9 col-md-9" style="text-align: center;">
	           <div id="nowYearStackChart" style="margin: auto;"></div>
	           <div id="nowYearTable" style="margin: auto;text-align: left;">
	           </div>
	       </div>
	    </div>
	    <!-- 没有数据，页面暂时隐藏
	    <div class="row" style="margin-top: 10px;">
	       <div class="col-xs-12 col-sm-12 col-md-12" style="border-top: 1px solid red;border-bottom: 1px solid red;text-align: left;padding-left: 20px;font-weight: bold;">
	          <span>利润同比变化影响因素分析</span>
	       </div>
	    </div>
	    <div class="row">
	        <div class="col-xs-12 col-sm-12 col-md-12">
	            <div id="lastYearStackChart" ></div>
	            <div id="lastYearTable" style="margin: auto;text-align: left;">
	            </div>
	        </div>
	    </div>
	    <div class="row" style="height: 30px;">
	        <div class="col-xs-12 col-sm-12 col-md-12">
	        </div>
	    </div>
	     -->
	 </div>
  </body>
</html>
