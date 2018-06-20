<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<b:doctype/>
<html>
	<head>
		<s:head />
		<style type="text/css">
			tr.board-type {
				background-color: #EFEFEF!important;
				font-weight: bold!important;
			}
			tr.board-type td {
				border-bottom: 1px solid #CECFC6!important;
			}
		</style>
	</head>

	<body>
		<b:appletBox title="论坛首页" showMM="false" />
		<form id="listForm">
			<table class="grid">
				<thead>
						<tr>
							<th>论坛</th>
							<th>主题数</th>
							<th>回帖数</th>
							<th>版主</th>
							<th>创建时间</th>
						</tr>
				</thead>
				<tbody>
				     <s:if test="BoardTypeList==null||BoardTypeList.size()==0">
				     	<tr><td colspan="12" style="text-align:center;">没有符合条件的数据</td></tr>
				     </s:if>
				    <s:else>
					<s:iterator value="BoardTypeList" id="tempType">
						<tr class="board-type">
							<td colSpan="5" align="left">
								${tempType.boardName }
							</td>
						</tr>
						<s:iterator
							value="%{boardList.{?#this.parentBoardId==#tempType.boardId}}" status="sta" id="tempBoard">
							<tr class="${sta.odd?'odd':'even'}">
								<td style="text-indent: 20px;">
									<a href="Topic.action?boardId=${tempBoard.boardId }">${tempBoard.boardName }</a>
								</td>
								<td align="center">${tempBoard.subjectNum }</td>
								<td align="center">${tempBoard.topicNum}</td>
								<td align="center">${tempBoard.boardManagerName }</td>
								<td align="center">${tempBoard.createTime }</td>
							</tr>
						</s:iterator>
					</s:iterator>
					</s:else>
				</tbody>
			</table>
		</form>
	</body>
</html>