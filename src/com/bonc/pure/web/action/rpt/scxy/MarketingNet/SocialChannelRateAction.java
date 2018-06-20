package com.bonc.pure.web.action.rpt.scxy.MarketingNet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class SocialChannelRateAction extends CwCommon{

	//月份的id
	private String monthId;
	//区域的id
	private String areaNo;
	//时间的选择
	private String year;

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
	
	/*
	 * 遍历表格的数据
	 */	
	public String queryTable(){
	
		list = daoHelper.queryForList("cw.rpt.scxy.marketNet.queryTable", this);

		System.out.println("table 的数据"+list);
		return "table";
	}

	/**
	 * 遍历折线图的数据
	 */
	public void queryChart(){
		
		Map map = new HashMap();
		
		list = daoHelper.queryForList("cw.common.getYear", this);
		
		String thisYear = "2017";
		String lastYear = "2016";
		
		if (list.size() > 0) {
			Map tempMap = (Map) list.get(0);
			thisYear = (String) tempMap.get("THIS_YEAR");
			lastYear = (String) tempMap.get("LAST_YEAR");
		}
		
		year = thisYear;
		List thisYearLine = daoHelper.queryForList("cw.rpt.scxy.marketNet.queryChart", this);
		map.put("thisYearLine", thisYearLine);
		
		year = lastYear;
		List lastYearLine = daoHelper.queryForList("cw.rpt.scxy.marketNet.queryChart", this);
		map.put("lastYearLine", lastYearLine);
		
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
