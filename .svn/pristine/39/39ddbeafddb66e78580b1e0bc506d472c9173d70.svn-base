package com.bonc.pure.web.action.ws.home.children;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页第二部分--财务核心指标完成情况
 */
public class HomePart2Action extends Children {

	private String kpiId;
	private String year;

	public String kpi() {
		list = daoHelper.queryForList("cw.children.part2Kpi", this);
		return "kpi";
	}

	public void chart() {
		list = daoHelper.queryForList("cw.common.getYear", this);
		String thisYear = "";
		String lastYear = "";
		if (list.size() > 0) {
			Map tempMap = (Map) list.get(0);
			thisYear = (String) tempMap.get("THIS_YEAR");
			lastYear = (String) tempMap.get("LAST_YEAR");
		}
		map = new HashMap();
		year = thisYear;
		List line1List = daoHelper.queryForList("cw.children.part2Line", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.children.part2Line", this);
		map.put("lastYearLine", line2List);
		returnMapAsJson(map);
	}

	public String getKpiId() {
		return kpiId;
	}

	public void setKpiId(String kpiId) {
		this.kpiId = kpiId;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

}
