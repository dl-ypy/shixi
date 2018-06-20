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
    
    <title>省内对标</title>
    
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
    <script type="text/javascript" src="../../resources/frame/DrillTable/DrillTable.js"></script>
<style type="text/css">
    html,body{
       width: 100%;
       text-align: center;
    }
</style>
<script type="text/javascript">
var projectPath = "<%=basePath%>";

function initDfLineChar(dataJSON,divId,title){
	var myChart = echarts.init(document.getElementById(divId));
	var option = {
			tooltip:{
			    trigger: 'axis',
			    formatter: "{b}月<br />{a0}:{c0}<br />"
			},
			title:{
				   text : title,
				      x : 'center',
				    textStyle:{
				          fontSize:12
				       }
				    },
			grid :{
				left: 50,
				top :30,
				right:20,
				borderWidth: 0
			},
			legend:{
			           x:'center',
			        y:'bottom',
			        textStyle:{
			            fontSize:10
			              },
			     data:dataJSON["legendData"]
			     },
			calculable : true,
			xAxis:[{
			    type : 'category',
			splitLine:{
			     　　　　show:false
			     　　},
			boundaryGap : false,
			 axisLine:{
				 lineStyle:{
					     type:'solid',
					    color:'#CCCCCC'
				 }
			 },
			 axisTick:{
				 lineStyle:{
						    type:'solid',
						    color:'#CCCCCC'
					    }
			 },
			axisLabel:{
			         interval:0,
			        textStyle:{
			       	      color:'#848684',
			           fontSize:10
			        }
			   },
			    data : dataJSON["axisData"]
			}],
			yAxis : [{type : 'value',
			  axisLine:{
			 	 lineStyle:{
			 		     type:'solid',
			 		    width:0.5,
			 		    color:'#9F9F9F'
			 	 }
			  },
			  axisTick:{
			 	 lineStyle:{
						    type:'solid',
						   width:0.5,
						    color:'#9F9F9F'
					    }
			  },
			  axisLabel:{
			        textStyle:{
			       	      color:'#9F9F9F',
			           fontSize:10
			        }
			     },
				splitLine:{
			　　　　                  show:true,
			　　　　           lineStyle:{
						    type:'dotted',
						    color:'#B3B3B3'
					    }
			　　              }
			  }],
			series : dataJSON["seriesData"]
	};
	myChart.setOption(option);
}


function initRingDChar(dataJSON,divId){
	var myChart = echarts.init(document.getElementById(divId));
	var option = {
		   // backgroundColor: '#1b1b1b',
		    tooltip : {
		        formatter: "{a} : {c}"
		    },
		    series : [
		        {
		            name:dataJSON["areaDesc"],
		            type:'gauge',
		            min:0,
		            max:dataJSON["MaxF"],
		            //splitNumber:10,
		            radius: '100%',
		            axisLine: {            // 坐标轴线
		                lineStyle: {       // 属性lineStyle控制线条样式
		                    color: [[0.15, 'lime'],[dataJSON["splitNum"], '#1e90ff'],[1, '#ff4500']],
		                    width: 2,
		                    shadowColor : '#fff', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            axisLabel: {            // 坐标轴小标记
		                textStyle: {       // 属性lineStyle控制线条样式
		                    fontWeight: 'bolder',
		                    color: 'auto',
		                    shadowColor : 'auto', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            axisTick: {            // 坐标轴小标记
		                lineStyle: {       // 属性lineStyle控制线条样式
		                    color: 'auto',
		                    shadowColor : '#fff', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            splitLine: {           // 分隔线
		                length :10,         // 属性length控制线长
		                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
		                    width:2,
		                    color: 'auto',
		                    shadowColor : '#fff', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            pointer: {           // 分隔线
		                width:3
		            },
		            detail : {
		                offsetCenter: [0, '30%'],       // x, y，单位px
		                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    fontWeight: 'bolder',
		                    color: '#FF0000'
		                }
		            },
		            title : {
		                show : true,
		                offsetCenter: [0, '70%'],       // x, y，单位px
		                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    color: '#0f0f0f',
		                    fontSize: 18
		                }
		            },
		            data:[{value: dataJSON["deFen"], name: dataJSON["paiMing"]}]
		        }
		    ]
		};
	myChart.setOption(option);
}

function initRingSChar(dataJSON,divId){
	var myChart = echarts.init(document.getElementById(divId));
	var option = {
		    tooltip : {
		        formatter: "{a} : {c}"
		    },
		    series : [
		        {
		            name:dataJSON["areaDesc"],
		            type:'gauge',
		            min:0,
		            max:dataJSON["MaxF"],
		            //splitNumber:15,
		            radius: '100%',
		            axisLine: {            // 坐标轴线
		                lineStyle: {       // 属性lineStyle控制线条样式
		                	color: [[0.15, 'lime'],[dataJSON["splitNum"], '#1e90ff'],[1, '#ff4500']],
		                    width: 2,
		                    shadowColor : '#fff', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            axisLabel: {            // 坐标轴小标记
		                textStyle: {       // 属性lineStyle控制线条样式
		                    fontWeight: 'bolder',
		                    color: 'auto',
		                    shadowColor : 'auto', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            axisTick: {            // 坐标轴小标记
		                lineStyle: {       // 属性lineStyle控制线条样式
		                    color: 'auto',
		                    shadowColor : '#fff', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            splitLine: {           // 分隔线
		                length :10,         // 属性length控制线长
		                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
		                    width:2,
		                    color: 'auto',
		                    shadowColor : '#fff', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            pointer: {           // 分隔线
		                width:3
		            },
		            itemStyle:{
		                normal:{
		                	color:'#3399FF'
		                }
		            },
		            detail : {
		                offsetCenter: [0, '30%'],       // x, y，单位px
		                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    fontWeight: 'bolder',
		                    color: '#FF0000'
		                }
		            },
		            title : {
		                show : true,
		                offsetCenter: [0, '70%'],       // x, y，单位px
		                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    color: '#0f0f0f',
		                    fontSize: 18
		                }
		            },
		            data:[{value: dataJSON["deFen"], name: dataJSON["paiMing"]}]
		        },
		        {
		            name:dataJSON["aAreaDesc"],
		            type:'gauge',
		            min:0,
		            max:dataJSON["MaxF"],
		            //splitNumber:15,
		            radius: '100%',
		            axisLine: {            // 坐标轴线
		                lineStyle: {       // 属性lineStyle控制线条样式
		                	color: [[0.15, 'lime'],[dataJSON["splitNum"], '#1e90ff'],[1, '#ff4500']],
		                    width: 2,
		                    shadowColor : '#fff', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            axisLabel: {            // 坐标轴小标记
		                textStyle: {       // 属性lineStyle控制线条样式
		                    fontWeight: 'bolder',
		                    color: 'auto',
		                    shadowColor : 'auto', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            axisTick: {            // 坐标轴小标记
		                lineStyle: {       // 属性lineStyle控制线条样式
		                    color: 'auto',
		                    shadowColor : '#fff', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            splitLine: {           // 分隔线
		                length :10,         // 属性length控制线长
		                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
		                    width:2,
		                    color: 'auto',
		                    shadowColor : '#fff', //默认透明
		                    shadowBlur: 10
		                }
		            },
		            pointer: {           // 分隔线
		                width:3
		            },
		            itemStyle:{
		                normal:{
		                	color:'#C23531'
		                }
		            },
		            detail : {
		                show:false,
		                offsetCenter: [0, '30%'],       // x, y，单位px
		                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    fontWeight: 'bolder',
		                    color: '#FF0000'
		                }
		            },
		            title : {
		                show : false
		            },
		            data:[{value: dataJSON["aDeFen"], name: '333'}]
		        },
		    ]
		};
	myChart.setOption(option);
}

function loadZfRingChar(){
	var areaNo = jQuery("#areaNo").val();
	var aimAreaNo = jQuery("#aimAreaNo").val();
	var monthId = jQuery("#monthId").val();
	var parmater = {
			"areaNo":areaNo,
			"aimAreaNo":aimAreaNo,
			"monthId":monthId
	};
	var url = '<%=basePath%>/rpt/kpikh/KpiKh!loadZfRingChar.action';
	jQuery.ajax({
 	       url: url,
 	       type: "post",
 	       data: parmater,
 	       dataType: "html",
 	       success: function(data){
 	    	    var divId = "loadZfRingChar";
 	    	    var dataJSON = null;
 	    	    var divW = jQuery("#"+divId).width();
 	    	    jQuery("#"+divId).height(divW);
 	    	    jQuery("#" + divId).empty();
 	    		jQuery("#" + divId).removeAttr("_echarts_instance_");
 	    	    if(data != ""){
	 	    		dataJSON = eval("("+data+")");
 	    	    }
 	    	    if(aimAreaNo != "-1"){
 	    	    	initRingSChar(dataJSON,divId);
 	    	    }else{
 	    	    	initRingDChar(dataJSON,divId);
 	    	    }
 	    	   
 	       }
	});
}

function loadSrgmRingChar(){
	var areaNo = jQuery("#areaNo").val();
	var aimAreaNo = jQuery("#aimAreaNo").val();
	var monthId = jQuery("#monthId").val();
	var parmater = {
			"areaNo":areaNo,
			"aimAreaNo":aimAreaNo,
			"monthId":monthId
	};
	var url = '<%=basePath%>/rpt/kpikh/KpiKh!loadSrgmRingChar.action';
	jQuery.ajax({
 	       url: url,
 	       type: "post",
 	       data: parmater,
 	       dataType: "html",
 	       success: function(data){
 	    	    var divId = "loadSrgmRingChar";
 	    	    var dataJSON = null;
 	    	    var divW = jQuery("#"+divId).width();
	    	    jQuery("#"+divId).height(divW);
 	    	    jQuery("#" + divId).empty();
 	    		jQuery("#" + divId).removeAttr("_echarts_instance_");
 	    	    if(data != ""){
	 	    		dataJSON = eval("("+data+")");
 	    	    }
 	    	    if(aimAreaNo != "-1"){
	    	    	initRingSChar(dataJSON,divId);
	    	    }else{
	    	    	initRingDChar(dataJSON,divId);
	    	    }
 	       }
	});
}

function loadXyjzRingChar(){
	var areaNo = jQuery("#areaNo").val();
	var aimAreaNo = jQuery("#aimAreaNo").val();
	var monthId = jQuery("#monthId").val();
	var parmater = {
			"areaNo":areaNo,
			"aimAreaNo":aimAreaNo,
			"monthId":monthId
	};
	var url = '<%=basePath%>/rpt/kpikh/KpiKh!loadXyjzRingChar.action';
	jQuery.ajax({
 	       url: url,
 	       type: "post",
 	       data: parmater,
 	       dataType: "html",
 	       success: function(data){
 	    	    var divId = "loadXyjzRingChar";
 	    	    var dataJSON = null;
 	    	    var divW = jQuery("#"+divId).width();
	    	    jQuery("#"+divId).height(divW);
 	    	    jQuery("#" + divId).empty();
 	    		jQuery("#" + divId).removeAttr("_echarts_instance_");
 	    	    if(data != ""){
	 	    		dataJSON = eval("("+data+")");
 	    	    }
 	    	    if(aimAreaNo != "-1"){
	    	    	initRingSChar(dataJSON,divId);
	    	    }else{
	    	    	initRingDChar(dataJSON,divId);
	    	    }
 	       }
	});
}

function loadNdzdRingChar(){
	var areaNo = jQuery("#areaNo").val();
	var aimAreaNo = jQuery("#aimAreaNo").val();
	var monthId = jQuery("#monthId").val();
	var parmater = {
			"areaNo":areaNo,
			"aimAreaNo":aimAreaNo,
			"monthId":monthId
	};
	var url = '<%=basePath%>/rpt/kpikh/KpiKh!loadNdzdRingChar.action';
	jQuery.ajax({
 	       url: url,
 	       type: "post",
 	       data: parmater,
 	       dataType: "html",
 	       success: function(data){
 	    	    var divId = "loadNdzdRingChar";
 	    	    var dataJSON = null;
 	    	    var divW = jQuery("#"+divId).width();
	    	    jQuery("#"+divId).height(divW);
 	    	    jQuery("#" + divId).empty();
 	    		jQuery("#" + divId).removeAttr("_echarts_instance_");
 	    	    if(data != ""){
	 	    		dataJSON = eval("("+data+")");
 	    	    }
 	    	    if(aimAreaNo != "-1"){
	    	    	initRingSChar(dataJSON,divId);
	    	    }else{
	    	    	initRingDChar(dataJSON,divId);
	    	    }
 	       }
	});
}

function loadPmKHAndDeFenJD(){
	var areaNo = jQuery("#areaNo").val();
	var aimAreaNo = jQuery("#aimAreaNo").val();
	var monthId = jQuery("#monthId").val();
	var parmater = {
			"areaNo":areaNo,
			"aimAreaNo":aimAreaNo,
			"monthId":monthId
	};
	var url = '<%=basePath%>/rpt/kpikh/KpiKh!loadPmKHAndDeFenJD.action';
	jQuery.ajax({
		    type:'post',
			async:true,
			url:url,
			data:parmater,
			dataType:"html",
			success:function(data){
			   if(data != ""){
				   var dataJSON = eval("("+data+")");
				   jQuery("#paiMingKHDiv").html(dataJSON["pmKHStr"]);
				   jQuery("#deFenJDDiv").html(dataJSON["deFenJDStr"]);
			   }
			}
	 });  
}

function loadDfLineChar(kpiId, kpiName){
	var areaNo = jQuery("#areaNo").val();
	var aimAreaNo = jQuery("#aimAreaNo").val();
	var monthId = jQuery("#monthId").val();
	if(kpiId == ""){
		kpiId = "KPI_001";
	}
	
	var title = "总分";
	if(kpiName != ""){
		title = kpiName;
	}
	
	var parmater = {
			"areaNo":areaNo,
			"aimAreaNo":aimAreaNo,
			"monthId":monthId,
			"kpiId":kpiId
	};
	var url = '<%=basePath%>/rpt/kpikh/KpiKh!loadDfLineChar.action';
	jQuery.ajax({
 	       url: url,
 	       type: "post",
 	       data: parmater,
 	       dataType: "html",
 	       success: function(data){
 	    	    var divId = "dfLineChar";
 	    	    var dataJSON = null;
 	    	    var divW = jQuery("#"+divId).width();
	    	    jQuery("#"+divId).height(divW/4);
 	    	    jQuery("#" + divId).empty();
 	    		jQuery("#" + divId).removeAttr("_echarts_instance_");
 	    	    if(data != ""){
	 	    		dataJSON = eval("("+data+")");
 	    	    }
 	    	    initDfLineChar(dataJSON,divId,title);
 	       }
	});
}

function initZgZdF(){
	var monthId = jQuery("#monthId").val();
	var parmater = {
		"monthId":monthId
	};
	var url = '<%=basePath%>/rpt/kpikh/KpiKh!initZgZdF.action';
	jQuery.ajax({
		    type:'post',
			async:true,
			url:url,
			data:parmater,
			dataType:"html",
			success:function(data){
			   if(data != ""){
				   var dataJSON = eval("("+data+")");
				   loadZgZdf(dataJSON);
			   }
			}
	 });  
}

function loadZgZdf(dataJSON){
	for(var i=0;i<dataJSON.length;i++){
		var itemObject = dataJSON[i];
		var kpiID = itemObject["KPI_ID"];
		var dyName = itemObject["AREA_DESC"];
		var kpiDF = itemObject["KPI_01"];
		var kpiPM = itemObject["KPI_03"];
		
		if(kpiID == "KPI_001"){
			if(kpiPM == "1"){
				jQuery("#zfZGName").html(dyName);
				jQuery("#zfZG").html(kpiDF);
			}else{
				jQuery("#zfZDName").html(dyName);
				jQuery("#zfZD").html(kpiDF);
			}
		}else if(kpiID == "KPI_002"){
			if(kpiPM == "1"){
				jQuery("#srgmZGName").html(dyName);
				jQuery("#srgmZG").html(kpiDF);
			}else{
				jQuery("#srgmZDName").html(dyName);
				jQuery("#srgmZD").html(kpiDF);
			}
		}else if(kpiID == "KPI_025"){
			if(kpiPM == "1"){
				jQuery("#xyjzlZGName").html(dyName);
				jQuery("#xyjzlZG").html(kpiDF);
			}else{
				jQuery("#xyjzlZDName").html(dyName);
				jQuery("#xyjzlZD").html(kpiDF);
			}
		}else{
			if(kpiPM == "1"){
				jQuery("#ndzdlZGName").html(dyName);
				jQuery("#ndzdlZG").html(kpiDF);
			}else{
				jQuery("#ndzdlZDName").html(dyName);
				jQuery("#ndzdlZD").html(kpiDF);
			}
		}
	}
}

function initDbDYSelect(){
	var areaNo = jQuery("#areaNo").val();
	var parmater = {
			"areaNo":areaNo
	};
	var url = '<%=basePath%>/rpt/kpikh/KpiKh!initDbDYSelect.action';
	jQuery("#dbDYSelect").load(url,parmater);
}

function loadKpiKhZbTable(){
	var areaNo = jQuery("#areaNo").val();
	var aimAreaNo = jQuery("#aimAreaNo").val();
	var monthId = jQuery("#monthId").val();
	jQuery.ajax({
		url: '<%=basePath%>/rpt/kpikh/KpiKh!loadKpiKhZbTable.action',
		type:"POST",
	    data: {
			"areaNo":areaNo,
			"aimAreaNo":aimAreaNo,
			"monthId":monthId
		},
		cache:false,
		success:function(html) {
			jQuery("#kpiZBTable").html(html);
			jQuery(".part1Table")[0].click();
		}
	});
}

function loadKpiKhZbTableDrill(obj, kpiId){
	var areaNo = jQuery("#areaNo").val();
	var monthId = jQuery("#monthId").val();
	var url= '<%=basePath%>/rpt/kpikh/KpiKh!loadKpiKhZbTable.action';
	var param = "monthId=" + monthId + "&areaNo=" + areaNo + "&kpiId=" + kpiId;
	action({
		td : obj,
		url : url,
		mode : 'drill',
		parameters : param,
		onComplete : function(data) {
		}
	});
	plusClick(kpiId);
}

function plusClick(id) {
	var src = jQuery("#IMG_"+id).attr("src");
	if(src==undefined){
		return ;
	}
	if(src.indexOf("icon-down.png")==-1){
		jQuery("#IMG_"+id).attr("src",projectPath+"/resources/frame/DrillTable/icon-down.png");
	}else{
		jQuery("#IMG_"+id).attr("src",projectPath+"/resources/frame/DrillTable/icon-right.png");
	}
}

function kpiKhZbTableClick(kpiId, kpiName) {
	var monthId = jQuery("#monthId").val();
	jQuery.ajax({
		url: '<%=basePath%>/rpt/kpikh/KpiKh!loadPmdbTable.action',
		type:"POST",
	    data: {
			"kpiId":kpiId,
			"monthId":monthId
		},
		cache:false,
		success:function(html) {
			jQuery("#pmdbNameSpan").html(kpiName);
			jQuery("#pmdbTable").html(html);
		}
	});

	loadDfLineChar(kpiId, kpiName);
}

function initSelect(){
	loadZfRingChar();
	loadSrgmRingChar();
	loadXyjzRingChar();
	loadNdzdRingChar();
	initZgZdF();
	loadPmKHAndDeFenJD();
	loadKpiKhZbTable();
	loadDfLineChar("", "");
}

jQuery(document).ready(function(){
	initDbDYSelect();
	loadZfRingChar();
	loadSrgmRingChar();
	loadXyjzRingChar();
	loadNdzdRingChar();
	initZgZdF();
	loadPmKHAndDeFenJD();
	loadKpiKhZbTable();
	loadDfLineChar("", "");
});

</script>

  </head>
  
  <body>
    <div class="container" style="width: 98%;margin-top: 10px;height: 0px;">
        <div class="row" style="height: 0px;">
		  <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: left;"> 
		      <form class="form-inline"  style="margin: 0px;">
		         <div class="form-group" style="margin-left: 30px;">
		             <label for="areaNo" style="color: #3399FF;">地域</label>
                     <s:select id="areaNo" cssClass="form-control" list="list" listKey="AREA_NO" listValue="AREA_DESC" onchange="initDbDYSelect()" cssStyle="width: 66px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
		         </div>
		         <div class="form-group" style="margin-left: 30px;" id="dbDYSelect">
		             <label for="aimAreaNo" style="color: #C23531;">对标地域</label>
				     <select id="aimAreaNo" class="form-control" style="width: 66px;height: 25px;font-size: 12px;padding: 0px;">
				       <option value ="-1">--</option>
				     </select>
		         </div>
		         <div class="form-group" style="margin-left: 30px;">
		             <label for="monthId">时间</label>
                     <input type="text" class="form-control workinput" id="monthId" value="${monthId}" style="width: 70px;height: 25px;font-size: 12px;padding: 0px;">
		         </div>
		         <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="initSelect()">查询</button>
		      </form>
		  </div>
		</div>
	 </div>
	 <div class="container" style="width: 85%;">
	    <div class="row">
	        <div class="col-xs-3 col-sm-3 col-md-3">
	            <div id="loadZfRingChar" style="width: 80%;margin-top: 10px;"></div>
	            <div style="text-align: center;margin-top: -15px;">
	                <table style="width: 100%;font-size: 12px;font-weight: bold;">
	                   <tr>
	                      <td rowspan="2" style="width: 50%;text-align: right;font-size: 14px;border: 3px solid #6CA6CD;" nowrap="nowrap">
	                                                                   总分（100+29分）
	                      </td>
	                      <td style="width: 15%;text-align: right;height: 20px;" nowrap="nowrap">
	                                                                   最低<span id="zfZDName">---</span>:
	                      </td>
	                      <td style="padding-left: 5px;" id="zfZD">
	                         --
	                      </td>
	                   </tr>
	                   <tr>
	                      <td style="width: 15%;text-align: right;height: 20px;" nowrap="nowrap">
	                                                                    最高<span id="zfZGName">---</span>:
	                      </td>
	                      <td style="padding-left: 5px;" id="zfZG">
	                          --
	                      </td>
	                   </tr>
	                </table>
	            </div>
	        </div>
	        <div class="col-xs-3 col-sm-3 col-md-3">
	            <div id="loadSrgmRingChar" style="width: 80%;margin-top: 10px;"></div>
	            <div style="text-align: center;margin-top: -15px;">
	                <table style="width: 100%;font-size: 12px;font-weight: bold;">
	                   <tr>
	                      <td rowspan="2" style="width: 50%;text-align: right;font-size: 14px;border: 3px solid #6CA6CD;" nowrap="nowrap">
	                                                                   收入规模类（38+14分）
	                      </td>
	                      <td style="width: 15%;text-align: right;height: 20px;" nowrap="nowrap">
	                                                                   最低<span id="srgmZDName">---</span>:
	                      </td>
	                      <td style="padding-left: 5px;" id="srgmZD">
	                         --
	                      </td>
	                   </tr>
	                   <tr>
	                      <td style="width: 15%;text-align: right;height: 20px;" nowrap="nowrap">
	                                                                    最高<span id="srgmZGName">---</span>:
	                      </td>
	                      <td style="padding-left: 5px;" id="srgmZG">
	                          --
	                      </td>
	                   </tr>
	                </table>
	            </div>
	        </div>
	        <div class="col-xs-3 col-sm-3 col-md-3">
	            <div id="loadXyjzRingChar" style="width: 80%;margin-top: 10px;"></div>
	            <div style="text-align: center;margin-top: -15px;">
	                <table style="width: 100%;font-size: 12px;font-weight: bold;">
	                   <tr>
	                      <td rowspan="2" style="width: 50%;text-align: right;font-size: 14px;border: 3px solid #6CA6CD;" nowrap="nowrap">
	                                                                   效益价值类（42+14分）
	                      </td>
	                      <td style="width: 15%;text-align: right;height: 20px;" nowrap="nowrap">
	                                                                   最低<span id="xyjzlZDName">---</span>:
	                      </td>
	                      <td style="padding-left: 5px;" id="xyjzlZD">
	                         --
	                      </td>
	                   </tr>
	                   <tr>
	                      <td style="width: 15%;text-align: right;height: 20px;" nowrap="nowrap">
	                                                                    最高<span id="xyjzlZGName">---</span>:
	                      </td>
	                      <td style="padding-left: 5px;" id="xyjzlZG">
	                          --
	                      </td>
	                   </tr>
	                </table>
	            </div>
	        </div>
	        <div class="col-xs-3 col-sm-3 col-md-3">
	            <div id="loadNdzdRingChar" style="width: 80%;margin-top: 10px;"></div>
	            <div style="text-align: center;margin-top: -15px;">
	                <table style="width: 100%;font-size: 12px;font-weight: bold;">
	                   <tr>
	                      <td rowspan="2" style="width: 50%;text-align: right;font-size: 14px;border: 3px solid #6CA6CD;" nowrap="nowrap">
	                                                                   年度重点类（20+1分）
	                      </td>
	                      <td style="width: 15%;text-align: right;height: 20px;" nowrap="nowrap">
	                                                                   最低<span id="ndzdlZDName">---</span>:
	                      </td>
	                      <td style="padding-left: 5px;" id="ndzdlZD">
	                         --
	                      </td>
	                   </tr>
	                   <tr>
	                      <td style="width: 15%;text-align: right;height: 20px;" nowrap="nowrap">
	                                                                    最高<span id="ndzdlZGName">---</span>:
	                      </td>
	                      <td style="padding-left: 5px;"  id="ndzdlZG">
	                          --
	                      </td>
	                   </tr>
	                </table>
	            </div>
	        </div> 
	    </div>
	 </div>
	 <div class="container" style="width: 98%;">
	    <div class="row">
	        <div class="col-xs-12 col-sm-12 col-md-12">
	            <table style="width: 98%;border: 1px solid #D4DBEE;background-color: #D4DBEE;margin-top: 20px;font-size: 12px;">
	                <tr>
	                    <td style="height: 20px;padding-left: 10px;">预警提示：</td>
	                </tr>
	                <tr>
	                    <td style="height: 20px;padding-left: 10px;">
	                        <span class="glyphicon glyphicon-stop" aria-hidden="true" style="color: #C00000;"/>
	                                                                   得分居后指标：
	                        <span id="paiMingKHDiv"></span>
	                    </td>
	                </tr>
	                <tr>
	                    <td style="height: 30px;padding-left: 10px;">
	                         <span class="glyphicon glyphicon-stop" aria-hidden="true" style="color: #C00000;"/>
	                                                                   得分较上月降低指标：
	                         <span id="deFenJDDiv"></span>
	                    </td>
	                </tr>
	            </table>
	        </div>
	    </div>
	 </div>
	 <div class="container" style="width: 98%;">
	     <div class="row" style="margin-top: 10px;">
	         <div class="col-xs-6 col-sm-6 col-md-6">
	            <div style="text-align: left;padding-left: 20px;font-size: 12px;">
	                <span span class="glyphicon glyphicon-equalizer" aria-hidden="true" style="color: #C00000;"/>
	                <span style="color: #C00000;font-weight: bold;">考核指标</span>
	            </div>
	         </div>
	         <div class="col-xs-6 col-sm-6 col-md-6">
	            <div style="text-align: left;padding-left: 20px;font-size: 12px;">
	                <span style="color: #C00000;font-weight: bold;">排名对标</span>&nbsp;
	                <span style="color: #C00000;font-weight: bold;" id="pmdbNameSpan"> </span>
	            </div>
	         </div>
	     </div>
	     <div class="row">
	         <div class="col-xs-6 col-sm-6 col-md-6">
	            <div id="kpiZBTable">
	            </div>
	         </div>
	         <div class="col-xs-6 col-sm-6 col-md-6">
	            <div id="pmdbTable">
	            </div>
	         </div>
	     </div>
	     <div class="row" style="margin-top: 20px;">
	         <div class="col-xs-12 col-sm-12 col-md-12">
	            <div id="dfLineChar">
	            </div>
	         </div>
	     </div>
	 </div>
  </body>
</html>
