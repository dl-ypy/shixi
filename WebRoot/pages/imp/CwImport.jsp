<%@ page contentType="text/html;charset=UTF-8" import="java.util.*"  language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<html>
<head>
    <title>基础数据导入</title>
<b:head meddle="false"/>
<script type="text/javascript">
function importExcel() {
	var excelId = jQuery('#excelId').val();
	if(excelId == '-1'){
		alert("请选择上传的文件类型！");
		jQuery('#excelId').focus();
		return false;
	}
	var monthId = jQuery('#monthId').val();
	if(monthId == ''){
		alert("请选择上传数据的账期！");
		jQuery('#monthId').focus();
		jQuery('#monthId').click();
		return false;
	}
	var excelFile = jQuery('#excelFile').val();
	if (excelFile == '') {
		alert("请选择要上传的文件！");
		jQuery('#excelFile').focus();
		jQuery('#excelFile').click();
		return false;
	}
	var index1 = excelFile.lastIndexOf(".")+1;  
	var index2 = excelFile.length;  
	var postf = excelFile.substring(index1,index2).toLowerCase();//后缀名    
	if(postf != "xls" && postf != "xlsx"){
		alert("文件只能是xls或xlsx格式，请重新选择。");
		jQuery('#excelFile').focus();
		jQuery('#excelFile').click();
		return false;
	}

	jQuery("#importButton").attr('disabled','disabled');
	jQuery.ajax({
		url:"CwImport!checkImport.action",
		type:"POST",
		data:{
			  "param.monthId": monthId,
			  "param.excelId": excelId
			  },
		dataType: "json",
		cache:false,
		success:function(data) {
			var isUpload = data.isUpload;
			if (isUpload == '0') {
				jQuery("#inputForm").submit();
			} else {
				var excelName = jQuery("#excelId").find("option:selected").text();
				if(confirm(monthId + "账期的《" + excelName + "》" + data.message + "，确认需要重新导入？")){
					jQuery("#inputForm").submit();
				}
				jQuery("#importButton").removeAttr('disabled');
			}
		}
	});

}
</script>
 </head>
 <body>
	<div class="appletBox">
		<div class="appletTitleBar">
			<div class="appletTitle">基础数据导入</div>
			<div class="appletIcon"></div>
		</div>
	</div>

	<form name="inputForm" id="inputForm" action="CwImport!uploadExcel.action" method="post" enctype ="multipart/form-data">
		<table class="formGrid" style="width:100%;" align="center">
			<tr height="34px">
				<td align="right">文件类型：</td>
				<td align="left">
					<s:select name="param.excelId" id="excelId" headerKey="-1" headerValue="---------- 请选择 ----------" listKey="EXCEL_ID" listValue="EXCEL_NAME" list="list"></s:select>
				</td>
			</tr>
			<tr height="34px">
				<td align="right">上传帐期：</td>
				<td align="left">
					<input type="text" name="param.monthId" value="<s:property value="param.monthId"/>" class="fieldInput datetimepicker" id="monthId" readonly="readonly" onclick="WdatePicker({el:'monthId',dateFmt:'yyyyMM'})"/>
					<img src="<%=contextPath %>/struts/base/s.gif" style="vertical-align: middle; cursor: pointer;margin-left:3px;" class="datetimepicker" onclick="WdatePicker({el:'monthId',dateFmt:'yyyyMM'})"/>
				</td>
			</tr>
			<tr height="34px">
				<td align="right">选择文件：</td>
				<td align="left">
				   <input style="height:20px;width:360px" id="excelFile" name="excelFile" type="file" />
				   &nbsp;&nbsp;
				   <input type="button" value=" 上  传 " class="buttonStyle" id="importButton" onclick="importExcel()"/>
				</td>
			</tr>
			<tr>
				<td align="right">备注：</td>
				<td><span style="padding-left:4px;color:red;">上传文件必须是EXCEL文件,格式为：xls或xlsx。</span></td>
			</tr>
		</table>
	</form>
</body>
</html>