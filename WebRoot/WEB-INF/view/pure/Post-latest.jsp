<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="post-latest" class="post">
	<div class="text-right">【<a class="sys-window-btn-close" onclick="updateContent(Bonc.toFullPath('/pure/Post'), '公告管理', 'sys_post_manager', '公告管理');return false;">历史公告</a>】</div>
	<s:if test="dataList!=null&&dataList.size>0">
		<s:iterator value="dataList" status="rowstatus">
			<div>
			<h1>${postTitle}&nbsp;&nbsp;<a id="${postId}" class="invisible-anchor">不再显示</a></h1>
			<div class="post-content">${postContent}</div>
			<div class="post-info">
				<s:if test='creater!=null'>发布人：${creater.userName}&nbsp;&nbsp;&nbsp;&nbsp;</s:if>
			   <s:if test='issueDate!=null'><s:date name="issueDate"  format="yyyy-MM-dd HH:mm:ss" /></s:if>
			</div>
			</div>
		</s:iterator>
	</s:if>
	<s:else>
		今天没有发布公告。
	</s:else>
</div>
<script>
	$j('div.post').delegate('a.invisible-anchor','click',function(){
		var thiz=this;//this会随着方法体的执行变换，所以此处先定义一个thiz指向开始的this，即<a>标签
		$j.ajax({
			  url: Bonc.toFullPath('/pure/Post!setInvisible.action'),
			  cache: false,
			  global:false,
			  dataType:'JSON',
			  data: 'postId='+$j(thiz).attr('id'),
			  type: 'POST',
			  error :function(){
				  alert('设置失败');
			  },
			  success: function(json){
				  if(json.success){
				  	$j(thiz).parent().parent().remove();
				  }
			  }
		});
	});
</script>