<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<b:doctype />
<html>
<head>
<s:head />
<script type="text/javascript" src="<s:url value="/struts/xheditor/xheditor-zh-cn.min.js"/>"></script>
<style type="text/css">
#xhe0_container {
	display: inline-block;
}
span.title-nav {
	padding: 0 8px;
}
</style>
</head>
<body>

<b:appletBox titleValue="<a href='Forum.action'>主题首页</a><span class='title-nav'>&gt;</span><a href='Topic.action?boardId=${forumArticle.forumBoard.boardId }'>${forumArticle.forumBoard.boardName }</a><span class='title-nav'>&gt;</span><span class='title-nav-current'>${forumArticle.articleTitle }</span>" showMM="false" />

<b:notice/>
<div align="right">	   
	<a href="#newww"  >回复主题</a>
</div>
<table class="grid">
	<thead>
		<tr>
			<th colspan=4 align=left>主题:${forumArticle.articleTitle }</th>
		</tr>
	</thead>
	<tbody>
		<tr class="odd">
			<td align="left" nowrap width="15%">
			 <p>${forumArticle.user.userName }</p>
			</td>
			<td>
			<s:if test="forumArticle.isShow == 1">
			<div style="word-break : break-all; text-indent : 12px;" >
			${forumArticle.articleContent }
			</div>
			</s:if>
			<s:else>
			<div style="word-break : break-all; text-indent : 12px;font-weight:bold;font-style:italic" >
			 帖子内容已被管理员屏蔽
			</div>
			</s:else>
			<p>发布时间:<fmt:formatDate value="${forumArticle.writedTime }" type="date" pattern="yy-MM-dd HH:mm"/>&nbsp;&nbsp;
			<s:if test="forumArticle.isShow == 1 && (forumArticle.user.userId==userId||forumArticle.forumBoard.boardManager.userId==userId)"><!-- 自己写的自己可以修改 -->
				<a href="Topic!jupUpdate.action?forumArticleId=${forumArticle.articleId }" onclick="return confirm('确认要修改主题内容？');">编辑</a>
			<!--<b:a href="Article!deleteT" params="articleId:article_id,fathId:board_id"  onclicks="confirm('确认要删除该主题？')">删除</b:a>
			-->
			</s:if>
			<s:if test="forumArticle.isShow == 1 && forumArticle.forumBoard.boardManager.userId==userId">
			 <a href="Topic!shieldTop.action?forumArticle.isShow=0&forumArticle.articleId=${forumArticle.articleId }&forumArticleId=${forumArticle.articleId }" onclick="return confirm('确认要屏蔽主题内容？');">屏蔽</a>
			</s:if>
			</p>
			</td>
		</tr>
	    <s:iterator value="forumArticleList" id="curReplyArticle" status="sta">
		<tr class="${sta.odd?'even':'odd'}">
			<td align="left" nowrap width="10%">
			 <p>${curReplyArticle.user.userName }</p>
			</td>
			<td>
			${curReplyArticle.articleTitle }<hr color="#B4C7FE" size="1px">
			<s:if test="#curReplyArticle.isShow == 1">
			<div style="word-break : break-all; text-indent : 12px;" >
			${curReplyArticle.articleContent }
			</div>
			</s:if>
			<s:else>
			<div style="word-break : break-all; text-indent : 12px;font-weight:bold;font-style:italic" >
			 该回复内容已被管理员屏蔽
			</div>
			</s:else>
			<p>发布时间:<fmt:formatDate value="${curReplyArticle.writedTime }" type="date" pattern="yy-MM-dd HH:mm"/>&nbsp;&nbsp;
			<s:if test="#curReplyArticle.isShow == 1 && (#curReplyArticle.user.userId==userId||forumArticle.forumBoard.boardManager.userId==userId)"><!-- 自己写的自己可以修改 -->
			<a href="Topic!jupUpdate.action?forumArticleId=${curReplyArticle.articleId }&boardId=${forumArticle.forumBoard.boardId }" onclick="return confirm('确认要修改主题内容？');">编辑</a>
			<!--<b:a href="Article!delete" params="articleId:article_id,fathId:tmp_values"  onclicks="confirm('确认要删除该帖子？')">删除</b:a>
			-->
			</s:if>
			<s:if test="#curReplyArticle.isShow == 1 && forumArticle.forumBoard.boardManager.userId==userId">
			 <a href="Topic!shieldTop.action?forumArticle.isShow=0&forumArticle.articleId=${curReplyArticle.articleId }&forumArticleId=${forumArticle.articleId }" onclick="return confirm('确认要屏蔽主题内容？');">屏蔽</a>
			</s:if>
			</p>
			</td>
		</tr>
	    </s:iterator>
	</tbody>
</table>
<b:pagiLink action="Topic!allList"/>
<br/>
<a name="newww"></a>
<form name="postForm" id="postForm" action="Topic!repAdd.action" method="post">
<b:inputHidden  name="boardId" value="articTopId[0].board_id"/>
<b:inputHidden  name="articleId" value="articTopId[0].article_id"/>
<b:inputHidden  name="reArticeId" value="articTopId[0].article_id"/>
    <b:inputHidden name="forumArticle.forumBoard.boardId" value="forumArticle.forumBoard.boardId"/>
    <b:inputHidden name="boardId" value="forumArticle.forumBoard.boardId"/>
    <b:inputHidden name="forumArticle.replyArticle.articleId" value="forumArticle.articleId"/>
    <b:inputHidden name="forumArticleId" value="forumArticle.articleId"/>
        <p style="white-space: nowrap;">
			<label for="articleTitleTxt" class="fieldLabel">回复标题:</label>	
			<input type="text" style="width: 460px;" readonly="readonly" class="{required:true,maxlength:100, messages:{required:'请输入主题标题'}} fieldInput valid" id="articleTitleTxt" value="Re:${forumArticle.articleTitle }" name="forumArticle.articleTitle"><span class="required">*</span> 
		</p>
	<p style="white-space: nowrap;"> <s:textarea label="回复内容" id="xheditor" name="forumArticle.articleContent" value="" rows="12" cols="120"/></p>
    <b:inputHtml value='<br/>'/>
    <div align="center">
	<b:inputSubmit colSpan="4" layoutAlign="center"/>
	<b:inputHtml value="&nbsp;&nbsp;"/>
	<b:inputReset value="撤消"/>
	<b:inputHtml value="&nbsp;&nbsp;"/>
	<b:inputButton value="返回主题列表" onclick="window.location='Topic.action?boardId=${forumArticle.forumBoard.boardId }';return false;"/>
	</div>
</form>

<script>
var attacheNum=0;
var addAttache=function(){
	if(attacheNum<5){
		Element.insert(Event.element(event).up(),{'bottom':'<span><br><input type="file" name="upload" size="50">&nbsp;&nbsp;<span onclick="delAttache()" style="cursor:pointer">删除</span></span>'});
		attacheNum++;
	}else{
		alert("一次最多添加5个附件！");
	}
};

var delAttache=function(){
	if(confirm("确定删除该附件吗？")){
		Event.element(event).up().remove();
		attacheNum--;
	}
};
</script>
<script type="text/javascript">
		//构造编辑器
		var editor=$j('#xheditor').xheditor({tools:'Cut,Copy,Paste,Pastetext,|,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat,|,Align,List,Outdent,Indent,|,Hr,Table,|,Fullscreen',skin:'default'});
		//构造角色树
	</script>
</body>
</html>