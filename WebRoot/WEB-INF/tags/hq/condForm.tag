<%@ tag body-content="scriptless" pageEncoding="UTF-8" dynamic-attributes="allAttributes" description="条件表单控件"%>
<%@ tag import="com.bonc.dss.hq.prelude.common.tag.TagUtils" %>
<%@ tag import="org.apache.commons.lang.StringUtils" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="hq" uri="/WEB-INF/tags/hq.tld" %>


<%@ attribute name="tagNames" required="false"  rtexprvalue="true"  description="条件标签名称，多个标签之间用逗号分隔。如：day,prov。默认值为：month,prov"%>
<%@ attribute name="action" required="false" rtexprvalue="true"  description="form的action，默认为空"%>

<%
if(StringUtils.isNotBlank(action)){
	action= action.trim();
	if(action.startsWith("/")){
		action = request.getContextPath()+action;
	}
}

%>
<form action="<%=action%>" 
	<c:forEach var="item" items="${allAttributes}" varStatus="i">
	 ${item.key}="${item.value}"
	</c:forEach>
>
<%
	tagNames = StringUtils.defaultIfEmpty(tagNames, "month,prov");
	String[] __tagNames = tagNames.split(",");
	for(String tagName : __tagNames){
		if(tagName.equals("day")){
			%>
				<hq:day/>
			<%
		}else if (tagName.equals("month")){
			%>
			<hq:month/>
			<%
		}else if (tagName.equals("prov")){
			%>
			<hq:prov/>
			<%
		}else if (tagName.equals("region")){
			%>
			<hq:region/>
			<%
		}
	}
%>
<jsp:doBody/>
<input type="submit" value="确定">
</form>