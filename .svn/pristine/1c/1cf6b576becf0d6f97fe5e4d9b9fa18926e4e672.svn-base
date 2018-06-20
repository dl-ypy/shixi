package com.bonc.pure.web.action.ws.home.children;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页第六部分--提质增效重点指标完成情况
 */
public class HomePart6Action extends Children {

	private String kpiId;
	private String year;

	public String table() {
		list = daoHelper.queryForList("cw.children.part6Table", this);
		return "table";
	}

	public void chart() {
		map = new HashMap();
		List mapList = daoHelper.queryForList("cw.children.part6Map", this);
		map.put("mapList", mapList);
		Map top3Map = (Map) mapList.get(3);
		map.put("top3Value", top3Map.get("VALUE_BH"));
		Map last3Map = (Map) mapList.get(14);
		map.put("last3Value", last3Map.get("VALUE_BH"));

		list = daoHelper.queryForList("cw.common.getYear", this);
		String thisYear = "";
		String lastYear = "";
		if (list.size() > 0) {
			Map tempMap = (Map) list.get(0);
			thisYear = (String) tempMap.get("THIS_YEAR");
			lastYear = (String) tempMap.get("LAST_YEAR");
		}
		year = thisYear;
		List line1List = daoHelper.queryForList("cw.children.part6Line", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.children.part6Line", this);
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
