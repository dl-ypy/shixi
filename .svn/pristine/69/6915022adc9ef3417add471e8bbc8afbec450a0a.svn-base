package com.bonc.pure.web.action.rpt.xjlts.yyqkfx;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

/**
 * @author 李林林
 * 营业欠款超限分析
 *
 */
public class AnalysisOverdueAction extends CwCommon {
	private String monthId;
	private String areaNo;
	private String areaNo_mapClick;
	private String levelId;
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
	public String getTableList() {
		list = daoHelper.queryForList("cw.rpt.xjlts.yyqkfx.getChangeTableList2", this);
		return "table";
	}
	public String getTableDetail() {
		// 默认每页20条，可以在pagiParam定义时直接设置，也可以通过setPageSize设置
		pagiParam.setPageSize(18);
		list = daoHelper.queryForPagiList("cw.rpt.xjlts.yyqkfx.getChangeTableDetailList2", this);
		return "tableDetail";
	}
	public void getMapChart() {
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		List<?> mapList = daoHelper.queryForList("cw.rpt.xjlts.yyqkfx.getMapChart2", this);
		map.put("mapList", mapList);
		returnMapAsJson(map);
	}
	// 周一改 
	public void getWarnText(){
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		List<?> mapList = daoHelper.queryForList("cw.rpt.xjlts.yyqkfx.getWarnText2", this);
		map.put("mapList", mapList);
		
		List<?> mapListAdd = daoHelper.queryForList("cw.rpt.xjlts.yyqkfx.getWarnText2_", this);
		String add=(String) ((Map<?, ?>) mapListAdd.get(0)).get("PARENT_ID");
		List<String> li=new ArrayList<String>();
		if(add.equals("0")){
			li.add("全省");
			map.put("add", li);
		}else if(add.equals("root")){
			li.add("全市");
			map.put("add", li);
		}else{
			li.add("县区");
			map.put("add", li);
		}
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
	public String getAreaNo_mapClick() {
		return areaNo_mapClick;
	}
	public void setAreaNo_mapClick(String areaNo_mapClick) {
		this.areaNo_mapClick = areaNo_mapClick;
	}
	public String getLevelId() {
		return levelId;
	}
	public void setLevelId(String levelId) {
		this.levelId = levelId;
	}
	

}
