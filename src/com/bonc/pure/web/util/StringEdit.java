package com.bonc.pure.web.util;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 字符串操作类
 * @author fcf
 *
 */
public class StringEdit {
	/**
	 * ISO8859_1转化为GBK
	 * @param str 原字符串
	 * @return newStr 转化后的字符串
	 */
	public static String ISO8859_1ToGBK(String str){
		String newStr = "";
		try {
			if(str != null){
			   newStr = new String(str.getBytes("ISO8859_1"), "GBK");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return newStr;
	}
	/**
	 * ISO8859_1转化为UTF-8
	 * @param str 原字符串
	 * @return newStr 转化后的字符串
	 */
	public static String ISO8859_1ToUTF_8(String str){
		String newStr = "";
		try {
			if(str != null){
			   newStr = new String(str.getBytes("ISO8859_1"), "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return newStr;
	}

	/**
	 * 字符串格式校验
	 * @param oldString 原来字符串
	 * @param patternString 匹配格式（正则）
	 * @return boolean 是否完全匹配
	 */
    public static boolean checkFormat(String oldString,String patternString){
    	Pattern pattern = Pattern.compile(patternString);
    	Matcher matcher = pattern.matcher(oldString);
    	return matcher.matches();
    }
	
	/**
	 * 截取字符串
	 * @param oldString  原字符串
	 * @param patternString java正则表达式，要截取的内容
	 * @return newString 匹配到的内容
	 */
	public static String cutString(String oldString,String patternString){
		String newString = "";
    	Pattern pattern = Pattern.compile(patternString);
    	Matcher matcher = pattern.matcher(oldString);
    	if(matcher.find()) {
    		newString = matcher.group();
    	}
    	return newString;
	}
	/**
	 * 替换字符串
	 * @param oldString 原字符串
	 * @param replaceString 替换成什么字符串
	 * @param patternString java正则表达式，要替换掉的内容
	 * @return newString 替换后的新字符串
	 */
	public static String replaceString(String oldString,String replaceString,String patternString){
		String newString = "";
		newString = oldString.replaceAll(patternString, replaceString);
    	return newString;
	}
	/**
	 * 查找是否包含指定内容
	 * @param oldString 原字符串
	 * @param patternString java正则表达式，要匹配的内容
	 * @return boolean 是否包含
	 */
	public static boolean searchString(String oldString,String patternString){
		Pattern pattern = Pattern.compile(patternString);
    	Matcher matcher = pattern.matcher(oldString);
    	if(matcher.find()) {
    		return true;
    	}else{
    		return false;
    	}
	}
	/**
	 * 分割字符串
	 * @param oldString 原字符串
	 * @param patternString java正则表达式，要匹配的内容
	 * @return String[] 分割后的数组
	 */
	public static String[] splitString(String oldString,String patternString){
		Pattern pattern = Pattern.compile(patternString);
		String[] newArgs = pattern.split(oldString);
		return newArgs;
	}
	/**
	 * 查找字符串中符合表达式的字符串
	 * <p> 注意：该方法会滤重
	 * @param oldString 原字符串
	 * @param patternString java正则表达式，要匹配的内容
	 * @param resultList 要返回的list
	 * @return List<String> 将匹配到的字符串添加到resultList
	 */
	public static List<String> matcherString(String oldString,String patternString,List<String> resultList){
		Pattern pattern = Pattern.compile(patternString);
    	Matcher matcher = pattern.matcher(oldString);
	    String resultString = null;
        if(matcher.find()){
        	resultString = matcher.group();
        	resultList.add(resultString);
        	String newString = oldString.replace(resultString, "");
        	matcherString(newString, patternString, resultList);
        }
        return resultList;
	}
	/**
	 * 日期加减
	 * @param date 日期字符串
	 * @param count +-值
	 * @param calendar  Calendar.MARCH(月加减) Calendar.DATE(日加减)
	 * @param format 格式化成的格式  如：yyyyMMdd;yyyy-MM-dd;yyyyMM;yyyy-MM 
	 * @return 计算后的日期
	 */
	public static String dateDayInit(String date,int count,int calendar,String format){
		String newDate = "";
		try {
			Date a = new SimpleDateFormat(format).parse(date);
			Calendar c = Calendar.getInstance();
			c.setTime(a);
			c.add(calendar, count);
			newDate = new SimpleDateFormat(format).format(c.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return newDate;
	}
	/**
	 * 将JSONString转化为List
	 * @param jsonString json格式字符串
	 */
	public static List<Map<String, Object>> jsonStringToList(String jsonString) {
		if (jsonString == null || "".equals(jsonString)) {
			return null;
		}
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			Map<String, Object> dateMap = new HashMap<String, Object>();
			dateMap = jsonStringToMap(jsonObject.toString());
			if(dateMap != null){
				list.add(dateMap);
			}
		}
		// 对LIST进行排序
		return list;
	}

	/**
	 * 将String类型的数据转化为Map<String,Object>
	 * @param jsonString json格式字符串
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> jsonStringToMap(String jsonString) {
		if (jsonString == null || "".equals(jsonString)) {
			return null;
		}
		JSONObject jsonObject = JSONObject.fromObject(jsonString);
		Iterator<String> keyIter = jsonObject.keys();
		String key = null;
		Object value = null;
		Map<String, Object> valueMap = new HashMap<String, Object>();
		while (keyIter.hasNext()) {
			key = (String) keyIter.next();
			value = jsonObject.get(key);
			valueMap.put(key, value);
		}
		return valueMap;
	}
	
	/**
	 * DES加密
	 * @param encryptString 待加密的字符串
	 * @param encryptKey 生成秘钥的字符串，例如：机器码 
	 * @return 加密后的字符串
	 */
	public static String encryptDES(String encryptString,String encryptKey){
		String afterEncryptString = "";
		try {
			SecretKeySpec key = new SecretKeySpec(encryptKey.getBytes(),"DES");
			Cipher cipher = Cipher.getInstance("DES");
			//Cipher.ENCRYPT_MODE（加密标识）
		    cipher.init(Cipher.ENCRYPT_MODE,key);
		    //DES加密
		    byte[] encryptedData = cipher.doFinal(encryptString.getBytes("UTF-8"));
		    //Base64加密生成在Http协议中传输的字符串
		    afterEncryptString = Base64.encode(encryptedData);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    return afterEncryptString;
	}
	
	/**
	 * DES解密
	 * @param decryptString 待解密的字符串
	 * @param decryptKey 生成秘钥的字符串，例如：机器码
	 * @return 解密后的字符串
	 */
	public static String decryptDES(String decryptString, String decryptKey){
		String afterDecryptString = null;
	    byte[] byteMi = Base64.decode(decryptString);
		try {
			SecretKeySpec key = new SecretKeySpec(decryptKey.getBytes(),"DES"); 
		    Cipher cipher= Cipher.getInstance("DES");
		    cipher.init(Cipher.DECRYPT_MODE,key);
		    byte[] decryptData = cipher.doFinal(byteMi);
		    afterDecryptString = new String(decryptData,"UTF-8");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    return afterDecryptString;
	}
	
	/**
	 * 替换语句中的变量
	 * <p> 语句中的变量要以${变量名}的格式书写，“变量名”为Map parmaters中的key,方法会遍历parmaters，替换所有包含在语句中的key
	 * <p> 除了支持替换${变量名}，该方法还会调用replaceTJPD方法，支持语句条件判断。
	 * @param dataSQL 包含变量或者条件的语句、字符串
	 * @param parmaters 需要替换的变量
	 * @return 替换掉条件、变量后的语句、字符串
	 */
	public static String replaceParmater(String dataSQL,HashMap<String,Object> parmaters){
		String dataSQLNew = dataSQL;
		if(parmaters != null && !parmaters.isEmpty()){
			dataSQLNew = replaceTJPD(dataSQLNew, parmaters);
			Set<String> keySet = parmaters.keySet();
			for(String key:keySet){
				String value = parmaters.get(key)== null?"":parmaters.get(key).toString();
				String patternString = "\\$\\{" + key + "\\}";
				dataSQLNew = StringEdit.replaceString(dataSQLNew, value, patternString);
			}
		}
		return dataSQLNew;
	}
	
	/**
	 * 处理语句中的条件语句，按照条件进行处理,如果条件满足，则保留条件中的内容（不单独使用，请直接调用replaceParmater方法）
	 * <p> 支持的条件如下（注：条件区分大小写）：
	 * <p> 1、&lt;isEqual property="变量" compareValue="值"&gt;内容&lt;/isEqual&gt;  判断“变量”是否与“值”相等，如果相等则只留内容，反之全部剔除。
	 * <p> 2、&lt;isNotEqual property="变量" compareValue="值"&gt;内容&lt;/isNotEqual&gt;  判断“变量”是否与“值”不相等，如果不相等则留下内容，反之全部剔除。
	 * <p> 3、&lt;isNull property="变量"&gt;内容&lt;/isNull&gt;  判断“变量”是否为空，如果为空则留下内容，反之全部剔除。
	 * <p> 4、&lt;isNotNull property="变量"&gt;内容&lt;/isNotNull&gt;  判断“变量”是否不为空，如果不为空则留下内容，反之全部剔除。
	 * @param dataSQL 要处理的语句、字符串
	 * @param parmaters 变量Map，所有变量值都会处理成字符串进行比较
	 * @return
	 */
	private static String replaceTJPD(String dataSQL,HashMap<String,Object> parmaters){
		String cutResultString = StringEdit.cutString(dataSQL, "<[^/>]+>[^<]*</[^>]+>");
		if(cutResultString != null && !"".equals(cutResultString)){
			String tjString = StringEdit.replaceString(StringEdit.cutString(cutResultString, "</[^>]+>"),"","(</|>)").trim();
			String propertyKey = StringEdit.cutString(cutResultString, "(?<=(property\\=\"))[^\"]*(?=\")").trim();
			String tjContext = StringEdit.cutString(cutResultString, "(?<=(>))[^<]*(?=<)");
			if("isEqual".equals(tjString)){
				String propertyValue = parmaters.get(propertyKey)== null?null:parmaters.get(propertyKey).toString();
				String compareValue = StringEdit.cutString(cutResultString, "(?<=(compareValue\\=\"))[^\"]*(?=\")").trim();
				if(propertyValue != null && propertyValue.equals(compareValue)){
					String patternString = "\\$\\{" + propertyKey + "\\}";
					tjContext = StringEdit.replaceString(tjContext, propertyValue, patternString);
					dataSQL = dataSQL.replace(cutResultString, tjContext);
				}else{
					dataSQL = dataSQL.replace(cutResultString, "");
				}
			}else if("isNotEqual".equals(tjString)){
				String propertyValue = parmaters.get(propertyKey)== null?null:parmaters.get(propertyKey).toString();
				String compareValue = StringEdit.cutString(cutResultString, "(?<=(compareValue\\=\"))[^\"]*(?=\")").trim();
				if(propertyValue != null && !propertyValue.equals(compareValue)){
					String patternString = "\\$\\{" + propertyKey + "\\}";
					tjContext = StringEdit.replaceString(tjContext, propertyValue, patternString);
					dataSQL = dataSQL.replace(cutResultString, tjContext);
				}else{
					dataSQL = dataSQL.replace(cutResultString, "");
				}
			}else if("isNull".equals(tjString)){
				String propertyValue = parmaters.get(propertyKey)== null?null:parmaters.get(propertyKey).toString();
				if(propertyValue == null){
					String patternString = "\\$\\{" + propertyKey + "\\}";
					tjContext = StringEdit.replaceString(tjContext, propertyValue, patternString);
					dataSQL = dataSQL.replace(cutResultString, tjContext);
				}else{
					dataSQL = dataSQL.replace(cutResultString, "");
				}
			}else if("isNotNull".equals(tjString)){
				String propertyValue = parmaters.get(propertyKey)== null?null:parmaters.get(propertyKey).toString();
				if(propertyValue != null){
					String patternString = "\\$\\{" + propertyKey + "\\}";
					tjContext = StringEdit.replaceString(tjContext, propertyValue, patternString);
					dataSQL = dataSQL.replace(cutResultString, tjContext);
				}else{
					dataSQL = dataSQL.replace(cutResultString, "");
				}
			}else{
				dataSQL = dataSQL.replace(cutResultString, "");
			}
			boolean ifFind = StringEdit.searchString(dataSQL, "<[^/>]+>[^<]*</[^>]+>");
			if(ifFind){
				dataSQL = replaceTJPD(dataSQL,parmaters);
			}
		}
		return dataSQL;
	}
}
