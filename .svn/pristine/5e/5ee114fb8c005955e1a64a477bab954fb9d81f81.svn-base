package com.bonc.pure.web.action.ws.home;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bonc.base.dao.DaoHelper;
import com.bonc.commons.orm.PagiParam;
import com.bonc.pure.web.action.CwCommon;
import com.bonc.pure.web.util.CollectionEdit;
import com.bonc.xframe.util.XUtils;

public class HomeFrameAction extends CwCommon{
	private String loginID;
	private String monthId;
	private List<Map<String,Object>> userItemList;
	
	public String index(){
		init();
		initCwAreaSelect();
		monthId = param.get("monthId")==null?"":param.get("monthId").toString();
		if(!"".equals(monthId)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			SimpleDateFormat sdfAim = new SimpleDateFormat("yyyy-MM");
			try {
				monthId = sdfAim.format(sdf.parse(monthId));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return "index";
	}
	
	@SuppressWarnings("unchecked")
	public void itemInit(){
		String str = "";
		try{
			userItemList = daoHelper.queryForList("cw.home.selectUserSYItem", this);
			if(userItemList != null && userItemList.size()>0){
				str = CollectionEdit.listToString(userItemList);
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

	public DaoHelper getDaoHelper() {
		return daoHelper;
	}

	public void setDaoHelper(DaoHelper daoHelper) {
		this.daoHelper = daoHelper;
	}

	public PagiParam getPagiParam() {
		return pagiParam;
	}

	public void setPagiParam(PagiParam pagiParam) {
		this.pagiParam = pagiParam;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public List<Map<String, Object>> getUserItemList() {
		return userItemList;
	}

	public void setUserItemList(List<Map<String, Object>> userItemList) {
		this.userItemList = userItemList;
	}

	public String getMonthId() {
		return monthId;
	}

	public void setMonthId(String monthId) {
		this.monthId = monthId;
	}
	
}
