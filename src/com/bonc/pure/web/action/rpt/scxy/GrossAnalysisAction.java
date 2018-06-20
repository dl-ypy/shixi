package com.bonc.pure.web.action.rpt.scxy;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

public class GrossAnalysisAction extends CwCommon{
	private String monthId;
	private String areaNo;
	private String kpiId;
	
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
	public String queryGrossTable(){
		list = daoHelper.queryForList("cw.rpt.scxy.prosstable", this);
		return "table";
	}
	public void queryGrossChart(){
		list = daoHelper.queryForList("cw.rpt.scxy.prosschart", this);
		Map map = new HashMap();
		map.put("list", list);
		returnMapAsJson(map);
	}
	
	public String queryDrill(){
		/*默认为areaNo为root,若要查找地市的下一级县区只需要删掉下行代码即可*/
		setAreaNo("root");
		
		list = daoHelper.queryForList("cw.rpt.scxy.getTableDrill", this);
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
	public String getKpiId() {
		return kpiId;
	}
	public void setKpiId(String kpiId) {
		this.kpiId = kpiId;
	}
}
