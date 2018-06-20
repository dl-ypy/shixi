/**
 * 
 */
package com.bonc.pure.web.action.ws.home.children;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @title:HomePart5Action.java
 * @description:
 * @author Lihuaizhu
 * @version v1.0
 * @date Dec 29, 2017
 */
public class HomePart5Action extends Children {
	private String kpiId;
	private String kpiName;
	private String year;

	/**
	 * @return
	 */
	public String getRingCharData() {
		list = daoHelper.queryForList("cw.children.getP5RingCharData", this);
		String res = "";
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			res = map.get("XJSR_WC") + "," + map.get("XJSR_MB") + "," + map.get("XJSR_WCL") + "," + map.get("XJSR_WC_2");
		}
		returnString(res);
		return null;
	}

	/**
	 * @return
	 */
	public String getTableData() {
		list = daoHelper.queryForList("cw.children.getP5tableData", this);
		return "table";
	}

	/**
	 * @return
	 */
	public String getLineCharData() {
		String res = "";
		list = daoHelper.queryForList("cw.children.getP5LineCharData", this);
		if (list.size() > 0) {
			Map map;
			String xCol = "";
			String yCol1 = "";
			String yCol2 = "";
			for (int i = 0; i < list.size(); i++) {
				map = (Map) list.get(i);
				xCol += "," + map.get("X_COL");
				yCol1 += "," + map.get("Y_COL1");
				yCol2 += "," + map.get("Y_COL2");
			}
			res = kpiName + "_今年,去年_" + xCol.substring(1) + "_" + yCol1.substring(1) + "_" + yCol2.substring(1);
		}
		returnString(res);
		return null;
	}

	public void lineChart() {
		map = new HashMap();
		list = daoHelper.queryForList("cw.common.getYear", this);
		String thisYear = "";
		String lastYear = "";
		if (list.size() > 0) {
			Map tempMap = (Map) list.get(0);
			thisYear = (String) tempMap.get("THIS_YEAR");
			lastYear = (String) tempMap.get("LAST_YEAR");
		}
		year = thisYear;
		List line1List = daoHelper.queryForList("cw.children.part5Line", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.children.part5Line", this);
		map.put("lastYearLine", line2List);
		returnMapAsJson(map);
	}

	public String getKpiId() {
		return kpiId;
	}

	public void setKpiId(String kpiId) {
		this.kpiId = kpiId;
	}

	public String getKpiName() {
		return kpiName;
	}

	public void setKpiName(String kpiName) {
		this.kpiName = kpiName;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

}
