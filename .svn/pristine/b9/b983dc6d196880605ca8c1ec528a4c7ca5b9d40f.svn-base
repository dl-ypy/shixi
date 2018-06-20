<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="<%=contextPath%>/resources/js/jquery/1.12.0/jquery.min.js"></script>
<style type="text/css">
<!-- 
	body{ text-align:center}
-->
</style>
</head>

<body>

 <div style="height:100px;"></div>
 <div id="leanAjaxLoading"><img alt="" src="<%=contextPath%>/resources/sso/loading.gif"></div>
</body>

<script type="text/javascript">
	jQuery(document).ready(function(){
			var flowUrl = '${params.flowUrl}';
			var firstFlag = '${params.firstFlag}';
			//alert('flowUrl='+flowUrl + '  firstFlag=' + firstFlag);
			var url="";
			if(flowUrl == ""){
				flowUrl = "/";
				url = "<%=contextPath%>/";
			}else{
				url = "<%=contextPath%>" + flowUrl;
			}
			
			window.location.href = url;
	});
</script>

</html>
