<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
<head>
<s:head />
</head>
<body>
	<b:appletBox title="用户中心" showMM="false" />
	<s:actionerror />
	<s:form action="UserCenter" validate="true" cssClass="notTipError">
		<s:hidden name="user.userId"/>
		<s:hidden name="user.admin"/>
		<s:hidden name="user.state"/>
		<s:hidden name="user.pwdState"/>
		<p>
			<s:textfield name="user.loginId" id="loginId" label="用户登录名" cssClass="{required:true,maxlength:30,wordinput:true,remote:{url:'User!validLoginId.action',type:'post',data:{'loginId':function (){return $j('#loginId').val();},'id':function(){return $j('#User_user_userId').val();}}}, messages:{required:'请输入用户姓名',remote:'用户名已存在'}}" />
		</p>
		<p>
			<s:textfield name="user.userName" label="用户姓名" cssClass="{required:true,maxlength:30, messages:{required:'请输入用户姓名'}}" />
		</p>
		<p>
			<s:select name="user.sex" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@SexOptions" label="性别" />
		</p>
		<p>
			<s:textfield name="user.email" label="Email" cssClass="{email:true,maxlength:100,messages:{email:'请输入正确的电子邮箱'}}"/>
		</p>
		<p>
			<s:textfield name="user.mobile" label="移动电话" cssClass="{maxlength:20}"/>
		</p>
		<p>
			<s:textfield name="user.telephone" label="固定电话" cssClass="{maxlength:20}"/>
		</p>
		<p>
			<s:textarea name="user.memo" rows="5" cols="50" label="备注" colSpan="3" cssClass="{maxlength:500}"/>
		</p>
		<p>
			<input type="submit" class="submit" value="提交" style="margin-left:140px;"/>
		</p>
	</s:form>
</body>
</html>