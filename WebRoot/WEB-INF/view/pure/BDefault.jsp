<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>智能营销平台</title>
  <meta name="description" content="Tutorial : Flyout Image Slider Using jQuery & CSS3">
  <meta name="author" content="Webstuffshare">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/spk_resource/global/js/main/demo.css?v=2">
  <script src="${pageContext.request.contextPath}/resources/spk_resource/global/js/main/modernizr.custom.34807.js"></script>
</head>
<body>

  <div id="container">
    <div id="itemlist">
    	<img src="${pageContext.request.contextPath}/resources/spk_resource/global/img/busby.jpg" alt="Busby" id="busby" />
      <img src="${pageContext.request.contextPath}/resources/spk_resource/global/img/gridly.jpg" alt="Gridly" id="gridly" />
      <img src="${pageContext.request.contextPath}/resources/spk_resource/global/img/reco.jpg" alt="Reco" id="reco" />
      <img src="${pageContext.request.contextPath}/resources/spk_resource/global/img/theblog.jpg" alt="Theblog" id="theblog" />
    </div>
    <div id="itemdescription">
      <span data-for="busby">Busby Theme</span>
      <span data-for="gridly">Gridly Theme</span>
      <span data-for="reco">Reco Theme</span>
      <span data-for="theblog">The Blog Theme</span>
    </div>
  </div>  
  
  <script> if(!Modernizr.csstransforms3d) document.getElementById('information').style.display = 'block'; </script>
  <script>!window.jQuery && document.write(unescape('%3Cscript src="${pageContext.request.contextPath}/resources/spk_resource/global/js/main/jquery-1.7.2.min.js"%3E%3C/script%3E'))</script>
  <script src="${pageContext.request.contextPath}/resources/spk_resource/global/js/main/demo.js"></script>
</body>
</html>