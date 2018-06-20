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
    
    <title>北十对标情况</title>
    
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
    <script type="text/javascript" src="../../../resources/frame/DrillTable/DrillTable.js"></script>
<style type="text/css">
    html,body{
       width: 100%;
       text-align: center;
    }
</style>
<script type="text/javascript">
	var projectPath = "<%=basePath%>";
	function initDbDYSelect(){
		var orgId = jQuery("#orgId").val();
		var parmater = {
				"orgId":orgId
		};
		var url = '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!initDbDYSelect.action';
		jQuery("#dbDYSelect").load(url,parmater);
	}
	function loadRingChar(loadDivId, kpiType){
		var orgId = jQuery("#orgId").val();
		var aimOrgId = jQuery("#aimOrgId").val();
		var monthId = jQuery("#monthId").val();
		var parmater = {
				"orgId":orgId,
				"aimOrgId":aimOrgId,
				"monthId":monthId,
				"kpiType":kpiType
		};
		var url = '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!loadRingChar.action';
		jQuery.ajax({
	 	       url: url,
	 	       type: "post",
	 	       data: parmater,
	 	       dataType: "html",
	 	       success: function(data){
	 	    	    var divId = loadDivId;
	 	    	    var dataJSON = null;
	 	    	    var divW = jQuery("#"+divId).width();
	 	    	    jQuery("#" + divId).height(divW);
	 	    	    jQuery("#" + divId).empty();
	 	    		jQuery("#" + divId).removeAttr("_echarts_instance_");
	 	    	    if(data != ""){
		 	    		dataJSON = eval("("+data+")");
	 	    	    }
	 	    	    if(aimOrgId != "-1"){
	 	    	    	initRingSChar(dataJSON,divId);
	 	    	    }else{
	 	    	    	initRingDChar(dataJSON,divId);
	 	    	    }
	 	    	   
	 	       }
		});
	}
	
	function initRingSChar(dataJSON,divId){
		var myChart = echarts.init(document.getElementById(divId));
		var option = {
			    tooltip : {
			        formatter: "{a} : {c}"
			    },
			    series : [
			        {
			            name:dataJSON["orgName"],
			            type:'gauge',
			            min:0,
			            max:dataJSON["MaxF"],
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
			                offsetCenter: [0, '0%'],       // x, y，单位px
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
			            name:dataJSON["aOrgName"],
			            type:'gauge',
			            min:0,
			            max:dataJSON["MaxF"],
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
			                offsetCenter: [0, '0%'],       // x, y，单位px
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
	function initRingDChar(dataJSON,divId){
		var myChart = echarts.init(document.getElementById(divId));
		var option = {
			   // backgroundColor: '#1b1b1b',
			    tooltip : {
			        formatter: "{a} : {c}"
			    },
			    series : [
			        {
			            name:dataJSON["orgName"],
			            type:'gauge',
			            min:0,
			            max:dataJSON["MaxF"],
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
			                offsetCenter: [0, '0%'],       // x, y，单位px
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
	
	function initZgZdF(){
		var monthId = jQuery("#monthId").val();
		var parmater = {
			"monthId":monthId
		};
		var url = '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!initZgZdF.action';
		jQuery.ajax({
			    type:'post',
				async:true,
				url:url,
				data:parmater,
				dataType:"json",
				success:function(data){
					loadZgZdf(data);
				}
		 });  
	}

	function loadZgZdf(dataJSON){
		if(dataJSON.zfList != null && dataJSON.zfList.length > 0){
			var zgzdMap = dataJSON.zfList[0];
			jQuery("#zfZG").html(zgzdMap.MAX_KAP_1_NAME+" "+zgzdMap.MAX_KPI_1);
			jQuery("#zfZD").html(zgzdMap.MIN_KPI_1_NAME+" "+zgzdMap.MIN_KPI_1);
		}
		if(dataJSON.srgmList != null && dataJSON.srgmList.length > 0){
			var zgzdMap = dataJSON.srgmList[0];
			jQuery("#srgmZG").html(zgzdMap.MAX_KAP_2_NAME+" "+zgzdMap.MAX_KPI_2);
			jQuery("#srgmZD").html(zgzdMap.MIN_KPI_2_NAME+" "+zgzdMap.MIN_KPI_2);
		}
		if(dataJSON.xyjzList != null && dataJSON.xyjzList.length > 0){
			var zgzdMap = dataJSON.xyjzList[0];
			jQuery("#xyjzlZG").html(zgzdMap.MAX_KAP_3_NAME+" "+zgzdMap.MAX_KPI_3);
			jQuery("#xyjzlZD").html(zgzdMap.MIN_KPI_3_NAME+" "+zgzdMap.MIN_KPI_3);
		}
		if(dataJSON.ndzdList != null && dataJSON.ndzdList.length > 0){
			var zgzdMap = dataJSON.ndzdList[0];
			jQuery("#ndzdlZG").html(zgzdMap.MAX_KAP_4_NAME+" "+zgzdMap.MAX_KPI_4);
			jQuery("#ndzdlZD").html(zgzdMap.MIN_KPI_4_NAME+" "+zgzdMap.MIN_KPI_4);
		}
	}
	
	function table1() {
		var orgId = jQuery("#orgId").val();
		var aimOrgId = jQuery("#aimOrgId").val();
		var monthId = jQuery("#monthId").val();
		jQuery.ajax({
			url: '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!table1.action',
			type:"POST",
		    data: {
				"monthId": monthId,
				"orgId": orgId,
				"aimOrgId": aimOrgId
			},
			cache:false,
			success:function(html) {
				jQuery("#part3TableDiv").html(html);
			}
		});
	}
	
	function table3() {
		monthId = jQuery("#monthId").val();
		jQuery.ajax({
			url: '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!table3.action',
			type:"POST",
		    data: {
				"monthId": monthId
			},
			cache:false,
			success:function(html) {
				jQuery("#part1TableDiv").html(html);
			}
		});
	}
	
	function table3db(dbType) {
		var tableDes = '';
		if("zf"==dbType){
			tableDes = '<span>总分得分情况与上月对比</span>';
			jQuery("#part2TableDes").html(tableDes);
		}else if("srgm"==dbType){
			tableDes = '<span>收入规模得分情况与上月对比</span>';
			jQuery("#part2TableDes").html(tableDes);
		}else if("xyjz"==dbType){
			tableDes = '<span>效益价值得分情况与上月对比</span>';
			jQuery("#part2TableDes").html(tableDes);
		}else if("ndzd"==dbType){
			tableDes = '<span>年度重点得分情况与上月对比</span>';
			jQuery("#part2TableDes").html(tableDes);
		}else{
			tableDes = '<span></span>';
			jQuery("#part2TableDes").html(tableDes);
		}
		
		var monthId = jQuery("#monthId").val();
		var orgId = jQuery("#orgId").val();
		jQuery.ajax({
			url: '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!table3db.action',
			type:"POST",
		    data: {
				"monthId": monthId,
				"dbType": dbType,
				"orgId": orgId 
			},
			cache:false,
			success:function(html) {
				jQuery("#part2TableDiv").html(html);
			}
		});
	}
	
	function loadBsKhZbTable(){
		var orgId = jQuery("#orgId").val();
		var aimOrgId = jQuery("#aimOrgId").val();
		var monthId = jQuery("#monthId").val();
		jQuery.ajax({
			url: '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!loadBsKhZbTable.action',
			type:"POST",
		    data: {
				"orgId":orgId,
				"aimOrgId":aimOrgId,
				"monthId":monthId
			},
			cache:false,
			success:function(html) {
				jQuery("#bsZBTable").html(html);
				jQuery(".part1Table")[0].click();
			}
		});
	}

	function loadBsKhZbTableDrill(obj, kpiId){
		var orgId = jQuery("#orgId").val();
		var monthId = jQuery("#monthId").val();
		var url= '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!loadBsKhZbTable.action';
		var param = "monthId=" + monthId + "&orgId=" + orgId + "&kpiId=" + kpiId;
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

	function loadPmKHAndDeFenJD(){
		var orgId = jQuery("#orgId").val();
		var monthId = jQuery("#monthId").val();
		jQuery.ajax({
			url: '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!loadPmKHAndDeFenJD.action',
			type:"POST",
		    data: {
				"orgId":orgId,
				"monthId":monthId
			},
			dataType:"json",
			cache:false,
			success:function(data) {
				var pMKHList =  data.pMKHList;
				var dFJDList = data.dFJDList;
				var pMKH = '';
				var dFJD = '';
				if(pMKHList != null && pMKHList.length > 0){
					for(var i = 0; i < pMKHList.length; i++){
						if(i == pMKHList.length-1){
							pMKH = pMKH + pMKHList[i].KPI_NAME
						}else{
							pMKH = pMKH + pMKHList[i].KPI_NAME + "；"
						}
					}
					pMKH = "<span>"+pMKH+"</span>";
					jQuery("#paiMingKHDiv").html(pMKH);
				}
				if(dFJDList != null && dFJDList.length > 0){
					for(var i = 0; i < dFJDList.length; i++){
						if(i == dFJDList.length-1){
							dFJD = dFJD + dFJDList[i].KPI_NAME
						}else{
							dFJD = dFJD + dFJDList[i].KPI_NAME + "；"
						}
					}
					dFJD = "<span>"+dFJD+"</span>";
					jQuery("#deFenJDDiv").html(dFJD);
				}
			}
		});
	}
	function bsKhZbTableClick(kpiId, kpiName) {
		jQuery("#pmdbTable").show();
		jQuery("#dfLineChar1").show();
		var monthId = jQuery("#monthId").val();
		var orgId = jQuery("#orgId").val();
		jQuery.ajax({
			url: '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!loadPmdbTable.action',
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
		loadDfLineChar(kpiId,kpiName);
	}
	function loadDfLineChar(kpiId, kpiName){
		var orgId = jQuery("#orgId").val();
		var monthId = jQuery("#monthId").val();
		if(kpiId == ""){
			kpiId = "KPI_003";
		}
		
		var title = "总分";
		if(kpiName != ""){
			title = kpiName;
		}
		
		var parmater = {
				"orgId":orgId,
				"monthId":monthId,
				"kpiId":kpiId
		};
		jQuery.ajax({
	 	       url: '<%=basePath%>/rpt/kpikh/bsdb/Bsdb!loadDfLineChar.action',
	 	       type: "post",
	 	       data: parmater,
	 	       dataType: "html",
	 	       success: function(data){
	 	    	    var divId = "dfLineChar1";
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
	
	function show_modal() {
        $('#myModal').modal('show');
        table1();
    }
	
	function initSelect(){
		loadRingChar("loadZfRingChar", "KPI_1");
		loadRingChar("loadSrgmRingChar", "KPI_2");
		loadRingChar("loadXyjzRingChar", "KPI_3");
		loadRingChar("loadNdzdRingChar", "KPI_4");
		initZgZdF();
		table3();
		table3db('zf');
		loadBsKhZbTable();
		loadPmKHAndDeFenJD();
		jQuery("#pmdbTable").hide();
		jQuery("#dfLineChar1").hide();
	}
	
	jQuery(document).ready(function(){
		monthId = jQuery("#monthId").val();
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });
		initDbDYSelect();
		loadRingChar("loadZfRingChar", "KPI_1");
		loadRingChar("loadSrgmRingChar", "KPI_2");
		loadRingChar("loadXyjzRingChar", "KPI_3");
		loadRingChar("loadNdzdRingChar", "KPI_4");
		initZgZdF();
		table3();
		table3db('zf');
		loadBsKhZbTable();
		loadPmKHAndDeFenJD();
	});
</script>

  </head>
  
  <body>
     <div class="container" style="width: 98%;margin-top: 10px;height: 0px;">
        <div class="row" style="height: 0px;">
		  <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: left;"> 
		      <form class="form-inline"  style="margin: 0px;">
		         <div class="form-group" style="margin-left: 30px;">
		             <label for="orgId" style="color: #3399FF;">地域</label>
                     <s:select id="orgId" cssClass="form-control" list="list" listKey="ORG_ID" listValue="ORG_NAME" onchange="initDbDYSelect()" cssStyle="width: 66px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
		         </div>
		         <div class="form-group" style="margin-left: 30px;" id="dbDYSelect">
		             <label for="aimOrgId" style="color: #C23531;">对标地域</label>
				     <select id="aimOrgId" class="form-control" style="width: 66px;height: 25px;font-size: 12px;padding: 0px;">
				       <option value ="-1">--</option>
				     </select>
		         </div>
		         <div class="form-group" style="margin-left: 30px;">
		             <label for="monthId">时间</label>
                     <input type="text" class="form-control workinput" id="monthId" value="${monthId}" style="width: 70px;height: 25px;font-size: 12px;padding: 0px;">
		         </div>
		         <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="initSelect()">查询</button>
		         <a href="javascript:void(-1);" onclick="show_modal();">对标详情</a>
		      </form>
		  </div>
		</div>
	 </div>
	 <div class="container" style="width: 85%;">
	    <div class="row">
	        <div class="col-xs-3 col-sm-3 col-md-3">
	            <div id="loadZfRingChar" style="width: 80%;margin-top: 10px;" onclick="table3db('zf')"></div>
	            <div style="text-align: center;margin-top: -15px;">
	                <table style="width: 100%;font-size: 12px;font-weight: bold;">
	                   <tr>
	                   	  <td rowspan="2" style="width: 10%;"></td>
	                      <td rowspan="2" style="width: 45%;text-align: center;font-size: 14px; border:3px solid #6CA6CD;">
                                                                               总分(100分)
	                      </td>
	                      <td style="width: 15%;text-align: right;height: 20px;">
	                                                                   最低:
	                      </td>
	                      <td style="padding-left: 5px;" id="zfZD">
	                         --
	                      </td>
	                   </tr>
	                   <tr>
	                      <td style="width: 15%;text-align: right;height: 20px;">
	                                                                    最高:
	                      </td>
	                      <td style="padding-left: 5px;" id="zfZG">
	                          --
	                      </td>
	                   </tr>
	                </table>
	            </div>
	        </div>
		    <div class="col-xs-3 col-sm-3 col-md-3">
	            <div id="loadSrgmRingChar" style="width: 80%;margin-top: 10px;" onclick="table3db('srgm')"></div>
	            <div style="text-align: center;margin-top: -15px;">
	                <table style="width: 100%;font-size: 12px;font-weight: bold;">
	                   <tr>
	                   	  <td rowspan="2" style="width: 7%;"></td>
	                      <td rowspan="2" style="width: 48%;text-align: center;font-size: 14px; border:3px solid #6CA6CD;">
	                                                                   收入规模类(38分)
	                      </td>
	                      <td style="width: 15%;text-align: right;height: 20px;">
	                                                                   最低:
	                      </td>
	                      <td style="padding-left: 5px;" id="srgmZD">
	                         --
	                      </td>
	                   </tr>
	                   <tr>
	                      <td style="width: 15%;text-align: right;height: 20px;">
	                                                                    最高:
	                      </td>
	                      <td style="padding-left: 5px;" id="srgmZG">
	                          --
	                      </td>
	                   </tr>
	                </table>
	            </div>
	        </div>
	        <div class="col-xs-3 col-sm-3 col-md-3">
	            <div id="loadXyjzRingChar" style="width: 80%;margin-top: 10px;" onclick="table3db('xyjz')"></div>
	            <div style="text-align: center;margin-top: -15px;">
	                <table style="width: 100%;font-size: 12px;font-weight: bold;">
	                   <tr>
	                   	  <td rowspan="2" style="width: 7%;"></td>
	                      <td rowspan="2" style="width: 48%;text-align: center;font-size: 14px; border:3px solid #6CA6CD;">
	                                                                   效益价值类(42分)
	                      </td>
	                      <td style="width: 15%;text-align: right;height: 20px;">
	                                                                   最低:
	                      </td>
	                      <td style="padding-left: 5px;" id="xyjzlZD">
	                         --
	                      </td>
	                   </tr>
	                   <tr>
	                      <td style="width: 15%;text-align: right;height: 20px;">
	                                                                    最高:
	                      </td>
	                      <td style="padding-left: 5px;" id="xyjzlZG">
	                          --
	                      </td>
	                   </tr>
	                </table>
	            </div>
	        </div>
	        <div class="col-xs-3 col-sm-3 col-md-3">
	            <div id="loadNdzdRingChar" style="width: 80%;margin-top: 10px;" onclick="table3db('ndzd')"></div>
	            <div style="text-align: center;margin-top: -15px;">
	                <table style="width: 100%;font-size: 12px;font-weight: bold;">
	                   <tr>
	                   	  <td rowspan="2" style="width: 7%;"></td>
	                      <td rowspan="2" style="width: 48%; text-align: center;font-size: 14px; border:3px solid #6CA6CD;">
	                                                                   年度重点类(20分)
	                      </td>
	                      <td style="width: 15%;text-align: right;height: 20px;">
	                                                                   最低:
	                      </td>
	                      <td style="padding-left: 5px;" id="ndzdlZD">
	                         --
	                      </td>
	                   </tr>
	                   <tr>
	                      <td style="width: 15%;text-align: right;height: 20px;">
	                                                                    最高:
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
	 <!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog" style="width: 900px;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                   	北十对标详情
	                </h4>
	            </div>
	            <div class="modal-body">
	                <div class="input-group">
	                    <div class="form-group">
	                        <div id="part3TableDiv">
	            			</div>
	                    </div>
	                 </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
	                </button>
	            </div>
	        </div>
	    </div>
	</div>
	 <div class="container" style="width: 98%; padding-top: 2%;border-top: 1px solid red;margin-top: 15px;">
	 	 	<div class="row">
	     		<div class="col-xs-2 col-sm-2 col-md-2" id="part1TableDes" style="font-size: 12px; color: #C00000; font-weight:bold; padding-left:5px">北十省整体情况</div>
	     		<div class="col-xs-5 col-sm-5 col-md-5"></div>
	     		<div class="col-xs-2 col-sm-2 col-md-2" id="part2TableDes" style="font-size: 12px; color: #C00000; font-weight:bold; padding-left:5px"></div>
	     	</div>
	     <div class="row">
	     	<div class="col-xs-7 col-sm-7 col-md-7" id="part1TableDiv" style="border-right: 1px solid #ABC5EA;">
	        </div>
	        <div class="col-xs-5 col-sm-5 col-md-5" id="part2TableDiv">
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
	            <div id="bsZBTable">
	            </div>
	         </div>
	         <div class="col-xs-6 col-sm-6 col-md-6">
	            <div id="pmdbTable">
	            </div>
	         </div>
	     </div>
	    <div class="row">
	         <div class="col-xs-12 col-sm-12 col-md-12">
	            <div id="dfLineChar1">
	            </div>
	         </div>
	     </div>
	 </div>
	</body>
</html>
