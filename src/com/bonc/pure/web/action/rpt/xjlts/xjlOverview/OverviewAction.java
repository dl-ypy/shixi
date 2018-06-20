package com.bonc.pure.web.action.rpt.xjlts.xjlOverview;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonc.pure.web.action.CwCommon;
import com.bonc.pure.web.util.CollectionEdit;

public class OverviewAction extends CwCommon {
	private String monthId;
	private String areaNo;
	private String kpiCode;
	private String year;
	private List list1;
	private List list2;
	private List list3;
	private String test;
	private String test1;
	private String level;
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
	 * 获取现金收入比的表格
	 * @return
	 */
	public String queryCashTable(){
		 list1=daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.querytarget", this);
		 Map map = new HashMap();
		 map.put("list1", list1);
		if(areaNo.equals("root")){
			list2 = daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.queryThree", this);
			list3 = daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.targetCity", this);
			int length = list2.size();
			String firstthree = "";
			String lastthree = "";
			String target = "";
			for(int i=0;i<3;i++){
				 Map map1 = new HashMap();
					map1 = (Map)list2.get(i);
					firstthree+=map1.get("ORG_NAME").toString()+"、";
			}
			int size = firstthree.length();
			firstthree = firstthree.substring(0, size-1);
			map.put("firstThree", firstthree);
			for(int j=length-3;j<length;j++){
				 Map map2 = new HashMap();
					map2 = (Map)list2.get(j);
					lastthree+=map2.get("ORG_NAME").toString()+"、";
			}
			size = lastthree.length();
			lastthree = lastthree.substring(0, size-1);
			map.put("lastThree", lastthree);
			for(int i=0;i<list3.size();i++){
				 Map map3 = new HashMap();
					map3 = (Map)list3.get(i);
					target+=map3.get("ORG_NAME").toString()+"、";
			}
			size = target.length();
			target = target.substring(0, size-1);
			map.put("target", target);
		}
		test=CollectionEdit.mapToString(map);
	  list = daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.queryCashIncome", this);
		return "cashtable";
	}
	/**
	 * 获取现金收入比的折线图
	 * @return
	 */
	public void queryCashChart(){
		Map map=new HashMap();
		String thisyear = monthId.substring(0, 4);
		String lastyear = String.valueOf(Integer.parseInt(thisyear)-1);
		year = thisyear+"%";
		list =  daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.queryCashChart", this);
		map.put("thisyear", list);
		year = lastyear+"%";
		List list1 =  daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.queryCashChart", this);
		map.put("lastyear", list1);
		returnMapAsJson(map);
	}
	/**
	 * 获取营业资本变动的表格和预警
	 * @return
	 */
	public String queryServiceTable(){
		list=daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.queryService", this);
		if(areaNo.equals("root")){
			list1=daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.queryWarning", this);
		}else{
			list1=daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.querycityWarning", this);
		}
		
		return "service";
	}
	/**
	 * 获取现金收款情况的表格
	 * @return
	 */
	public String queryCashCollection(){
		list=daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.querycashCollect", this);
		return "cashCollection";
	}
	public void getPie(){
		list=daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.queryPie", this);
		returnListAsJson(list);
		 
	}
	public void getPie2(){
		list=daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.queryPie2", this);
		returnListAsJson(list);
		 
	}
	/**
	 * 获取现金收款情况的折线图
	 * @return
	 */
	public void queryCollectChart(){
		Map map=new HashMap();
		String thisyear = monthId.substring(0, 4);
		String lastyear = String.valueOf(Integer.parseInt(thisyear)-1);
		year = thisyear+"%";
		list =  daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.queryCollectChart", this);
		map.put("thisyear", list);
		year = lastyear+"%";
		List list1 =  daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.queryCollectChart", this);
		map.put("lastyear", list1);
		returnMapAsJson(map);
	}
	
	public String getMap(){
	   list =  daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.querymapWarning", this);
	   list1 = daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.querylevel", this);
	    Map map2 = new HashMap();
		map2 = (Map)list1.get(0);
		level = map2.get("BM_LEVEL").toString();
		test = CollectionEdit.listToString(list);
		return "map";
	}
   public void getMapMap(){
	   Map map=new HashMap();
	   list =  daoHelper.queryForList("cw.rpt.xjlts.xjlOverview.querymapdiv", this);
	   map.put("mapList", list);
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
	public String getKpiCode() {
		return kpiCode;
	}
	public void setKpiCode(String kpiCode) {
		this.kpiCode = kpiCode;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public List getList1() {
		return list1;
	}
	public void setList1(List list1) {
		this.list1 = list1;
	}
	public List getList2() {
		return list2;
	}
	public void setList2(List list2) {
		this.list2 = list2;
	}
	public List getList3() {
		return list3;
	}
	public void setList3(List list3) {
		this.list3 = list3;
	}
	public String getTest() {
		return test;
	}
	public void setTest(String test) {
		this.test = test;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getTest1() {
		return test1;
	}
	public void setTest1(String test1) {
		this.test1 = test1;
	}
	
}
