package com.bonc.pure.web.action.rpt.kpikh;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bonc.pure.web.action.CwCommon;
import com.bonc.pure.web.util.CollectionEdit;
import com.bonc.pure.web.util.EchartsUtil;

public class KpiKhAction extends CwCommon{
	private String monthId;
	private String areaNo;
	private String aimAreaNo;
	private String kpiId;
	
	public String execute(){
		init();
		initCwAreaSelect();
		monthId = param.get("monthId")==null?"":param.get("monthId").toString();
		if(!"".equals(monthId)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			SimpleDateFormat sdfAim = new SimpleDateFormat("yyyy-MM");
			try {
				monthId = sdfAim.format(sdf.parse(monthId));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return "success";
	}
	
	public String initDbDYSelect(){
		if(!"root".equals(areaNo)){
			list = daoHelper.queryForList("cw.rpt.kpikh.selectDBDyList", this);
		}
		return "dbDYSelect";
	}
	
	//加载kpi指标table
	public String loadKpiKhZbTable(){
		kpiId = kpiId == null || "".equals(kpiId) ? "-1" : kpiId;
		list = daoHelper.queryForList("cw.rpt.kpikh.KpiKhZbTable", this);
		if ("-1".equals(kpiId)) {
			return "table";
		} else {
			return "tableDrill";
		}
	}

	//加载排名对标table
	public String loadPmdbTable(){
		kpiId = kpiId == null || "".equals(kpiId) ? "-1" : kpiId;
		list = daoHelper.queryForList("cw.rpt.kpikh.PmdbTable", this);
		return "pmdbTable";
	}
	
	@SuppressWarnings({ "unchecked" })
	public void loadDfLineChar(){
		String str = "";
		try{
			List<Map<String,Object>> dataList = daoHelper.queryForList("cw.rpt.kpikh.selectKhzbQSLineChar", this);
			
			Map<String,Object> initMap = new HashMap<String, Object>();
			initMap.put("nameCloumn", "MONTH_ID");
			
			List<Map<String,Object>> initList = new ArrayList<Map<String,Object>>();
			
			Map<String,Object> todyMap = new HashMap<String, Object>();
			todyMap.put("dataName", "得分");
			todyMap.put("dataCloumn", "KPI_01");
			todyMap.put("dataType", "line");
			todyMap.put("lineColor", "#DE0000");
			todyMap.put("lineStyleWidth", "2");
			
			initList.add(todyMap);
			
			str = EchartsUtil.initDataChartOther(dataList, initList, initMap);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public void loadZfRingChar(){
		String str = "";
		try{
			kpiId = "KPI_001";
			list = daoHelper.queryForList("cw.rpt.kpikh.selectRingChar", this);
            if(list != null && list.size()>0){
            	Map<String,Object> rMap = (Map<String, Object>) list.get(0);
            	String deFen = rMap.get("DEFEN")==null?"0":rMap.get("DEFEN").toString();
            	String paiMing = rMap.get("PAIMING")==null?"":rMap.get("PAIMING").toString();
            	String aDeFen = rMap.get("ADEFEN")==null?"0":rMap.get("ADEFEN").toString();
            	String areaDesc = rMap.get("AREA_DESC")==null?"":rMap.get("AREA_DESC").toString();
            	String aAreaDesc = rMap.get("A_AREA_DESC")==null?"":rMap.get("A_AREA_DESC").toString();
            	StringBuffer sb = new StringBuffer();
                sb.append("{");
                sb.append("'deFen':");
                sb.append(deFen);
                sb.append(",'paiMing':'");
                sb.append(paiMing);
                sb.append("','aDeFen':");
                sb.append(aDeFen);
                sb.append(",'areaDesc':'");
                sb.append(areaDesc);
                sb.append("','aAreaDesc':'");
                sb.append(aAreaDesc);
                sb.append("','MaxF':130");
                sb.append(",'splitNum':0.77");
                sb.append("}");
                str = sb.toString();
            }
            
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public void loadSrgmRingChar(){
		String str = "";
		try{
			kpiId = "KPI_002";
			list = daoHelper.queryForList("cw.rpt.kpikh.selectRingChar", this);
			if(list != null && list.size()>0){
            	Map<String,Object> rMap = (Map<String, Object>) list.get(0);
            	String deFen = rMap.get("DEFEN")==null?"0":rMap.get("DEFEN").toString();
            	String paiMing = rMap.get("PAIMING")==null?"":rMap.get("PAIMING").toString();
            	String aDeFen = rMap.get("ADEFEN")==null?"0":rMap.get("ADEFEN").toString();
            	String areaDesc = rMap.get("AREA_DESC")==null?"":rMap.get("AREA_DESC").toString();
            	String aAreaDesc = rMap.get("A_AREA_DESC")==null?"":rMap.get("A_AREA_DESC").toString();
            	StringBuffer sb = new StringBuffer();
                sb.append("{");
                sb.append("'deFen':");
                sb.append(deFen);
                sb.append(",'paiMing':'");
                sb.append(paiMing);
                sb.append("','aDeFen':");
                sb.append(aDeFen);
                sb.append(",'areaDesc':'");
                sb.append(areaDesc);
                sb.append("','aAreaDesc':'");
                sb.append(aAreaDesc);
                sb.append("','MaxF':50");
                sb.append(",'splitNum':0.76");
                sb.append("}");
                str = sb.toString();
            }
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public void loadXyjzRingChar(){
		String str = "";
		try{
			kpiId = "KPI_025";
			list = daoHelper.queryForList("cw.rpt.kpikh.selectRingChar", this);
			if(list != null && list.size()>0){
            	Map<String,Object> rMap = (Map<String, Object>) list.get(0);
            	String deFen = rMap.get("DEFEN")==null?"0":rMap.get("DEFEN").toString();
            	String paiMing = rMap.get("PAIMING")==null?"":rMap.get("PAIMING").toString();
            	String aDeFen = rMap.get("ADEFEN")==null?"0":rMap.get("ADEFEN").toString();
            	String areaDesc = rMap.get("AREA_DESC")==null?"":rMap.get("AREA_DESC").toString();
            	String aAreaDesc = rMap.get("A_AREA_DESC")==null?"":rMap.get("A_AREA_DESC").toString();
            	StringBuffer sb = new StringBuffer();
                sb.append("{");
                sb.append("'deFen':");
                sb.append(deFen);
                sb.append(",'paiMing':'");
                sb.append(paiMing);
                sb.append("','aDeFen':");
                sb.append(aDeFen);
                sb.append(",'areaDesc':'");
                sb.append(areaDesc);
                sb.append("','aAreaDesc':'");
                sb.append(aAreaDesc);
                sb.append("','MaxF':60");
                sb.append(",'splitNum':0.7");
                sb.append("}");
                str = sb.toString();
            }
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public void loadNdzdRingChar(){
		String str = "";
		try{
			kpiId = "KPI_051";
			list = daoHelper.queryForList("cw.rpt.kpikh.selectRingChar", this);
			if(list != null && list.size()>0){
            	Map<String,Object> rMap = (Map<String, Object>) list.get(0);
            	String deFen = rMap.get("DEFEN")==null?"0":rMap.get("DEFEN").toString();
            	String paiMing = rMap.get("PAIMING")==null?"":rMap.get("PAIMING").toString();
            	String aDeFen = rMap.get("ADEFEN")==null?"0":rMap.get("ADEFEN").toString();
            	String areaDesc = rMap.get("AREA_DESC")==null?"":rMap.get("AREA_DESC").toString();
            	String aAreaDesc = rMap.get("A_AREA_DESC")==null?"":rMap.get("A_AREA_DESC").toString();
            	StringBuffer sb = new StringBuffer();
                sb.append("{");
                sb.append("'deFen':");
                sb.append(deFen);
                sb.append(",'paiMing':'");
                sb.append(paiMing);
                sb.append("','aDeFen':");
                sb.append(aDeFen);
                sb.append(",'areaDesc':'");
                sb.append(areaDesc);
                sb.append("','aAreaDesc':'");
                sb.append(aAreaDesc);
                sb.append("','MaxF':30");
                sb.append(",'splitNum':0.67");
                sb.append("}");
                str = sb.toString();
            }
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings({ "unchecked" })
	public void loadPmKHAndDeFenJD(){
		String str = "";
		try{
			List<Map<String,Object>> pmKHList = daoHelper.queryForList("cw.rpt.kpikh.selectPaiMingKH", this);
			List<Map<String,Object>> deFenJDList = daoHelper.queryForList("cw.rpt.kpikh.selectDeFenJD", this);
			
			StringBuffer sb = new StringBuffer();
			String pmKHStr = initString(pmKHList);
			String deFenJDStr = initString(deFenJDList);
			sb.append("{");
			sb.append("'pmKHStr':'");
			sb.append(pmKHStr);
			sb.append("'");
			sb.append(",'deFenJDStr':'");
			sb.append(deFenJDStr);
			sb.append("'");
			sb.append("}");
			str = sb.toString();
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String initString(List<Map<String,Object>> dataList){
		StringBuffer sb = new StringBuffer();
		int i=0;
		for(Map<String,Object> dataMap:dataList){
			String kpiName = dataMap.get("KPI_NAME")==null?"":dataMap.get("KPI_NAME").toString();
			if(i!=0){
				sb.append("；");
			}
			sb.append(kpiName);
			i++;
		}
		return sb.toString();
	}
	
	public void initZgZdF(){
		String str = "";
		try{
			list = daoHelper.queryForList("cw.rpt.kpikh.selectKpiZgZdf", this);
			str = CollectionEdit.listToString(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getMonthId() {
		return monthId;
	}

	public void setMonthId(String monthId) {
		if(monthId != null){
			monthId = monthId.replaceAll("-", "");
		}
		this.monthId = monthId;
	}

	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	public String getAimAreaNo() {
		return aimAreaNo;
	}

	public void setAimAreaNo(String aimAreaNo) {
		this.aimAreaNo = aimAreaNo;
	}

	public String getKpiId() {
		return kpiId;
	}

	public void setKpiId(String kpiId) {
		this.kpiId = kpiId;
	}

}
