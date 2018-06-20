<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@	page import="java.util.*"%>
<%@	page import="com.bonc.pure.domain.Message"%>
<style type="text/css">
.a-blink {
	color: rgb(227, 68, 2);
}

.b-blink {
	color: rgb(153, 174, 218);
}
</style>
<%List<Object> data=(List<Object>)request.getAttribute("data");if(data!=null&&data.size()>0){ int i=0;%>
<table id="usersList" class="tableAddr">
	<tbody>
		<% Object tempObject[]=null; 
		for(Object o:data){ 
			tempObject=(Object[])o;
      if("hasMsg".equals(tempObject[4])&&"on".equals(tempObject[6])){
      %>
		<tr _objMsg="<%=tempObject[4]%>" _objMsgNum="<%=tempObject[5]%>"
			_objLine="<%=tempObject[6]%>">
			<td id="address-person<%=i++%>" flag="false"
				_objId="<%=tempObject[0]%>" _objName="<%=tempObject[1]%>"
				_objMobile="<%=tempObject[2]%>" _objEmail="<%=tempObject[3]%>"
				_objMsg="<%=tempObject[4]%>" _objLine="<%=tempObject[6]%>"
				onmouseover="jQuery(this).css('background-color','#C3E2F8');"
				onmouseout="jQuery(this).css('background-color','#FFFFFF');"
				class="a-blink" onclick="selectedOnOffAddr(this);">
				
					<div class="over-text-omit msg-headon" title='<%=tempObject[1]+"("+tempObject[5]+")"%>'>
						<%=tempObject[1]+"("+tempObject[5]+")"%>
					</div>
			</td>
		</tr>
		<%;} else if("hasMsg".equals(tempObject[4])&&"off".equals(tempObject[6])){%>
		<tr _objMsg="<%=tempObject[4]%>" _objMsgNum="<%=tempObject[5]%>"
			_objLine="<%=tempObject[6]%>">
			<td id="address-person<%=i++%>" flag="false"
				_objId="<%=tempObject[0]%>" _objName="<%=tempObject[1]%>"
				_objMobile="<%=tempObject[2]%>" _objEmail="<%=tempObject[3]%>"
				_objMsg="<%=tempObject[4]%>" _objLine="<%=tempObject[6]%>"
				onmouseover="jQuery(this).css('background-color','#C3E2F8');"
				onmouseout="jQuery(this).css('background-color','#FFFFFF');"
				onclick="selectedOnOffAddr(this);">
					<div class="over-text-omit msg-headoff"  title='<%=tempObject[1]+"("+tempObject[5]+")"%>'>
					 <%=tempObject[1]+"("+tempObject[5]+")"%>
					</div>
			</td>
		</tr>
		<%} else if("noMsg".equals(tempObject[4])&&"on".equals(tempObject[6])){%>
		<tr _objMsg="<%=tempObject[4]%>" _objMsgNum="0"
			_objLine="<%=tempObject[6]%>">
			<td id="address-person<%=i++%>" flag="false"
				_objId="<%=tempObject[0]%>" _objName="<%=tempObject[1]%>"
				_objMobile="<%=tempObject[2]%>" _objEmail="<%=tempObject[3]%>"
				_objMsg="<%=tempObject[4]%>" _objLine="<%=tempObject[6]%>"
				onmouseover="jQuery(this).css('background-color','#C3E2F8');"
				onmouseout="jQuery(this).css('background-color','#FFFFFF');"
				class="a-blink" onclick="selectedOnOffAddr(this);">
				
					<div class="over-text-omit  msg-headon" title='<%=tempObject[1]%>'>
						<%=tempObject[1]%>
					</div>
				
			</td>
		</tr>
		<% } else {%>
		<tr _objMsg="<%=tempObject[4]%>" _objMsgNum="0"
			_objLine="<%=tempObject[6]%>">
			<td id="address-person<%=i++%>" flag="false"
				_objId="<%=tempObject[0]%>" _objName="<%=tempObject[1]%>"
				_objMobile="<%=tempObject[2]%>" _objEmail="<%=tempObject[3]%>"
				_objMsg="<%=tempObject[4]%>" _objLine="<%=tempObject[6]%>"
				onmouseover="jQuery(this).css('background-color','#C3E2F8');"
				onmouseout="jQuery(this).css('background-color','#FFFFFF');"
				onclick="selectedOnOffAddr(this);">
				
					<div class="over-text-omit msg-headoff" title='<%=tempObject[1]%>'>
						<%=tempObject[1]%>
					</div>
			</td>
		</tr>
		<% }}}%>
	</tbody>
</table>

<script type="text/javascript">
	/**
	 *修改备注
	 */
	var notationEdit = function(node) {
		if(!node){
			return false;
		}
		var html = "<div style='padding:10px;'>输入备注名称：<input type='text' id='yourname' name='yourname' /></div>";
		var submit = function(v, h, f) {
			if (f.yourname == '') {
				jQuery.jBox.tip("请输入您的姓名。", 'error', {
					focusId : "yourname"
				}); // 关闭设置 yourname 为焦点
				return false;
			}
			var callbackFunc = function() {
				var thisId = node.getAttribute("_objId");
				jQuery("#usersList tbody tr").find(
						"td[_objId='" + thisId + "']").children("div").text(
						f.yourname);
			};
			_ajaxRequest(
					"post",
					false,
					false,
					"${pageContext.request.contextPath}/pure/message/messagemodComments.action",
					{
						"currId" :node.getAttribute("_objId"),
						"noteName" : f.yourname
					}, callbackFunc);
			jQuery.jBox.tip("备注修改成功：" + f.yourname);
			return true;
		};
		jQuery.jBox("html:"+html, {
			title : "修改备注",
			submit : submit
		});
	};
	/**
	 * 联系人排序 
	 */
	var addrSequence = function() {
		var table = jQuery("#usersList");
		var trs = jQuery(table).find("tr");
		var tempTable = document.createElement("table");
		var trOnHasmsg = jQuery(table).find(
				"tr[_objLine='on'][_objMsg='hasMsg']");
		var tempTr;
		for ( var k = 0; k < trOnHasmsg.length;) {
			tempTr = jQuery(trOnHasmsg.get(0));
			for ( var i = 0; i < trOnHasmsg.length; i++) {

				if (parseInt(jQuery(trOnHasmsg.get(i)).attr("_objMsgNum")) > parseInt(jQuery(
						tempTr).attr("_objMsgNum"))) {
					tempTr = jQuery(trOnHasmsg.get(i));
				}
			}
			jQuery(tempTr).remove();
			jQuery(tempTr).appendTo(tempTable);
			trOnHasmsg = jQuery(table).find(
					"tr[_objLine='on'][_objMsg='hasMsg']");
		}
		var trOnNomsg = jQuery(table)
				.find("tr[_objLine='on'][_objMsg='noMsg']");
		jQuery(trOnNomsg).each(function() {
			jQuery(this).appendTo(tempTable);
		});
		var trOffHasmsg = jQuery(table).find(
				"tr[_objLine='off'][_objMsg='hasMsg']");
		for ( var k = 0; k < trOffHasmsg.length;) {
			tempTr = jQuery(trOffHasmsg.get(0));
			for ( var i = 0; i < trOffHasmsg.length; i++) {
				if (parseInt(jQuery(trOffHasmsg.get(i)).attr("_objMsgNum")) > parseInt(jQuery(
						tempTr).attr("_objMsgNum"))) {
					tempTr = jQuery(trOffHasmsg.get(i));
				}
			}
			jQuery(tempTr).remove();
			trOffHasmsg = jQuery(table).find(
					"tr[_objLine='off'][_objMsg='hasMsg']");
			jQuery(tempTr).appendTo(tempTable);
		}
		var trOffNomsg = jQuery(table).find(
				"tr[_objLine='off'][_objMsg='noMsg']");
		jQuery(trOffNomsg).each(function() {
			jQuery(this).appendTo(tempTable);
		});
		jQuery(table).append(jQuery(tempTable).html());
	};
	/**
	 * 文字闪烁
	 */
	var textBlink = function() {
		var tds = jQuery("#usersList tbody tr td[_objMsg='hasMsg']");
		if (tds.length == 0) {
			window.clearInterval(blinkId);
		}
		jQuery(tds).each(function() {
			jQuery(this).click(function() {
				jQuery(this).attr("_objMsg", "noMsg");
				tds = jQuery("#usersList tbody tr td[_objMsg='hasMsg']");
			});
			if (jQuery(this).attr("class") == "a-blink") {
				jQuery(this).removeClass("a-blink").addClass("b-blink");
			} else {
				jQuery(this).removeClass("b-blink").addClass("a-blink");
			}
		});
	};
	var blinkId = setInterval(textBlink, 200);
	addrSequence();
	Ext.getDoc().on("contextmenu", function(e) {
		e.stopEvent();
	});
	var contxtMenu = new Ext.menu.Menu(
			{
				items : [
						{
							text : "查看资料",
							iconCls : 'icon-info',
							handler : function(e) {
								viewInfo(node);
							}
						},
						{
							text : "修改备注",
							iconCls : 'icon-edit',
							handler : function(e) {
								notationEdit(node);
							}
						},
						{
							text : "删除联系人",
							iconCls : 'icon-del',
							handler : function(item) {
								Ext.MessageBox.confirm("提示", "确定将["
										+ node.getAttribute("_objName")
										+ "]移出联系人列表？", callback);
								function callback(id) {
									if (id == "yes") {
										Ext.Ajax.request({
													url : "${pageContext.request.contextPath}/pure/message/messagedeleteF.action",
													params : {
														"IDS" : node.getAttribute("_objId")
													},
													success : function(data) {
														
														 var onNum=parseInt(jQuery("#on-off").attr("onNum"),10),totalNum=parseInt(jQuery("#on-off").attr("totalNum"),10);
														 totalNum=totalNum-1;
														 if(node.getAttribute("_objline")==="on"){
															 onNum=onNum-1;
														 }
														
														 jQuery("#on-off").attr("onNum",onNum).attr("totalNum",totalNum).text("(" + onNum + "/" + totalNum + ")");
														 node.remove();
														 currId=null;
														jQuery.jBox.tip('成功删除联系人','提示');
														
													}
												});
									}
								}
							}
						} ]
			});
	var personNum =
<%=data.size()%>
	;
	var node = null;
	for ( var k = 0; k < personNum; k++) {
		Ext.get("address-person" + k).on("contextmenu", function(e) {

			contxtMenu.showAt(e.getXY());
			node = this;
		});
	}
	jQuery("#totalNum").html();
	var onNum = jQuery("#usersList tbody tr td[_objLine='on']").length;
	var totalNum = jQuery("#usersList tbody tr td").length;
	jQuery("#on-off").attr("onNum",onNum).attr("totalNum",totalNum).text("(" + onNum + "/" + totalNum + ")");
</script>

