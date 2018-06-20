<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="com.bonc.pure.SystemConfigProperty"%>
<html>
<head>
<script type="text/javascript">
	var openWindowName = 'boncWin', action = 'pure/Frame.action', fullScreen = <%=SystemConfigProperty.FRAME_FULL_SCREEN%> ;
	if (fullScreen === true && document.uniqueID && window.name !== openWindowName) {
		var boncWin=window.open(action,
					'boncWin',
					'toolbar=no,location=no,directories=no,status=yes,menubar=0,scrollbars=yes,resizable=yes,left=Left,top=Top,width=' + screen.availWidth + ',height=' + screen.availHeight);
		if(null!=boncWin){
			window.opener = null;
			window.open('', '_self');
			window.returnValue = 'TEST';
			window.close();
		}else {
			alert("您的浏览器开启了窗口阻止程序，请将本系统地址加入信任站点或者关闭窗口阻止程序重试");
		}
	} else {
		window.location.href = action;
	}
</script>
</head>
<body>您已经成功登录。页面正在跳转中...</body>
</html>