package com.bonc.pure.web.action.rpt.ztdb;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bonc.pure.web.action.CwCommon;

public class BdZtqkAction extends CwCommon{
	private String monthId;
	private String areaNo;
	private List<Map<String,Object>> tableTitle;
	private List<Map<String,Object>> tableYSData;
	private List<Map<String,Object>> tableYXData;
	private List<Map<String,Object>> tablePMData;
	private String tableType;
	
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
	
	@SuppressWarnings("unchecked")
	public void initRingChart(){
		String str = "";
		try{
		    List<Map<String,Object>> ringList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_LRYSWcqk", this);
		    if(ringList != null && ringList.size()>0){
		    	Map<String,Object> ringMap = ringList.get(0);
		    	String paiM = ringMap.get("AREA_ORD")== null?"北十第":ringMap.get("AREA_ORD").toString();
		    	String chartZB = ringMap.get("CHART_ZB")== null?"0":ringMap.get("CHART_ZB").toString();
		    	String wcl = ringMap.get("WCL")== null?"0":ringMap.get("WCL").toString();
		    	str = paiM + "," + chartZB + "," + wcl;
		    }else{
		    	str = "北十第,0,0";
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
	
    @SuppressWarnings("unchecked")
	public void initNowStackChart(){
    	String str = "";
		try{
			List<Map<String,Object>> liRunList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_now_LiRun", this);
			List<Map<String,Object>> otherKpiList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_now_kpi", this);
			str = initStackStr(liRunList, otherKpiList);
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
    
    @SuppressWarnings("unchecked")
	public String initNowTable(){
    	List<Map<String,Object>> liRunList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_now_LiRun", this);
		List<Map<String,Object>> otherKpiList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_now_kpi", this);
		List<Map<String,Object>> hjKpiList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_now_kpi_hj", this);
		initTableList(liRunList, otherKpiList,hjKpiList);
		tableType = "N";
    	return "table";
    }
    
    @SuppressWarnings("unchecked")
	public void initLastStackChart(){
    	String str = "";
		try{
			//临时的
			List<Map<String,Object>> liRunList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_Last_LiRun", this);
			List<Map<String,Object>> otherKpiList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_Last_kpi", this);
			str = initStackStr(liRunList, otherKpiList);
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
    
    @SuppressWarnings("unchecked")
	public String initLastTable(){
    	List<Map<String,Object>> liRunList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_Last_LiRun", this);
		List<Map<String,Object>> otherKpiList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_Last_kpi", this);
		List<Map<String,Object>> hjKpiList = daoHelper.queryForList("cw.rpt.bdztdb.selectZTQK_Last_kpi_hj", this);
		initTableList(liRunList, otherKpiList,hjKpiList);
		tableType = "L";
    	return "table";
    }
    
    public void initTableList(List<Map<String,Object>> liRunList,List<Map<String,Object>> otherKpiList,List<Map<String,Object>> hjKpiList){
    	double liRunMbValue =0;
		for(Map<String,Object> liRunMap:liRunList){
			String kpiId = liRunMap.get("KPI_ID")==null?"":liRunMap.get("KPI_ID").toString();
			double kpiMinus = liRunMap.get("KPI_MINUS")==null?0:Double.parseDouble(liRunMap.get("KPI_MINUS").toString());
			if("KPI_001".equals(kpiId)){
				liRunMbValue = kpiMinus;
			}
		}
		List<Map<String,Object>> otherKpiZList = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> otherKpiFList = new ArrayList<Map<String,Object>>();
		//将指标分类，正的放一起，负的放一起
		for(Map<String,Object> otherKpiMap:otherKpiList){
			double kpiMinus = otherKpiMap.get("KPI_MINUS")==null?0:Double.parseDouble(otherKpiMap.get("KPI_MINUS").toString());
			if(kpiMinus >= 0){
				otherKpiZList.add(otherKpiMap);
			}else{
				otherKpiFList.add(otherKpiMap);
			}
		}
		tableTitle = new ArrayList<Map<String,Object>>();
		tableYSData = new ArrayList<Map<String,Object>>();
		tableYXData = new ArrayList<Map<String,Object>>();
		tablePMData = new ArrayList<Map<String,Object>>();
		
		//遍历正负List的顺序要跟 方法 initStackStr 保持一致。
		
		if(liRunMbValue >=0){
			for(Map<String,Object> otherKpiZMap:otherKpiZList){
				String kpiName = otherKpiZMap.get("KPI_NAME")==null?"":otherKpiZMap.get("KPI_NAME").toString();
    			String kpiMinus = otherKpiZMap.get("KPI_MINUS")==null?"":otherKpiZMap.get("KPI_MINUS").toString();
    			String lrRate = otherKpiZMap.get("LR_RATE")==null?"":otherKpiZMap.get("LR_RATE").toString();
    			String lrRateOrd = otherKpiZMap.get("LR_RATE_ORD")==null?"":otherKpiZMap.get("LR_RATE_ORD").toString();
    			
    			Map<String,Object> titleMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> ysqkMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> lryxMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> pmMap = new LinkedHashMap<String, Object>();
    			
    			titleMap.put("kpiName", kpiName);
    			tableTitle.add(titleMap);
    			ysqkMap.put("kpiValue", kpiMinus);
    			tableYSData.add(ysqkMap);
    			lryxMap.put("kpiValue", lrRate);
    			tableYXData.add(lryxMap);
    			pmMap.put("kpiValue", lrRateOrd);
    			tablePMData.add(pmMap);
			}
			
            for(Map<String,Object> otherKpiFMap:otherKpiFList){
            	String kpiName = otherKpiFMap.get("KPI_NAME")==null?"":otherKpiFMap.get("KPI_NAME").toString();
            	String kpiMinus = otherKpiFMap.get("KPI_MINUS")==null?"":otherKpiFMap.get("KPI_MINUS").toString();
            	String lrRate = otherKpiFMap.get("LR_RATE")==null?"":otherKpiFMap.get("LR_RATE").toString();
    			String lrRateOrd = otherKpiFMap.get("LR_RATE_ORD")==null?"":otherKpiFMap.get("LR_RATE_ORD").toString();
    			
    			Map<String,Object> titleMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> ysqkMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> lryxMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> pmMap = new LinkedHashMap<String, Object>();
    			
    			titleMap.put("kpiName", kpiName);
    			tableTitle.add(titleMap);
    			ysqkMap.put("kpiValue", kpiMinus);
    			tableYSData.add(ysqkMap);
    			lryxMap.put("kpiValue", lrRate);
    			tableYXData.add(lryxMap);
    			pmMap.put("kpiValue", lrRateOrd);
    			tablePMData.add(pmMap);
			}
		}else{
			for(Map<String,Object> otherKpiFMap:otherKpiFList){
            	String kpiName = otherKpiFMap.get("KPI_NAME")==null?"":otherKpiFMap.get("KPI_NAME").toString();
            	String kpiMinus = otherKpiFMap.get("KPI_MINUS")==null?"":otherKpiFMap.get("KPI_MINUS").toString();
            	String lrRate = otherKpiFMap.get("LR_RATE")==null?"":otherKpiFMap.get("LR_RATE").toString();
    			String lrRateOrd = otherKpiFMap.get("LR_RATE_ORD")==null?"":otherKpiFMap.get("LR_RATE_ORD").toString();
    			
    			Map<String,Object> titleMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> ysqkMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> lryxMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> pmMap = new LinkedHashMap<String, Object>();
    			
    			titleMap.put("kpiName", kpiName);
    			tableTitle.add(titleMap);
    			ysqkMap.put("kpiValue", kpiMinus);
    			tableYSData.add(ysqkMap);
    			lryxMap.put("kpiValue", lrRate);
    			tableYXData.add(lryxMap);
    			pmMap.put("kpiValue", lrRateOrd);
    			tablePMData.add(pmMap);
			}
			
			for(Map<String,Object> otherKpiZMap:otherKpiZList){
				String kpiName = otherKpiZMap.get("KPI_NAME")==null?"":otherKpiZMap.get("KPI_NAME").toString();
				String kpiMinus = otherKpiZMap.get("KPI_MINUS")==null?"":otherKpiZMap.get("KPI_MINUS").toString();
				String lrRate = otherKpiZMap.get("LR_RATE")==null?"":otherKpiZMap.get("LR_RATE").toString();
    			String lrRateOrd = otherKpiZMap.get("LR_RATE_ORD")==null?"":otherKpiZMap.get("LR_RATE_ORD").toString();
    			
    			Map<String,Object> titleMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> ysqkMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> lryxMap = new LinkedHashMap<String, Object>();
    			Map<String,Object> pmMap = new LinkedHashMap<String, Object>();
    			
    			titleMap.put("kpiName", kpiName);
    			tableTitle.add(titleMap);
    			ysqkMap.put("kpiValue", kpiMinus);
    			tableYSData.add(ysqkMap);
    			lryxMap.put("kpiValue", lrRate);
    			tableYXData.add(lryxMap);
    			pmMap.put("kpiValue", lrRateOrd);
    			tablePMData.add(pmMap);
			}
		}
		for(Map<String,Object> hjKpiMap:hjKpiList){
			String kpiName = hjKpiMap.get("KPI_NAME")==null?"":hjKpiMap.get("KPI_NAME").toString();
			String kpiMinus = hjKpiMap.get("KPI_MINUS")==null?"":hjKpiMap.get("KPI_MINUS").toString();
			String lrRate = hjKpiMap.get("LR_RATE")==null?"":hjKpiMap.get("LR_RATE").toString();
			String lrRateOrd = hjKpiMap.get("LR_RATE_ORD")==null?"":hjKpiMap.get("LR_RATE_ORD").toString();
			
			Map<String,Object> titleMap = new LinkedHashMap<String, Object>();
			Map<String,Object> ysqkMap = new LinkedHashMap<String, Object>();
			Map<String,Object> lryxMap = new LinkedHashMap<String, Object>();
			Map<String,Object> pmMap = new LinkedHashMap<String, Object>();
			
			titleMap.put("kpiName", kpiName);
			tableTitle.add(titleMap);
			ysqkMap.put("kpiValue", kpiMinus);
			tableYSData.add(ysqkMap);
			lryxMap.put("kpiValue", lrRate);
			tableYXData.add(lryxMap);
			pmMap.put("kpiValue", lrRateOrd);
			tablePMData.add(pmMap);
		}
		
    }
    
    public String initStackStr(List<Map<String,Object>> liRunList,List<Map<String,Object>> otherKpiList){
    	String str = "";
    	try{
    		StringBuffer allStr = new StringBuffer();
    		
    		StringBuffer xAxisSB = new StringBuffer();
    		StringBuffer baseStackSB = new StringBuffer();
    		StringBuffer barOneSB = new StringBuffer();
    		StringBuffer barTwoSB = new StringBuffer();
    		
    		xAxisSB.append("[");
    		baseStackSB.append("[");
    		barOneSB.append("[");
    		barTwoSB.append("[");
    		if(liRunList !=null && otherKpiList != null && liRunList.size()>0 && otherKpiList.size()>0){
    			String liRunMbName = "";
        		double liRunMbValue =0;
        		String liRunWcName = "";
        		double liRunWcValue = 0;
        		//处理图形的首位指标
        		for(Map<String,Object> liRunMap:liRunList){
        			String kpiId = liRunMap.get("KPI_ID")==null?"":liRunMap.get("KPI_ID").toString();
        			String kpiName = liRunMap.get("KPI_NAME")==null?"":liRunMap.get("KPI_NAME").toString();
        			double kpiMinus = liRunMap.get("KPI_MINUS")==null?0:Double.parseDouble(liRunMap.get("KPI_MINUS").toString());
        			if("KPI_001".equals(kpiId)){
        				liRunMbName = kpiName;
        				liRunMbValue = kpiMinus;
        			}else{
        				liRunWcName = kpiName;
        				liRunWcValue = kpiMinus;
        			}
        		}
        		List<Map<String,Object>> otherKpiZList = new ArrayList<Map<String,Object>>();
        		List<Map<String,Object>> otherKpiFList = new ArrayList<Map<String,Object>>();
        		//将指标分类，正的放一起，负的放一起
        		for(Map<String,Object> otherKpiMap:otherKpiList){
        			double kpiMinus = otherKpiMap.get("KPI_MINUS")==null?0:Double.parseDouble(otherKpiMap.get("KPI_MINUS").toString());
        			if(kpiMinus >= 0){
        				otherKpiZList.add(otherKpiMap);
        			}else{
        				otherKpiFList.add(otherKpiMap);
        			}
        		}
        		
        		xAxisSB.append("'"+ liRunMbName + "'");
        		
        		baseStackSB.append("0");
        		
        		barOneSB.append("{value :");
        		barOneSB.append(liRunMbValue);
        		barOneSB.append(",itemStyle:{normal:{color:'#4472C4'}}}");
        		
        		barTwoSB.append("'-'");
        		double midValue = 0;
        		double lastValue = liRunMbValue;
        		//遍历正负List的顺序要跟方法  initTableList 保持一致。
        		if(liRunMbValue >=0){
        			for(Map<String,Object> otherKpiZMap:otherKpiZList){
        				String kpiName = otherKpiZMap.get("KPI_NAME")==null?"":otherKpiZMap.get("KPI_NAME").toString();
            			double kpiMinus = otherKpiZMap.get("KPI_MINUS")==null?0:Double.parseDouble(otherKpiZMap.get("KPI_MINUS").toString());
            			midValue = lastValue;
            			lastValue = lastValue + kpiMinus;
            			
            			xAxisSB.append(",'"+kpiName + "'");
            			baseStackSB.append("," + midValue);
            			barOneSB.append("," + kpiMinus);
            			barTwoSB.append(",'-'");
        			}
        			
                    for(Map<String,Object> otherKpiFMap:otherKpiFList){
                    	String kpiName = otherKpiFMap.get("KPI_NAME")==null?"":otherKpiFMap.get("KPI_NAME").toString();
            			double kpiMinus = otherKpiFMap.get("KPI_MINUS")==null?0:Double.parseDouble(otherKpiFMap.get("KPI_MINUS").toString());
            			
            			xAxisSB.append(",'"+kpiName + "'");
            			if(lastValue > 0){
            				lastValue = lastValue + kpiMinus;
            				midValue = lastValue;
            				baseStackSB.append("," + midValue);
                			barOneSB.append(",'-'");
            				barTwoSB.append("," + Math.abs(kpiMinus));
            			}else{
            				lastValue = lastValue + kpiMinus;
            				midValue = lastValue;
            				baseStackSB.append("," + midValue);
                			barOneSB.append(",'-'");
            				barTwoSB.append(",-" + Math.abs(kpiMinus));
            			}
            			
        			}
        		}else{
        			for(Map<String,Object> otherKpiFMap:otherKpiFList){
                    	String kpiName = otherKpiFMap.get("KPI_NAME")==null?"":otherKpiFMap.get("KPI_NAME").toString();
            			double kpiMinus = otherKpiFMap.get("KPI_MINUS")==null?0:Double.parseDouble(otherKpiFMap.get("KPI_MINUS").toString());
            			midValue = lastValue;
            			lastValue = lastValue + kpiMinus;
            			
            			xAxisSB.append(",'"+kpiName + "'");
            			baseStackSB.append("," + midValue);
            			barOneSB.append("," + kpiMinus);
            			barTwoSB.append(",'-'");
        			}
        			
        			for(Map<String,Object> otherKpiZMap:otherKpiZList){
        				String kpiName = otherKpiZMap.get("KPI_NAME")==null?"":otherKpiZMap.get("KPI_NAME").toString();
            			double kpiMinus = otherKpiZMap.get("KPI_MINUS")==null?0:Double.parseDouble(otherKpiZMap.get("KPI_MINUS").toString());
            			
            			xAxisSB.append(",'"+kpiName + "'");
            			if(lastValue <0){
            				lastValue = lastValue + kpiMinus;
                			midValue = lastValue;
                			baseStackSB.append("," + midValue);
                			barOneSB.append(",'-'");
                			barTwoSB.append(",-" + Math.abs(kpiMinus));
            			}else{
            				lastValue = lastValue + kpiMinus;
                			midValue = lastValue;
                			baseStackSB.append("," + midValue);
                			barOneSB.append(",'-'");
                			barTwoSB.append("," + Math.abs(kpiMinus));
            			}
        			}
        		}

        		xAxisSB.append(",'"+ liRunWcName + "'");
        		if(liRunMbValue > 0){
        			if(lastValue > 0 ){
            			baseStackSB.append(",0");
            		}else{
            			baseStackSB.append("," + lastValue);
            		}
        		}else{
        			if(lastValue > 0 ){
        				baseStackSB.append("," + lastValue);
            		}else{
            			baseStackSB.append(",0");
            		}
        		}
        		barOneSB.append(",'-'");
        		
        		barTwoSB.append(",{value :");
        		barTwoSB.append(liRunWcValue);
        		barTwoSB.append(",itemStyle:{normal:{color:'#4472C4'}}}");
    		}
    		
    		xAxisSB.append("]");
    		baseStackSB.append("]");
    		barOneSB.append("]");
    		barTwoSB.append("]");
    		
    		allStr.append("{");
    		allStr.append("'xAxis':" + xAxisSB.toString());
    		allStr.append(",");
    		allStr.append("'baseStack':" + baseStackSB.toString());
    		allStr.append(",");
    		allStr.append("'barOne':" + barOneSB.toString());
    		allStr.append(",");
    		allStr.append("'barTwo':" + barTwoSB.toString());
    		allStr.append("}");
    		
    		str = allStr.toString();
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    	return str;
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

	public List<Map<String, Object>> getTableTitle() {
		return tableTitle;
	}

	public void setTableTitle(List<Map<String, Object>> tableTitle) {
		this.tableTitle = tableTitle;
	}

	public List<Map<String, Object>> getTableYSData() {
		return tableYSData;
	}

	public void setTableYSData(List<Map<String, Object>> tableYSData) {
		this.tableYSData = tableYSData;
	}

	public List<Map<String, Object>> getTableYXData() {
		return tableYXData;
	}

	public void setTableYXData(List<Map<String, Object>> tableYXData) {
		this.tableYXData = tableYXData;
	}

	public List<Map<String, Object>> getTablePMData() {
		return tablePMData;
	}

	public void setTablePMData(List<Map<String, Object>> tablePMData) {
		this.tablePMData = tablePMData;
	}

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}
	
}
