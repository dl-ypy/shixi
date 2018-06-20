<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page
	import="com.bonc.pure.domain.Resources,java.util.List,com.bonc.pure.PureUtils,java.net.URLEncoder,org.apache.struts2.ServletActionContext,java.lang.Math,com.bonc.pure.web.util.WebIconUtil,com.bonc.pure.web.util.ResourceUrlHandlerUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<title>财务效益评估</title>
<!-- 国产浏览器高速模式 -->
<meta name="renderer" content="webkit">
<!-- 禁用 IE 兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- 移动设备视口 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link href="${pageContext.request.contextPath}/resources/icons/favicon.ico" rel="shortcut icon">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap/3.3.5/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/epm/0.1.0/epm.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/matrix.css" rel="stylesheet">
<!--[if lt IE 9]>
      <link href="${pageContext.request.contextPath}/resources/css/epm/0.1.0/epm-compatibility.css" rel="stylesheet">
      <script src="${pageContext.request.contextPath}/resources/js/html5shiv/3.7.3/html5shiv.js"></script>
      <script src="${pageContext.request.contextPath}/resources/js/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<input type="hidden" value="${pageContext.request.contextPath}" id="contextPath"/>
<div class="matrix">
<center>
	<div style="height: 200px; width: 929px;">&nbsp;</div>
	<div class="matrix-layout" style="width: 929px;">
		<%
		  String[] colors = {"#9999FF","#00FF00","#0099FF","#CC99FF","#CC9966","#FF6633","#1AE61A","#BD1AE6","#E6E61A"};
		  Resources res0 = (Resources)ServletActionContext.getRequest().getSession().getAttribute("pureResources");
		  if(res0!=null){
		  	List<Resources> ress = res0.getChildren();
		  	if(ress!=null && ress.size()>0){
		  	    
		  		for(Resources res1:ress){
		  		  String resourceId = res1.getResourcesId();
		  		  String url = ResourceUrlHandlerUtil.getResourceUrl(res1);
		  		  int random=1+(int)(Math.random()*(colors.length - 1));
					  %>
				<a href="${pageContext.request.contextPath}/BFrame.action?id=<%=resourceId%>"> 
		        	<div class="comp" style="background-color:<%=(res1.getExt4() != null && !"".equals(res1.getExt4()) && res1.getExt4().startsWith("#")) ? res1.getExt4() : colors[random]%>">
						<%=WebIconUtil.getIconHtml((res1.getExt3() == null || "".equals(res1.getExt3())) ? "th-large" : res1.getExt3())%>
						<span class="innerText" style="text-align:center;font-size:18px;font-family:微软雅黑;"><%=res1.getResourcesName()%></span>
					</div>
				</a>
				<%
					}
				}
			}
			%>
	</div>
</center>
</div>
	<div class="pagi">
		<div class="prev" title="Previous"></div>
		<div class="next" title="Next"></div>
	</div>
	<div class="epm-frame-account systool">
        <div class="overview" title="${epmFramePureUser.userName}">
      	  <span class="username">${epmFramePureUser.userName}</span>
      	  <span class="glyphicon glyphicon-user userImg"></span>
      	</div>
      	<div class="panel extend-box" style="display:none;">
      	  <div class="info">
      	    <img class="icon" alt="${epmFramePureUser.userName}" src="${pageContext.request.contextPath}/resources/images/user-icon-demo.png">
      	    <div class="username">${epmFramePureUser.userName}</div>
      	    <c:if test="${not empty epmFramePureUser.email}"><div class="email">${epmFramePureUser.email}</div></c:if>
      	  </div>
      	  <ul>
      	    <!-- <li><a>假装都能点</a></li>
      	    <li><a>首选项</a></li>
      	    <li><a>账户设置</a></li> -->
      	    <li class="divider"></li>
      	    <li><a href="${pageContext.request.contextPath}/Logout.action"><span class="glyphicon glyphicon-log-out"></span> 注销</a></li>
        <li><a  target="_blank" href="${pageContext.request.contextPath}/pure/ModifyPwd.action"><span class="glyphicon glyphicon glyphicon-lock"></span> 修改密码</a></li>
	
      	  </ul>
      	</div>
    </div>
	<div class="authority">
		<span class="copyright">
		© 2016 &nbsp;&nbsp;|&nbsp;&nbsp;ChinaUnicom&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a class="company-link" href="http://www.bonc.com.cn" target="_blank">BONC</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		</span>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap/3.3.5/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery/plugins/bgswitcher/jquery.bgswitcher.js"></script>
	<script>
        $(function(){
        	//处理IE8居中问题
        	//if(!window.addEventListener){ 
        	//	$(".matrix-layout").css("left",224);
        	//	$(".matrix-layout").css("top",152);
       		//}
        	var contextPath = $("#contextPath").val();
        	var array = new Array();
        	array.push(contextPath+"/resources/images/matrix.jpg");
        	array.push(contextPath+"/resources/images/matrix_1.jpg");
        	array.push(contextPath+"/resources/images/matrix_2.jpg");
        	array.push(contextPath+"/resources/images/matrix_3.jpg");
        	array.push(contextPath+"/resources/images/matrix_4.jpg");
        	array.push(contextPath+"/resources/images/matrix_5.jpg");
        	var $el = $(".matrix").bgswitcher({
	      		  images: array,
	      		  interval: 5000,
	    		  loop: true
    		});
        	$(".next,.prev").click(function(){
        		$el.bgswitcher("select", parseInt(5*Math.random())); // 
        	});
        	//依次展示模块
        	var timer = 0;
       		showComp();
        	function showComp(){
           		$(".comp").delay(100).eq(timer).fadeIn("fast");
           		timer++;
           		if(timer < $(".comp").length){
        			showComp();
           		}
        	} 
			$(document).click(function() {
				$(".extend-box").slideUp("fast");
			})
			$(".overview").click(function(event){
				event.stopPropagation();
				$(".extend-box").slideToggle("fast");
			});
        });
    </script>
	</body>
	</html>
