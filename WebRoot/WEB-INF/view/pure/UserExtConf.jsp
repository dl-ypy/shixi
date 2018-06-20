<%@page import="com.bonc.pure.PureUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<b:doctype/>
<html>
<head>
<s:head />
</head>
<body>
	<b:appletBox title="用户扩展属性管理" showMM="false" />
	
	<s:form action="UserExtConf">
		<table class="form">
			<tr>
				<td>扩展属性编码:<s:textfield name="extCode" /></td>
				<td>扩展属性名称:<s:textfield name="extName" /></td>
				<td align="right"><input type="submit" class="submit" value="查询" /></td>
			</tr>
		</table>
	</s:form>

	<div class="operation-container">
		<p:auth resourcesId="PURE_USER_EXTCONF" optType="<%=PureUtils.AUTH_CREATE %>">
			<a href="UserExtConf!create.action" class="icon-vcard-add">新增</a>
		</p:auth>
		<p:auth resourcesId="PURE_USER_EXTCONF" optType="<%=PureUtils.AUTH_DELETE %>">
			<a class="icon-vcard-delete" id="del-btn">删除</a>
		</p:auth>
	</div>
	
	<s:actionerror />
	<s:actionmessage/>
	
	<form <p:auth resourcesId="PURE_USER_EXTCONF" optType="<%=PureUtils.AUTH_DELETE %>">action="UserExtConf!delete.action"</p:auth> id="listForm">
		<table class="grid">
			<thead>
				<b:gHead action="UserExtConf">
					<tr>
						<p:auth resourcesId="PURE_USER_EXTCONF" optType="<%=PureUtils.AUTH_DELETE %>"><th style="width:30px"><input type="checkbox" id="checkAll"/></th></p:auth>
						<th style="width:40px"><p:auth resourcesId="PURE_USER_EXTCONF" optType="<%=PureUtils.AUTH_DELETE %>">全选</p:auth></th>
						<th><b:gh col="extCode">属性编码</b:gh></th>
						<th><b:gh col="extName">属性名称</b:gh></th>
						<th><b:gh col="dataType">属性值类型</b:gh></th>
						<th><b:gh col="isNull">可以为空</b:gh></th>
						<th><b:gh col="showMode">展现模式</b:gh></th>
						<th><b:gh col="multi">多选</b:gh></th>
						<th><b:gh col="defaultValue">默认值</b:gh></th>
						<th><b:gh col="defaultDesc">默认描述</b:gh></th>
						<th style="width:160px;"></th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
			     <s:if test="dataList==null||dataList.size()==0">
			     	<tr><td colspan="12" style="text-align:center;">没有符合条件的数据</td></tr>
				 </s:if>
				 <s:else>
				<s:iterator value="dataList" status="rowstatus">
					<tr class="${rowstatus.odd?'odd':'even'}">
						<p:auth resourcesId="PURE_USER_EXTCONF" optType="<%=PureUtils.AUTH_DELETE %>" ><td align="center"><input type="checkbox" value="${extCode}" name="ids"/></td></p:auth>
						<td class="text-center grid-row-number">${pagiParam.firstResult+rowstatus.index+1}.</td>
						<td>${extCode}</td>
						<td>${extName}</td>
						<td>${dataType}</td>
						<td><s:if test="isNull==0">否</s:if><s:else>是</s:else></td>
						<td><s:property value="@com.bonc.pure.PureUtils@ShowModeOptions.{?#this.key.equals(#attr.showMode)}[0].value"/></td>
						<td><s:if test="@com.bonc.pure.PureUtils$ShowMode@COMBOBOX.key==showMode">${multi==1?"是":"否"}</s:if><s:else>-</s:else></td>
						<s:if test="isNull==1&&(@com.bonc.pure.PureUtils$ShowMode@COMBOBOX.key==showMode||@com.bonc.pure.PureUtils$ShowMode@CASCADE.key==showMode)">
							<td>${defaultValue}</td>
							<td>${defaultDesc}</td>
						</s:if>
						<s:else>
							<td>-</td>
							<td>-</td>
						</s:else>
						<td class="text-center operation-data-row">
							<p:auth resourcesId="PURE_USER_EXTCONF" optType="<%=PureUtils.AUTH_UPDATE %>"><a href="UserExtConf!update.action?id=${extCode}" class="icon-vcard-edit">编辑</a></p:auth>
							<p:auth resourcesId="PURE_USER_EXTCONF" optType="<%=PureUtils.AUTH_DELETE %>"><a uid="${extCode}" class="icon-vcard-delete">删除</a></p:auth>
						</td>
					</tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
	</form>
	<b:pagiLink action="UserExtConf" />
	<p:auth resourcesId="PURE_USER_EXTCONF" optType="<%=PureUtils.AUTH_DELETE %>">
	<script type="text/javascript">
		$j('#checkAll').bindCheckAll(':checkbox[name="ids"]');
		$j('#listForm').delegate('a.icon-vcard-delete','click',function(){
			if(confirm('您确认要删除所选的扩展属性配置吗?')){
				location.href='UserExtConf!delete.action?ids='+this.getAttribute('uid');
			}
		});
		$j('#del-btn').bindCommitBatch('#listForm :checkbox[name="ids"]','请选择您要删除的扩展属性配置！','您确认要删除所选的扩展属性配置吗?');
	</script>
	</p:auth>
</body>
</html>