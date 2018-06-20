<%@page import="net.sf.json.processors.JsonBeanProcessor"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" import="com.bonc.pure.domain.*,org.apache.commons.lang.StringUtils,java.util.*,com.bonc.pure.*;"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
<head>
<s:head />
<link href="<s:url value='/struts/jquery/jquery-ui-1.10.3/themes/base/jquery-ui.css'/>" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<s:url value='/struts/jquery/jquery-ui-1.10.3/ui/jquery-ui.js'/>"></script>
</head>
<body>
	<div id="portal-nav">
		<div id="portal-modify-msg">若要应用更改、请单击"保存"按钮。<input type="button" value="保存" />&nbsp;<input type="button" name="cancel" value="取消" />
		</div>
		<ul id="portal-nav-menu">
			<li>【<a id="portal-portlets-add">增删模块</a>】
			<li>
			<li>|
			<li>
			<li><a columns="100%">1栏</a>
			<li>
			<li><a columns="50%,50%">2栏</a>
			<li>
			<li><a columns="25%,50%,25%">3栏</a>
			<li>
			<li><a columns="25%,25%,25%,25%">4栏</a>
			<li>
		</ul>
	</div>
	<div id="portal-portlets-panel">
		<p class="icon-info input-tip">提示：新增的模块会直接加到最后一列.</p>
		<p id="portal-portlets"></p>
		<p class="text-center" style="padding-bottom: 15px">
		</p>
	</div>

	<div id="portlets-container"></div>


	<script type="text/javascript">
		<%JsonConfig jsonConfig = new JsonConfig();
		final String contextPath=request.getContextPath();
			jsonConfig.registerJsonBeanProcessor(Resources.class,
					new JsonBeanProcessor() {
						public JSONObject processBean(Object o,
								JsonConfig jsonConfig) {
							if (o == null || !(o instanceof Resources)) {
								return new JSONObject(true);
							}
							Resources bean = (Resources) o;
							String url="";
							if(StringUtils.isNotBlank(bean.getUrl())){
								url=PureUtils.getFullUrl(bean.getAppSystem(), bean.getUrl(), contextPath);
							}
							JSONObject json = new JSONObject()
									.element("id", bean.getResourcesId())
									.element("title", bean.getResourcesName())
									.element("url", url)
									.element("height", bean.getExt1())
									.element("iframe", bean.getExt2());
							return json;
						}
					});%>
		var portlets=<%=JSONSerializer.toJSON(request.getAttribute("dataList"),
					jsonConfig).toString()%>||[];
		var container=new Bonc.Portal.Container({
		    renderTo:'portlets-container',
		   	portlets:portlets,
		   	config:${config},
		   	moveend:function(){
		   		$j('#portal-modify-msg').show();
		   	}
		});
		$j('#portal-portlets').html(function(){
			var html=[],portlet=null;
			for(var i=0;i<portlets.length;i++){
				portlet=portlets[i];
				html.push(['<input type="checkbox" id="c-',portlet['id'],'" value="',portlet['id'],'"/><label for="c-',portlet['id'],'">',portlet['title'],'</label>'].join(''));
			}
			return html.join('');
		});
		var checkedinit=false;
		$j('#portal-nav-menu').delegate('a','click',function(){
			if(this.id){
				if(checkedinit==false){
					var checkbox = $j('#portal-portlets-panel :checkbox');
					var portal = container.serialize(),portlets = null;
					for(var i=0;i<portal.length;i++){
						portlets=portal[i].portlets;			
						for(var j=0;j<portlets.length;j++) {
							checkbox.filter('[value="'+portlets[j].id+'"]').attr('checked',true);
						}
					}
					checkedinit=true;
				}
				$j('#portal-portlets-panel').toggle('fast');
			}else{
				var columns = this.getAttribute('columns').split(',');
				container.setColumns(columns);
				$j('#portal-modify-msg').show();
			}
		});
		var funcId = null;
		$j('#portal-portlets-panel').delegate(':checkbox','click',function(){
		 	clearTimeout(funcId);
		 	fubcId=setTimeout(function(){
				var v=[];
				$j('#portal-portlets-panel').find(':checked').each(function(){
					v.push(this.value)
				});
				container.setPortlets(v);
				$j('#portal-modify-msg').show();
			},1500);
		});
		$j('#portal-modify-msg').delegate(':button','click',function(){
			if(this.name=='cancel'){
				$j('#portal-modify-msg').hide();
			}else{
				$j.getJSON(
					Bonc.toFullPath("/pure/PortalCustomize!doUpdate.action"),
					{config:$j.toJSON(container.serialize())},
					function(data){
						if(data.success){
							$j('#portal-modify-msg').hide();
						}
					}
				);
			}
		});
		document.oncontextmenu1  = function (event){
			var _event = event ||  window.event;
			if ( _event.stopPropagation ) {
				_event.stopPropagation();
			} else {
				window.event.cancelBubble = true;
			}
			return false;
		}
	</script>
</body>
</html>