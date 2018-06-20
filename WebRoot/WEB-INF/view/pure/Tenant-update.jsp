<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.bonc.pure.PureUtils"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
<head>
<s:head />
</head>
<body>
	<b:appletBox title="编辑租户" showMM="false" />
	<s:actionerror />
	<s:form action="Tenant!doUpdate" validate="true" cssClass="notTipError">
		<s:hidden name="tenant.tenantId"/>
		<s:hidden name="tenant.loginId"/>
		<s:hidden name="tenant.roleRootId"/>
		<s:hidden name="tenant.orgRootId"/>
		<p>
			<s:textfield name="tenant.tenantId" label="租户编码" disabled="true" />
		</p>
		<p>
			<s:textfield name="tenant.tenantName" label="租户名称" cssClass="{required:true,maxlength:50, messages:{required:'请输入应用系统名称'}}" />
		</p>
		<p>
			<s:textfield name="tenant.tenantURL" label="租户的URL"  />
		</p>
		<p>
			<s:select disabled="true" name="tenant.state" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@TenantStateOptions" label="租户状态" />
			<span class="icon-info input-tip">停用状态时,不允许登录，</span>
		</p>
		<p>
			<s:textfield  name="tenant.loginId" label="用户登陆ID" disabled="true"/>
		</p>
		<p>
			<s:textfield  name="tenant.roleRootId" label="角色根节点ID" disabled="true" />
		</p>
		<p>
			<s:textfield  name="tenant.orgRootId" label="组织根节点ID" disabled="true" />
		</p>
		<p>
			<s:checkboxlist label="租赁应用系统" name="appSystemIds" list="appSystemList" listKey="appSystemId" 
 			listValue="appSystemName" value="appSystemListForTenant"  />
		</p>
		<p>
			<s:textfield name="tenant.ord" label="排序" cssClass="{number:true, messages:{number:'排序只能填写数字'}}"/>
		</p>
		<p>
			<s:textarea name="tenant.remark" rows="5" cols="50" label="备注" colSpan="3" cssClass="{maxlength:1000}"/>
		</p>
		<p>
			<input type="submit" class="submit" value="提交" style="margin-left:140px;"/>
			<p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_READ %>"><input type="button" class="cancel" value="取消" style="margin-left:140px;" onclick="location.href='Tenant.action'"/></p:auth>
		</p>
	</s:form>
</body>
</html>