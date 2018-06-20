<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.bonc.pure.PureUtils,com.bonc.pure.SystemConfigProperty" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<b:doctype/>
<html>
	<head>
		<s:head/>
		<style type="text/css">
			form p{
				padding-left:280px;
			}
		</style>
	</head>
	<body>
		<b:appletBox title="修改密码" showMM="false">
		<s:actionerror />
		<s:form  action="ModifyPwd!save" validate="true" cssClass="showBorder notTipError">
		     <input type="hidden" id="loginId" value="<%=PureUtils.getUser().getLoginId() %>"/>
			<p><s:password name="currentPassword" cssClass="{required:true, minlength:3,maxlength:30, messages:{required:'请输入当前密码'}}" label="原密码"/></p>
			<%if(SystemConfigProperty.CHECK_PASSWORD){%>
			    <p><s:password name="password" id="password" cssClass="{required:true, minlength:3, maxlength:30,messages:{required:'请输入新密码'},notEqualTo:'#loginId'}" label="新密码"/></p>
			<%}else{ %>
			     <p><s:password name="password" id="password" cssClass="{required:true, minlength:3, maxlength:30,messages:{required:'请输入新密码'}}" label="新密码"/></p>
			<%} %>
			<p><s:password cssClass="{required:true,equalTo:'#password', messages:{required:'请输入确认新密码',equalTo:'密码不一致'}}" label="重复新密码"/></p>
			<p style="padding-left:360px;"><input type="submit" class="submit" value="保存"/><input type="reset" class="cancel" value="重置" style="margin-left:60px;"/></p>
		</s:form> 
		</b:appletBox>
	</body>
</html>