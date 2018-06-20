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
	<b:appletBox title="编辑用户扩展属性" showMM="false" />
	<s:actionerror />
	<s:form action="UserExtConf!doUpdate" validate="true" cssClass="notTipError" id="form1">
		<input id="extCode" type="hidden" value="${userExtConf.extCode}"/>
		<p>
			<s:textfield name="userExtConf.extCode" label="属性编码" readOnly="true" />
			<span class="required">*</span>
		</p>
		<p>
			<s:textfield name="userExtConf.extName" label="属性名称" cssClass="{required:true,maxlength:30, messages:{required:'请输入属性名称'}}" />
		</p>
		<p>
			<s:select name="userExtConf.dataType"  listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@DataTypeOptions" label="属性值类型" />
		</p>
		<p>
			<s:select name="userExtConf.showMode"  listKey="key" listValue="value" list="@com.bonc.pure.PureUtils@ShowModeOptions" label="展现模式" id="showMode" />
			<span class="icon-info input-tip">展现模式的不同，需要配置的属性也将不同</span>
		</p>
		<p group="CASCADE">
			<s:select name="userExtConf.parentId" headerKey="" headerValue="无"  listKey="extCode" listValue="extName" list="parentList" label="属性上级编码" id="extParentId"/>
			<span class="icon-info input-tip">级联选择的第一个字段，选择【无】</span>
		</p>
		<p group="CASCADE CHECKBOX RADIOBOX COMBOBOX TREE">
			<s:textfield name="userExtConf.codeTable" label="候选项编码表名" cssClass="{maxlength:50}"/>
			<span class="required">*<span class="icon-info input-tip">请填入已存在的编码表</span></span>
			
		</p>
		<p group="CASCADE CHECKBOX RADIOBOX COMBOBOX TREE">
			<s:textfield name="userExtConf.codeKey" label="候选项值列名" cssClass="{maxlength:30}"/>
			<span class="required">*<span class="icon-info input-tip">请填入编码表中存在的列</span></span>
		</p>
		<p group="CASCADE TREE" id="cascade-not-first">
			<s:textfield name="userExtConf.codeParentKey" label="候选项上级编码列名" cssClass="{maxlength:30}"/>
			<span class="required">*<span class="icon-info input-tip">请填入编码表中存在的列</span></span>
		</p>
		<p group="CASCADE CHECKBOX RADIOBOX COMBOBOX TREE">
			<s:textfield name="userExtConf.codeDesc" label="候选项描述列名" cssClass="{maxlength:30}"/>
			<span class="required">*<span class="icon-info input-tip">请填入编码表中存在的列</span></span>
		</p>
		<p group="CASCADE CHECKBOX RADIOBOX COMBOBOX TREE">
			<s:textfield name="userExtConf.codeOrd" label="候选项排序列名" cssClass="{maxlength:30}"/>
			<span class="required">*<span class="icon-info input-tip">请填入编码表中存在的列</span></span>
		</p>
		<p group="COMBOBOX">
			<s:select name="userExtConf.multi"  list="#{0:'否', 1:'是'}"  label="是否多选" />
		</p>
		<p group="CASCADE COMBOBOX">
			<s:select name="userExtConf.isNull"  list="#{1:'是', 0:'否'}"  label="是否可以为空" id="isNull"/>
			<span class="icon-info input-tip">当展现模式是下拉列表时，则表示是否展现【全部】</span>
		</p>
		<p group="showNull">
			<s:textfield name="userExtConf.defaultValue" label="全部-值" cssClass="{maxlength:30}"/>
		</p>
		<p group="showNull">
			<s:textfield name="userExtConf.defaultDesc" label="全部-描述" cssClass="{maxlength:30}"/>
		</p>
		<p>
			<s:textfield name="userExtConf.extOrd" label="扩展属性排序" cssClass="{number:true,maxlength:10}"/>
		</p>
		<p>
			<input type="submit" class="submit" value="保存" style="margin-left:140px;"/>
			<p:auth resourcesId="PURE_USER_EXTCONF" optType="<%=PureUtils.AUTH_READ %>"><input type="button" class="cancel" value="取消" style="margin-left:140px;" onclick="location.href='UserExtConf.action'"/></p:auth>
		</p>
	</s:form>
	<script type="text/javascript">
		var _$groups=$j('#form1 p[group]');//表单组
		$j('#showMode').change(function(){
			var value=$j(this).val();//当前模式
			_$groups.each(function(){//根据选项的不同，展现不同的表单
				var $el=$j(this);
				if($el.attr('group').indexOf(value)>-1){
					$el.show();
				}else{
					$el.hide();
				}
			});
			$j('#isNull,#extParentId').change();//需要重新其他事件
		}).change();
		$j('#isNull').change(function(){//根据否为空元素是否可见，以及选项的值，联动全部候选项得值
			var _$this=$j(this);
			if(_$this.parent().is(":visible")){
				var value= _$this.val();//是否显示全部候选项
				var _$nullgroups=_$groups.filter('[group="showNull"]');
				if(value=='1'){
					_$nullgroups.show();
				}else{
					_$nullgroups.hide();
				}
			}
		}).change();
		$j('#extParentId').change(function(){//仅仅当级联并且没有选择上级编码时才展现统一的名称
			var _$this=$j(this);
			if($j('#showMode').val()=='TREE'){
				$j('#cascade-not-first').show();
				return;
			}
			if(_$this.parent().is(":visible")&&_$this.val()!=''){
				$j('#cascade-not-first').show();
			}else{
				$j('#cascade-not-first').hide();
			}
		}).change();

	</script>
</body>
</html>