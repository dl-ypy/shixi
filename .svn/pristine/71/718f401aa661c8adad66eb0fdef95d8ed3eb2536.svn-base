<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<b:doctype />
<html>
	<head>
		<s:head />
	</head>
  <body>
	<div class="message-box icon-big-error" style="background-color:#FFFFE0">
			<p style="font-size: 16px;">系统异常，请查看日志或者联系管理员！<p />
			 <s:if test="%{#request.errorMsg!=null}">   
		    	<p>错误详细信息:</p>
			    <p>${errorMsg}</p>   
			</s:if>
   </div> 
  </body>
</html>