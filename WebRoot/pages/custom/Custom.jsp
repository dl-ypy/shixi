<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>organization test</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap/3.3.6/bootstrap.min.css" media="screen">
	<link rel="stylesheet" type="text/css" href="../resources/frame/jedate-6.0.2/skin/jedate.css">
    <link rel="stylesheet" type="text/css" href="../resources/spk_resource/ztree/css/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/custom/organizationTree.css">
    <!--  
    <link rel="stylesheet" type="text/css" href="../resources/spk_resource/ztree/css/demo.css">
    -->
	<script type="text/javascript" src="../resources/js/jquery/1.12.0/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/frame/jedate-6.0.2/jquery.jedate.min.js"></script>
    <script type="text/javascript" src="../resources/spk_resource/ztree/js/jquery.ztree.core-3.5.min.js"></script>
	<script type="text/javascript" src="../resources/spk_resource/ztree/js/jquery.ztree.excheck-3.5.min.js"></script>
	
    <script type="text/javascript" src="../resources/js/custom/organizationTree.js"></script>
<script type="text/javascript">
  jQuery(document).ready(function(){
	  bonc_hn_ztree_initZTree("citySel");
  });
</script>
  </head>
  
  <body>
        <h1>带 checkbox 的多选下拉菜单  -- zTree</h1>
		<h6>[ 文件路径: super/select_menu_checkbox.html ]</h6>
		<div class="content_wrap">
			<div class="zTreeDemoBackground left">
				<ul class="list">
					<li class="title">&nbsp;&nbsp;<span class="highlight_red">勾选 checkbox 或者 点击节点 进行选择</span></li>
					<li class="title">&nbsp;&nbsp;Test: <input id="citySel" type="text" readonly value="" style="width:120px;" onclick="bonc_hn_ztree_showMenu();" />
				    </li>
				</ul>
			</div>
			<div class="right">
				<ul class="info">
					<li class="title"><h2>实现方法说明</h2>
						<ul class="list">
						<li>用 checkbox 也可以轻松实现多选的下拉菜单</li>
						<li>此 Demo 主要用于 和 其他下拉菜单进行对比</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
  </body>
</html>
