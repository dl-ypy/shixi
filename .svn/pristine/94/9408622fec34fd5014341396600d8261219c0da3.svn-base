package com.bonc.pure.web.action.rpt.xjlts.yyqkfx;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

/**
 * 营业欠款分析
 * @author ypy
 */
public class BusinessArrearsAction extends CwCommon{
	private String monthId;
	private String areaNo;
	
	public String execute() {
		init();
		initCwAreaSelect();
		monthId = param.get("monthId") == null?"":param.get("monthId").toString();
		if (!"".equals(monthId)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			SimpleDateFormat sdfAim = new SimpleDateFormat("yyyy-MM");
			try {
				monthId = sdfAim.format(sdf.parse(monthId));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
		}
		return "SUCCESS";
	}
	
	/*得到表格初始数据*/
	public String getTableList() {
		list = daoHelper.queryForList("cw.rpt.xjlts.yyqkfx.getTableList", this);
		return "table";
	}
	
	/*获取图表数据*/
	public void getBusinessArrearsBarChart() {
		Map map = new HashMap();
		List barList = daoHelper.queryForList("cw.rpt.xjlts.yyqkfx.getBusinessArrearsBarChart", this);
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
