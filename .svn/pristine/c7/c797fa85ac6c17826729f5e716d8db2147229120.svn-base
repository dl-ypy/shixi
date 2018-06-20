<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page
	import="com.bonc.pure.domain.Resources,java.util.List,com.bonc.pure.PureUtils,java.net.URLEncoder,org.apache.struts2.ServletActionContext,java.lang.Math,com.bonc.pure.web.util.WebIconUtil,com.bonc.pure.web.util.ResourceUrlHandlerUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div>
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
		        	<div class="compMini" style="display:block;width: 96px; height: 96px; background-color:<%=(res1.getExt4() != null && !"".equals(res1.getExt4()) && res1.getExt4().startsWith("#")) ? res1.getExt4() : colors[random]%>">
						<%=WebIconUtil.getIconHtml((res1.getExt3() == null || "".equals(res1.getExt3())) ? "th-large" : res1.getExt3())%>
						<span class="innerText" style="text-align:center;width: 96px;"><%=res1.getResourcesName()%></span>
					</div>
				</a>
				<%
					}
				}
			}
			%>
	</div>
