<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>首页</title>
    
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

<style type="text/css">
    html,body{
       width: 100%;
       text-align: center;
    }
    div{
       margin: 0px;
       padding: 0px;
    }

</style>
<script type="text/javascript">
var areaNo;
var monthId;

    function initPageItem(){
       var initItemUrl = '../../ws/home/HomeFrame!itemInit.action';
 	   jQuery.ajax({
 		    type:'post',
			async:true,
			url:initItemUrl,
			data:{
			},
			dataType:"html",
			success:function(data){
			   if(data != ""){
				   var dataJSON = eval("("+data+")");
				   loadPageContainer(dataJSON);
			   }
			}
      });       
    }
    
    function loadPageContainer(dataJSON){
    	for(i=0;i<dataJSON.length;i++){
    		var itemObject = dataJSON[i];
    		var containerId = itemObject["ID"];
    		var containerTitle = itemObject["NAME"];
    		var containerUrl = '<%=basePath%>' + itemObject["URL"];
    		var type = itemObject["TYPE"];
    		var short_name=itemObject["SHORT_NAME"];
    		var htmlStr = '';
    		var menuHtml='';
    		if(type == "1"){
    			htmlStr = '<div class="row" style="height: 30px;margin-top: 10px;"><div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;"><table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;"><tr><td style="background-color: #C00000;width: 28px;"></td><td style="width: 3px;"></td><td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">';
    			htmlStr = htmlStr + '<a name="'+i+'">'+containerTitle + '</a></td></tr></table></div></div>';
    		}
    		containerId = "hp_container_" + containerId;
    		htmlStr = htmlStr + '<div class="row"><div class="col-xs-12 col-sm-12 col-md-12 container-item" id="';
    		htmlStr = htmlStr + containerId + '" url="' + containerUrl +'"></div></div>';
    		menuHtml='<li style="height:20px;border-bottom: 1px dashed #F75F67"><a href="#'+i+'">'+short_name+'</a></li>'
    		jQuery("#homeframe-container").append(htmlStr);
    		jQuery("#menu").append(menuHtml);
    		var parmater = {
    				"areaNo":areaNo,
    				"monthId":monthId
    		};
    		jQuery("#"+containerId).load(containerUrl,parmater);
    	}
    }
    
    function searchItem(){
    	areaNo = jQuery("#areaNo").val();
    	monthId = jQuery("#monthId").val();

    	var itemArray = jQuery(".container-item");
    	for(var i=0;i<itemArray.length;i++){
    		var itemUrl = jQuery(itemArray[i]).attr("url");
    		var parmater = {
    				"areaNo":areaNo,
    				"monthId":monthId
    		};
    		jQuery(itemArray[i]).load(itemUrl,parmater);
    	}
    }
    
    var bool = false;
	var offsetX = 0;
	var offsetY = 0;
    
    jQuery(document).ready(function(){
    	areaNo = jQuery("#areaNo").val();
    	monthId = jQuery("#monthId").val();

    	initPageItem();
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM",
       	   okfun: function(elem, val) {
       			searchItem();
       	   }
        });
        
    	jQuery("#bonc_zl_pig").bind({
    		click:function(){
    			if($("#bonc_zl_dht").is(":hidden")){
    				jQuery("#bonc_zl_dht").show();
    			}else{
    				jQuery("#bonc_zl_dht").hide();
    			}
    		}
    	});
    	
    	/* 
    	jQuery("#bonc_zl_pig").mousedown(function(event) {
			bool = true;
			offsetX = event.offsetX ? event.offsetX : event.layerX;
			offsetY = event.offsetY ? event.offsetY : event.layerY;
			//offsetX
			jQuery("#bonc_zl_pig").css('cursor', 'move');
		}).mouseup(function() {
			bool = false;
			jQuery(document).unbind('mouseover');
		});
    	
    	jQuery(document).mousemove(function(event) {
			if (!bool) {
				return false;
			}else {
				//var x = event.clientX - offsetX;
				//var y = event.clientY - offsetY;
				var x = event.clientX;
				var y = event.clientY;
				var winH = $(window).height();
				var winW = $(window).width();
				var newR = winW - x - offsetX;
				var newB = winH - y - offsetY;
				$("#pig-father-div").css("position", "fixed");
				jQuery("#pig-father-div").css("right", newR);
				jQuery("#pig-father-div").css("bottom", newB);
			}
		});
    	*/
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
                     <s:select id="areaNo" cssClass="form-control" list="list" listKey="AREA_NO" listValue="AREA_DESC" cssStyle="width: 66px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
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
	 <div class="container" style="width: 95%;" id="homeframe-container"></div>
	 <div id="pig-father-div" style="width:75px;margin-bottom:20px;bottom:0px;right:16px;position: fixed;text-align: center;">
	    <div style="display: none;background-color: #D9DFF0;" id="bonc_zl_dht">
	       <ul style="list-style-type:none;padding:0px;margin-bottom:0px" id="menu"></ul>
	    </div>
	 	<div id="bonc_zl_pig" style="color: #9F9F9F;font-size: 50px;cursor: pointer;width: 50px;height: 50px;margin: auto;">
	 	    <span class="glyphicon glyphicon-plane" aria-hidden="true"/>
	 	</div>
	 </div>
  </body>
</html>
