package com.bonc.pure.web.action.ws.home.children;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页第一部分
 */
public class HomePart1Action extends Children {

	private String kpiId;
	private String year;

	public void text() {
		list = daoHelper.queryForList("cw.children.part1Text", this);
		if (list.size() > 0) {
			map = (Map) list.get(0);
		}
		returnMapAsJson(map);
	}

	public String table() {
		list = daoHelper.queryForList("cw.children.part1Table", this);
		return "table";
	}

	public void chart() {
		map = new HashMap();
		List mapList = daoHelper.queryForList("cw.children.part1Map", this);
		map.put("mapList", mapList);
		Map top3Map = (Map) mapList.get(3);
		map.put("top3Value", top3Map.get("VALUE_L_ZF"));
		Map last3Map = (Map) mapList.get(14);
		map.put("last3Value", last3Map.get("VALUE_L_ZF"));
		String top3Area = ((Map) mapList.get(0)).get("AREA_DESC") + "、" + ((Map) mapList.get(1)).get("AREA_DESC") + "、" + ((Map) mapList.get(2)).get("AREA_DESC");
		String last3Area = ((Map) mapList.get(17)).get("AREA_DESC") + "、" + ((Map) mapList.get(16)).get("AREA_DESC") + "、" + ((Map) mapList.get(15)).get("AREA_DESC");
		map.put("top3Area", top3Area);
		map.put("last3Area", last3Area);

		list = daoHelper.queryForList("cw.common.getYear", this);
		String thisYear = "";
		String lastYear = "";
		if (list.size() > 0) {
			Map tempMap = (Map) list.get(0);
			thisYear = (String) tempMap.get("THIS_YEAR");
			lastYear = (String) tempMap.get("LAST_YEAR");
		}
		year = thisYear;
		List line1List = daoHelper.queryForList("cw.children.part1Line", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.children.part1Line", this);
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
