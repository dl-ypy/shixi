package com.bonc.pure.web.action.rpt.xjlts.yyqkfx;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;

/**
 * 营业沉淀资金分析
 * @author zhou
 *
 */
public class MoneyAnalysisAction extends CwCommon{

	//月份的id	
	private String monthId;
	//地点的切换	
	private String areaNo;


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
	
	/**
	 * 返回方法，success代表成功返回页面
	 */
	public String execute() {
		init();
		initCwAreaSelect();
		monthId = param.get("monthId") == null ? "" : param.get("monthId").toString();
		if (!"".equals(monthId)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			SimpleDateFormat sdfAim = new SimpleDateFormat("yyyy-MM");
			try {
				monthId = sdfAim.format(sdf.parse(monthId));
				System.err.println(monthId);
			} catch (ParseException e){
				e.printStackTrace();
			}
		}
		return "success";
	}

	
	/**
	 *
	 * 返回list表格，数据类型为String
	*/
	public String table() {
		list = daoHelper.queryForList("cw.rpt.xjlts.yyqkfx.InfoMoneyTable", this);
		return "table";		
	}
	
	/**
	 * 得到条形图的信息，
	 */
	public void queryMoneyChart() {
		System.out.println("进入到了Chart的action里面");
		Map map = new HashMap();
		List dataList = daoHelper.queryForList("cw.rpt.xjlts.yyqkfx.queryMoneyChart", this);
		System.out.println("dataList的数据"+dataList);
		
		map.put("dataList", dataList);
		returnMapAsJson(map);
	}
	
	
	
	
}
