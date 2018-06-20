package com.bonc.pure.web.action.ws.home.children;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bonc.pure.web.util.CollectionEdit;
import com.bonc.pure.web.util.EchartsUtil;

/**
 * 首页第一部分
 */
public class HomePart4Action extends Children {
	private String kpiId;
	private String kpiLevel;
	
	private String kpiName;
	private String kpiValueDesc;
	
	@SuppressWarnings("unchecked")
	public void initTableData(){
		String str = "";
		try{
			List<Map<String,Object>> tableList = daoHelper.queryForList("cw.children.selectPart4TableList", this);
			if(tableList != null && tableList.size()>0){
				str = CollectionEdit.listToString(tableList);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void initBar(){
		String str = "";
		try{
			List<Map<String,Object>> barList = daoHelper.queryForList("cw.children.selectPart4BarList", this);
			if(barList != null && barList.size()>0){
				Map<String,Object> initMap = new HashMap<String, Object>();
				initMap.put("nameCloumn", "AREA_DESC");
				List<Map<String,Object>> initList = new ArrayList<Map<String,Object>>();
				
				Map<String,Object> lastDayMap = new HashMap<String, Object>();
				lastDayMap.put("dataName", "得分");
				lastDayMap.put("dataCloumn", "KPI_03");
				lastDayMap.put("dataType", "bar");
				lastDayMap.put("barCategoryGap", "40%");
				lastDayMap.put("lineColor", "#3FA7DC");
				
				initList.add(lastDayMap);
				
				str = EchartsUtil.initDataChart(barList, initList, initMap);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void initBarTitle(){
		String str = "";
		try{
			List<Map<String,Object>> barList = daoHelper.queryForList("cw.children.selectPart4BarTitle", this);
			if(barList != null && barList.size()>0){
				str = CollectionEdit.listToString(barList);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getKpiId() {
		return kpiId;
	}

	public void setKpiId(String kpiId) {
		this.kpiId = kpiId;
	}

	public String getKpiLevel() {
		return kpiLevel;
	}

	public void setKpiLevel(String kpiLevel) {
		this.kpiLevel = kpiLevel;
	}

	public String getKpiName() {
		return kpiName;
	}

	public void setKpiName(String kpiName) {
		this.kpiName = kpiName;
	}

	public String getKpiValueDesc() {
		return kpiValueDesc;
	}

	public void setKpiValueDesc(String kpiValueDesc) {
		this.kpiValueDesc = kpiValueDesc;
	}

}
