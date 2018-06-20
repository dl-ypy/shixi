package com.bonc.pure.web.action.rpt.xjlts.gcjzdzbzx;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.bonc.pure.web.action.CwCommon;

public class CityCompanyAction extends CwCommon {

	private String monthId;
	private String areaNo;

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
	public String cctable() {
		list = daoHelper.queryForList("cw.rpt.xjlts.gcjzdzbzx.ccTable", this);
		return "table";
	}

}
