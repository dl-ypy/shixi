package com.bonc.pure.web.action.custom.tag.tagUtils;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import com.opensymphony.xwork2.util.ValueStack;
/**
 * 自定义标签公共类 
 * <p>Title:TagUtils.java</p>
 * <p>Description:</p>
 * <p>Copyright:BONC</p>
 * @author Fan Jiantao
 * @date 2010-6-3
 * @version 1.0
 */
public class TagUtils {
	
	/**
	 * jsp输出
	 * @param page
	 * @param paramObj
	 * @throws JspException
	 */
	public static void print(PageContext page, Object paramObj) throws JspException{
		try {
			page.getOut().print(paramObj);
		} 
		catch (IOException e) {
			throw new JspException(e);
		}
	}
	
	/**
	 * jsp换行输出
	 * @param page
	 * @param paramObj
	 * @throws JspException
	 */
	public static void println(PageContext page, Object paramObj) throws JspException{
		try {
			page.getOut().println(paramObj);
		} catch (IOException e) {
			throw new JspException(e);
		}
	}
	
	/**
	 * 返回值栈
	 * @param page
	 * @return
	 */
	public static ValueStack getStack(PageContext page){
		return org.apache.struts2.views.jsp.TagUtils.getStack(page);
	}
	
	/**
	 * 返回参数所对应的对象
	 * @param page
	 * @param paramString
	 * @return
	 */
	public static Object findValue(PageContext page, String paramString){
		return org.apache.struts2.views.jsp.TagUtils.getStack(page).findValue(paramString);
	}
	
	/**
	 * 格式化对象
	 * @param paramObj	对象
	 * @param paramString 格式化类型
	 * @return
	 */
	public static String NumFormat(Object paramObj, String paramString){
		if (paramObj == null) {
			return "";
		}
		
		if (paramObj instanceof String) {
			try {
				paramObj = new Double(Double.parseDouble(paramObj.toString()));
			} catch (NumberFormatException e) {
				throw new RuntimeException(paramObj + " is a String, but it can parse to double!");
			}
		}
		
		if (!(paramObj instanceof Number)) {
			throw new RuntimeException(paramObj + " is not a type of Number!");
		}
		
		DecimalFormat df = new DecimalFormat();
		df.applyPattern(paramString);
		df.setRoundingMode(RoundingMode.HALF_UP);  
		return df.format(paramObj);
	}
	
	/**
	 * 格式化对象
	 * @param paramObj	对象
	 * @param paramString 格式化类型
	 * @return
	 */
	public static String NumFormatTwo(Object paramObj, String paramString){
		if (paramObj == null) {
			return null;
		}
		
		if (paramObj instanceof String) {
			try {
				paramObj = new Double(Double.parseDouble(paramObj.toString()));
			} catch (NumberFormatException e) {
				throw new RuntimeException(paramObj + " is a String, but it can parse to double!");
			}
		}
		
		if (!(paramObj instanceof Number)) {
			throw new RuntimeException(paramObj + " is not a type of Number!");
		}
		
		DecimalFormat df = new DecimalFormat();
		df.applyPattern(paramString);
		df.setRoundingMode(RoundingMode.HALF_UP);  
		return df.format(paramObj);
	}
	
	/**
	 * 返回double对象
	 * @param paramObject
	 * @return
	 */
	public static double getDoubleObject(Object paramObject)
	{
	    if (paramObject == null)
	        return 0.0D;
	    
	    if (paramObject instanceof Number)
	        return ((Number)paramObject).doubleValue();
	    
	    if (paramObject instanceof String)
	      try
	      {
	          return Double.parseDouble((String)paramObject);
	      }
	      catch (NumberFormatException localNumberFormatException)
	      {
	          System.out.println("parse " + paramObject + " to double error,then return 0");
	          return 0.0D;
	      }
	    return 0.0D;
	}
	
	/**
	 * 返回String对象
	 * @param paramObj
	 * @return
	 */
	public static String getStringObject(Object paramObj){
		
		if (paramObj == null)
			return "";
		
		if (paramObj instanceof String)
			return paramObj.toString();
		
		if (paramObj instanceof Number) {
			BigDecimal bd = (BigDecimal) paramObj;
			return bd.toString();
		}
		
		return "";
	}
	
	
	

}
