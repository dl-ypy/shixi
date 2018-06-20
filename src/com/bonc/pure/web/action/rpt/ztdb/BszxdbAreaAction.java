package com.bonc.pure.web.action.rpt.ztdb;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class BszxdbAreaAction extends CwCommon{

	private String monthId;
	private String year;
	private String orgId;

	public String execute() {
		init();
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

	
	public String table1() {
		
		list = daoHelper.queryForList("cw.rpt.ztdb.BszxdbAreaTable1", this);
		return "table1";
	}

	public void chart1() {
		
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
		List line1List = daoHelper.queryForList("cw.rpt.ztdb.BszxdbAreaLine1", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.rpt.ztdb.BszxdbAreaLine1", this);
		map.put("lastYearLine", line2List);	
		
		returnMapAsJson(map);
	
	}

	public String table2() {
		
		list = daoHelper.queryForList("cw.rpt.ztdb.BszxdbAreaTable2", this);
		return "table2";
	}

	public void chart2() {
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
		List line1List = daoHelper.queryForList("cw.rpt.ztdb.BszxdbAreaLine2", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.rpt.ztdb.BszxdbAreaLine2", this);
		map.put("lastYearLine", line2List);
		
		returnMapAsJson(map);
	}

	public String table3() {
		
		list = daoHelper.queryForList("cw.rpt.ztdb.BszxdbAreaTable3", this);

		return "table3";
	}

	public void chart3() {
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
		List line1List = daoHelper.queryForList("cw.rpt.ztdb.BszxdbAreaLine3", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.rpt.ztdb.BszxdbAreaLine3", this);
		map.put("lastYearLine", line2List);
		
		System.out.println("今年的数据---"+line1List);
		System.out.println("去年的数据---"+line2List);
		
		
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


}
