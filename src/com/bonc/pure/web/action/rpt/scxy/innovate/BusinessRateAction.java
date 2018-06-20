package com.bonc.pure.web.action.rpt.scxy.innovate;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class BusinessRateAction extends CwCommon {

	private String monthId;
	private String areaNo;
	
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
	 * 获取业务毛利率同比变动表格数据
	 * @return
	 */
	public String getBusinessRateTable() {
		list = daoHelper.queryForList("cw.rpt.scxy.innovate.BusinessRateTable", this);
		return "table";
	}
	
	/**
	 * 获取业务毛利率同比变动柱状图数据
	 * @return
	 */
	public void getBusinessRateBarChart() {
		Map map = new HashMap();
		List barList = daoHelper.queryForList("cw.rpt.scxy.innovate.BusinessRateBarChart1", this);
		map.put("barList", barList);
		returnMapAsJson(map);
	}
	/**
	 * 获取业务毛利率同比变动首行显示
	 * @return
	 */
	public void getBusinessRateFirstLine() {
		Map map = new HashMap();
		List firstLineList = daoHelper.queryForList("cw.rpt.scxy.innovate.getBusinessRateFirstLine", this);
		map.put("firstLineList", firstLineList);
		returnMapAsJson(map);
	}
	/**
	 * 获取业务毛利率同比变动尾行显示
	 * @return
	 */
	public void getBusinessRateLastLine() {
		Map map = new HashMap();
		List lastLineList = daoHelper.queryForList("cw.rpt.scxy.innovate.getBusinessRateLastLine", this);
		map.put("lastLineList", lastLineList);
		returnMapAsJson(map);
	}
	
	/**
	 * 获取业务毛利率同比变动前三后三
	 * @return
	 */
	public void getBusinessRateRanking() {
		Map map = new HashMap();
		List rankingList = daoHelper.queryForList("cw.rpt.scxy.innovate.getBusinessRateRanking", this);
		map.put("rankingList", rankingList);
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
	
}
