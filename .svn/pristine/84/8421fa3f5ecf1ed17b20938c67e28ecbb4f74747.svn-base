package com.bonc.pure.web.action.custom.tag;

import static com.bonc.pure.web.action.custom.AideTag.getBlankDefault;
import static com.bonc.pure.web.action.custom.AideTag.getDateFormat;
import static com.bonc.pure.web.action.custom.AideTag.getNumberFormat;
import static com.bonc.pure.web.action.custom.AideTag.getRateColor;
import static com.bonc.pure.web.action.custom.AideTag.getRateFormat;
import static com.bonc.pure.web.action.custom.AideTag.getPPFormat;
import static com.bonc.pure.web.action.custom.AideTag.getPPPostfix;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 常用函数
 * 
 * @author Roof
 * 
 */
public class Functions {
	// 时间格式对象缓存
	private static Map<String, DateFormat> sdfs = new HashMap<String, DateFormat>();
	// 数值格式缓存
	private static Map<String, NumberFormat> nfs = new HashMap<String, NumberFormat>();

	/**
	 * 默认值
	 * 
	 * @param o
	 *            源对象
	 * @return
	 */
	public static Object def(Object o) {
		return isBlank(o) ? getBlankDefault() : o;
	}

	/**
	 * 是否为空白
	 * 
	 * @param o
	 * @return
	 */
	private static boolean isBlank(Object o) {
		return (o == null || (o instanceof String && ((String) o).trim()
				.equals("")));
	}

	/**
	 * 日期格式化
	 * 
	 * @param o
	 *            需格式化对象
	 * @return
	 */
	public static String fmtDate(Object o) {
		if (isBlank(o)) {
			return getBlankDefault();
		}
		Date d = null;
		if (o instanceof Date) {
			d = (Date) o;
		} else {
			long l = Long.parseLong(String.valueOf(o));
			d = new Date(l);
		}
		String fmt = getDateFormat();
		DateFormat sdf = sdfs.get(fmt);
		if (sdf == null) {
			sdf = new SimpleDateFormat(fmt);
			sdfs.put(fmt, sdf);
		}
		return sdf.format(d);
	}

	/**
	 * 数字格式化
	 * 
	 * @param o
	 * @return
	 */
	public static String fmtNumber(Object o) {
		return fmtNumber2(o, 1);
	}

	/**
	 * 数字格式化（除以一定值）
	 * 
	 * @param o
	 * @param ratio
	 * @return
	 */
	public static String fmtNumber2(Object o, int ratio) {
		if (isBlank(o)) {
			return getBlankDefault();
		}
		Double d = null;
		if (o instanceof Number) {
			d = ((Number) o).doubleValue();
		} else {
			d = parseDouble(o);
		}
		d = division(d, ratio == 0 ? 1 : ratio);
		String fmt = getNumberFormat();

		NumberFormat nf = nfs.get(fmt);
		if (nf == null) {
			nf = new DecimalFormat(fmt);
			nfs.put(fmt, nf);
		}
		return nf.format(d);
	}
	
	/**
	 * 比率格式化
	 * 
	 * @param o
	 * @return
	 */
	public static String fmtRate(Object o) {
		if (isBlank(o)) {
			return getBlankDefault();
		}
		Double d = null;
		if (o instanceof Number) {
			d = ((Number) o).doubleValue();
		} else {
			d = parseDouble(o);
		}
		String fmt = getRateFormat();

		NumberFormat nf = nfs.get(fmt);
		if (nf == null) {
			nf = new DecimalFormat(fmt);
			nfs.put(fmt, nf);
		}
		return nf.format(d);
	}

	public static Double add(Object o1, Object o2) {
		return addition(o1, o2);
	}

	public static Double add(Object o1, Object o2, Object o3) {
		return addition(o1, o2, o3);
	}

	public static Double add(Object o1, Object o2, Object o3, Object o4) {
		return addition(o1, o2, o3, o4);
	}

	/**
	 * 加法（addition）
	 * 
	 * @param os
	 * @return
	 */
	public static Double addition(Object... os) {
		if (os == null) {
			return null;
		}
		Double sum = 0d;

		for (Object o2 : os) {
			Double d2 = parseDouble(o2);
			if (d2 == null) {
				d2 = 0d;
			}
			sum += d2;
		}
		return sum;
	}
	
	public static Double sub(Object o1,Object o2) {
		return subtraction(o1,o2);
	}
	
	public static Double sub(Object o1,Object o2,Object o3) {
		return subtraction(o1,o2,o3);
	}
	
	public static Double sub(Object o1,Object o2,Object o3,Object o4) {
		return subtraction(o1,o2,o3,o4);
	}
	
	/**
	 * 减法（subtraction）
	 * @param os
	 * @return
	 */
	public static Double subtraction(Object... os){
		if (os == null) {
			return null;
		}
		Double sub = 0d;
		boolean isStart = true;

		for (Object o2 : os) {
			Double d2 = parseDouble(o2);
			if (d2 == null) {
				d2 = 0d;
			}
			if(isStart){
				sub = d2;
				isStart = false;
				continue;				
			}			
			sub -= d2;	
		}
		return sub;
	}

	/**
	 * 乘法（multiplication）
	 * 
	 * @param os
	 * @return
	 */
	public static Double multiplication(Object... os) {
		if (os == null) {
			return null;
		}
		Double mul = 1d;

		for (Object o2 : os) {
			Double d2 = parseDouble(o2);
			if (d2 == null) {
				d2 = 0d;
			}
			mul *= d2;
		}
		return mul;
	}

	/**
	 * 除法(division)
	 * 
	 * @param o1
	 *            除数
	 * @param o2
	 *            被除数
	 * @return
	 */
	public static Double division(Object o1, Object o2) {
		Double v1 = parseDouble(o1);
		Double v2 = parseDouble(o2);

		if (v1 == null || v2 == null || v2.doubleValue() == 0) {
			return null;
		}
		return v1.doubleValue() / v2.doubleValue();
	}

	/**
	 * 增长速度、增长率(growthRate)<br>
	 * 增长速度=增减量/基期水平=（报告期水平-基期水平）/基期水平=发展速度-1
	 * 
	 * @param o1
	 *            报告期值
	 * @param o2
	 *            基准期值
	 * @return
	 */
	public static Double growthRate(Object o1, Object o2) {
		Double v1 = parseDouble(o1);
		Double v2 = parseDouble(o2);
		if (v1 == null || v2 == null || v1.doubleValue() == 0
				|| v2.doubleValue() == 0) {
			return null;
		}
		return (v1.doubleValue() - v2.doubleValue())
				/ Math.abs(v2.doubleValue());
	}

	/**
	 * 增长率变化
	 * 
	 * @param o1
	 *            第一期值
	 * @param o2
	 *            第二期值
	 * @param o3
	 *            第三期值
	 * @return
	 */
	public static Double growthRateChange(Object o1, Object o2, Object o3) {
		Double v1 = growthRate(o1, o2);
		Double v2 = growthRate(o2, o3);
		if (v1 == null || v2 == null) {
			return null;
		}
		return v1 - v2;
	}

	/**
	 * 复合增长率<br>
	 * 
	 * <pre>
	 * 复合增长率（Compound Annual Growth Rate，简称CAGR）
	 * 
	 * CAGR通过总增长率百分比的N次方根求得，N相等于有关时期内的年数，具体公式如下：
	 * 		<b>CAGR = (现有价值/基础价值)^(1/N) - 1</b>
	 * 现有价值是指你要计算的某项指标本年度的数目
	 * 基础价值是指你计算的年度上一年的这项指标的数据，如你计算3年，则是计算上溯第4年的数值
	 * </pre>
	 * 
	 * @param o1
	 *            现有价值
	 * @param o2
	 *            基础价值
	 * @param amount
	 *            时期数量
	 * @return
	 */
	public static Double caGrowthRate(Object o1, Object o2, int amount) {
		Double v1 = parseDouble(o1);
		Double v2 = parseDouble(o2);
		if (v1 == null || v2 == null || v2.doubleValue() == 0 || amount < 0) {
			return null;
		}
		Double d3 = v1.doubleValue() / v2.doubleValue();
		if (d3 < 0) {
			return null;
		}
		return Math.pow(d3, (double) 1 / amount) - 1;
	}

	/**
	 * 除法，格式化为数字
	 * 
	 * @param o1
	 *            除数
	 * @param o2
	 *            被除数
	 * @return
	 */
	public static String cf(Object o1, Object o2) {
		Double d = division(o1, o2);
		return (String) fmtNumber(d);
	}

	/**
	 * 除法，格式化为比率
	 * 
	 * @param o1
	 *            除数
	 * @param o2
	 *            被除数
	 * @return
	 */
	public static String bl(Object o1, Object o2) {
		Double d = division(o1, o2);
		return (String) fmtRate(d);
	}

	/**
	 * 增长速度、增长率(growthRate)<br>
	 * 增长速度=增减量/基期水平=（报告期水平-基期水平）/基期水平=发展速度-1
	 * 
	 * @param o1
	 *            报告期值
	 * @param o2
	 *            基准期值
	 * @return
	 */
	public static String zzl(Object o1, Object o2) {
		Double d = growthRate(o1, o2);
		String f = fmtRate(d);
		return addRateColor(d, f);
	}

	private static String addRateColor(Double d, String f) {
		if (d == null) {
			return f;
		}
		// 加颜色
		String color = getRateColor(d);
		if (color == null) {
			return f;
		}
		return "<font color=\"" + color + "\">" + f + "</font>";
	}

	/**
	 * 增长率变化
	 * 
	 * @param o1
	 *            第一期值
	 * @param o2
	 *            第二期值
	 * @param o3
	 *            第三期值
	 * @return
	 */
	public static String zzlbh(Object o1, Object o2, Object o3) {
		Double d = growthRateChange(o1, o2, o3);
		String f = fmtPP(d);
		return addRateColor(d, f);
	}

	/**
	 * 复合增长率<br>
	 * 
	 * <pre>
	 * 复合增长率（Compound Annual Growth Rate，简称CAGR）
	 * 
	 * CAGR通过总增长率百分比的N次方根求得，N相等于有关时期内的年数，具体公式如下：
	 * 		<b>CAGR = (现有价值/基础价值)^(1/N) - 1</b>
	 * 现有价值是指你要计算的某项指标本年度的数目
	 * 基础价值是指你计算的年度上一年的这项指标的数据，如你计算3年，则是计算上溯第4年的数值
	 * </pre>
	 * 
	 * @param o1
	 *            现有价值
	 * @param o2
	 *            基础价值
	 * @param amount
	 *            时期数量
	 * @return
	 */
	public static String fhzzl(Object o1, Object o2, int amount) {
		Double d = caGrowthRate(o1, o2, amount);
		String f = fmtRate(d);
		return addRateColor(d, f);
	}

	/**
	 * 将对象转为Double
	 * 
	 * @param o
	 * @return
	 */
	private static Double parseDouble(Object o) {
		if (o == null
				|| (o instanceof String && ((String) o).trim().equals(""))) {
			return null;
		}

		if (o instanceof Number) {
			return ((Number) o).doubleValue();
		}
		return Double.valueOf(String.valueOf(o));
	}
	
	/**
	 * 增长率，比率变化格式字符串
	 * 
	 * @param o
	 * @return
	 */
	public static String fmtPP(Object o) {
		if (isBlank(o)) {
			return getBlankDefault();
		}
		Double d = null;
		if (o instanceof Number) {
			d = ((Number) o).doubleValue();
		} else {
			d = parseDouble(o);
		}
		d = d*100;
		String fmt = getPPFormat();

		NumberFormat nf = nfs.get(fmt);
		if (nf == null) {
			nf = new DecimalFormat(fmt);
			nfs.put(fmt, nf);
		}
		return nf.format(d)+getPPPostfix();
	}
	
	/**
	 * 比率变化
	 * 
	 * @param o1
	 *            第一期值
	 * @param o2
	 *            第二期值
	 * @param o3
	 *            第三期值
	 * @param o3
	 *            第四期值
	 * @return
	 */
	public static String blbh(Object o1, Object o2,Object o3, Object o4){
		Double v1 = division(o1, o2);
		Double v2 = division(o3, o4);
		if (v1 == null || v2 == null) {
			return null;
		}
		String f = fmtPP(v1 - v2);
		return addRateColor(v1 - v2, f);
	}	
}
