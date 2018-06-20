<%@ tag body-content="empty" pageEncoding="UTF-8" dynamic-attributes="allAttributes" description="日期控件"%>
<%@ tag import="com.bonc.dss.hq.prelude.common.tag.TagUtils" %>
<%@ tag import="com.bonc.dss.hq.prelude.common.PreludeUtils" %>
<%@ tag import="org.apache.commons.lang.StringUtils" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="label" required="false"  rtexprvalue="true"  description="标签，默认为日期："%>
<%@ attribute name="id" required="false"  rtexprvalue="true"  description="标识，默认为系统自动创建"%>
<%@ attribute name="name" required="false"  rtexprvalue="true"  description="名称，默认为：dayId"%>
<%@ attribute name="value" required="false"  rtexprvalue="true"  description="值，日期格式：yyyy-MM-dd"%>
<%@ attribute name="maxDate" required="false"  rtexprvalue="true"  description="最大时间，默认为null"%>
<%@ attribute name="minDate" required="false"  rtexprvalue="true"  description="最小时间，默认为null"%>
<% String ctp = request.getContextPath();%>
<%--日期控件，依赖jQuery ui  --%>

<%
	String dateFormat = "yy-mm-dd";

	String defaultLabel = "日期：";
	String defaultId = TagUtils.nextId();
	String defaultName = "dayId";

	label = StringUtils.defaultIfEmpty(label, defaultLabel);
	id = StringUtils.defaultIfEmpty(id, defaultId);
	name = StringUtils.defaultIfEmpty(name, defaultName);
	
	if(StringUtils.isBlank(value)){
		value = TagUtils.dateToString(TagUtils.findNameValue(jspContext,request, name));
	}
	if(StringUtils.isBlank(value)){
		value = TagUtils.getDefaultDayId();
	}
	if(StringUtils.isBlank(maxDate)){
		maxDate = TagUtils.dateToString(PreludeUtils.getMaxDayDataDate());
	}
	if(StringUtils.isBlank(minDate)){
		minDate = TagUtils.dateToString(PreludeUtils.getMinDayDataDate());
	}
	
%>
<%=label%><input id="<%=id%>" name="<%=name%>" type="text"  value="<%=value%>" 
<c:forEach var="item" items="${allAttributes}" varStatus="i">
 ${item.key}="${item.value}"
</c:forEach>
>

<style>
.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
    width: 40%;
}
</style>
<script type="text/javascript">
	jQuery(function() {
		jQuery('#<%=id%>').datepicker({
			dateFormat: '<%=dateFormat%>',
			defaultDate : "<%=value%>",
			autoSize : true,
			constrainInput : true,
			showAnim : 'show',
			maxDate : '<%=maxDate%>',
			minDate : '<%=minDate%>',
			changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            monthNamesShort: ['1月','2月','3月','4月','5月','6月',
                 		'7月','8月','9月','10月','11月','12月']
		});
	});
</script>

