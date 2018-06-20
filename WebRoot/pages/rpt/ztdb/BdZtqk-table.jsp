<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="p" uri="/pure-tags"%>

<table style="border-collapse: collapse;font-size: 12px;padding: 3px;width: 90%;text-align: center;margin-left: 10px;">
    <thead>
       <tr style="height: 30px;">
           <th style="border-bottom: 1px solid #FF7F7F;border-right: 1px solid #FF7F7F;width: 15%;"></th>
           <s:iterator value="tableTitle" status="tabT">
              <s:if test="tabT.last">
                 <th style="border: 1px solid #FF7F7F;border-top: 0px;width: 5%;text-align: center;">
              </s:if>
              <s:else>
                 <th style="border: 1px solid #FF7F7F;border-top: 0px;border-right: 0px;width: 10%;text-align: center;">
              </s:else>
                 ${kpiName}
                 </th>
           </s:iterator>
       </tr>
    </thead>
    <tbody>
       <tr style="height: 30px;">
           <td style="border: 1px solid #FF7F7F;border-left: 0px;">
              <s:if test='tableType == "N"'>
                                              预算缺口（万元）
              </s:if>
              <s:else>
                                              同比增加（万元）
              </s:else>    
           </td>
           <s:iterator value="tableYSData" status="tabYSD">
              <s:if test="tabYSD.last">
                 <td style="border: 1px solid #FF7F7F;text-align: right;">
              </s:if>
              <s:else>
                 <td style="border: 1px solid #FF7F7F;border-right: 0px;text-align: right;">
              </s:else>
                 ${kpiValue}
                 </td>
           </s:iterator>
       </tr>
       <tr style="height: 30px;">
           <td style="border: 1px solid #FF7F7F;border-left: 0px;">
              <s:if test='tableType == "N"'>
                                              对利润预算完<br/>成比例影响（pp）
              </s:if>
              <s:else>
                                              对利润同比增<br/>长贡献（pp）
              </s:else>
           </td>
           <s:iterator value="tableYXData" status="tabYXD">
              <s:if test="tabYXD.last">
                 <td style="border: 1px solid #FF7F7F;text-align: right;">
              </s:if>
              <s:else>
                 <td style="border: 1px solid #FF7F7F;border-right: 0px;text-align: right;">
              </s:else>
              ${kpiValue}
              </td>
           </s:iterator>
       </tr>
       <tr style="height: 30px;">
           <td style="border: 1px solid #FF7F7F;border-left: 0px;border-bottom: 0px;">排名</td>
           <s:iterator value="tablePMData" status="tabPMD">
              <s:if test="tabPMD.last">
                 <td style="border: 1px solid #FF7F7F;border-bottom: 0px;text-align: right;">
              </s:if>
              <s:else>
                 <td style="border: 1px solid #FF7F7F;border-bottom: 0px;border-right: 0px;text-align: right;">
              </s:else>
              ${kpiValue}
              </td>
           </s:iterator>
       </tr>
    </tbody>
</table>