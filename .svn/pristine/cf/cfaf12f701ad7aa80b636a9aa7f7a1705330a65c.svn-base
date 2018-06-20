<%@ page contentType="text/html;charset=UTF-8" language="java" import="net.sf.json.JsonConfig,net.sf.json.*,net.sf.json.JSONObject,net.sf.json.processors.JsonBeanProcessor,com.bonc.pure.domain.Role"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<b:doctype />
<html>
<head>
<s:head />
<script type="text/javascript" src="<s:url value="/struts/xheditor/xheditor-zh-cn.min.js"/>"></script>
<style type="text/css">
#xhe0_container {
	display: inline-block;
}
</style>
</head>
<body>
<script>
var attacheNum=0;
var addAttache=function(el){
	if(attacheNum<5){
		jQuery('<span><br><input type="file" name="upload" size="50">&nbsp;&nbsp;<span onclick="delAttache(this)" style="cursor:pointer">删除</span></span>').insertAfter(el);
		//Element.insert(Event.element(event).up(),{'bottom':});
		attacheNum++;
	}else{
		alert("一次最多添加5个附件！");
	}
};
var delAttache=function(del){
	if(confirm("确定删除该附件吗？")){
			jQuery().insertAfter(el);
	
	//	Event.element(event).up().remove();
		attacheNum--;
	}
};
</script>
 

<b:notice/>
<b:appletBox title="新增主题" showMM="false"/>
<s:actionerror/>
<s:form action="Topic!doAdd" name="postForm" id="postForm">
    <b:inputHidden name="forumArticle.forumBoard.boardId" value="boardId"/>
    <b:inputHidden name="boardId" value="boardId"/>
        <p>
			<s:textfield id="articleTitleTxt" cssStyle="width:460px" name="forumArticle.articleTitle" label="主题标题" cssClass="{required:true,maxlength:100, messages:{required:'请输入主题标题'}}" />
		</p>
	<p> <s:textarea label=" 主题内容" id="xheditor" name="forumArticle.articleContent" rows="12" cols="120"/></p>
	<div align="center">
	<b:inputSubmit colSpan="4" layoutAlign="center"/>
	<b:inputHtml value="&nbsp;&nbsp;"/>
	<b:inputButton value="取消" onclick="window.location='Topic.action?boardId=${boardId }';return false;"/>
	</div>
</s:form>

<script type="text/javascript">
		//构造编辑器
		var editor=$j('#xheditor').xheditor({tools:'Cut,Copy,Paste,Pastetext,|,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat,|,Align,List,Outdent,Indent,|,Hr,Table,|,Fullscreen',skin:'default'});
		//构造角色树
	 
		/*提交验证*/
		 $j("#postForm").validate({
			 	submitHandler:function(form){
			 		//var jdiv=$j('#preContent'),testContent=null;
			 		//var ediSource=$j('#xheditor').val();
			 		//testContent=jdiv.html(editor.getSource()).hide().text();
			 		if($j('#articleTitleTxt').val() == ''){
			 			alert("请填写公告内容!");
			 			return;
			 		}
			 		//表单提交
			 		form.submit();
			 	}
		});
	</script>
</body>
</html>