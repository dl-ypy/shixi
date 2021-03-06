package com.bonc.pure.web.action.rpt.ztdb;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

/**
 * @author 李林林
 * 本地网执行对标-网运线成本
 *
 */
public class NetworkTransportCostLineAction extends CwCommon {
	private String monthId;
	private String areaNo;
	private String year;
	private String kpiId;
	private String zsbType;
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
	public String queryCumulativeTable() {
		kpiId = kpiId == null || "".equals(kpiId) ? "-1" : kpiId;
		list = daoHelper.queryForList("cw.rpt.ztdb.queryCumulativeTable", this);
		if ("-1".equals(kpiId)) {
			return "table1";
		} else {
			return "tableDrill1";
		}
	}
	public String drillTableByOrg1() {
		list = daoHelper.queryForList("cw.rpt.ztdb.drillTableByOrg1", this);
		return "tableDrill1";
	}
	public String drillTableByOrg2() {
		list = daoHelper.queryForList("cw.rpt.ztdb.drillTableByOrg2", this);
		return "tableDrill2";
	}
	public void cumulativeChart() {
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		list = daoHelper.queryForList("cw.common.getYear", this);
		String thisYear = "";
		String lastYear = "";
		if (list.size() > 0) {
			Map<?, ?> tempMap = (Map<?, ?>) list.get(0);
			thisYear = (String) tempMap.get("THIS_YEAR");
			lastYear = (String) tempMap.get("LAST_YEAR");
		}
		year = thisYear;
		List<?> line1List = daoHelper.queryForList("cw.rpt.ztdb.cumulativeChart", this);
		map.put("thisYearLine1", line1List);
		year = lastYear;
		List<?> line2List = daoHelper.queryForList("cw.rpt.ztdb.cumulativeChart", this);
		map.put("lastYearLine1", line2List);
		returnMapAsJson(map);
	}
	public void accountChart() {
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		list = daoHelper.queryForList("cw.common.getYear", this);
		String thisYear = "";
		String lastYear = "";
		if (list.size() > 0) {
			Map<?, ?> tempMap = (Map<?, ?>) list.get(0);
			thisYear = (String) tempMap.get("THIS_YEAR");
			lastYear = (String) tempMap.get("LAST_YEAR");
		}
		year = thisYear;
		List<?> line1List = daoHelper.queryForList("cw.rpt.ztdb.accountChart", this);
		map.put("thisYearLine2", line1List);
		year = lastYear;
		List<?> line2List = daoHelper.queryForList("cw.rpt.ztdb.accountChart", this);
		map.put("lastYearLine2", line2List);
		returnMapAsJson(map);
	}
	public String queryAccountTable() {
		kpiId = kpiId == null || "".equals(kpiId) ? "-1" : kpiId;
		list = daoHelper.queryForList("cw.rpt.ztdb.queryAccountTable", this);
		if ("-1".equals(kpiId)) {
			return "table2";
		} else {
			return "tableDrill2";
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
	public String getKpiId() {
		return kpiId;
	}
	public void setKpiId(String kpiId) {
		this.kpiId = kpiId;
	}
	public String getZsbType() {
		return zsbType;
	}
	public void setZsbType(String zsbType) {
		this.zsbType = zsbType;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	

}
