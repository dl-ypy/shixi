package com.bonc.pure.web.action.rpt.zhwg;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;
/**
 * 利润进度对标
 * @author 
 */
public class ProfitScheduleDBAction extends CwCommon{
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
	
	/*得到表格数据*/
	public String queryOutTable() {
		list = daoHelper.queryForList("cw.rpt.zhwg.queryProfitScheduleDBTable", this);
		return "table";
	}
	
	/*得到图表数据*/
	public void queryOutChart() {
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		List<?> chartList = daoHelper.queryForList("cw.rpt.zhwg.queryProfitScheduleDBChart", this);
		map.put("list", chartList);
		returnMapAsJson(map);
	}
	
	/*得到首行数据*/
	public void querytitle() {
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		List<?> firstLineList = daoHelper.queryForList("cw.rpt.zhwg.queryProfitScheduleDBTitle", this);
		map.put("list", firstLineList);
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
