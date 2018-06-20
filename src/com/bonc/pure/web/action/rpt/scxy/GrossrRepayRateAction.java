package com.bonc.pure.web.action.rpt.scxy;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class GrossrRepayRateAction extends CwCommon {

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
		list = daoHelper.queryForList("cw.rpt.scxy.GrossrRepayRateTable1", this);
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
		List line1List = daoHelper.queryForList("cw.rpt.scxy.GrossrRepayRateLine1", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.rpt.scxy.GrossrRepayRateLine1", this);
		map.put("lastYearLine", line2List);	
	
		returnMapAsJson(map);
	
	}

	public String table2() {
		list = daoHelper.queryForList("cw.rpt.scxy.GrossrRepayRateTable2", this);
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
		List line1List = daoHelper.queryForList("cw.rpt.scxy.GrossrRepayRateLine2", this);
		map.put("thisYearLine", line1List);
		year = lastYear;
		List line2List = daoHelper.queryForList("cw.rpt.scxy.GrossrRepayRateLine2", this);
		map.put("lastYearLine", line2List);
		returnMapAsJson(map);
	}

	public void title() {
		Map map = new HashMap();
		List list1 = daoHelper.queryForList("cw.rpt.scxy.GrossrRepayRateTitle1", this);
		List list2 = daoHelper.queryForList("cw.rpt.scxy.GrossrRepayRateTitle2", this);
		map.put("list1", list1);
		map.put("list2", list2);
		
		System.out.println("list1的数据为"+list1);
		System.out.println("list2的数据为"+list2);
		
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
