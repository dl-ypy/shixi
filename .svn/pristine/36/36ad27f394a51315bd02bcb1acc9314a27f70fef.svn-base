<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>工作台</title>
		<link rel="stylesheet" type="text/css" href="<s:url value='/struts/ext4/resources/ext-theme-gray/ext-theme-gray-all.css'/>" />
		<link rel="stylesheet" type="text/css" href="<s:url value='/struts/vfront/themes/theme-classic/theme-classic.css'/>" />
	    <s:head />
	</head>
	<body style="overflow-x: hidden;">
		<script type="text/javascript" src="<s:url value='/struts/ext4/ext-all.js'/>"></script>
		<script type="text/javascript" src="<s:url value='/struts/ext4/locale/ext-lang-zh_CN.js'/>"></script>
		<script type="text/javascript" src="<s:url value='/struts/ext4/ux/TreePicker.js'/>"></script>
		<script type="text/javascript" src="<s:url value='/struts/vfront/VFront.js'/>"></script>
		<script type="text/javascript" src="<s:url value='/struts/vfront/Ext4Fix.js'/>"></script>
		<script type="text/javascript">
			Ext.Loader.setConfig({
				enabled : true,
				disableCaching : false,
				paths : {
					'VFront' :  VFront.toFullPath('/struts/vfront/src'),
					'Pure' :  VFront.toFullPath('/struts/pure/js')
					}
			    });
			Ext.onReady(function() {
				Ext.QuickTips.init();
				Ext.require(['Pure.customportal.ModelPanel'], function() {
					 VFront.setWidgetType({
							'model' : 'Pure.customportal.ModelPanel'
						});
					Ext.override(Pure.customportal.ModelPanel,{
						status : 'edit'
					});
					Ext.create('Pure.customportal.CustomPortalApp', {
						status:'custom',
						title:'自定义',
						isFirstCustom :'${isFirstCustom}',
						config : {
							   id:'${customPortalBasic.id}',
						       name:'${customPortalBasic.name}',
						       remark:'${customPortalBasic.remark}',
						       portalParentId:'${customPortalBasic.portalParentId}',
						       theme:'${customPortalBasic.ext1}',
						       content:${customPortalBasic.content}
						}
					});
				});
			});
		</script>
	</body>
</html>