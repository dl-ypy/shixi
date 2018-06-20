package com.bonc.pure.web.action.rpt.xjlts.checkDay;

import java.text.ParseException;
import java.text.SimpleDateFormat;


import com.bonc.pure.web.action.CwCommon;
import com.bonc.pure.web.util.BccUtils;

public class BusinessHallCheckAction extends CwCommon{
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
	
	public String queryTable() {
		list = daoHelper.queryForList("cw.rpt.xjlts.checkDay.BusinessHallCheck", this);
		return "table";
	}
	public String queryTableDrill() {
		list = daoHelper.queryForList("cw.rpt.xjlts.checkDay.BusinessHallCheckDrill", this);
		return "tableDrill";
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
