package com.bonc.pure.web.action.rpt.scxy;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;
/**
 * ICT毛利率及回款率
 */
public class ICTRateAction extends CwCommon {

	private String monthId;
	private String year;
	private String orgId;
	private String areaNo;
	private String kpiId;

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
	
	/*表1*/
	public String table() {
		list = daoHelper.queryForList("cw.rpt.scxy.ICTRateTable", this);
		return "table";
	}
	
	/*表2*/
	public String table2() {
		list = daoHelper.queryForList("cw.rpt.scxy.ICTRateTable2", this);
		return "table2";
	}
	
	/*标题*/
	public void getTitle() {
		Map map = new HashMap();
		List list1 = daoHelper.queryForList("cw.rpt.scxy.ICTRateTitle1", this);
		List list2 = daoHelper.queryForList("cw.rpt.scxy.ICTRateTitle2", this);
		map.put("list1", list1);
		map.put("list2", list2);
		returnMapAsJson(map);
	}
	
	/*折线图1*/
	public void getLineChart1(){
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
		List lineList1 = daoHelper.queryForList("cw.rpt.scxy.ICTRateLine1", this);
		map.put("thisYearLine", lineList1);
		year = lastYear;
		List lineList2 = daoHelper.queryForList("cw.rpt.scxy.ICTRateLine1", this);
		map.put("lastYearLine", lineList2);
		returnMapAsJson(map);
	} 
	
	/*折线图2*/
	public void getLineChart2(){
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
		List lineList1 = daoHelper.queryForList("cw.rpt.scxy.ICTRateLine2", this);
		map.put("thisYearLine", lineList1);
		year = lastYear;
		List lineList2 = daoHelper.queryForList("cw.rpt.scxy.ICTRateLine2", this);
		map.put("lastYearLine", lineList2);
		returnMapAsJson(map);
	} 
	
	public String queryDrill(){
		/*默认为areaNo为root,若要查找地市的下一级县区只需要删掉下行代码即可*/
		setAreaNo("root");	
		System.out.println("测试区域号--"+areaNo);
		System.out.println("测试月份--"+monthId);
		System.out.println("测试的Kpi--"+kpiId);
		
		list = daoHelper.queryForList("cw.rpt.scxy.getICTDrill", this);
		System.out.println("测试的list--"+list);
		
		return "drillTable";
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
	
	
	
}
