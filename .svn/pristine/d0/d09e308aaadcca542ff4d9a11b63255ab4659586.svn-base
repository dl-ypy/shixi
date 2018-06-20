<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<b:doctype/>
<html>
	<head>
		<s:head />
		<style type="text/css">
		span.title-nav {
			padding: 0 8px;
		}
		</style>
	</head>
	<body>
		<b:appletBox titleValue="<a href='Forum.action'>主题首页</a><span class='title-nav'>&gt;</span> <span class='title-nav-current'>${forumBoard.boardName }</span>" showMM="false" />
		<s:actionmessage/>
		<div align="right">
			<b:a href="Topic!jupAdd" params="boardId:boardId"
				cssClass="icon-add">发表新主题</b:a>
		</div>
		<b:notice />
		<div>
			<b:inputHidden name="boardId" value="boardId" />
		</div>
		<table class="grid">
			<thead>
				<b:gHead action="Topic">
					<tr>
						<th colspan=4 align=left>
							${forumBoard.boardName }
						</th>
					</tr>
					<tr>
						<th>
							<b:gh col="articleTitle">主题</b:gh>
						</th>
						<th>
							查看/回复
						</th>
						<th>
							发布人
						</th>
						<th>
							最后回复时间
						</th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
				 <s:if test="articleList==null||articleList.size()==0">
			     	<tr><td colspan="12" style="text-align:center;">没有符合条件的数据</td></tr>
			     </s:if>
			    <s:else>
				<s:iterator value="articleList" id="article" status="sta">
					<tr class="${sta.odd?'odd':'even'}">
						<td>
							<a href="Topic!allList.action?readArticle=1&forumArticleId=${article.articleId }">
								${article.articleTitle }
							</a>
						</td>
						<td>
							${article.readedNum }/${article.replyedNum }
						</td>
						<td>
							${article.user.userName }
						</td>
						<td align="center">
							<fmt:formatDate value="${article.lastDate }" type="date" pattern="yy-MM-dd HH:mm"/>
						</td>
					</tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
		<b:pagiLink action="Topic" />
	</body>
</html>