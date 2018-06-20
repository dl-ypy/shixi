package com.bonc.pure.web.action.rpt.xjlts.gcjzdzbzx;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.bonc.pure.web.action.CwCommon;

public class ProvincialCompanyAction extends CwCommon {

	private String monthId;

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

	public String getMonthId() {
		return monthId;
	}

	public void setMonthId(String monthId) {
		if (monthId != null) {
			this.monthId = monthId.replaceAll("-", "");
		}
	}
	public String table() {
		list = daoHelper.queryForList("cw.rpt.xjlts.gcjzdzbzx.pcTable", this);
		return "table";
	}

}
