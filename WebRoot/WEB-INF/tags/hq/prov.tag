<%@ tag body-content="empty" pageEncoding="UTF-8" dynamic-attributes="allAttributes" description="省分控件"%>
<%@ tag import="com.bonc.dss.hq.prelude.common.tag.TagUtils" %>
<%@ tag import="org.apache.commons.lang.StringUtils" %>

<%@ taglib prefix="hq" uri="/WEB-INF/tags/hq.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="label" required="false"  rtexprvalue="true"  description="标签，默认为省分"%>
<%@ attribute name="id" required="false"  rtexprvalue="true"  description="标识，默认为areaNo"%>
<%@ attribute name="name" required="false"  rtexprvalue="true"  description="名称，默认为areaNo"%>
<%@ attribute name="arg" required="false"  rtexprvalue="true"  description="参数，默认为auth"%>

<%
	String defaultLabel = "省分";
	String defaultId = TagUtils.nextId();
	String defaultName = "areaNo";
	String defaultArg = "auth";

	label = StringUtils.defaultIfEmpty(label, defaultLabel);
	id = StringUtils.defaultIfEmpty(id, defaultId);
	name = StringUtils.defaultIfEmpty(name, defaultName);
	arg = StringUtils.defaultIfEmpty(arg, defaultArg);

%>


<hq:region labels="<%=label%>" ids="<%=id%>" names="<%=name%>" arg="<%=arg%>"/>