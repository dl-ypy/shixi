<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>财务效益评估</title>

<!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/bootstrap.jsp" %>
<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/resources/spk_resource/frame/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/spk_resource/frame/css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/spk_resource/frame/css/style.min.css?v=4.0.0" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/spk_resource/frame/css/plugins/toastr/toastr.min.css" rel="stylesheet">
<c:if test="${id != null}">
<link href="${pageContext.request.contextPath}/resources/css/epm/0.1.0/epm.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/matrix.css" rel="stylesheet">
	<style>
		.compMini {
			position: relative;
			width: 94px;
			height: 94px;
			float: left;
			margin: 3px;
		}
		.compMini .epm-icon {
			font-size: 35px;
			color: white;
			overflow: hidden;
			position: absolute;
			left: 29px;
			top: 18px;
		}
		.miniDiv {
			position:fixed;
			top:55px;
			left:215px;
			z-index:99999;
			width: 518px;
			height: 210px;
			margin-top: 12px;
			margin-left: 12px;
			border: 1px solid #888;
			box-shadow: 2px 2px 5px #ccc;
			border-radius: 5px;
			background-color: #fff;
			overflow-y: auto;
			overflow-x:hidden;
			opacity:1;
			transition: opacity 0.3s 0.3s ease-in-out;
			visibility: hidden;
		}
	</style>
</c:if>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden; font-family:Helvetica Neue,Helvetica,Microsoft Yahei Light,Microsoft Yahei,Hiragino Sans GB,WenQuanYi Micro Hei,sans-serif!important">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<div style="color: #ADCFFF; font-size: 30px; padding-top: 15px; padding-left: 23px;">效益评估</div>
				<ul class="nav" id="side-menu">
					<c:if test="${id != null}">
 					<li onmouseover="showMini()" onmouseout="hiddenMini()">
						<a href="${pageContext.request.contextPath}/BIndex.action" style="color: #ADCFFF">
							<i class="fa fa-home"></i> <span>首页</span> <span class="fa"></span>
	                	</a>
	                	<div id="start-panel" class="miniDiv" onmouseover="showMini()" onmouseout="hiddenMini()"></div>
 					</li>
					</c:if>
                    <c:forEach items="${menu}" var="resource">
						<c:if test="${resource.children == null }">
							<li>
								<c:if test="${resource.url == null }">
									<a class="J_menuItem" href="${pageContext.request.contextPath}/BDefault.action?resourceId=${resource.id}" id="a_${resource.id}">
										<i class="glyphicon glyphicon-th"></i> <span class="nav-label">${resource.text }</span> <span class="fa"></span>
					                </a>
								</c:if>
								<c:if test="${resource.url != null }">
									<a class="J_menuItem" href="${pageContext.request.contextPath}${resource.url }" id="a_${resource.id}">
										<i class="glyphicon glyphicon-th"></i> <span class="nav-label">${resource.text }</span> <span class="fa"></span>
					                </a>
								</c:if>
			                </li>
						</c:if>
						<c:if test="${resource.children != null }">
							<li>
								<a href="#" id="a_${resource.id}"> 
									<i class="fa fa-columns"></i> 
									<span class="nav-label">${resource.text }</span> <span class="fa arrow"></span>
						        </a>
								<ul class="nav nav-second-level">
								    <c:forEach items="${resource.children }" var="firResource">
									    <c:if test="${firResource.children == null }">
										    <c:if test="${firResource.url == null }">
										    <li><a class="J_menuItem" href="${pageContext.request.contextPath}/BDefault.action?resourceId=${firResource.id}" id="a_${firResource.id}">${firResource.text }</a></li>
										    </c:if>
										    <c:if test="${firResource.url != null }">
										    <li><a class="J_menuItem" href="${pageContext.request.contextPath}${firResource.url}" id="a_${firResource.id}">${firResource.text }</a></li>
										    </c:if>
									    </c:if>
									    <!-- fa-certificate -->
									    <c:if test="${firResource.children != null }">
									    <li><a href="#" id="a_${firResource.id}"><i class="fa fa-circle-o"></i>${firResource.text } <span class="fa arrow"></span></a>
									    <ul class="nav nav-third-level">
									    <c:forEach items="${firResource.children }" var="secResource"> 
										    <c:if test="${secResource.url == null }">
										    <li><a class="J_menuItem" href="${pageContext.request.contextPath}/BDefault.action?resourceId=${secResource.id}" id="a_${secResource.id}"><i class="fa fa-star"></i>${secResource.text }</a></li>
										    </c:if>
										    <c:if test="${secResource.url != null }">
										    <li><a class="J_menuItem" href="${pageContext.request.contextPath}${secResource.url}" id="a_${secResource.id}"><i class="fa fa-star"></i>${secResource.text }</a></li>
										    </c:if>
									    </c:forEach>
									    </ul>
									    </li>
									    </c:if>
								     </c:forEach> 
								</ul>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#" onclick="changeWindowSize()"><i class="fa fa-bars"></i> </a>
							
						<form role="search" class="navbar-form-custom" method="post" action="search_results.html">
							<div class="form-group">
								<!-- 
								<input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
								 -->
							</div>
						</form>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<!-- 
						<li class="dropdown hidden-xs"><a class="right-sidebar-toggle" aria-expanded="false"> <i class="fa fa-tasks"></i> 设置
						</a>
						</li>
						 -->
					</ul>
				</nav>
			</div>
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
				<!-- 
						<a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
				 -->
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<!--  <a href="login.html" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>-->
				<a data-toggle="dropdown" class="roll-nav roll-right J_tabExit" href="#">
				<span class="clear">
					<span class="text-muted text-xs block"><s:property value="param.userName"/><b class="caret"></b></span>
				</span>
				</a>
				<ul role="menu" class="dropdown-menu dropdown-menu-right">
					<!-- <li><a class="J_menuItem" href="">修改头像</a></li>
					<li><a class="J_menuItem" href="">个人资料</a></li>
					<li><a class="J_menuItem" href="">联系人</a></li>
					<li><a class="J_menuItem" href="">信箱</a></li>
					<li class="divider"></li> -->
					<li><a target="_blank" href="${pageContext.request.contextPath}/pure/ModifyPwd.action">修改密码</a></li>
					<li><a href="javascript:loginout();">安全退出</a></li>
				</ul>
			</div>
			<div class="row J_mainContent" id="content-main" >
				<iframe class="J_iframe" name="iframe0"  width="100%" height="100%" src="" frameborder="0" data-id="" seamless>
				</iframe>
			</div>
			<div class="footer">
				<div class="pull-right">
					&copy; 2014-2016 <a href="http://www.bonc.com.cn/" target="_blank">BONC</a>
				</div>
			</div>
		</div>
		<!--右侧部分结束-->
		<!--右侧边栏开始-->
		<div id="right-sidebar">
			<div class="sidebar-container">
				<ul class="nav nav-tabs navs-3">
					<li class="active">
					<a data-toggle="tab" href="#tab-1"> <i class="fa fa-gear"></i>主题</a>
					</li>
					<!-- <li class=""><a data-toggle="tab" href="#tab-2"> 通知 </a></li>
					<li><a data-toggle="tab" href="#tab-3"> 项目进度 </a></li> -->
				</ul>

				<div class="tab-content">
					<div id="tab-1" class="tab-pane active">
						<!-- <div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 主题设置
							</h3>
							<small><i class="fa fa-tim"></i>
								你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
						</div> -->
						<div class="skin-setttings">
							<div class="title">主题设置</div>
							<div class="setings-item">
								<span>收起左侧菜单</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
										<label class="onoffswitch-label" for="collapsemenu">
											<span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span>固定顶部</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar"> 
											<label class="onoffswitch-label" for="fixednavbar"> 
											<span class="onoffswitch-inner"></span> 
											<span  class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span>固定宽度</span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
										<label class="onoffswitch-label" for="boxedlayout">
											<span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="title">皮肤选择</div>
							<div class="setings-item default-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-0">
									默认皮肤 </a>
								</span>
							</div>
							<div class="setings-item blue-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-1">
									蓝色主题 </a>
								</span>
							</div>
							<div class="setings-item yellow-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-3">
									黄色/紫色主题 </a>
								</span>
							</div>
							<div class="title">显示方式</div>
							<div class="setings-item">
								<span>切到纵屏</span>
								<div class="switch">
									<div class="btn btn-success btn-sm">
										<span > <a href="javascript:toRows();"><i class="fa fa-reorder"> </i></a>
										</span>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span>切到全屏</span>
								<div class="switch">
									<div >
										<span >
										<a href="javascript:tofullScreen();" class="btn btn-success btn-xs navbar-minimalize minimalize-styl-2" style="padding:0px 8px;">
										 <i class="fa fa-laptop"> </i>
										 </a>
										</span>
									</div>
								</div>
							</div>
							<!-- <div class="btn btn-block btn-outline btn-success">
								<span > <a href="javascript:toRows();">
										切到纵屏 </a>
								</span>
							</div> -->
							<!-- <div >
								<span > <a href="javascript:tofullScreen();" class="btn btn-success btn-outline navbar-minimalize minimalize-styl-2">
										<i class="fa fa-desktop"> </i>&nbsp;&nbsp;全屏 </a>
								</span>
							</div> -->
						</div>
					</div>
				</div>

			</div>
		</div>
		<!--右侧边栏结束-->
		<!--mini聊天窗口开始-->
		<!-- 
		<div class="small-chat-box fadeInRight animated">

			<div class="heading" draggable="true">
				<small class="chat-date pull-right"> 2015.9.1 </small> 与 管理员 聊天中
			</div>

			<div class="content">

				<div class="left">
					<div class="author-name">
						管理员 <small class="chat-date"> 10:02 </small>
					</div>
					<div class="chat-message active">你好</div>

				</div>
				<div class="right">
					<div class="author-name">
						游客 <small class="chat-date"> 11:24 </small>
					</div>
					<div class="chat-message">你好，请问有帮助文档吗？</div>
				</div>
			</div>
			<div class="form-chat">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control"> <span
						class="input-group-btn">
						<button class="btn btn-primary" type="button">发送</button>
					</span>
				</div>
			</div>

		</div>
		<div id="small-chat">
			<span class="badge badge-warning pull-right">5</span> <a
				class="open-small-chat"> <i class="fa fa-comments"></i>

			</a>
		</div>
		 -->
	</div>
	
	<script>
		var rootPath = '${pageContext.request.contextPath}';
		function loginout() {
			top.jConfirm("确定要退出",null,function(){
				location.href = "${pageContext.request.contextPath}/Logout.action";
				
			});
		}
	</script>

	<script src="${pageContext.request.contextPath}/resources/spk_resource/frame/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${pageContext.request.contextPath}/resources/spk_resource/frame/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/spk_resource/frame/js/plugins/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath}/resources/spk_resource/frame/js/boncfront.min.js?v=4.0.0"></script>
	<script src="${pageContext.request.contextPath}/resources/spk_resource/frame/js/contabs.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/spk_resource/frame/js/plugins/pace/pace.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/spk_resource/frame/js/plugins/toastr/toastr.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/spk_resource/global/js/main.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		//$("#content-main iframe").attr("src",'${pageContext.request.contextPath}/main/mainpage.do');
		//$("#a_gxt_old").click();
		<c:if test="${id != null}">
		$('#start-panel').load('BIndex.action', {'mini': true});
		</c:if>
		<s:property value="param.click"/>
	});
	$("mainrows").click(function(){
		var b= $("input[name='mainrows']:checked")
		var a=document.getElementById("mainrows");
		// alert("11"+b);
	});
	 function toRows(){
		 location.href = "${pageContext.request.contextPath}/main/mainrows.do";
	 }

	var isMaxWindow = false; // 窗口是否最大化，最大化时展示mini一级菜单样式有问题
	function changeWindowSize() {
		if (isMaxWindow) {
			isMaxWindow = false;
		} else {
			isMaxWindow = true;
		}
	}

	<c:if test="${id != null}">
	var isMiniShow = false;
	function showMini() {
		if (!isMaxWindow) { // 窗口是否最大化，最大化时展示mini一级菜单样式有问题
			isMiniShow = true;
			$('#start-panel').css("visibility", "visible");
		}
	}

	function hiddenMini() {
		isMiniShow = false;
		setTimeout("doHiddenMini()", 500);
	}

	function doHiddenMini() {
		if (!isMiniShow) {
			$('#start-panel').css("visibility", "hidden");
		}
	}
	</c:if>

	// 新建框架Tab页  使用方法: parent.newTabPage("11144", "www.baidu.com", "百度");
	function newTabPage(id, href, text) {
		if (void 0 == href || 0 == $.trim(href).length) return;
		var ishave = false;
		$(".J_menuTab").each(function() {
			if (!ishave) {
				if ($(this).data("id") == href) {
					$(this).click();
					ishave=true;
				}
			}
		});
		if (!ishave) {
			var s = '<a href="javascript:;" class="active J_menuTab" data-id="' + href + '">' + text + ' <i class="fa fa-times-circle"></i></a>';
			$(".J_menuTab").removeClass("active");
			var r = '<iframe class="J_iframe" name="iframe' + id + '" width="100%" height="100%" src="' + href + '" frameborder="0" data-id="' + href + '" seamless></iframe>';
			$(".J_mainContent").find("iframe.J_iframe").hide().parents(".J_mainContent").append(r);
			var o = layer.load();
 			$(".J_mainContent iframe:visible").load(function() {
				layer.close(o)
			}),
			$(".J_menuTabs .page-tabs-content").append(s),
			e($(".J_menuTab.active"));
		}
	}

	// 刷新框架Tab页  使用方法: parent.refreshTabPage("11144", "www.baidu.com");
	function refreshTabPage(id, href) {
		if (void 0 == href || 0 == $.trim(href).length) return;
		$(".J_menuTab").each(function() {
			if ($(this).data("id") == href) {
				$(this).click();
				$(this).dblclick();
				return;
			}
		});
	}
	</script>
</body>

</html>
