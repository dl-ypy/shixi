package com.bonc.pure.web.util;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import com.bonc.base.dao.DaoHelper;

public class DssParam {
	/**
	 * 从系统表中获取参数的值
	 * 
	 * @param dc
	 *            DataCenter 数据中心
	 * @param constType
	 *            String参数类型
	 * @param paramName
	 *            String 参数名称
	 * @return String 取参数的值
	 */
	public static String getParam(DaoHelper daoHelper, String constType, String paramName) {
		String paramValue = "";

		try {
			HashMap hm = new HashMap();
			hm.put("constType", constType);
			hm.put("constName", paramName);
			Map mp = (Map) daoHelper.queryForObject("cw.common.getConstNameValue", hm);
			if (mp != null) {
				paramValue = (String) mp.get("constValue");
			}
		} catch (Exception _ex) {
			_ex.printStackTrace();
		}

		return paramValue;
	}

	public static String getParam(DaoHelper daoHelper, String resourceId) {
		String paramValue = "";
		try {
			String str = (String) daoHelper.queryForObject("cw.common.getConstMonthValue", resourceId);
			if (str != null) {
				paramValue = str;
			}
		} catch (Exception _ex) {
			_ex.printStackTrace();
		}

		return paramValue;
	}

	/**
	 * 取得顶级地域名称
	 * 
	 * @param dc
	 * @return
	 */
	public static String getTopAreaName(DaoHelper daoHelper) {
		return getParam(daoHelper, "var.dss", "areaall.desc");
	}

	/**
	 * 该公共方法判断项目是经分项目或是报表中心项目
	 * 
	 * @return
	 */
	public static boolean isDssWebProject(HttpServletRequest request) {
		boolean flag = true;
		String contextPath = request.getContextPath();
		Pattern p = Pattern.compile("report");
		if (p.matcher(contextPath).find()) {
			flag = false;
		} else {
			flag = true;
		}
		return flag;
	}

	public static String DMCODE = "HN_DMCODE";
	public static String DSS_USER = "CW_DSS";
	public static String DM = "HN_DM";
}
