package com.bonc.pure.web.action;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bonc.base.dao.DaoHelper;
import com.bonc.commons.orm.PagiParam;
import com.bonc.pure.PureUtils;
import com.bonc.pure.web.util.BccUtils;
import com.bonc.pure.web.util.CollectionEdit;
import com.bonc.pure.web.util.DssParam;

public class CwCommon {

	// 默认账期
	protected String constTypeMonth = "var.dss.workbench";
	protected String paramNameMonth = "calendar.curmon.cw";
	protected String constTypeDay = "var.dss.workbench";
	protected String paramNameDay = "calendar.curday.cw";

	protected DaoHelper daoHelper;
	protected Map param;
	protected List list;
	protected PagiParam pagiParam = new PagiParam();
	protected String sortCol;
	protected String sortOrder = "";

	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void init() {
		if (param == null) {
			param = new HashMap();
		} else {
			BccUtils.dealParamValue(param);
		}
		String monthId = (String) param.get("monthId");
		if (monthId == null || "".equals(monthId)) {
			param.put("monthId", DssParam.getParam(daoHelper, constTypeMonth, paramNameMonth));
		}
		String dayId = (String) param.get("dayId");
		if (dayId == null || "".equals(dayId)) {
			param.put("dayId", DssParam.getParam(daoHelper, constTypeDay, paramNameDay));
		}
		String orgId = (String) param.get("orgId");
		String userOrgId = PureUtils.getUser().getOrg().getOrgId();
		userOrgId = userOrgId == null || "".equals(userOrgId) ? "root" : userOrgId;
		if (orgId == null || "".equals(orgId)) {
			orgId = userOrgId;
		}
		param.put("orgId", orgId);
		param.put("userOrgId", userOrgId);
		if ("root".equals(userOrgId)) {
			param.put("userOrgLevel", "1");
		} else {
			param.put("userOrgLevel", "3");
		}
		Map mp = this.queryNodeInfo(orgId);
		if (mp != null) {
			String orgDesc = (String) mp.get("NODE_NAME");
			param.put("orgDesc", orgDesc);
		}
	}

	/**
	 * 地市列表
	 */
	protected void initCwAreaSelect() {
		String orgLevel = (String) param.get("orgLevel");
		if (orgLevel == null || "".equals(orgLevel)) {
			param.put("orgLevel", param.get("userOrgLevel"));
		}
		list = daoHelper.queryForList("cw.common.areaList", param);
	}

	/**
	 * 北十列表（含北十省）
	 */
	protected void initCwProvincesSelect() {
		list = daoHelper.queryForList("cw.common.provincesList", param);
	}

	/**
	 * 北十列表（不含北十省）
	 */
	protected void initCwProvincesItemSelect() {
		list = daoHelper.queryForList("cw.common.provincesItemList", param);
	}

	public Map queryNodeInfo(String nodeId) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("nodeId", nodeId);
		Map mp = (Map) daoHelper.queryForObject("cw.common.queryNodeInfo", param);
		return mp;
	}

	/**
	 * 以json的格式返回map到response
	 */
	protected void returnMapAsJson(Map map) {
		String str = "";
		try {
			if (map != null) {
				str = CollectionEdit.mapToString(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		returnString(str);
	}

	/**
	 * 以json的格式返回list到response
	 */
	protected void returnListAsJson(List list) {
		String str = "";
		try {
			if (list != null && list.size() > 0) {
				str = CollectionEdit.listToString(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		returnString(str);
	}

	/**
	 * 返回string到response
	 */
	protected void returnString(String str) {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(str);
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 格式化数据，空值显示nullShow
	 */
	public String kpiFmt(Object o1, String fmt, String nullShow) {
		if (o1 == null) {
			return nullShow;
		} else {
			return kpiFmt(o1, fmt);
		}
	}

	/**
	 * 格式化数据
	 */
	public String kpiFmt(Object o1, String fmt) {
		double d1 = getObjectdouble(o1);
		fmt = fmt == null || "".equals(fmt) ? "###,###,##0.00" : fmt;
		String format = fmt.endsWith("pp") ? fmt.replace("pp", "%") : fmt;
		DecimalFormat dfmt = new DecimalFormat(format);
		String formatValue = dfmt.format(d1);
		formatValue = fmt.endsWith("pp") ? formatValue.replace("%", "pp") : formatValue;
		return formatValue;
	}

	public double getObjectdouble(Object o) {
		if (o == null)
			return 0;
		if (o instanceof Number)
			return ((Number) o).doubleValue();
		if (o instanceof String) {
			try {
				return Double.parseDouble((String) o);
			} catch (NumberFormatException e) {
				return 0;
			}
		}
		return 0;
	}

	public DaoHelper getDaoHelper() {
		return daoHelper;
	}

	public void setDaoHelper(DaoHelper daoHelper) {
		this.daoHelper = daoHelper;
	}

	public Map getParam() {
		return param;
	}

	public void setParam(Map param) {
		this.param = param;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public PagiParam getPagiParam() {
		return pagiParam;
	}

	public void setPagiParam(PagiParam pagiParam) {
		this.pagiParam = pagiParam;
	}

	public String getSortCol() {
		return sortCol;
	}

	public void setSortCol(String sortCol) {
		this.sortCol = sortCol;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

}
