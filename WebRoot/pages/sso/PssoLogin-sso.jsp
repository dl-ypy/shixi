<%@page pageEncoding="utf-8" language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

   <%
     String returnurl = request.getParameter("rUrl");
     returnurl = returnurl==null?"":returnurl;
   %>

<html>

  <head>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

  </head>

  <body onload="javascript:document.checkForm.submit();">
  	<%-- 测试环境的action地址是http://sit3.portal.unicom.local:8080/eip_sso/rest/authentication/check_login --%>
  	<!--  
  	<form id="checkForm" name="checkForm" action="http://sit3.portal.unicom.local:8080/eip_sso/rest/authentication/check_login" method="GET">
    -->
  	<!--  -->
    <form id="checkForm" name="checkForm" action="http://sso.portal.unicom.local/eip_sso/rest/authentication/check_login" method="GET">
    
		<div id="divLogin" align="center">
		    <!--  -->
	        <input type="hidden"  name="success" value="http://jzgl.ha.unicom.local:8090/cwfw/sso/PssoLogin!login.action">
			<input type="hidden" name="error" value="http://jzgl.ha.unicom.local:8090/cwfw/Login!input.action">
			
			<!-- 
			<input type="hidden"  name="success" value="http://localhost:8888/cw/sso/PssoLogin!login.action">
			<input type="hidden" name="error" value="http://localhost:8888/cw/Login!input.action">
			-->
			<input type="hidden" name="appid" value="ha107">
			<input type="hidden" name="return" value="<%=returnurl%>">
		</div>
	</form>
  </body>
  
  
</html>