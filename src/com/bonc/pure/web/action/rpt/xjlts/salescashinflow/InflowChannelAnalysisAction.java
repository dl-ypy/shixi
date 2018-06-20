package com.bonc.pure.web.action.rpt.xjlts.salescashinflow;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.bonc.pure.web.action.CwCommon;
import com.bonc.pure.web.util.CollectionEdit;

/**
 * 现金流入渠道分析
 * @author 曾玉菊
 *
 */
public class InflowChannelAnalysisAction extends CwCommon {

	private String monthId;
	private String areaNo;
	
	private String pieData;//饼图数据

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
		list = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.InflowChannelAnalysisTable", this);
		return "table";
	}

	/**
	 * 返回饼图
	 * @return
	 */
	public String chart() {
		List<?> chartList = daoHelper.queryForList("cw.rpt.xjlts.salescashinflow.InflowChannelAnalysisChart", this);
		pieData = "";
		if (chartList != null && chartList.size() > 0) {
			pieData = CollectionEdit.listToString(chartList);//转为json串
		}
		return "chart";
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

	public String getPieData() {
		return pieData;
	}

	public void setPieData(String pieData) {
		this.pieData = pieData;
	}

}
