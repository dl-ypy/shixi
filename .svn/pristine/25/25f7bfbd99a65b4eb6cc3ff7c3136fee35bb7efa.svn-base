<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
   <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title><s:if test="customPortalBasic.name==null">工作台</s:if><s:else>${customPortalBasic.name }</s:else></title>
		<link rel="stylesheet" type="text/css" href="<s:url value='/struts/ext4/resources/ext-theme-gray/ext-theme-gray-all.css'/>" />
		<link rel="stylesheet" type="text/css" href="<s:url value='/struts/vfront/themes/theme-classic/theme-classic.css'/>" />
		<s:head />
		<style type="text/css">
			.vfront-table-layout-cell {
				height:0;
			    padding: 0;
			    margin:0;
			    vertical-align: top;
			}
			
			.vfront-table-layout {
			    border-collapse: collapse;
			    font-size: 1em;
			    table-layout: fixed;
			    width: 100%;
			    height:0;
			}
		</style>
	</head>
	<body style="overflow-x: hidden;">
		<script type="text/javascript" src="<s:url value='/struts/ext4/ext-all.js'/>"></script>
		<script type="text/javascript" src="<s:url value='/struts/ext4/locale/ext-lang-zh_CN.js'/>"></script>
		<script type="text/javascript" src="<s:url value='/struts/ext4/ux/TreePicker.js'/>"></script>
		<script type="text/javascript" src="<s:url value='/struts/vfront/VFront.js'/>"></script>
		<script type="text/javascript" src="<s:url value='/struts/vfront/Ext4Fix.js'/>"></script>
		<script type=text/javascript>
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
				var theme = '${customPortalBasic.ext1}';
				if(theme =='gray'){
					Ext.util.CSS.swapStyleSheet('css','<s:url value="/struts/ext4/resources/ext-theme-gray/ext-theme-gray-all.css"/>');
				}else if(theme =='classic'){
					Ext.util.CSS.swapStyleSheet('css','<s:url value="/struts/ext4/resources/ext-theme-classic/ext-theme-classic-all.css"/>');
				}else if(theme =='access'){
					Ext.util.CSS.swapStyleSheet('css','<s:url value="/struts/ext4/resources/ext-theme-access/ext-theme-access-all.css"/>');
				}
				Ext.require(['Pure.customportal.ModelPanel'], function() {
					 VFront.setWidgetType({
							'model' : 'Pure.customportal.ModelPanel'
						});
					Ext.override(Pure.customportal.ModelPanel,{
						status : 'view'
					});
					Ext.create('Pure.customportal.CustomPortalApp', {
						status:'view',
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