package com.bonc.pure.web.action.custom;

import javax.servlet.jsp.PageContext;

public class AideTag {
	private static final String REQUEST = "request";
	private static final String SESSION = "session";
	private static final String APPLICATION = "application";

	/**
	 * 属性作用域
	 * 
	 * @param scope
	 * @return
	 */
	public static int getScope(String scope) {
		int ret = PageContext.PAGE_SCOPE; // default

		if (REQUEST.equalsIgnoreCase(scope))
			ret = PageContext.REQUEST_SCOPE;
		else if (SESSION.equalsIgnoreCase(scope))
			ret = PageContext.SESSION_SCOPE;
		else if (APPLICATION.equalsIgnoreCase(scope))
			ret = PageContext.APPLICATION_SCOPE;
		return ret;
	}

	

	public static Object getSetting(String key) {
		return AideServlet.getRequest().getAttribute(
				AideTag.class.getName() + "." + key);
	}

	/**
	 * 比率颜色
	 * 
	 * @param d
	 * @return
	 */
	public static String getRateColor(Double d) {
		if (d == null) {
			return null;
		}
		String s = (String) getSetting("rate.color");
		if ("".equals(s)) {
			return null;
		}
		if (s == null) {
			s = "#00BA4F,#CC0000";
		}
		String[] colors = s.split(",");
		String color = d > 0 ? colors[0] : colors[1];
		return color;
	}

	/**
	 * 数值格式化串
	 * 
	 * @return
	 */
	public static String getNumberFormat() {
		String s = (String) getSetting("number.format");
		if ("".equals(s)) {
			return null;
		}
		if (s == null) {
			s = "#,##0.00";
		}
		return s;
	}

	/**
	 * 比率格式化串
	 * 
	 * @return
	 */
	public static String getRateFormat() {
		String s = (String) getSetting("rate.format");
		if ("".equals(s)) {
			return null;
		}
		if (s == null) {
			s = "#,##0.00%";
		}
		return s;
	}

	/**
	 * 日期格式化串
	 * 
	 * @return
	 */
	public static String getDateFormat() {
		String s = (String) getSetting("date.format");
		if ("".equals(s)) {
			return null;
		}
		if (s == null) {
			s = "yy-MM-dd";
		}
		return s;
	}

	/**
	 * 空白字符默认值
	 * 
	 * @return
	 */
	public static String getBlankDefault() {
		String s = (String) getSetting("blank.default");
		if ("".equals(s)) {
			return null;
		}
		if (s == null) {
			s = "--";
		}
		return s;
	}
	
	/**
	 * 增长率变化格式字符串pp
	 * 
	 * @return
	 */
	public static String getPPFormat() {
		String s = (String) getSetting("pp.format");
		if ("".equals(s)) {
			return null;
		}
		if (s == null) {
			s = "#,##0.00";
		}
		return s;
	}
	
	/**
	 * 默认增长率后缀字符串
	 * 
	 * @return
	 */	
	public static String getPPPostfix(){
		String s = (String) getSetting("pp.postfix");
		if ("".equals(s)) {
			return null;
		}
		if (s == null) {
			s = "pp";
		}
		return s;
	}
	
	/**
	 * 设置反向指标的现实颜色
	 * @param isReverse
	 */
	public static void setReverse(boolean isReverse){
		if(isReverse){
			AideServlet.getRequest().
				setAttribute(AideTag.class.getName()+".rate.color", "#CC0000,#00BA4F");
		}else{
			AideServlet.getRequest().
				setAttribute(AideTag.class.getName()+".rate.color", "#00BA4F,#CC0000");
		}
	}
	
	/**
	 * 设置数据格式为默认格式  "#,##0.00" 
	 * @param format 
	 */
	public static void setNumberFormat(){
		setNumberFormat("");
	}
	
	/**
	 * 设置数据格式化方式
	 * @param format  格式样式 "#,##0.00" 
	 */
	public static void setNumberFormat(String format){
		if("".equals(format)){
			AideServlet.getRequest().
			setAttribute(AideTag.class.getName()+".number.format", "#,##0.00");
		}else{
			AideServlet.getRequest().
			setAttribute(AideTag.class.getName()+".number.format", format);
		}
	}
}
