<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List,net.sf.json.JsonConfig,net.sf.json.*,net.sf.json.JSONObject,net.sf.json.processors.JsonBeanProcessor,com.bonc.pure.domain.*,com.bonc.pure.PureUtils,com.bonc.pure.SystemConfigProperty"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
<head>
<s:head />
<s:head template="head_ext.ftl" />
</head>
<body>
	<b:appletBox title="编辑用户" showMM="false" />
	<s:actionerror />
	<s:form action="User!doUpdate" validate="true" cssClass="notTipError">
		<s:hidden name="user.userId" id="userId"/>
		<div class="float-clear"></div>
		<div id="container">
			<table style="width:100%">
		    <tr>
		      <td style="width:48%">
		            <h1>基本信息</h1><br/>
					<p>
						<s:textfield name="user.loginId" label="用户登录名" id="loginId" cssClass="{required:true,maxlength:30,wordinput:true,remote:{url:'User!validLoginId.action',type:'post',data:{'loginId':function (){return $j('#loginId').val();},'id':function(){return $j('#userId').val();}}}, messages:{required:'请输入用户姓名',remote:'用户名已存在'}}" />
					</p>
					<p>
						<s:textfield name="user.userName" label="用户姓名" cssClass="{required:true,maxlength:30, messages:{required:'请输入用户姓名'}}" />
					</p>
					<p>
					   <s:textfield name="user.org.orgName" label="所属机构" id="orgTextField"  readOnly="true" /><s:hidden name="user.org.orgId" id="orgId"/>
						<span class="icon-info input-tip">如果不选择,则使用当前用户的属性</span>
					</p>
					<p>
						<s:select name="user.sex" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@SexOptions" label="性别" />
					</p>
					<p>
						<s:select name="user.state" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@getStateOptions()" label="用户状态" />
						<span class="icon-info input-tip">停用状态时,不允许登录，</span>
					</p>
					<p>
						<s:select name="user.pwdState" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@PasswordStateOptions" label="密码状态" />
					</p>

				  <p>
					  <s:select name="user.tenantAdmin" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@YesNoOptions" label="是否租户管理员" />
				  </p>
					<%if(SystemConfigProperty.CHECK_PWD_VALID){%>
					<p>
						<s:select name="user.pwdValidState" listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@pwdValidStateOpts" label="密码有效期" />
					</p>
					<%} %>
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
						<s:textarea name="user.memo" rows="3" cols="50" label="备注" colSpan="3" cssClass="{maxlength:500}"/>
					</p>
			  </td>
			   <td style=" border-left: 1px solid #CCCCCC;height: 100%; width: 4%;"></td>
		      <td style="width:48%" valign="top">
		        <h1>扩展信息</h1><br/>
				<p:userExt id="userExtMap" prefix="userExtMap" />
		      </td>
		    </tr>
		    <tr>
		      <td colspan="3" style="text-align:center;">
			    <input type="submit" class="submit" value="提交" />
			    <p:auth resourcesId="PURE_USER" optType="<%=PureUtils.AUTH_READ %>"><input type="button" class="cancel" value="取消" style="margin-left:140px;" onclick="location.href='User.action'"/></p:auth>
	          </td>
		    </tr>
		  </table>
		 </div>
	</s:form>
	<script type="text/javascript">
	<%
	Object tree = request.getAttribute("tree");  
	if(null != tree){
	    JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonBeanProcessor(Org.class,
				new JsonBeanProcessor() {
					public JSONObject processBean(Object o, JsonConfig jsonConfig) {
						if (o==null||!(o instanceof Org)) {
							return new JSONObject(true);
						}
						Org bean = (Org) o;
						JSONObject json = new JSONObject()
								.element("id",bean.getOrgId())
								.element("text", bean.getOrgName())
								.element("parentId", bean.getParentId())
								.element("path", bean.getPath())
								.element("leaf",bean.getChildren()==null)
								.element("children", JSONSerializer.toJSON(bean.getChildren(), jsonConfig).toString());
						return json;
					}
				}
		);
	   %>
		//组织机构树
		var tree=new Bonc.FormExt.TreeClickSelect({
				arg:'post',
				title:'选择机构',
				jsonConfig:true,
				showTbar:true,
			    descInputId:'orgTextField',
				inputId:'orgId',
			    root:new Ext.tree.AsyncTreeNode(<%=JSONSerializer.toJSON(tree, jsonConfig).toString()%>)
		});
	<%}%>
	</script>
</body>
</html>