package com.bonc.pure.web.action.ws.home.children;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

/**
 * 首页第一部分
 */
public class HomePart3Action extends Children {
	private String kpiId;
	private String kpiLevel;
	
	@SuppressWarnings({ "rawtypes" })
	public void initRingSr(){
		String str = "";
		try{
			list = daoHelper.queryForList("cw.children.selectPart3RingSr", this);
			if(list != null && list.size()>0){
				Map map = (Map)list.get(0);
				str = map.get("WC") + "," + map.get("WC_2") + "," + map.get("WCL") + "," + map.get("NAME");
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
	
	@SuppressWarnings({ "rawtypes" })
	public void initRingLr(){
		String str = "";
		try{
			list = daoHelper.queryForList("cw.children.selectPart3RingLr", this);
			if(list != null && list.size()>0){
				Map map = (Map)list.get(0);
				str = map.get("WC") + "," + map.get("WC_2") + "," + map.get("WCL") + "," + map.get("NAME");
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
	public void initBarLine(){
		String str = "";
		try{
			List<Map<String,Object>> barLineList = daoHelper.queryForList("cw.children.selectPart3BarLine", this);
			if(barLineList != null && barLineList.size()>0){
				StringBuffer barLineAll = new StringBuffer();
				StringBuffer kpiNameSB = new StringBuffer();
				StringBuffer barYS = new StringBuffer();
				StringBuffer barWc = new StringBuffer();
				StringBuffer barWcl = new StringBuffer();
				int i=0;
				kpiNameSB.append("[");
				barYS.append("[");
				barWc.append("[");
				barWcl.append("[");
				for(Map<String,Object> barLineMap:barLineList){
					String kpiName = barLineMap.get("KPI_NAME")==null?"":barLineMap.get("KPI_NAME").toString();
					String kpiYS = barLineMap.get("YS_VALUE")==null?"":barLineMap.get("YS_VALUE").toString();
					String kpiWC = barLineMap.get("WC_VALUE")==null?"":barLineMap.get("WC_VALUE").toString();
					String kpiWcl = barLineMap.get("WCL")==null?"":barLineMap.get("WCL").toString();
					if(i!=0){
						kpiNameSB.append(",");
						barYS.append(",");
						barWc.append(",");
						barWcl.append(",");
					}
					kpiNameSB.append("'"+kpiName+"'");
					barYS.append(kpiYS);
					barWc.append(kpiWC);
					barWcl.append(kpiWcl);
					i++;
				}
				kpiNameSB.append("]");
				barYS.append("]");
				barWc.append("]");
				barWcl.append("]");
				
				barLineAll.append("{");
				barLineAll.append("'kpiName':");
				barLineAll.append(kpiNameSB.toString());
				barLineAll.append(",'barYS':");
				barLineAll.append(barYS.toString());
				barLineAll.append(",'barWc':");
				barLineAll.append(barWc.toString());
				barLineAll.append(",'barWcl':");
				barLineAll.append(barWcl.toString());
				barLineAll.append("}");
				str = barLineAll.toString();
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

}
