<%@ tag body-content="empty" pageEncoding="UTF-8" dynamic-attributes="allAttributes" description="月份控件"%>
<%@ tag import="com.bonc.dss.hq.prelude.common.tag.TagUtils" %>
<%@ tag import="com.bonc.dss.hq.prelude.common.PreludeUtils" %>
<%@ tag import="org.apache.commons.lang.time.DateFormatUtils" %>
<%@ tag import="org.apache.commons.lang.StringUtils" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="label" required="false"  rtexprvalue="true"  description="标签，默认为月份："%>
<%@ attribute name="id" required="false"  rtexprvalue="true"  description="标识，默认为系统自动创建"%>
<%@ attribute name="name" required="false"  rtexprvalue="true"  description="名称，默认为：monthId"%>
<%@ attribute name="value" required="false"  rtexprvalue="true"  description="值，格式：yyyyMM"%>
<%@ attribute name="minYearMonth" required="false"  rtexprvalue="true"  description="最小月份，格式：yyyyMM"%>
<%@ attribute name="maxYearMonth" required="false"  rtexprvalue="true"  description="最大月份，格式：yyyyMM"%>


<%

	String defaultLabel = "月份：";
	String defaultId = TagUtils.nextId();
	String defaultName = "monthId";

	label = StringUtils.defaultIfEmpty(label, defaultLabel);
	id = StringUtils.defaultIfEmpty(id, defaultId);
	name = StringUtils.defaultIfEmpty(name, defaultName);
	
	if(StringUtils.isBlank(value)){
		value = (String)TagUtils.findNameValue(jspContext,request, name);
	}
	if(StringUtils.isBlank(value)){
		value = TagUtils.getDefaultMonthId();
	}
	if(StringUtils.isBlank(minYearMonth)){
		minYearMonth=DateFormatUtils.format(PreludeUtils.getMinMonthDataDate(),"yyyyMM");
	}
	if(StringUtils.isBlank(maxYearMonth)){
		maxYearMonth=DateFormatUtils.format(PreludeUtils.getMaxMonthDataDate(),"yyyyMM");
	}
	
	
	String dateStyleId = TagUtils.nextId();
%>
<%=label%><input id="<%=id%>" name="<%=name%>" type="text"  value="<%=value %>" 
<c:forEach var="item" items="${allAttributes}" varStatus="i">
 ${item.key}="${item.value}"
</c:forEach>
>
<style>
.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
    width: 40%;
}
</style>
<div style="display:none;" id="<%=dateStyleId%>"></div>
<script type="text/javascript">

jQuery(document).ready(function() {
	jQuery('#<%=id%>').monthPicker({
		minYearMonth : '<%=minYearMonth%>',
		maxYearMonth : '<%=maxYearMonth%>'
	});
<%-- 	
	jQuery('#<%=id%>').datepicker({
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'yy年MM',
		autoSize : true,
		showAnim : 'show',
		monthNamesShort: ['1月','2月','3月','4月','5月','6月',
             		'7月','8月','9月','10月','11月','12月'],
        onClose: function(dateText, inst) { 
            var month = jQuery("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = jQuery("#ui-datepicker-div .ui-datepicker-year :selected").val();
            jQuery(this).datepicker('setDate', new Date(year, month, 1));
            jQuery('#<%=dateStyleId%>').html('');
        },
        beforeShow: function(input, inst) {
        	jQuery('#<%=dateStyleId%>').html('<style>.ui-datepicker-calendar{display: none;}</style>');
        }
    }); --%>
});

</script>
