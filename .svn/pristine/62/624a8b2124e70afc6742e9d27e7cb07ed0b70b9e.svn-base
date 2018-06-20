﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.bonc.pure.SystemConfigProperty"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<b:doctype/>
<html>
	<head>
		<s:head/>
		<style type="text/css">
		#pure-login-row #login form label.error{
			width:auto;
			color:red;
		}
		</style>
	</head>
	<body id="<%=SystemConfigProperty.LOGIN_LAYOUT%>">
		<div id="login" style="width: 776px; height: 446px; background: url('${pageContext.request.contextPath}/resources/img/bg.png');">
			<!-- 将cssClass="notTipError"去掉可隐藏提示不占用元素位置 -->
			<s:form action="Login" name="form1" id="loginForm" validate="true" cssClass="notTipError">
				<div class="errors" id="msg-error">${msg}</div>
				<div class="row">
					<label>用户名:</label>
					<s:textfield id="userLoginId" name="loginId" cssClass="{required:true, messages:{required:'请输入用户名'}}"/>
				</div>
				<div class="row">
					<label>密&nbsp;&nbsp;码:</label>
					<s:password id="userPassword" name="password" cssClass="{required:true, messages:{required:'请输入密码'}}"/>
				</div>
				<div class="row btn-row">
					<input id="submitId" type="submit" value="" class="btn-submit" onfocus="blur()"/>
				  	<input type="reset" class="btn-cancel" onfocus="blur()"/>
				</div>
			</s:form>
		</div>
		<script type="text/javascript">
		 setTimeout(function(){$j('#msg-error').html('');},1000);
		</script>
	</body>
</html>