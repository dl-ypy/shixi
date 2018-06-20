package com.bonc.pure.web.action.custom;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bonc.base.dao.DaoHelper;

public class CustomAction {
	protected DaoHelper daoHelper;
	
	public String execute(){
		return "success";
	}

	@SuppressWarnings("unchecked")
	public void initAllOrganizationTree(){
		String str = "";
		try{
			List<Map<String,Object>> organizeList = daoHelper.queryForList("cw.common.selectAllOrganizationTree", this);
			str = initTreeJson(organizeList);
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
	
	public String initTreeJson(List<Map<String,Object>> organizeList){
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		try{
			int i=0;
			for(Map<String,Object> organizeMap:organizeList){
				String id = organizeMap.get("id")==null?"":organizeMap.get("id").toString();
				String pId = organizeMap.get("pId")==null?"":organizeMap.get("pId").toString();
				String name = organizeMap.get("name")==null?"":organizeMap.get("name").toString();
				if(i != 0){
					sb.append(",");
				}
				sb.append("{");
				sb.append("id:"+ id);
				sb.append(",pId:"+pId);
				sb.append(",name:\""+name + "\"");
				sb.append("}");
				i++;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		sb.append("]");
		return sb.toString();
	}
	
	public DaoHelper getDaoHelper() {
		return daoHelper;
	}

	public void setDaoHelper(DaoHelper daoHelper) {
		this.daoHelper = daoHelper;
	}

}
