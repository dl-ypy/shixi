<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%
	String contextPath = request.getContextPath()+"/branportal/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
response.addHeader("Expires", "Thu, 01 Jan 1970 00:00:01 GMT"); 
%>
<title>财务基础数据导入列表</title>
<link href="<s:url value="/resources/portal/css/presidentbase.css"/>" rel="stylesheet" type="text/css"/>
<link href="<s:url value="/resources/portal/css/portal-new.css"/>" rel="stylesheet" type="text/css"/>
<link href="<s:url value="/resources/portal/css/calendar.css"/>" rel="stylesheet" type="text/css"/>
<SCRIPT type="javascript" src="<s:url value="/resources/portal/js/cal2.js"/>" defer="true"></SCRIPT>
<script type="text/javascript" src="<s:url value="/pages/cnc/portal/swfobject.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/portal/js/tablesort.js"/>"></script>
<link href="<s:url value="/struts/base/css/base.css?ver=1.0.1"/>" rel="stylesheet" type="text/css"/>
<link href="<s:url value="/struts/pure/css/red.css?ver=1.0.1"/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<s:url value="/struts/jquery/jquery-1.7.1.min.js?ver=1.0.1"/>"></script>
<script type="text/javascript" src="<s:url value="/struts/jquery/jquery.bgiframe.min.js?ver=1.0.1"/>"></script>
<script type="text/javascript" src="<s:url value="/struts/jquery/jquery.metadata.js?ver=1.0.1"/>"></script>
<script type="text/javascript" src="<s:url value="/struts/jquery/jquery.validate.min.js?ver=1.0.1"/>"></script>
<script type="text/javascript" src="<s:url value="/struts/jquery/jquery.event.drag.min.js?ver=1.0.1"/>"></script>
<script type="text/javascript" src="<s:url value="/struts/jquery/messages_cn.js?ver=1.0.1"/>"></script>
<script type="text/javascript">$j = jQuery.noConflict();</script>
<script type="text/javascript" src="<s:url value="/struts/My97DatePicker/WdatePicker.js?ver=1.0.1"/>" defer="defer"></script>
<script type="text/javascript" src="<s:url value="/struts/base/js/base.js?ver=1.0.1"/>"></script>
<script type="text/javascript">jQuery.extend(Bonc.Constants,{WEB_APP_CONTEXT_PATH:Bonc._getContextPath('/struts/base/js/base.js'),WEB_APP_ACTION_EXTENSION:'action',BLANK_IMAGE_URL:Bonc._getContextPath('/struts/base/js/base.js')+'/struts/base/s.gif'});</script>
<script type="text/javascript" src="<s:url value="/struts/pure/js/pure02.js?ver=1.0.1"/>"></script>
<link href="<s:url value='/resources/portal/jquery/css/jquery.ui.custom.css'/>" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<s:url value='/struts/jquery/jquery-ui-1.8.16.custom.min.js'/>"></script>
<style>
.mainNavDiv {width:100%; height: 20px; margin-top: 2px;border-bottom: 1px solid #C00;}
.selected{width:89px;height:20px;background-image:url(<b:url value='/resources/portal/img/tab01.jpg'/>);}
.unselected{width:89px;height:20px;background-image:url(<b:url value='/resources/portal/img/tab02.jpg'/>);}
ul{list-style:none;}
li{float:left; width:89px;height:20px;text-align:center;margin-right:2px}
.navSpan{
width:89px;color:white;font-weight:bold;line-height:20px;vertical-align:-8%;
}
</style>

<script type="text/javascript">
function monthOpenpicker() {
	jQuery('#selectMonth').attr('value', jQuery('#monthId').val());
	WdatePicker({
		el : 'selectMonth',
		dateFmt : 'yyyyMM',
		onpicked : function() {
			jQuery('#monthId').attr('value', jQuery('#selectMonth').val());
		}
	});
}

function queryList() {
	var excelId = jQuery('#excelId').val();
	var monthId = jQuery('#monthId').val();
	jQuery.ajax({
		url:"CwImport!queryList.action",
		type:"POST",
		data:{
			  "param.monthId": monthId,
			  "param.excelId": excelId
			  },
		cache:false,
		success:function(html) {
			jQuery("#mainDiv").html(html);
		}
	});
}

jQuery(document).ready(function() {
	queryList();
});

function showImpResult(logId, excelId) {
	new Bonc.Window({
		id:'imp-result-window-' + logId,
		resizable: true,
		dragable:false,
		height:350,
		width:610,
		title:'导入结果查看',
		url:Bonc.toFullPath('/cw/imp/CwImport!showImpResult.action?param.logId='+logId+'&param.excelId='+excelId)
   	});
}

function impTableList(logId, excelId) {
	jQuery("#nav1").addClass("selected");
	jQuery("#nav1").removeClass("unselected");
	jQuery("#nav2").addClass("unselected");
	jQuery("#nav2").removeClass("selected");
	jQuery.ajax({
		url:"CwImport!impTableList.action",
		type:"POST",
		data:{
			  "param.logId": logId,
			  "param.excelId": excelId
			  },
		cache:false,
		success:function(html) {
			jQuery("#navTableDiv").html(html);
		}
	});
}

function impErrorList(logId, excelId) {
	jQuery("#nav1").addClass("unselected");
	jQuery("#nav1").removeClass("selected");
	jQuery("#nav2").addClass("selected");
	jQuery("#nav2").removeClass("unselected");
	jQuery.ajax({
		url:"CwImport!impErrorList.action",
		type:"POST",
		data:{
			  "param.logId": logId,
			  "param.excelId": excelId
			  },
		cache:false,
		success:function(html) {
			jQuery("#navTableDiv").html(html);
		}
	});
}
</script>
</head>
<body>
<input type="hidden" id="orgId" value='<s:property value="param.orgId"/>' />
<input type="hidden" id="selectMonth" name="selectMonth"/>

<div>
<p style="margin-right:5px;text-align:right;font-size:10pt;color:#2A5685;">
	账期：
	<input name="monthId" id="monthId" type="text" value="<s:property value="param.monthId"/>" style="width: 80px; height: 15px" readonly="readonly" onClick="monthOpenpicker();"/>
	<img src="<%=request.getContextPath()%>/struts/base/s.gif" style="vertical-align: middle; cursor: pointer; margin-bottom:5px;" class="datetimepicker" onClick="monthOpenpicker();"/>
	文件类型：
	<s:select name="param.excelId" id="excelId" headerKey="-1" headerValue="---------- 请选择 ----------" listKey="EXCEL_ID" listValue="EXCEL_NAME" list="list"></s:select>
	<input type="button" value=" 查  询  " onclick="queryList()"/>
</p>
</div>
<div class="portlet-handler" >
<div class="portlet-title">财务基础数据导入列表</div>
</div>
<div id="mainDiv">
</div>
<br/>
<br/>
</body>
</html>

