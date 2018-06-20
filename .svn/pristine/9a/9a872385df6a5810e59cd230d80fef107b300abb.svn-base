<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="com.bonc.pure.PureConstant"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
<head>
<s:head />
<style>
</style>
</head>
<body>
	<s:if test="dataList.size>1">
		<ul id="tabMenu" class="menu-tab">
			<s:iterator value="dataList">
			<li><a url="${url}">${resourcesName}</a></li>
			</s:iterator>
		</ul>
		<div class="float-clear"></div>
		<div id="tip" style="padding:20px;color:#000;text-shadow: 3px 3px 3px #e2e2e2;">正在加载中，请耐心等待...</div>
		<iframe id="tabIframe" name="tabIframe" scrolling="auto" frameborder="no" border="0" width="100%"></iframe>
		<script type="text/javascript">
			var $items=$j('#tabMenu li a'),$iframe=$j('#tabIframe'),$tip=$j('#tip');
			$items.click(function(){
				$items.removeClass('selected');
				$tip.show();
				$iframe.hide().attr('src',Bonc.joinParameters($j(this).addClass('selected').attr('url'),'<%=PureConstant.PAGE_PARAMETER_NAME%>=<%=request.getParameter(PureConstant.PAGE_PARAMETER_NAME)%>'));
			}).first().click();
			$iframe.load(function(){
				$tip.hide();
				$iframe.show();
			});
			$j(window).resize(function(){
				setTimeout(function(){
					$iframe.height($j(window).height() - $j('#tabMenu').outerHeight()-10);
				},100);
			}).resize();
		</script>
	</s:if>
	<s:elseif test="dataList.size==1">
	<script type="text/javascript">
		location.href=Bonc.joinParameters('${dataList[0].url}','<%=PureConstant.PAGE_PARAMETER_NAME%>=<%=request.getParameter(PureConstant.PAGE_PARAMETER_NAME)%>');
		</script>
	</s:elseif>
	<s:else>找不到相应的资源</s:else>
</body>
</html>