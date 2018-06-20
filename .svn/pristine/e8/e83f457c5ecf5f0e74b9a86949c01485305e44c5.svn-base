<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.bonc.pure.PureUtils"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<b:doctype />
<html>
<head>
<s:head />
</head>
<body>
	<b:appletBox title="新增版块" showMM="false" />
	<s:actionerror />
	
	<s:form action="Board!doCreate" validate="true" cssClass="notTipError" id="form1">
		<p>
			<s:textfield name="forumBoard.boardId" label="版块编码" cssClass="{required:true,wordinput:true,maxlength:30, messages:{required:'请输入版块编码'}}" />
		</p>
		<p>
			<s:textfield name="forumBoard.boardName" label="版块名称" cssClass="{required:true,maxlength:30, messages:{required:'请输入版块名称'}}" />
		</p>
		<p>
		  <s:select name="forumBoard.parentBoard.boardId" label="版块类别" listKey="boardId" listValue="boardName" list="forumBoardTypeList" 
		     cssStyle="width:140px;"/>
		</p>
		<p>
			<s:textarea name="forumBoard.boardDesc" rows="5" cols="50" label="版块说明" colSpan="3" cssClass="{maxlength:500}"/>
		</p>
		<p>
			<input type="submit" class="submit" value="保存" style="margin-left:140px;"/>
			<p:auth resourcesId="PURE_FORUM_BOARD" optType="<%=PureUtils.AUTH_READ %>">
			<input type="button" class="cancel" value="取消" style="margin-left:140px;" onclick="location.href='Board.action'"/>
			</p:auth>
		</p>
	</s:form>
</body>
</html>