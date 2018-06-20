package com.bonc.pure.web.action.rpt.rlzyxy;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class DoPlanRateAction extends CwCommon{

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
	
	/**
	 * 页面中对于左侧表格的遍历
	 * @return
	 */
	public String queryTable1(){
		list = daoHelper.queryForList("cw.rpt.rlzyxy.queryTable1", this);
		return "table";
	}

	/**
	 * 对于title1的遍历
	 * @return
	 */
	public void queryTitle1(){
		
		Map map = new HashMap();
		list = daoHelper.queryForList("cw.rpt.rlzyxy.queryTitle1", this);
		map.put("list", list);
		returnMapAsJson(map);
		
	}
	
	/**
	 * 遍历bar的柱状图
	 * @return
	 */
	public void queryBar1(){
		
		Map map = new HashMap();
		list = daoHelper.queryForList("cw.rpt.rlzyxy.queryTable1", this);
		map.put("barList", list);
		returnMapAsJson(map);
		
	}
	
	/**
	 * 遍历line的折线图
	 * @return
	 */
	public void queryLine1(){
		
		System.out.println(monthId);
		
		Map map = new HashMap();
		list = daoHelper.queryForList("cw.common.getYear", this);
		
		String thisYear = "";
		String lastYear = "";
		
		if (list.size() > 0) {
			Map tempMap = (Map) list.get(0);
			thisYear = (String) tempMap.get("THIS_YEAR");
			lastYear = (String) tempMap.get("LAST_YEAR");
		}
		
		System.out.println(thisYear);
		
		year = thisYear;
		List thisYearLine = daoHelper.queryForList("cw.rpt.rlzyxy.queryLine1", this);
		map.put("thisYearLine", thisYearLine);
		
		year = lastYear;
		List lastYearLine = daoHelper.queryForList("cw.rpt.rlzyxy.queryLine1", this);
		map.put("lastYearLine", lastYearLine);
		
		System.out.println("去年的数据"+thisYearLine);
		
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
