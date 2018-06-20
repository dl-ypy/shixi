<%@ page import="com.bonc.pure.PureUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<b:doctype/>
<html>
<head>
<s:head />
<script>
$j(document).ready(function(){
   //var temp="<s:property value='forumBoard.parentBoard.boardId'/>"  
   //$j("#parentForumBoardId").val(temp); 
});
</script>
</head>
<body>
	<b:appletBox title="版主管理" showMM="false" />
	
	<s:form action="BoardManager">
		<table class="form">
			<tr>
				<td>登录用户名:<s:textfield name="loginId" /></td>
				<td>用户姓名:<s:textfield name="userName" /></td>
				<td>版块类型:<s:select name="parentBoardId" listKey="boardId" headerKey="" headerValue="全部" listValue="boardName" list="boardTypeList" cssStyle="min-width:140px;"/></td>
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>

	<s:actionerror />
	<s:actionmessage/>
	
	<s:form  action="BoardManager!update" id="listForm">
	<div style="margin-top:15px">版块:<s:select name="boardId"  listKey="boardId" listValue="boardName" list="boardList" cssStyle="min-width:140px;"/></div>
		<table class="grid">
			<thead>
				<b:gHead action="BoardManager">
					<tr>
						<th style="width:10%">选择</th>
						<th style="width:10%">序号</th>
						<th style="width:20%"><b:gh col="loginId">登录用户名</b:gh></th>
						<th style="width:20%"><b:gh col="userName">用户姓名</b:gh></th>						
						<th style="width:20%"><b:gh col="admin">管理员</b:gh></th>
						<th style="width:20%"><b:gh col="state">启用</b:gh></th>						
					</tr>
				</b:gHead>
			</thead>
			<tbody>
			<tr>
	            <td align="center"><input type="radio" value=""  checked name="user.userId"/></td>
				<td class="text-center grid-row-number">无</td>
				<td align="center">无</td>
				<td align="center">不指定版主</td>
				<td align="center">无</td>
				<td align="center">无</td>
			</tr>
				<s:iterator value="userDataList" status="rowstatus"> 
					<tr class="${rowstatus.odd?'odd':'even'}">
						<td align="center"><input type="radio" value="${userId}" name="user.userId"/></td>
						<td class="text-center grid-row-number">${pagiParam.firstResult+rowstatus.index+1}.</td>
						<td align="center">${loginId}</td>
						<td align="center">${userName}</td>
						<td align="center" hidden="true">${userId}</td>
						<td align="center"><s:property value="@com.bonc.pure.PureUtils@StateOptions.{?#this.key== #attr.admin}[0].value"/></td>
						<td align="center"><s:property value="@com.bonc.pure.PureUtils@StateOptions.{?#this.key== #attr.state}[0].value"/></td>				
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<b:inputSubmit colSpan="4" layoutAlign="center"/>
	</s:form>
	
	<b:pagiLink action="BoardManager" />
</body>
</html>