<%@page import="com.bonc.pure.PureUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="div" >
	<s:form action="LogEnter!list.action"  target="div" onsubmit="formButton();" >
		<table class="form" style="border:0px;">
			<tr>
				<td width="15px"></td>
				<td width="200px" >用户名:<s:textfield name="userName" id="formbutton"/></td>
				<td align="left" ><input type="submit" value="查询" class="submit"/></td>
			</tr>
			<tr height="10"></tr>
		</table>
	</s:form>
	<form action="LogEnter!list.action"  >
		<table class="grid" >
			<thead>
				<b:gHead action="LogEnter!list.action"  target="div">
					<tr>
						<th style="width: 80px"><b:gh col="user.userName">用户名</b:gh></th>
						<th style="width: 80px"><b:gh col="user.loginId">登录Id</b:gh></th>
						<th style="width: 80px"><b:gh col="clientIp">登录地址</b:gh></th>
						<th style="width: 180px"><b:gh col="loginDate">登录时间</b:gh></th>
					</tr>
				</b:gHead>
			</thead>
			<tbody>
			  <s:if test="dataList==null||dataList.size()==0">
			     <tr><td colspan="12" style="text-align:center;">没有符合条件的在线用户！</td></tr>
			  </s:if>
			  <s:else>
				<s:iterator value="dataList" status="rowstatus">
					<tr>
						<td align="center">${user.userName}</td>
						<td align="center">${user.loginId}</td>
						<td align="center">${clientIp}</td>
						<td align="center" class="date"><fmt:formatDate value="${loginDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table >
		<b:pagiLink target="div" action="LogEnter!list.action"/>
	</form>
	<script type="text/javascript">
		var formButton = function(){
			$j.ajax({
	         	url:Bonc.toFullPath('/pure/LogEnter!list.action'),
	         	async:false,
	         	type:'post',
	         	data:{'userName':$("#formbutton").val()},
	         	success:function(data){
	         		document.getElementById("div").innerHTML =data;
	         	}
	         });
		}
	</script>
</div>
