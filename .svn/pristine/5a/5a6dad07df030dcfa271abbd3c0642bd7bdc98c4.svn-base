<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="com.bonc.pure.SystemConfigProperty"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
</head>
<body>
	<form action="http://127.0.0.1:8090/cas/login" id="form" method="post">
		<input type="hidden" name="service" value="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<input type="hidden" name="3rduser" value="<%=request.getAttribute("3rduser") %>" />
		<input type="hidden" name="3rdpass" value="<%=request.getAttribute("3rdpass") %>" />
 	</form>
 	<script type="text/javascript">
 		document.getElementById('form').submit();
 	</script>
</body>
</html>