package com.bonc.pure.web.action.rpt.xjlts.salescashinflow;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.bonc.pure.web.action.CwCommon;

/**
 * 销售现金流入报表
 * @author 曾玉菊
 *
 */
public class InflowReportAction extends CwCommon {

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

	/**
	 * 返回表格
	 * @return
	 */
	public String table() {
		list = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.InflowReportTable", this);
		return "table";
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
