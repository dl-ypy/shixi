<%@page import="com.bonc.pure.PureUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<b:doctype />
<html>
<head>
<s:head />
</head>
<body>
	<b:appletBox title="登录管理" showMM="false" />

	<s:form action="LogEnter">
		<table class="form">
			<tr>
				<td>登录名:<s:textfield name="loginId" /></td>
				<td>用户姓名:<s:textfield name="userName" /></td>
				<td><b:datetimepicker formatPattern="yyyy-MM-dd HH:mm:ss"
						id="beginLoginDate" name="loginBegin" readonly="true" label="登录时间"
						maxDate="#F{$dp.$D(\\\'endLoginDate\\\')}" /> -<b:datetimepicker
						formatPattern="yyyy-MM-dd HH:mm:ss" id="endLoginDate"
						name="loginEnd" readonly="true"
						minDate="#F{$dp.$D(\\\'beginLoginDate\\\')}" />
				</td>
				<td>在线:<s:select name="online" listKey="key" listValue="value"
						list="@com.bonc.pure.PureUtils@YesNoOptions" headerKey=""
						headerValue="全部" /></td>
				<td align="right"><input type="submit" value="查询" class="submit"/></td>
			</tr>
		</table>
	</s:form>

	<div class="operation-container">
		<p:auth resourcesId="PURE_LOGENTER" optType="<%=PureUtils.AUTH_AUTH %>">
					<a class="icon-status-offline" id="del-btn">下线</a>
		</p:auth>
	</div>

	<s:actionerror />
	<s:actionmessage />

	<form
		<p:auth resourcesId="PURE_LOGENTER" optType="<%=PureUtils.AUTH_DELETE %>">action="LogEnter!logout.action"</p:auth>
		id="listForm">
		<table class="grid">
			<thead>
				<b:gHead action="LogEnter">
					<tr>
						<p:auth resourcesId="PURE_LOGENTER" optType="<%=PureUtils.AUTH_DELETE %>">
							<th style="width: 30px"><input type="checkbox" id="checkAll" /></th>
						</p:auth>
						<th style="width: 40px"><p:auth resourcesId="PURE_LOGENTER" optType="<%=PureUtils.AUTH_DELETE %>">全选</p:auth></th>
						<th><b:gh col="user.loginId">用户</b:gh></th>
						<th style="width: 50px">在线</th>
						<th style="width: 80px"><b:gh col="clientIp">登录地址</b:gh></th>
						<th style="width: 180px"><b:gh col="loginDate">登录时间</b:gh></th>
						<th style="width: 180px"><b:gh col="activeDate">活动时间</b:gh></th>
						<th style="width: 180px"><b:gh col="logoutDate">退出时间</b:gh></th>
						<th style="width: 80px;"></th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
				<s:iterator value="dataList" status="rowstatus">
					<tr class="${rowstatus.odd?'odd':'even'}">
						<p:auth resourcesId="PURE_LOGENTER" optType="<%=PureUtils.AUTH_DELETE %>">
							<td align="center"><input type="checkbox" value="${logEnterId}" name="ids" ${logoutDate!=null? 'disabled':''}/></td>
						</p:auth>
						<td class="text-center grid-row-number">${pagiParam.firstResult+rowstatus.index+1}.</td>
						<td>${user.loginId}【${user.userName}】</td>
						<td><s:property value="@com.bonc.pure.PureUtils@YesNoOptions.{?#this.key== (#attr.logoutDate==null?1:0)}[0].value" />
						</td>
						<td>${clientIp}</td>
						<td class="date"><fmt:formatDate value="${loginDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="date"><fmt:formatDate value="${activeDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="date"><fmt:formatDate value="${logoutDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="text-center operation-data-row">
						<s:if test="logoutDate==null">
						<p:auth resourcesId="PURE_LOGENTER" optType="<%=PureUtils.AUTH_AUTH %>">
									<a class="icon-status-offline" uid="${logEnterId}">下线</a>
						</p:auth>
						</s:if>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</form>
	<b:pagiLink action="LogEnter" />
	<p:auth resourcesId="PURE_LOGENTER" optType="<%=PureUtils.AUTH_DELETE %>">
		<script type="text/javascript">
			$j('#checkAll').bindCheckAll(':checkbox[name="ids"]');
			$j('#listForm').delegate('a.icon-status-offline','click',function(){
				if(confirm('强制下线后，用户将掉线.您确认要强制下线所选用户吗?')){
					location.href='LogEnter!logout.action?userName=${userName}&loginId=${loginId}&online=${online}&loginBegin=<fmt:formatDate value="${loginBegin}" type="date" pattern="yyyy-MM-dd HH:mm:ss" />&loginEnd=<fmt:formatDate value="${loginEnd}" type="date" pattern="yyyy-MM-dd HH:mm:ss" />&ids='+this.getAttribute('uid');
				}
			});
			$j('#del-btn').bindCommitBatch('#listForm :checkbox[name="ids"]','请选择您要强制下线的用户！','强制下线后，用户将掉线.\n您确认要强制下线所选项用户吗?');
		</script>
	</p:auth>
</body>
</html>