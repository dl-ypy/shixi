package com.bonc.pure.web.action.rpt.rlzyxy;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class SynergismAction extends CwCommon{

	//月份的id
	private String monthId;
	//区域的id
	private String areaNo;
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
	
	/**
	 * 表格
	 * @return
	 */
	public String queryTable(){
		list = daoHelper.queryForList("cw.rpt.rlzyxy.querySynergismTable", this);
		return "table";
	}
		
	/**
	 * 柱状图
	 * @return
	 */
	public void queryBar(){
		Map map = new HashMap();
		list = daoHelper.queryForList("cw.rpt.rlzyxy.querySynergismBar", this);
		map.put("barList", list);
		returnMapAsJson(map);
	}
	
	/**
	 * 折线图
	 * @return
	 */
	public void queryLine(){
		Map map = new HashMap();
		list = daoHelper.queryForList("cw.common.getYear", this);
		String thisYear = "";
		String lastYear = "";
		if (list.size() > 0) {
			Map tempMap = (Map) list.get(0);
			thisYear = (String) tempMap.get("THIS_YEAR");
			lastYear = (String) tempMap.get("LAST_YEAR");
		}
		setYear(thisYear);
		List thisYearLine = daoHelper.queryForList("cw.rpt.rlzyxy.querySynergismLine", this);
		map.put("thisYearLine", thisYearLine);
		setYear(lastYear);
		List lastYearLine = daoHelper.queryForList("cw.rpt.rlzyxy.querySynergismLine", this);
		map.put("lastYearLine", lastYearLine);
		returnMapAsJson(map);
	}
	
	/**
	 * 标题
	 * @return
	 */
	public void queryTitle(){
		Map map = new HashMap();
		list = daoHelper.queryForList("cw.rpt.rlzyxy.querySynergismTitle", this);
		map.put("list", list);
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

	/**
	 * @return the year
	 */
	public String getYear() {
		return year;
	}

	/**
	 * @param year the year to set
	 */
	public void setYear(String year) {
		this.year = year;
	}

}
