package com.bonc.pure.web.action.ws.home.children;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页第八部分
 */
public class HomePart8Action extends Children {

	private String kpiId;
	private String year;

	public String table() {
		list = daoHelper.queryForList("cw.children.part8Table", this);
		return "table";
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
		List line1List = daoHelper.queryForList("cw.children.part8Line", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.children.part8Line", this);
		map.put("lastYearLine", line2List);
		returnMapAsJson(map);
	}
	
	public void piechart() {
		List list = daoHelper.queryForList("cw.children.part8Pie", this);
		map = new HashMap();
		if(list!=null&&list.size()>0){
			map=(Map)list.get(0);
		}
		returnMapAsJson(map);
	}

	public String getKpiId() {
		return kpiId;
	}

	public void setKpiId(String kpiId) {
		this.kpiId = kpiId;
	}

}
