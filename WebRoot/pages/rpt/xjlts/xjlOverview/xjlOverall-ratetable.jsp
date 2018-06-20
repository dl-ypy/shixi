<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String contextPath = request.getContextPath();%>
<script type="text/javascript">
 jQuery(document).ready(function() {
	 var dataList=${test};
	 var areaNo="${areaNo}";
	 var data;
	 if(dataList.list1.length>0){
		   if(areaNo=="root"){
				  data = "现金收入比为  "+dataList.list1[0].KPI_04+"%，居北十第 "+dataList.list1[0].KPI_03+"，"+dataList.list1[0].TARGET+dataList.list1[0].KPI_05+" PP。";
			 }else{
				  data = "现金收入比为"+dataList.list1[0].KPI_04+"%，全省第 "+dataList.list1[0].KPI_03+"， "+dataList.list1[0].TARGET+dataList.list1[0].KPI_05+" PP。"
			 }  
	   }
	 document.getElementById("Provice1").innerHTML = data;
}); 
</script>
<div class="row" >
   <span style="float:left;margin-left:30px;" id="Provice1"></span>
</div>
<div style="width:100%;overflow-y:auto;height:200px;">
<table class="grid" style="width:99%;margin-top:2%;" >
	<thead>
		<tr>
			<th align="center" nowrap="nowrap">指标</th>
			<th></th>
			<th align="center" nowrap="nowrap">单位</th>
			<th align="center" nowrap="nowrap">本月</th>
			<th align="center" nowrap="nowrap">环比</th>
			<th align="center" nowrap="nowrap">本年累计</th>
			<th align="center" nowrap="nowrap">增幅</th>
			<th align="center" nowrap="nowrap">排名</th>
		</tr>
	</thead>
    <tbody>
	    <s:iterator value="list" var="data">
			<tr onMouseOut="this.bgColor=''" onMouseOver="this.bgColor='#DFEfFf'">
				<td nowrap="nowrap" onclick="getChart(this, '${KPI_ID}','${KPI_NAME}','${PART_ID }','${RST2 }')" width="7%" align="left"  class="topTableTr"><a href="###" ><s:property escapeHtml="false" value="KPI_NAME"/></a></td>
				<td style="text-align: center;width: 2%;cursor: pointer; " onclick="loadOrgTableDrill(this, '<s:property value="KPI_ID"/>', '<s:property value="ORG_ID"/>','<s:property value="PART_ID"/>')" onmouseover="dyo_mouseOver(this)" onmouseout="dyo_mouseOut(this)">
				    <img class="dyo_span" src="<%=contextPath%>/resources/img/xxjt.png" alt="" style="display: none;width: 15px;height: 15px;">
				    <img class="dyo_span_zw" src="<%=contextPath%>/resources/img/zw.png" alt="" style="display: block;width: 15px;height: 15px;">
				</td>
				<td align="right" width="7%"><s:property escapeHtml="false" value="RST2" /></td>
				<s:if test="PART_ID== 2 && KPI_ID=='KPI_004'">
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0.00%')}" /></td>
				</s:if>
				<s:else>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_01,'###,###,##0')}" /></td>
				</s:else>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_02,'###,###,##0.00%')}" /></td>
				<s:if test="PART_ID== 2 && KPI_ID=='KPI_004'">
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0.00%')}" /></td>
				</s:if>
				<s:else>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_03,'###,###,##0')}" /></td>
				</s:else>
				<td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_04,'###,###,##0.00%')}" /></td>
			    <td align="right" width="7%"><s:property escapeHtml="false" value="%{kpiFmt(KPI_05,'###,###,##0')}" /></td>
			</tr>
		</s:iterator>
	</tbody>
   </table>
</div>
