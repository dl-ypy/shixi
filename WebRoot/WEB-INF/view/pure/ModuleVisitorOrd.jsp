<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<b:doctype/>
<html>
<head>
<s:head />
</head>
<body>
	<b:appletBox title="模块访问者排名" showMM="false" />
	
	<s:form action="ModuleVisitorOrd">
		<table class="form">
			<tr>
				<td>登录名:<s:textfield name="loginId" /></td>
				<td>用户姓名:<s:textfield name="userName" /></td>
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>
	
		<table class="grid">
			<thead>
				<b:gHead action="ModuleVisitorOrd">
					<tr>
						<th><b:gh col="LOGIN_ID">登录名</b:gh></th>
						<th><b:gh col="USER_NAME">用户名称</b:gh></th>
						<th><b:gh col="VISIT_TIMES">访问次数</b:gh></th>
						<th><b:gh col="LAST_VISIT_TIME">最后访问时间</b:gh></th>
						<th><b:gh col="LAST_MODULE_NAME">最后访模块</b:gh></th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
				<s:iterator value="dataList" status="rowstatus">
					<tr class="${rowstatus.odd?'odd':'even'}">
						<td>${LOGIN_ID}</td>
						<td>${USER_NAME}</td>
						<td align="right"><fmt:formatNumber type="long" value="${VISIT_TIMES }" pattern="#,##0"></fmt:formatNumber></td>
						<td class="date"><fmt:formatDate value="${LAST_VISIT_TIME}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${LAST_MODULE_NAME}</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	<b:pagiLink action="ModuleVisitorOrd" />
</body>
</html>