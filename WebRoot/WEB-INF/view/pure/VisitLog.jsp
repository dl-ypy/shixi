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
	<b:appletBox title="模块访问日志" showMM="false" />
	
	<s:form action="VisitLog">
		<table class="form">
			<tr>
				<td>登&nbsp;录&nbsp;&nbsp;名:<s:textfield name="loginId" /></td>
				<td>用户姓名:<s:textfield name="userName" /></td>
				<td>模块编号:<s:textfield name="resourcesId" /></td>
				<td>模块名称:<s:textfield name="resourcesName" /></td>
			</tr>
			<tr>
				<%
				//<td>应用系统:
				//   <s:select name="appSystemId" listKey="appSystemId" listValue="appSystemName"
				//      list="allSystems" headerKey="-1" headerValue="全部" cssStyle="min-width:140px;"/>
				//</td>
				%>
				<td colspan="3"><b:datetimepicker formatPattern="yyyy-MM-dd HH:mm:ss"
						id="queryBegin" name="queryBegin" readonly="true" label="访问时间"
						maxDate="#F{$dp.$D(\\\'queryEnd\\\')}" /> -<b:datetimepicker
						formatPattern="yyyy-MM-dd HH:mm:ss" id="queryEnd"
						name="queryEnd" readonly="true"
						minDate="#F{$dp.$D(\\\'queryBegin\\\')}" />
				</td>
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>
	<br/>
	
	<table class="grid">
			<thead>
				<b:gHead action="VisitLog">
					<tr>
						<th><b:gh col="user.loginId">登录名</b:gh></th>
						<th><b:gh col="user.userName">用户姓名</b:gh></th>
						<th><b:gh col="resources.resourcesId">模块编号</b:gh></th>
						<th><b:gh col="resources.resourcesName">模块名称</b:gh></th>
						<th><b:gh col="appSystemAlias.appSystemName">应用系统</b:gh></th>
						<th><b:gh col="visitDate">访问时间</b:gh></th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
			     <s:if test="visitLogs==null||visitLogs.size()==0">
			    	 <tr><td colspan="12" style="text-align:center;">没有符合条件的数据</td></tr>
			    </s:if>
			    <s:else>
				<s:iterator value="visitLogs" status="rowstatus">
					<tr class="${rowstatus.odd?'odd':'even'}">
						<td>${user.loginId}</td>
						<td>${user.userName}</td>
						<td>${resources.resourcesId }</td>
						<td>${resources.resourcesName }</td>
						<td>${resources.appSystem.appSystemName}</td>
						<td class="date"><fmt:formatDate value="${visitDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
	<b:pagiLink action="VisitLog" />
</body>
</html>