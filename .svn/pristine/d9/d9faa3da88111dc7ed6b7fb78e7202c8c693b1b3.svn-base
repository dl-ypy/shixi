package com.bonc.pure.web.action.rpt.xjlts.cashflow;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class CashIncomeRatioAction extends CwCommon {

	private String monthId;
	private String areaNo;
	private String year;
	
	public String execute() {
		init();
		initCwAreaSelect();
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
	
	/**
	 * 获取现金收入比完成情况数据
	 * @return
	 */
	public String getCashIncomeRatioTable() {
		list = daoHelper.queryForList("cw.rpt.xjlts.cashflow.CashIncomeRatioTable", this);
		return "table";
	}
	
	/**
	 * 获取现金收入比完成情况折线图数据
	 * @return
	 */
	public void getCashIncomeRatioLine() {
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
		List thisYearLine = daoHelper.queryForList("cw.rpt.xjlts.cashflow.CashIncomeRatioLine1", this);
		map.put("thisYearLine", thisYearLine);
		year = lastYear;
		List lastYearLine = daoHelper.queryForList("cw.rpt.xjlts.cashflow.CashIncomeRatioLine1", this);
		map.put("lastYearLine", lastYearLine);
		returnMapAsJson(map);
	}
	
	/**
	 * 获取现金收入比完成情况柱状图数据
	 * @return
	 */
	public void getCashIncomeRatioBarChart() {
		Map map = new HashMap();
		List barList = daoHelper.queryForList("cw.rpt.xjlts.cashflow.CashIncomeRatioBarChart1", this);
		map.put("barList", barList);
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

	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
}
