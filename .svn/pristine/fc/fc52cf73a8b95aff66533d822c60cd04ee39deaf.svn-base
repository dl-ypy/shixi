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
	<b:appletBox title="新增租户" showMM="false" />
	<s:actionerror />
	<s:form action="Tenant!doCreate" validate="true" cssClass="notTipError">
		<p>
			<s:textfield  name="tenant.tenantId" label="租户编码" cssClass="{required:true,maxlength:50,wordinput:true,remote:{url:'Tenant!validTenantId.action',type:'post',data:{'id':function (){return $j('#Tenant_tenant_tenantId').val();}}}, messages:{required:'请输入租户编码',remote:'租户编码已存在'}}" />
		</p>
		<p>
			<s:textfield  name="tenant.tenantName" label="租户名称" cssClass="{required:true,maxlength:100, messages:{required:'请输入应用系统名称'}}" />
		</p>
		<p>
			<s:textfield  name="tenant.tenantURL" label="租户的URL" cssClass="{}" />
		</p>
<%-- 		<p> --%>
<%-- 			<s:select name="tenant.state" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@TenantStateOptions" label="租户状态" /> --%>
<%-- 			<span class="icon-info input-tip">停用状态时,不允许登录，</span> --%>
<%-- 		</p> --%>
		<p>
			<s:textfield  name="tenant.loginId" label="用户登录名" cssClass="{required:true,maxlength:30,wordinput:true,remote:{url:'User!validLoginId.action',type:'post',data:{'loginId':function (){return $j('#Tenant_tenant_loginId').val();}}}, messages:{required:'请输入用户姓名',remote:'用户名已存在'}}"  />
		</p>
		<p>
			<s:textfield  name="tenant.roleRootId" label="角色根节点ID" cssClass="{required:true,maxlength:30,wordinput:true,remote:{url:'Role!validRoleId.action',type:'post',data:{'id':function (){return $j('#Tenant_tenant_roleRootId').val();}}}, messages:{required:'请输入角色根节点',remote:'角色已存在'}}" />
		</p>
		 <p>
			<s:textfield  name="tenant.orgRootId" label="组织根节点ID" cssClass="{required:true,maxlength:30,wordinput:true,remote:{url:'Org!validOrgId.action',type:'post',data:{'id':function (){return $j('#Tenant_tenant_orgRootId').val();}}}, messages:{required:'请输入组织结构根节点',remote:'组织结构已存在'}}"/>
		</p>
		<p>
 			<s:checkboxlist label="租赁应用系统" name="appSystemIds" list="appSystemList" listKey="appSystemId" 
 			listValue="appSystemName"  />
		</p>
		<p>
			<s:if test="tenant==null">
				<s:textfield name="tenant.ord" value="1" label="排序" cssClass="{number:true, messages:{number:'排序只能填写数字'}}"/>
			</s:if>
			<s:else>
				<s:textfield name="tenant.ord" label="排序" cssClass="{number:true, messages:{number:'排序只能填写数字'}}"/>
			</s:else>
		</p>
		<p>
			<s:textarea name="tenant.remark"  rows="5" cols="50" label="备注" colSpan="3" cssClass="{maxlength:1000}"/>
		</p>
		<p>
			<input type="submit" class="submit" value="提交" style="margin-left:140px;"/>
			<p:auth resourcesId="PURE_TENANT" optType="<%=PureUtils.AUTH_READ %>"><input type="button" class="cancel" value="取消" style="margin-left:140px;" onclick="location.href='Tenant.action'"/></p:auth>
		</p>
	</s:form>
</body>
</html>