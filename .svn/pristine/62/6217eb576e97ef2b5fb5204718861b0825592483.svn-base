<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<ul class="portlet-post">
	<s:iterator value="dataList">
		<li>
			<a href="<s:url value='/pure/Post!getContent.action'/>?postId=${postId}" target="blank" >${postTitle}</a>
			<span class="post-info"><fmt:formatDate value="${issueDate}" type="date" pattern="yyyy-MM-dd HH:mm" /></span>
		</li>
	</s:iterator>
</ul>
<br/>
<p class="text-right">
	<a style="color:red;" href="<s:url value='/pure/Post.action'/>" target="_blank">更多...</a>
</p>
