<%@tag import="com.bonc.dss.hq.commons.AideQuery"%>
<%@tag import="org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper"%>
<%@tag import="org.springframework.jdbc.core.simple.ParameterizedSingleColumnRowMapper"%>
<%@tag import="org.springframework.jdbc.core.simple.ParameterizedRowMapper"%>
<%@tag import="com.bonc.dss.hq.commons.AideTag"%>
<%@ tag body-content="scriptless"  pageEncoding="UTF-8"  description="数据查询"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="var" required="true"  rtexprvalue="false"  description="结果集变量名"%>
<%@ attribute name="value" required="false"  rtexprvalue="true"  description="sql语句"%>
<%@ attribute name="scope" required="false" rtexprvalue="false"  description="变量作用域" %>
<%@ attribute name="type" required="false" rtexprvalue="true"  
	description="结果集中对象类型，可选值：map,one,或者一个bean的Class全称如com.company.Foo" %>

<%@ variable  name-from-attribute="var" alias="outvar" scope="AT_BEGIN" %>
<%{
	if(value == null){
		java.io.Writer writer = new java.io.StringWriter();
		getJspBody().invoke(writer);
		value = writer.toString();
	}
	value = "\n"+value.trim()+"\n";
	Object result = null;				
	 if ("one".equals(type) ){
		ParameterizedRowMapper mapper  = new ParameterizedSingleColumnRowMapper();
		result = AideQuery.getSimpleJdbcTemplate().query(value, mapper);
	}else if (type == null || "".equals(type) || "map".equals(type)){
		result = AideQuery.getSimpleJdbcTemplate().queryForList(value);
	}else{
		Class t = Class.forName(type);
		ParameterizedRowMapper mapper  = ParameterizedBeanPropertyRowMapper.newInstance(t);
		result = AideQuery.getSimpleJdbcTemplate().query(value, mapper);
	}
	
	jspContext.setAttribute("outvar",result, com.bonc.dss.hq.commons.AideTag.getScope(scope));
}
%>