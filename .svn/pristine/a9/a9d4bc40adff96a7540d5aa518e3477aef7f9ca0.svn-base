package com.bonc.pure.web.util;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 集合操作工具类
 * @author fcf
 *
 */
public class CollectionEdit {
	
	/**
	 * 将Map转化为json串
	 * <p>注意：
	 * <p>1、map中value可以是list，支持嵌套
	 * <p>2、转化后格式是   "key":"value"，key、value均被双引号包含
	 * @param map 要转化的map
	 * @return json字符串
	 */
	@SuppressWarnings("unchecked")
	public static String mapToString(Map<String,Object> map){
		StringBuffer sb = new StringBuffer();
		try{
			if(map != null && !map.isEmpty()){
				Set<String> keySet = map.keySet();
				sb.append("{");
				int i = 0;
				for(String key:keySet){
					if(i != 0){
						sb.append(",");
					}
					sb.append("\"");
					sb.append(key);
					sb.append("\":");
					Object value = map.get(key);
					if(value instanceof Map){
						Map<String,Object> mapValue = (Map<String, Object>) value;
						String valueStr = mapToString(mapValue);
						sb.append(valueStr);
					}else if(value instanceof List){
						List<?> listValue = (List<?>) value;
						String valueStr = listToString(listValue);
						sb.append(valueStr);
					}else if(value instanceof BigDecimal){
						BigDecimal bigDecimalValue = (BigDecimal) value;
						String valueStr = bigDecimalValue.toString();
						sb.append("\"");
						sb.append(valueStr);
						sb.append("\"");
					}else{
						if(value == null){
							sb.append("\"\"");
						}else{
							String valueStr = (String) value;
							sb.append("\"");
							sb.append(valueStr);
							sb.append("\"");
						}
					}
					i++;
				}
				sb.append("}");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	/**
	 * 将list转化为json串
	 * <p>注意：
	 * <p>1、支持复杂嵌套，如list内部可以是list和map,同时内部的map再包含list，或者内部的map再包含map
	 * <p>2、转化后格式是   "key":"value"，key、value均被双引号包含
	 * @param list 要转化的list
	 * @return json字符串
	 */
	@SuppressWarnings("unchecked")
	public static String listToString(List<?> list){
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		try{
			if(list != null && list.size()>0){
				int i = 0;
				for(Object value:list){
					if(i != 0){
						sb.append(",");
					}
					if(value instanceof Map){
						Map<String,Object> mapValue = (Map<String, Object>) value;
						String valueStr = mapToString(mapValue);
						sb.append(valueStr);
					}else if(value instanceof List){
						List<?> listValue = (List<?>) value;
						String valueStr = listToString(listValue);
						sb.append(valueStr);
					}else if(value instanceof BigDecimal){
						BigDecimal bigDecimalValue = (BigDecimal) value;
						String valueStr = bigDecimalValue.toString();
						sb.append("\"");
						sb.append(valueStr);
						sb.append("\"");
					}else{
						if(value == null){
							sb.append("\"\"");
						}else{
							String valueStr = (String) value;
							sb.append("\"");
							sb.append(valueStr);
							sb.append("\"");
						}
					}
					i++;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		sb.append("]");
		return sb.toString();
	}

}
