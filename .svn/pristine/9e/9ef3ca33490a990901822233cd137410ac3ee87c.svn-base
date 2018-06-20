package com.bonc.pure.web.action.custom;

import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

public class AideServlet {
	/**
	 * 将Parameter放到Attribute中
	 * 
	 * @param request
	 * @param arrayKey
	 *            参数值为数组的参数名，多个时以逗号分隔。如：a,b
	 */
	@SuppressWarnings("all")
	public static void param2Attri(HttpServletRequest request, String arrayKey) {
		Enumeration en = request.getParameterNames();
		List<String> arrayKeys = null;
		if (StringUtils.isNotBlank(arrayKey)) {
			arrayKeys = Arrays.asList(arrayKey.split(","));
		}
		while (en.hasMoreElements()) {
			String key = (String) en.nextElement();
			String[] values = request.getParameterValues(key);
			// 当指定了参数为数组，或者参数值多个一个时，都作为数据存入Attribute中
			if ((arrayKeys != null && arrayKeys.contains(key))
					|| (values != null && values.length > 1)) {
				request.setAttribute(key, values);
			} else {
				request.setAttribute(key, request.getParameter(key));
			}
		}

	/*	java.util.Enumeration en2 = request.getAttributeNames();
		while (en2.hasMoreElements()) {
			String key = (String) en2.nextElement();
			System.out.println(key + "==" + request.getAttribute(key));
		}*/
	}

	public static HttpServletRequest getRequest() {
		return com.bonc.commons.spring.SpringUtils.getRequest();
	}
	
}
