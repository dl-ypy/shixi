<%@ tag body-content="scriptless" pageEncoding="UTF-8" dynamic-attributes="allAttributes" description="表格装饰"%>
<%@ tag import="com.bonc.dss.hq.prelude.common.tag.TagUtils" %>
<%@ tag import="org.apache.commons.lang.StringUtils" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="hq" uri="/WEB-INF/tags/hq.tld" %>


<%@ attribute name="title" required="false"  rtexprvalue="true"  description="标题"%>
<%@ attribute name="titleWidth" required="false"  rtexprvalue="true"  description="标题宽度，当默认高度不美观时设置"%>
<%@ attribute name="titleHeight" required="false"  rtexprvalue="true"  description="标题高度，当默认高度不美观时设置"%>
<%@ attribute name="topNote" required="false" rtexprvalue="true"  description="上半部分内容，可以放入html标记"%>
<%@ attribute name="bottomNote" required="false" rtexprvalue="true"  description="上半部分内容，可以放入html标记"%>


<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td class="note">
				<div class="title" style="
					<c:if test="${!empty titleHeight}">
						line-height:${titleHeight};
					</c:if>
					<c:if test="${!empty titleWidth}">
						width:${titleWidth};
					</c:if>
					"
				>${title}</div>
				<div class="content">${topNote}</div>
		</td>
		<td valign="top" rowspan="2">
			<jsp:doBody/>
			<div class="bott"></div>
		</td>
	</tr>	
	<tr>
			<td class="note note_bottom" >
				<div  id="bottom_desc_div"  class="content">${bottomNote}</div>
				<div class="bott1"></div>
				<div class="bott"></div>
			</td>
	</tr>
</table>