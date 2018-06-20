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
</head>
<body>
	<b:appletBox title="公告管理" showMM="false" />
	
	<s:form action="Post">
		<table class="form">
			<tr>
				<td>公告标题:<s:textfield name="postTitle" /></td>
				<td><b:datetimepicker 
						id="issueDate" name="issueDate" readonly="true" label="发布时间"
						formatPattern="yyyy-MM-dd"  />
				</td>
				<td><b:datetimepicker formatPattern="yyyy-MM-dd"
						id="beginDate" name="beginDate" readonly="true" label="公告时间"
						maxDate="#F{$dp.$D(\\\'endDate\\\')}" /> -<b:datetimepicker
						formatPattern="yyyy-MM-dd" id="endDate"
						name="endDate" readonly="true"
						minDate="#F{$dp.$D(\\\'beginDate\\\')}" />
				</td>
				<td>状态:<s:select name="postState" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@postStateOpts" headerKey="" headerValue="全部"/></td>
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>

	<div class="operation-container">
		<p:auth resourcesId="PURE_POST" optType="<%=PureUtils.AUTH_CREATE %>">
			<a href="Post!create.action" class="icon-vcard-add">新增</a>
		</p:auth>
		<p:auth resourcesId="PURE_POST" optType="<%=PureUtils.AUTH_DELETE %>">
			<a class="icon-vcard-delete" id="batchDel-btn">删除</a>
		</p:auth>
	</div>
	
	<s:actionerror />
	<s:actionmessage/>
	
	<form <p:auth resourcesId="PURE_POST" optType="<%=PureUtils.AUTH_DELETE %>">action="Post!delete.action"</p:auth> id="postForm">
		<table class="grid">
			<thead>
				<b:gHead action="Post">
					<tr>
						<p:auth resourcesId="PURE_POST" optType="<%=PureUtils.AUTH_DELETE %>" ><th style="width:30px"><input type="checkbox" id="checkAll"/></th></p:auth>
						<th style="width:40px"><p:auth resourcesId="PURE_POST" optType="<%=PureUtils.AUTH_DELETE %>">全选</p:auth></th>
						<th><b:gh col="postTitle">公告标题</b:gh></th>
						<th style="width:100px"><b:gh col="postState">公告状态</b:gh></th>
						<th style="width:150px"><b:gh col="issueDate">发布时间</b:gh></th>
						<th style="width:150px"><b:gh col="beginDate">开始时间</b:gh></th>
						<th style="width:150px"><b:gh col="endDate">结束时间</b:gh></th>
						<th style="width:100px">发布人</th>
						<th style="width:160px;"></th>
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
						<p:auth resourcesId="PURE_POST" optType="<%=PureUtils.AUTH_DELETE %>"><td align="center"><input type="checkbox" value="${postId}" name="postIds"/></td></p:auth>
						<td class="text-center grid-row-number">${pagiParam.firstResult+rowstatus.index+1}.</td>
						<td><a title="查看公告内容" title="查看公告内容" class="anchorTitle">${postTitle}</a></td>
						<td><s:property value="@com.bonc.pure.PureUtils@postStateOpts.{?#this.key== #attr.postState}[0].value"/></td>
						<td class="date"><fmt:formatDate value="${issueDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td class="date"><fmt:formatDate value="${beginDate}" type="date" pattern="yyyy-MM-dd"/></td>
						<td class="date"><fmt:formatDate value="${endDate}" type="date" pattern="yyyy-MM-dd"/></td>
						<td>${creater.userName}</td>
						<td class="text-center operation-data-row">
							<p:auth resourcesId="PURE_POST" optType="<%=PureUtils.AUTH_UPDATE %>"><s:if test="%{postState!=1}"><a href="Post!update.action?postId=${postId}" class="icon-vcard-edit">编辑</a></s:if></p:auth>
							<p:auth resourcesId="PURE_POST" optType="<%=PureUtils.AUTH_DELETE %>"><a rel="${postId}" class="icon-vcard-delete">删除</a></p:auth>
						</td>
					</tr>
					<tr class="noneClass" style="display:none"><td colspan="8"><div>公告内容:</div>${postContent}</tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
	</form>
	<b:pagiLink action="Post" />
	<p:auth resourcesId="PURE_POST" optType="<%=PureUtils.AUTH_DELETE %>">
	<script type="text/javascript">
		$j('#checkAll').bindCheckAll(':checkbox[name="postIds"]');
		$j('#postForm').delegate('a.icon-vcard-delete','click',function(){
			if(confirm('您确认要删除所选项公告吗?')){
				location.href='Post!delete.action?postIds='+$j(this).attr('rel');
			}
		});
		$j('#postForm').delegate('a.anchorTitle','click',function(){
			var jthiz=$j(this),jtr=jthiz.parent('td').parent('tr');
			jtr.siblings('tr.noneClass').not(jtr.next()).hide();
			jtr.next('tr.noneClass').toggle();
		});
		$j('#batchDel-btn').bindCommitBatch('#postForm :checkbox[name="postIds"]','请选择您要删除的公告！','您确认要删除所选项公告吗?'); 
	</script>
	</p:auth>
</body>
</html>