<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>
<s:head />
<s:head template="head_ext.ftl" />
<link rel="stylesheet" type="text/less" href="../../struts/pure/msg/navigation.less" />
<script type="text/javascript" src="../../struts/pure/msg/less-1.3.0.min.js"> </script>
<script type="text/javascript" src="../../struts/pure/msg/pagingbox.js"> </script>
<script type="text/javascript" src="../../struts/pure/msg/jquery.jBox-2.3.min.js"> </script>
<link rel="stylesheet" type="text/css" href="../../struts/pure/msg/jbox.css" />
</head>
<body>
 	<div style="width:40px;margin-top:100px;margin-left:auto;margin-right:auto;"><a style="cursor:pointer;text-decoration:underline;" onclick="doMsgBox();">消息</a></div>	 
	<script type="text/javascript">
	var doMsgBox=function(){
  		jQuery.ajax({
		url:"${pageContext.request.contextPath}/pure/message/messagebox.action",
	    data:{},
	    success:function(data){
	    	
    		var msgBox=jQuery.jBox.open('html:'+data, "消息中心", 800,640,{loaded: function (h) { 
  			jQuery("input[type='text']").keydown(function(e){
				 if(e.keyCode==13){
					 return false;
				 }
			});}, top:10,left:0,buttons: {'关闭': true}});
	    }
		});
	};
	 	
 	</script>
</body>
</html>