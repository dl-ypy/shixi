package com.bonc.pure.web.action.rpt.xjlts.salescashinflow;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;
/**
 * 折扣退费
 */
public class DiscountReturnAction extends CwCommon {

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
	
	/**
	 * 折扣退费表格数据
	 * @return
	 */
	public String getDiscountReturnTable() {
		list = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.DiscountReturnTable", this);
		return "table";
	}
	
	/**
	 * 折扣退费折线图数据
	 * @return
	 */
	public void getDiscountReturnChart() {
		Map map = new HashMap();
		if ("root".equals(orgId)) {
			List thisMonList = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.DiscountReturnChart2", this);
			//求上个月
			String year = monthId.substring(0, 4);
			String month = monthId.substring(4, 6);
			SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
			Calendar c = Calendar.getInstance();
			c.set(Integer.parseInt(year),(Integer.parseInt(month)-1),01);
			c.add(Calendar.MONTH, -1);
			Date m = c.getTime();
			monthId = format.format(m);
			List lastMonList = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.DiscountReturnChart2", this);
			map.put("thisMonList", thisMonList);
			map.put("lastMonList", lastMonList);
		} else {
			list = daoHelper.queryForList("cw.common.getYear", this);
			String thisYear = "";
			String lastYear = "";
			if (list.size() > 0) {
				Map tempMap = (Map) list.get(0);
				thisYear = (String) tempMap.get("THIS_YEAR");
				lastYear = (String) tempMap.get("LAST_YEAR");
			}
			year = thisYear;
			List lineList1 = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.DiscountReturnChart", this);
			map.put("thisYearList", lineList1);
			year = lastYear;
			List lineList2 = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.DiscountReturnChart", this);
			map.put("lastYearList", lineList2);
		}
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
