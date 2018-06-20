package com.bonc.pure.web.action.rpt.ztdb;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class BszxdbWyxcbAction extends CwCommon {

	private String monthId;
	private String year;
	private String orgId;
	private String kpiId;

	public String execute() {
		init();
		initCwProvincesItemSelect();
		monthId = param.get("monthId") == null ? "" : param.get("monthId").toString();
		if (!"".equals(monthId)) {
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

	public String table() {
		kpiId = kpiId == null || "".equals(kpiId) ? "-1" : kpiId;
		list = daoHelper.queryForList("cw.rpt.ztdb.BszxdbWyxcbTable", this);
		if ("-1".equals(kpiId)) {
			return "table";
		} else {
			return "tableDrill";
		}
	}
	public String drillTableByOrg() {
		list = daoHelper.queryForList("cw.rpt.ztdb.drillTableByOrg", this);
		return "tableDrill";
	}

	public void chart() {
		Map map = new HashMap();
		list = daoHelper.queryForList("cw.common.getYear", this);
		String thisYear = "";
		String lastYear = "";
		if (list.size() > 0) {
			Map tempMap = (Map) list.get(0);
			thisYear = (String) tempMap.get("THIS_YEAR");
			lastYear = (String) tempMap.get("LAST_YEAR");
		}
		year = thisYear;
		List line1List = daoHelper.queryForList("cw.rpt.ztdb.BszxdbWyxcbLine", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.rpt.ztdb.BszxdbWyxcbLine", this);
		map.put("lastYearLine", line2List);
		returnMapAsJson(map);
	}

	public String getMonthId() {
		return monthId;
	}

	public void setMonthId(String monthId) {
		if (monthId != null) {
			this.monthId = monthId.replaceAll("-", "");
		}
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getKpiId() {
		return kpiId;
	}

	public void setKpiId(String kpiId) {
		this.kpiId = kpiId;
	}

}
