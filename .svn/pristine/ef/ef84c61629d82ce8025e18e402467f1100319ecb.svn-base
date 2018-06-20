<%@page import="com.bonc.pure.PureUtils" import="com.bonc.pure.PureUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<b:doctype/>
<html>
<head>
<s:head />
</head>
<body>
	<b:appletBox title="版块管理" showMM="false" />
	
	<s:form action="Board">
		<table class="form">
			<tr>
				<td>版块编码:<s:textfield name="forumBoard.boardId" /></td>
				<td>版块名称:<s:textfield name="forumBoard.boardName" /></td>				
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>

	<div class="operation-container">
		<p:auth resourcesId="PURE_FORUM_BOARD" optType="<%=PureUtils.AUTH_CREATE %>">
			<a href="Board!create.action" class="icon-vcard-add">新增版块</a>
		</p:auth>
		<p:auth resourcesId="PURE_FORUM_BOARD" optType="<%=PureUtils.AUTH_DELETE %>">
			<a class="icon-vcard-delete" id="del-btn">删除版块</a>
		</p:auth>
	</div>
	
	<s:actionerror />
	<s:actionmessage/>
	
	<form <p:auth resourcesId="PURE_FORUM_BOARD" optType="<%=PureUtils.AUTH_DELETE %>">action="Board!delete.action"</p:auth> id="listForm">
		<table class="grid">
			<thead>
				<b:gHead action="Board">
					<tr>
						<p:auth resourcesId="PURE_FORUM_BOARD" optType="<%=PureUtils.AUTH_DELETE %>"><th style="width:30px"><input type="checkbox" id="checkAll"/></th></p:auth>
						<th style="width:5%" ><p:auth resourcesId="PURE_USER" optType="<%=PureUtils.AUTH_DELETE %>">全选</p:auth></th>
						<th style="width:10%" align="center"><b:gh col="boardId">版块编码</b:gh></th>
						<th style="width:15%" align="center"><b:gh col="boardName">版块名称</b:gh></th>
						<th style="width:35%" align="center"><b:gh col="boardDesc">版块说明</b:gh></th>
						<th style="width:5%"  align="center"><b:gh col="boardManager">版主</b:gh></th>
						<th style="width:15%" align="center"><b:gh col="parentBoard">版块类别</b:gh></th>
						<th style="width:15%"></th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
				 <s:if test="forumBoardList==null||forumBoardList.size()==0">
			     	<tr><td colspan="12" style="text-align:center;">没有符合条件的数据</td></tr>
			     </s:if>
			    <s:else>
				<s:iterator value="forumBoardList" status="rowstatus">
					<tr class="${rowstatus.odd?'odd':'even'}">
						<p:auth resourcesId="PURE_FORUM_BOARD" optType="<%=PureUtils.AUTH_DELETE %>">
						<td align="center"><input type="checkbox" value="${boardId}" name="ids"/></td></p:auth>
						<td class="text-center grid-row-number">${pagiParam.firstResult+rowstatus.index+1}.</td>
						<td align="center">${boardId}</td>
						<td align="center">${boardName}</td>
						<td align="center"><s:property value="@com.bonc.pure.PureUtils@clipString(boardDesc)" /></td>
						<td align="center">${boardManager.userName}</td>
						<td align="center">${parentBoard.boardName}</td>
						<td class="text-center operation-data-row">
							<p:auth resourcesId="PURE_FORUM_BOARD" optType="<%=PureUtils.AUTH_UPDATE %>"><a href="Board!update.action?forumBoard.boardId=${boardId}" class="icon-edit">编辑</a></p:auth>
							<p:auth resourcesId="PURE_FORUM_BOARD" optType="<%=PureUtils.AUTH_DELETE %>"><a uid="${boardId}" class="icon-del">删除</a></p:auth>
						</td>
					</tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
	</form>
	<b:pagiLink action="Board" />
	<p:auth resourcesId="PURE_FORUM_BOARD" optType="<%=PureUtils.AUTH_DELETE %>">
		<script type="text/javascript">
		$j('#checkAll').bindCheckAll(':checkbox[name="ids"]');
		$j('#listForm').delegate('a.icon-del','click',function(){
			if(confirm('删除版块后将同时删版块下的版块及贴子.\n您确认要删除所选项类别吗？')){
				location.href='Board!delete.action?forumBoard.boardId='+this.getAttribute('uid');
			}
		});
		$j('#del-btn').bindCommitBatch('#listForm :checkbox[name="ids"]','请选择您要删除的版块！','删除版块后将同时删版块下的版块及贴子.\n您确认要删除所选项类别吗?');
		</script>
	</p:auth>
</body>
</html>