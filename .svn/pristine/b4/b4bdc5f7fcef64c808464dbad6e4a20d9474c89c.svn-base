<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>

<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
String contextPath = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>专业销售现金流入分析</title>
    
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

<style type="text/css">
    html,body{
       width: 100%;
       text-align: center;
    }
    div{
       margin: 0px;
       padding: 0px;
    }
	.tw {border-right:1px solid #D61821 ;border-width:medium}
</style>
<script type="text/javascript">
	var areaNo;
	var monthId;
	var zyxId;
    jQuery(document).ready(function(){
    	areaNo = jQuery("#areaNo").val();
    	monthId = jQuery("#monthId").val();
    	jQuery("#monthId").jeDate({
       	   format:"YYYY-MM"
        });
    	query();
    });
   
    function query() {
    	areaNo = jQuery("#areaNo").val();
    	monthId = jQuery("#monthId").val();
    	zyxId = jQuery("#zyxId option:selected").val();
    	table();
    }
    function table() {
    	jQuery.ajax({
    		url: '<%=contextPath%>/rpt/xjlts/salescashinflow/InflowAnalysis!table.action',
    		type:"POST",
    	    data: {
    			"areaNo":areaNo,
    	    	"monthId": monthId,
    	    	"zyxId": zyxId
    		},
    		cache:false,
    		success:function(html) {
    			jQuery("#table").html(html);
    		}
    	});
    }
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
		         <div class="form-group">
		             <label for="zyxId">专业线</label>
                     <select id="zyxId" 
                     	     class="form-control" 
                     	     style="width: 66px;height: 25px;font-size: 12px;padding: 0px;">
                     	  <option value="市场线">市场线</option>
                     	  <option value="集客线">集客线</option>
                     </select>
		         </div>
		         <button type="button" class="btn btn-info btn-sm" style="width: 60px;height: 25px;line-height: 10px;" onclick="query()">查询</button>
		      </form>
		  </div>
		</div>
	 </div>
	 <div class="container" style="width: 98%;" id="homeframe-container">
	 	<div class="row" style="height: 30px;margin-top: 10px;">
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
				<table style="border-collapse: collapse;height: 28px;padding: 0px;margin: auto;width: 100%;">
					<tr>
					<td style="background-color: #C00000;width: 28px;"></td>
					<td style="width: 3px;"></td>
					<td style="background-color: #BFBFBF;text-align: left;padding-left: 10px;font-weight: bold;font-size: 14px;">专业销售现金流入分析</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row" style="height: 30px;margin-top: 10px;">
			<div id="table" class="col-xs-12 col-sm-12 col-md-12"  style="padding: 0px;">
			
			</div>
		</div>
	 </div>
	 
  </body>
</html>
