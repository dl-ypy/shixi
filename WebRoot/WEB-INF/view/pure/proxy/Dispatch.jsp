<%@page import="com.bonc.pure.PureConstant"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String query = request.getQueryString();
	if (null != query && query.trim().length() > 0 && query.indexOf("url=") > -1) {
		response.sendRedirect(response.encodeURL(query.substring(query
				.indexOf("url") + 4)));
	}
%>