<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>

<s:if test='areaNo == "root"'>
    <label for="aimAreaNo" style="color: #C23531;">对标地域</label>
    <select id="aimAreaNo" class="form-control" style="width: 66px;height: 25px;font-size: 12px;padding: 0px;">
       <option value ="-1">--</option>
    </select>
</s:if>
<s:else>
    <label for="aimAreaNo" style="color: #C23531;">对标地域</label>
    <s:select id="aimAreaNo" cssClass="form-control" list="list" listKey="AREA_NO" listValue="AREA_DESC" cssStyle="width: 66px;height: 25px;font-size: 12px;padding: 0px;"></s:select>
</s:else>

