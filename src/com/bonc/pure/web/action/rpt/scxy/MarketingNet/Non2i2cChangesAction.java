package com.bonc.pure.web.action.rpt.scxy.MarketingNet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class Non2i2cChangesAction extends CwCommon{
	private String monthId;
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
	public void querytitle(){
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		list = daoHelper.queryForList("cw.rpt.scxy.marketNet.queryOutTitle1", this);
		map.put("list", list);
		returnMapAsJson(map);
	}
	public String queryOutTable() {
		list = daoHelper.queryForList("cw.rpt.scxy.marketNet.queryOutLine1", this);
		return "table";
	}
	/**
	 * 
	 * @return
	 */
	public void queryOutLineChart() {
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		List<?> barList = daoHelper.queryForList("cw.rpt.scxy.marketNet.queryChart1", this);
		map.put("barList", barList);
		returnMapAsJson(map);
	}
	public void getLastInfo(){
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		List<?> list = daoHelper.queryForList("cw.rpt.scxy.marketNet.queryLastInfo1", this);
		map.put("lastlist", list);
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
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
}
