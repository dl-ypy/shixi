package com.bonc.pure.web.action.ws.home.children;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bonc.base.dao.DaoHelper;
import com.bonc.pure.web.util.CollectionEdit;

/**
 * children包的父类
 */
public class Children {

	protected String monthId;
	protected String areaNo;
	protected List list;
	protected Map map;
	protected Map parem;
	protected DaoHelper daoHelper;

	public String execute() {
		return "success";
	}

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

	public String kpiFmt(Object o1, String fmt, String nullShow) {
		if (o1 == null) {
			return nullShow;
		} else {
			return kpiFmt(o1, fmt);
		}
	}

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

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public DaoHelper getDaoHelper() {
		return daoHelper;
	}

	public void setDaoHelper(DaoHelper daoHelper) {
		this.daoHelper = daoHelper;
	}

	public Map getMap() {
		return map;
	}

	public void setMap(Map map) {
		this.map = map;
	}

	public Map getParem() {
		return parem;
	}

	public void setParem(Map parem) {
		this.parem = parem;
	}

}
