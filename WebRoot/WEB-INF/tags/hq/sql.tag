<%@ tag body-content="empty"  pageEncoding="UTF-8"  description="sql生成"  %>
<%@ tag import="com.bonc.dss.hq.commons.AideQuery"%>
<%@ tag import="com.bonc.dss.hq.cloud.service.month.MonthChartService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="acctDate" required="true"  rtexprvalue="true"  description="数据帐期。如：日数据：201200615，月数据:201206"%>
<%@ attribute name="table" required="true"  rtexprvalue="true"  description="数据表名称。"%>
<%@ attribute name="measure" required="true"  rtexprvalue="true"  description="度量，即指标字段名，多个时以逗号分隔。如：v1,v2,v3"%>
<%@ attribute name="acctDateEnd" required="false"  rtexprvalue="true"  description="结束数据帐期。当指定了结束帐期时，则返回按帐期分组的数据"%>
<%@ attribute name="dimension" required="false"  rtexprvalue="true"  description="分组维度，即维度字段名，多个时以逗号分隔。如：prov_id（省分）"%>
<%@ attribute name="aggrDimension" required="false"  rtexprvalue="true"  description="聚合维度，为grouping sets的片段。如：()或者((prov_id),())或者((prov_id,area_no),(prov_id),())，聚合维度必须是分组维度的子集"%>
<%@ attribute name="condition" required="false"  rtexprvalue="true"  description="数据限定条件。数据帐期条件不能包含在此，如：prov_id='010'"%>

<%{
	String provId = (String)request.getAttribute("provId");
    String areaNo = (String)request.getAttribute("areaNo");
    
	condition = MonthChartService.createCond(condition,provId,areaNo);
	
    if(acctDateEnd == null || "".equals(acctDateEnd)){
		acctDateEnd = acctDate;
	}
	String result = AideQuery.buildSql(table,acctDateEnd+","+ acctDate, measure, "cm,lm,llm,cyt,lyt,cyavg,lyavg", dimension, aggrDimension, condition);
	
	//String result = AideQuery.getSql(table, measure, acctDate, acctDateEnd, dimension, aggrDimension, condition);
	out.print(result);
}
%>