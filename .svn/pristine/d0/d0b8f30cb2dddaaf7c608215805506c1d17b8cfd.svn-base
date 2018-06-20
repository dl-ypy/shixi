<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache");
String contextPath = request.getContextPath();
%>
<s:iterator value="list" var="data">
	<div class="col-xs-2 col-sm-2 col-md-2" style="padding: 0px;">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center; font-weight: bold;"><s:property escapeHtml="false" value="KPI_NAME"/></div>
			<div class="col-xs-6 col-sm-6 col-md-6" style="color: red; text-align: center; padding: 0px"><s:property escapeHtml="false" value="%{kpiFmt(THIS_VALUE, '###,##0.00')}"/><s:property escapeHtml="false" value="RST1"/></div>
			<s:if test="VALUE_TB > 0">
			<div class="col-xs-4 col-sm-4 col-md-4" style="color: red; text-align: left">
				↑&nbsp;<s:property escapeHtml="false" value="%{kpiFmt(VALUE_TB, RST2)}"/>
			</div>
			</s:if>
			<s:else>
			<div class="col-xs-4 col-sm-4 col-md-4" style="color: green; text-align: left">
				↓&nbsp;<s:property escapeHtml="false" value="%{kpiFmt(VALUE_TB, RST2)}"/>
			</div>
			</s:else>
			<div class="col-xs-1 col-sm-1 col-md-1"></div>
			<div class="col-xs-12 col-sm-12 col-md-12" style="height: 150px; text-align: left;" id="part2LineDiv<s:property escapeHtml="false" value="KPI_ID"/>"></div>
		</div>
	</div>
	<script type="text/javascript">
	   part2Chart('<s:property escapeHtml="false" value="KPI_ID"/>','<s:property escapeHtml="false" value="KPI_NAME"/>');
    </script>
</s:iterator>

