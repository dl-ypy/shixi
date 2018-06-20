package com.bonc.pure.web.action.rpt.scxy.MarketingNet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;
/**
 * 不含2I2C市场毛利率预算完成模块
 * @author ypy
 */
public class MarketRateBudgetAction extends CwCommon{
	private String monthId;
	private String areaNo;
	
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
	
	/*获取市场毛利率预算表格数据*/
	public String getMarketRateBudgetTable() {
		list = daoHelper.queryForList("cw.rpt.scxy.marketNet.getMarketRateBudgetTable", this);
		return "table";
	}
	
	/*获取市场毛利率预算图表数据*/
	public void getMarketRateBudgetBarChart() {
		Map map = new HashMap();
		List barList = daoHelper.queryForList("cw.rpt.scxy.marketNet.getMarketRateBudgetBarChart", this);
		map.put("barList",barList);
		returnMapAsJson(map);
	}
	
	/*获取市场毛利率预算首行数据*/
	public void getMarketRateBudgetFirstLine() {
		Map map = new HashMap();
		List firstLineList = daoHelper.queryForList("cw.rpt.scxy.marketNet.getMarketRateBudgetFirstLine", this);
		map.put("firstLineList",firstLineList);
		returnMapAsJson(map);
	}
	
	/*获取市场毛利率预算尾行数据*/
	public void getMarketRateBudgetLastLine() {
		Map map = new HashMap();
		List lastLineList = daoHelper.queryForList("cw.rpt.scxy.marketNet.getMarketRateBudgetLastLine", this);
		map.put("lastLineList",lastLineList);
		returnMapAsJson(map);
	}
	
	/*获取市场毛利率预算前三后三数据*/
	public void getMarketRateBudgetRanking() {
		Map map = new HashMap();
		List rankingList = daoHelper.queryForList("cw.rpt.scxy.marketNet.getMarketRateBudgetRanking", this);
		map.put("rankingList",rankingList);
		returnMapAsJson(map);
	}

	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
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
}
