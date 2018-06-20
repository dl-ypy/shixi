<%@ tag body-content="empty" pageEncoding="UTF-8" dynamic-attributes="allAttributes" description="地域控件"%>
<%@ tag import="com.bonc.dss.hq.prelude.common.tag.TagUtils" %>
<%@ tag import="org.apache.commons.lang.StringUtils" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>

<%@ attribute name="labels" required="false"  rtexprvalue="true"  description="标签，默认为地域"%>
<%@ attribute name="ids" required="false"  rtexprvalue="true"  description="标识，默认为areaNo|cityNo"%>
<%@ attribute name="names" required="false"  rtexprvalue="true"  description="名称，名称的个数可以表明最终的出几个地域联动。默认为areaNo|cityNo"%>
<%@ attribute name="arg" required="false"  rtexprvalue="true"  description="参数，默认为auth"%>

<%
	
	String defaultLabels = "地域";
	String defaultIds = TagUtils.nextId()+"|"+TagUtils.nextId();
	String defaultNames = "areaNo|cityNo";
	String defaultArg = "auth";

	labels = StringUtils.defaultIfEmpty(labels, defaultLabels);
	ids = StringUtils.defaultIfEmpty(ids, defaultIds);
	names = StringUtils.defaultIfEmpty(names, defaultNames);
	arg = StringUtils.defaultIfEmpty(arg, defaultArg);

%>
<b:selectlist provider = "areaHProviderHigh" showNullOnlyIfMulti="true" labels="<%=labels%>" ids="<%=ids%>" names="<%=names%>" arg="<%=arg%>"/>
