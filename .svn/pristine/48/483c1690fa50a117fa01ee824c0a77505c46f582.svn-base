<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="hq" uri="/hq-tags" %>

<div class="mainNavDiv">
	<ul>
		<li class="selected" id="nav1" onclick="impTableList('<s:property value="param.logId"/>','<s:property value="param.excelId"/>')">
			<span class="navSpan">导入列表查看</span>
		</li>
		<li class="unselected" id="nav2" onclick="impErrorList('<s:property value="param.logId"/>','<s:property value="param.excelId"/>')">
			<span class="navSpan">异常列表查看</span>
		</li>
	</ul>
</div>
<div style="width:100%; height: 330px;" id="navTableDiv"></div>

<script type="text/javascript">
jQuery("#nav1").click();
</script>