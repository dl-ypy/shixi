<%@ page contentType="text/html;charset=UTF-8" language="java" import="net.sf.json.JsonConfig,net.sf.json.*,net.sf.json.JSONObject,net.sf.json.processors.JsonBeanProcessor,com.bonc.pure.domain.Role,com.bonc.pure.PureUtils"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
<head>
<s:head />
<s:head template="head_ext.ftl" />
<script type="text/javascript" src="<s:url value="/struts/xheditor/xheditor-zh-cn.min.js"/>"></script>
</head>
<body>
	<b:appletBox title="修改公告" showMM="false" />
	<s:actionerror />
	<s:form id="postForm" action="Post!doUpdate" validate="true" cssClass="notTipError">
	<s:hidden name="post.postId"/>
		<p>
			<s:textfield cssStyle="width:460px" name="post.postTitle" label="公告标题" cssClass="{required:true,maxlength:100, messages:{required:'请输入公告标题'}}" />
		</p>
		<p>
			<b:datetimepicker  formatPattern="yyyy-MM-dd HH:mm:ss"
					id="issueDate" name="post.issueDate" readonly="true" label="发布时间"
					cssClass="{required:true}"/>
		</p>
		<p>
			<b:datetimepicker formatPattern="yyyy-MM-dd"
					id="beginDate" name="post.beginDate" readonly="true" label="开始时间"
					maxDate="#F{$dp.$D(\\\'endDate\\\')}" />
			<b:datetimepicker
					formatPattern="yyyy-MM-dd" id="endDate"
					name="post.endDate" readonly="true" label="结束时间"
					minDate="#F{$dp.$D(\\\'beginDate\\\')}" />
		</p>
		<p>
			<s:select name="post.postState" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@postStateOpts" label="公告状态" />
		</p>
		<p>
			<s:textfield cssStyle="width:230px" id="role_desc" name="roleDesc" label="公告角色"  readonly="true" cssClass="{required:true, messages:{required:'请选择角色'}}" />
			<input id="roleIds" type="hidden" name="roleId" value="${roleId}">
		</p>
		<p>
			<s:textarea label="公告内容" id="xheditor" name="post.postContent" rows="12" cols="120"/>
		</p>
		<p style="text-align:center">
			<input type="submit" class="submit" value="提交" />
			<p:auth resourcesId="PURE_POST" optType="<%=PureUtils.AUTH_READ %>"><input type="button" class="cancel" value="取消" style="margin-left:140px;" onclick="location.href='Post.action'"/></p:auth>
		</p>
		<div style="dispaly:hidden" id="preContent"></div>
	</s:form>
	<script type="text/javascript">
		//构造编辑器
		var editor=$j('#xheditor').xheditor({tools:'Cut,Copy,Paste,Pastetext,|,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat,|,Align,List,Outdent,Indent,|,Hr,Table,|,Fullscreen',skin:'default'});
		//构造角色树
		new Bonc.FormExt.TreeSelect({
				provider:'userExtProvider',
				arg:'post',
				listKey:'role_id',
				listValue:'role_name',
				rootId:'${root.roleId}',
				rootText:'${root.roleName}',
				title:'选择角色',
				width:230,
				expanded:true,
				jsonConfig:true,
				expandAll:true,
				<%
	            JsonConfig jsonConfig = new JsonConfig();
	    		jsonConfig.registerJsonBeanProcessor(Role.class,
	  				new JsonBeanProcessor() {
	  					public JSONObject processBean(Object bean, JsonConfig jsonConfig) {
	  						if (!(bean instanceof Role)) {
	  							return new JSONObject(true);
	  						}
	  						Role role = (Role) bean;
	  						JSONObject json = new JSONObject()
		 							.element("id", role.getRoleId())
									.element("text", role.getRoleName())
									.element("parentId", role.getParentId())
									.element("leaf", role.getChildren().size() == 0)
									.element("children", JSONSerializer.toJSON(role.getChildren(), jsonConfig).toString())
									.element("roleId", role.getRoleId())
									.element("roleName", role.getRoleName())
									.element("ord", role.getOrd())
									.element("memo", role.getMemo()
								);
	  						if (role.hasPermission() != null && role.hasPermission() ==true && role.getChecked()!= null) {
	  							json.element("checked", role.getChecked());
	  						}
	  						return json;
	  					}
	  				}
	    		);
            %>
				root:new Ext.tree.AsyncTreeNode(<%=JSONSerializer.toJSON(request.getAttribute("root"), jsonConfig).toString()%>),
				showTbar:true,
				descInputId:'role_desc',
				inputId:'roleIds'
		});
		/*提交验证*/
		 $j("#postForm").validate({
			 	submitHandler:function(form){
			 		var jdiv=$j('#preContent'),testContent=null;
			 		var ediSource=$j('#xheditor').val();
			 		testContent=jdiv.html(editor.getSource()).hide().text();
			 		if(testContent==null||$j.trim(testContent).length==0){
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