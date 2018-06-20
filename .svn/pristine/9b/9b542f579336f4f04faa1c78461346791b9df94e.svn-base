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
	<b:appletBox title="模块访问排名" showMM="false" />
	
	<s:form action="VisitModuleOrd">
		<table class="form">
			<tr>
				<td>模块编号:<s:textfield name="resourcesId" /></td>
				<td>模块名称:<s:textfield name="resourcesName" /></td>
				<% //<td>应用系统:<s:select name="appSystemId" listKey="appSystemId" listValue="appSystemName" list="allSystems" headerKey="-2" headerValue="全部"/></td> %>
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>
	<br/>
	<table class="grid">
			<thead>
				<b:gHead action="VisitModuleOrd">
					<tr>
						<th><b:gh col="RESOURCES_ID">模块编号</b:gh></th>
						<th><b:gh col="RESOURCES_NAME">模块名称</b:gh></th>
						<th><b:gh col="APP_SYSTEM_NAME">应用系统</b:gh></th>
						<th><b:gh col="VISIT_TIMES">访问次数</b:gh></th>
						<th><b:gh col="LAST_VISIT_DATE">最后访问时间</b:gh></th>
						<th><b:gh col="LAST_USER_NAME">最后访问人</b:gh></th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
				 <s:if test="dataList==null||dataList.size()==0">
			    	 <tr><td colspan="12" style="text-align:center;">没有符合条件的数据</td></tr>
			    </s:if>
			    <s:else>
				<s:iterator value="dataList" status="rowstatus">
					<tr class="${rowstatus.odd?'odd':'even'}">
						<td>${RESOURCES_ID}</td>
						<td>${RESOURCES_NAME}</td>
						<td>${APP_SYSTEM_NAME }</td>
						<td align="right"><fmt:formatNumber type="long" value="${VISIT_TIMES }" pattern="#,##0"></fmt:formatNumber></td>
						<td class="date"><fmt:formatDate value="${LAST_VISIT_DATE}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${LAST_USER_NAME}</td>
					</tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
	<b:pagiLink action="VisitModuleOrd" />
</body>
</html>