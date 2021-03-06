package com.bonc.pure.web.action.rpt.xjlts.salescashinflow;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

/**
 * 销售现金流入情况
 * @author 李林林
 *
 */
public class SalesCashInflowZlAction extends CwCommon {

	private String monthId;
	private String areaNo;
	private String kpiId;
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
	 * 返回表格1
	 * @return
	 */
	public String table1() {
		list = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.SalesCashInflowZlTable1", this);
		return "table1";
	}
	public String table2() {
		list = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.SalesCashInflowZlTable2", this);
		return "table2";
	}
	public void line1() {
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
		List<?> line1List = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.SalesCashInflowZlLine1", this);
		map.put("thisYearLine1", line1List);
		year = lastYear;
		List<?> line2List = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.SalesCashInflowZlLine1", this);
		map.put("lastYearLine1", line2List);
		returnMapAsJson(map);
	}
	public void line2() {
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
		List<?> line1List = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.SalesCashInflowZlLine2", this);
		map.put("thisYearLine2", line1List);
		year = lastYear;
		List<?> line2List = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.SalesCashInflowZlLine2", this);
		map.put("lastYearLine2", line2List);
		returnMapAsJson(map);
	}
	public void pie1() {
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		List<?> pie1List = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.SalesCashInflowZlPie1", this);
		map.put("pie1List", pie1List);
		returnMapAsJson(map);
	}
	public void pie2() {
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		List<?> pie2List = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.SalesCashInflowZlPie2", this);
		map.put("pie2List", pie2List);
		returnMapAsJson(map);
	}
	public String drillTableByOrg1() {
		list = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.drillTableByOrg1", this);
		return "tableDrill1";
	}
	public String drillTableByOrg2() {
		list = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.drillTableByOrg2", this);
		return "tableDrill2";
	}

	public String getMonthId() {
		return monthId;
	}

	public void setMonthId(String monthId) {
		if (monthId != null) {
			this.monthId = monthId.replaceAll("-", "");
		}
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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	

}
