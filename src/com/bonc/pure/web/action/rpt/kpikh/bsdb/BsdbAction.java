package com.bonc.pure.web.action.rpt.kpikh.bsdb;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bonc.pure.web.action.CwCommon;
import com.bonc.pure.web.util.CollectionEdit;
import com.bonc.pure.web.util.EchartsUtil;

public class BsdbAction extends CwCommon {

	private String monthId;
	private String orgId;
	private String kpiId;
	private String aimOrgId;
	private String dbType;
	private String thisMonth;
	private String lastMonth;
	private String kpiType;
	private String table3dbNum;
	private List<Map<String,Object>> dfList;
	
	public String execute(){
		init();
		initCwProvincesItemSelect();
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
	/**
	 * 获取对标地域
	 * @return
	 */
	public String initDbDYSelect(){
		list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectDBDyList", this);
		return "dbDYSelect";
	}
	
	/**
	 * 获取北十对标表格1的数据
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String table1(){
		list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.bsdbTable1", this);
		dfList = daoHelper.queryForList("cw.rpt.kpikh.bsdb.bsdbTable1_1", this);
		return "table1";
	}
	
	/**
	 * 获取北十对标表格3的数据
	 * @return
	 */
	public String table3(){
		list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.bsdbTable3", this);
		return "table3";
	}
	
	/**
	 * 获取北十对标表格3对标的数据
	 * @return
	 */
	public String table3db(){
		if("zf".equals(dbType)){
			table3dbNum = "100";
			list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.bsdbTable3dbZf", this);
		}else if("srgm".equals(dbType)){
			table3dbNum = "38";
			list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.bsdbTable3dbSrgm", this);
		}else if("xyjz".equals(dbType)){
			table3dbNum = "42";
			list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.bsdbTable3dbXyjz", this);
		}else if("ndzd".equals(dbType)){
			table3dbNum = "20";
			list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.bsdbTable3dbNdzd", this);
		}else{
			table3dbNum = "";
			list=null;
		}
		Integer temp = Integer.parseInt(monthId.substring(4));
		thisMonth = temp.toString();
		temp--;
		if(temp == 0){
			temp = 12;
		}
		lastMonth = temp.toString();
		return "table3db";
	}
	
	/**
	 * 获取总分仪表盘数据
	 */
	@SuppressWarnings({ "unchecked" })
	public void loadRingChar(){
		String str = "";
		String splitNum = "";
		String MaxF = "";
		try{
			if("KPI_1".equals(kpiType)){//总分
				MaxF = "130";
				splitNum = "0.77";
				list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectZfRingChar", this);
			}else if("KPI_2".equals(kpiType)){// 收入规模类
				MaxF = "50";
				splitNum = "0.76";
				list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectSrgmRingChar", this);
			}else if("KPI_3".equals(kpiType)){// 效益价值类
				MaxF = "60";
				splitNum = "0.7";
				list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectXyjzRingChar", this);
			}else if("KPI_4".equals(kpiType)){// 年度重点类
				MaxF = "30";
				splitNum = "0.67";
				list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectNdzdRingChar", this);
			}else{
				list = null;
			}
            if(list != null && list.size()>0){
            	Map<String,Object> rMap = (Map<String, Object>) list.get(0);
            	String deFen = rMap.get("DEFEN")==null?"0":rMap.get("DEFEN").toString();
            	String paiMing = rMap.get("PAIMING")==null?"":rMap.get("PAIMING").toString();
            	String aDeFen = rMap.get("ADEFEN")==null?"0":rMap.get("ADEFEN").toString();
            	String orgName = rMap.get("ORG_NAME")==null?"":rMap.get("ORG_NAME").toString();
            	String aOrgName = rMap.get("A_ORG_NAME")==null?"":rMap.get("A_ORG_NAME").toString();
            	StringBuffer sb = new StringBuffer();
                sb.append("{");
                sb.append("'deFen':");
                sb.append(deFen);
                sb.append(",'paiMing':'");
                sb.append(paiMing);
                sb.append("','aDeFen':");
                sb.append(aDeFen);
                sb.append(",'orgName':'");
                sb.append(orgName);
                sb.append("','aOrgName':'");
                sb.append(aOrgName);
                sb.append("','MaxF':'");
                sb.append(MaxF);
                sb.append("','splitNum':'");
                sb.append(splitNum);
                sb.append("'}");
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
	
	/**
	 * 获取仪表盘最高最低分数
	 */
	public void initZgZdF(){
		Map map = new HashMap();
		List zfList = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectZfZgZdf", this);
		List srgmList = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectSrgmZgZdf", this);
		List xyjzList = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectXyjzZgZdf", this);
		List ndzdList = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectNdzdZgZdf", this);
		map.put("zfList", zfList);
		map.put("srgmList", srgmList);
		map.put("xyjzList", xyjzList);
		map.put("ndzdList", ndzdList);
		returnMapAsJson(map);
	}

	/**
	 * 加载北十指标table
	 * @return
	 */
	public String loadBsKhZbTable(){
		kpiId = kpiId == null || "".equals(kpiId) ? "-1" : kpiId;
		list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.bsKhZbTable", this);
		if ("-1".equals(kpiId)) {
			return "table2";
		} else {
			return "table2Drill";
		}
	}
	
	/**
	 * 加载排名对标table
	 * @return
	 */
	public String loadPmdbTable(){
		kpiId = kpiId == null || "".equals(kpiId) ? "-1" : kpiId;
		list = daoHelper.queryForList("cw.rpt.kpikh.bsdb.PmdbTable", this);
		return "table2db";
	}
		
	/**
	 * 和获取指标年度变化趋势图
	 * @return
	 */
	public void getLineList(){
		Map map = new HashMap();
		List zbList = daoHelper.queryForList("cw.rpt.kpikh.bsdb.bsdbLine1", this);
		returnMapAsJson(map);
	}
	
	@SuppressWarnings({ "unchecked" })
	public void loadDfLineChar(){
		String str = "";
		try{
			List<Map<String,Object>> dataList = daoHelper.queryForList("cw.rpt.kpikh.bsdb.bsdbLine1", this);
			
			Map<String,Object> initMap = new HashMap<String, Object>();
			initMap.put("nameCloumn", "MONTH_ID");
			
			List<Map<String,Object>> initList = new ArrayList<Map<String,Object>>();
			
			Map<String,Object> todyMap = new HashMap<String, Object>();
			todyMap.put("dataName", "得分");
			todyMap.put("dataCloumn", "KPI_03");
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
	
	public void loadPmKHAndDeFenJD(){
		Map map = new HashMap();
		List pMKHList = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectPaiMingKH", this);
		List dFJDList = daoHelper.queryForList("cw.rpt.kpikh.bsdb.selectDeFenJD", this);
		map.put("pMKHList", pMKHList);
		map.put("dFJDList", dFJDList);
		returnMapAsJson(map);
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
	
	public String getKpiId() {
		return kpiId;
	}

	public void setKpiId(String kpiId) {
		this.kpiId = kpiId;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	public String getAimOrgId() {
		return aimOrgId;
	}
	public void setAimOrgId(String aimOrgId) {
		this.aimOrgId = aimOrgId;
	}
	public String getDbType() {
		return dbType;
	}
	public void setDbType(String dbType) {
		this.dbType = dbType;
	}
	public String getLastMonth() {
		return lastMonth;
	}
	public void setLastMonth(String lastMonth) {
		this.lastMonth = lastMonth;
	}
	public String getKpiType() {
		return kpiType;
	}
	public void setKpiType(String kpiType) {
		this.kpiType = kpiType;
	}
	public String getThisMonth() {
		return thisMonth;
	}
	public void setThisMonth(String thisMonth) {
		this.thisMonth = thisMonth;
	}
	public String getTable3dbNum() {
		return table3dbNum;
	}
	public void setTable3dbNum(String table3dbNum) {
		this.table3dbNum = table3dbNum;
	}
	public List<Map<String, Object>> getDfList() {
		return dfList;
	}
	public void setDfList(List<Map<String, Object>> dfList) {
		this.dfList = dfList;
	}
}
