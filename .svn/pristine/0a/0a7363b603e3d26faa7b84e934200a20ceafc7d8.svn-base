<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<input type="hidden" id="data" value="<s:property value='dataList.size()==null?0:dataList.size()'/>"/>
<div id="post-latest" class="post-pop-msg">
    <div id="none-remind" style="text-align: right;">
		<a id="post-delete-all" class="icon-post-delete" >不再提示</a>
	</div>	
	 <div id="none-popMsg" style="text-align: left;display:none">
		  当前无提示信息。
	 </div>		
	<s:if test="dataList!=null&&dataList.size>0">
		<s:iterator value="dataList" status="rowstatus">
			<div class="post-view">
				<h1>${postTitle}&nbsp;&nbsp;<a id='${postId }' class="icon-post-delete" title="不再提示"></a></h1>
				<div class="post-content">
	                 <a  postTitle='${postTitle}' id='${postId }'>${postContent}</a>
                 </div>
                 <div class="post-info"></div>
			</div>
		</s:iterator>
		<script type="text/javascript">
		 jQuery(function(){
			 $j('div.post-content a').each(function(){
				 var text=$j(this).text();
				 if(text.length>20){
					 $j(this).html(text.substr(0,20)+"...");
				 }
			 });
		 });
		</script>
   </s:if>
</div>
<script type="text/javascript">
//所有提示设置为不再显示
$j('#post-delete-all').click(function(){
	var thiz=this;
	$j.ajax({
		  url:Bonc.toFullPath('/pure/Post!setRead.action'),
		  async: false,
		  data:{},
	      success:function(data){
	    	  if(data.success){
	    		  $j(thiz).parent().parent().parent().parent().hide();
			 }
	      }
	});
});
//每行设置不再显示
$j('div.post-pop-msg').delegate('.post-view a','click',function(){
	var thiz=this,id=this.getAttribute('id'),datasize=$j('#data').val();
	$j.ajax({
		 url: Bonc.toFullPath('/pure/Post!setInvisible.action'),
		  cache: false,
		  async: false,
		  global:false,
		  dataType:'JSON',
		  data: {postId:id},
		  type: 'POST',
		  success: function(data){
			  if(data.success){
				 $j('#data').val(datasize-1);
			  	$j(thiz).parent().parent().remove();
			  	if(datasize-1==0){
			  		$('#none-remind').hide();
			  		$('#none-popMsg').show();
			  	}
			  }
		  }
	});
});
//每行的详细信息展现
	$j('div.post-content').delegate('a','click',function(){
		var thiz=this,title=this.getAttribute('postTitle'),id=this.getAttribute('id'),
		width=$j('.pure-frame-body').width(),height=$j('.pure-frame-body').height(),
		datasize=$j('#data').val();
		$j.ajax({
			 url: Bonc.toFullPath('/pure/Post!setInvisible.action'),
			  cache: false,
			  global:false,
			  async: false,
			  dataType:'JSON',
			  data: {postId:id},
			  type: 'POST',
			  success: function(data){
				  if(data.success){
					  $j('#data').val(datasize-1);
					  	$j(thiz).parent().parent().remove();
					  	if(datasize-1==0){
					  		$('#none-remind').hide();
					  		$('#none-popMsg').show();
					  	}
				  }
			  }
		});
		new Bonc.PopWindow({
			id:'sys-tool-pop-window',
			resizable:true,
			dragable:true,
			height:260,
			width:400,
			bottom:3,
			right:3,
            title:title,
            url:Bonc.toFullPath('/pure/Post!remindview.action?postId='+id)
       	});
	});
</script>