<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
String contextPath = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>电子渠道稽核日报</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap/3.3.6/bootstrap.min.css" media="screen">
	<link rel="stylesheet" type="text/css" href="../../../resources/frame/jedate-6.0.2/skin/jedate.css" />
	<link href="<s:url value="/struts/pure/css/grey.css?ver=1.5.1-SNAPSHOT"/>" rel="stylesheet" type="text/css"/>
	
    <script type="text/javascript" src="../../../resources/js/jquery/1.12.0/jquery.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../../resources/frame/jedate-6.0.2/jquery.jedate.min.js"></script>
    <script type="text/javascript" src="../../../resources/frame/DrillTable/DrillTable.js"></script>
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
var projectPath = "<%=contextPath%>";
	 jQuery(document).ready(function(){
	    	jQuery("#monthId").jeDate({
	       	   format:"YYYY-MM"
	        });
	    	query();
	    });

	 function query(){
	 	var monthId = jQuery('#monthId').val();
	 	var areaNo = jQuery('#areaNo').val();
	 	jQuery.ajax({
	 		url: '<%=contextPath%>/rpt/xjlts/checkDay/EChannelCheck!queryTable.action',
	 	    type: "post",
	 	    data: {
	 			"monthId": monthId, 
	 			"areaNo": areaNo
	 		},
	 		success:function(data){
	 			jQuery("#tableDiv").html(data);
	 		}
	 	});
	 }

	   function getSubList(obj, region_id){
		    var monthId = jQuery('#monthId').val();
			var url= '<%=contextPath%>/rpt/xjlts/checkDay/EChannelCheck!queryTableDrill.action';
			var param = "monthId=" + monthId + "&areaNo=" + region_id;
			action({
				td : obj,
				url : url,
				mode : 'drill',
				parameters : param,
				onComplete : function(data) {
				}
			});
			plusClick(region_id);
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
</script>
</head>
<body>
 <div class="container" style="width: 98%;margin-top: 5px;height: 0px;">
        <div class="row" style="height: 0px;">
		  <div class="col-xs-6 col-sm-6 col-md-6"></div>
		  <div class="col-xs-6 col-sm-6 col-md-6" > 
		   <form class="form-inline"  style="margin-top: 10px;float:right;">
		         <div class="form-group" >
                    <label for="areaNo">地域</label>
                    <s:select id="areaNo" cssClass="form-control" list="list" listKey="AREA_NO" listValue="AREA_DESC" cssStyle="width: 100px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
		         </div>
		         <div class="form-group">
		             <label for="monthId">时间</label>
                     <input type="text" class="form-control workinput" id="monthId" value="<s:property value="monthId"/>" style="width: 100px;height: 25px;margin-right:10px; font-size: 12px;padding: 0px;">
		         </div>
		         <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="query()">查询</button>
		    </form>
		  </div>
		</div>
	 </div>
	<div class="container" style="width: 98%;margin-top:50px;" id="homeframe-container">
	  <div class="row" style="height: 30px;margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">电子渠道稽核日报</td>
					</tr>
				</table>
			</div>
		</div>
       <div id="tableDiv" >
       </div>
     </div>
<br/>
<br/>
</body>
</html>

