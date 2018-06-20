package com.bonc.pure.web.action.rpt.scxy;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class OutLineAction extends CwCommon{
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
	public void querytitle(){
		Map map = new HashMap();
		list = daoHelper.queryForList("cw.rpt.scxy.queryOutTitle", this);
		map.put("list", list);
		returnMapAsJson(map);
	}
	public String queryOutTable() {
		list = daoHelper.queryForList("cw.rpt.scxy.queryOutLine", this);
		return "table";
	}
	public void getLastInfo(){
		Map map = new HashMap();
		List list = daoHelper.queryForList("cw.rpt.scxy.queryLastInfo", this);
		map.put("lastlist", list);
		returnMapAsJson(map);
	}
	/**
	 * 获取移动离网率柱状图数据
	 * @return
	 */
	public void queryOutLineChart() {
		Map map = new HashMap();
		List barList = daoHelper.queryForList("cw.rpt.scxy.queryChart", this);
		map.put("barList", barList);
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
	public String getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}
}
