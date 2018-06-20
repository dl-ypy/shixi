package com.bonc.pure.web.util;

import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.bonc.xframe.util.XUtils;

public class BccUtils {

	public static String formatData(String data, String format) {
		// String fmStr="###,###,##0.0%";百分数格式
		// String fmStr="###,###,##0.0";小数格式
		// String fmStr="###,###,##0";整数格式
		if (format == null || "".equals(format.trim()))
			return data;
		if (data == null || "".equals(data.trim()))
			return "";
		try {
			DecimalFormat fm = new DecimalFormat();
			;
			BigDecimal bdata = new BigDecimal(data);
			fm.applyPattern(format);
			data = fm.format(bdata);
		} catch (Exception e) {
			e.printStackTrace();

		}

		return data;
	}

	/**
	 * 处理带有分页参数的请求参数
	 * 
	 * @param mp
	 *            参数对象
	 * @param action
	 *            本次请求action对象 void
	 */
	public static void dealParamValuePagi(Map mp, Object action) {
		if (mp != null) {
			Iterator it = mp.keySet().iterator();
			while (it.hasNext()) {
				String key = (String) it.next();
				Object o = mp.get(key);
				mp.put(key, dealParam(o, false, false));
			}
			mp.put("pagiParam", invoke(action, "getPagiParam"));
			mp.put("sortCol", invoke(action, "getSortCol"));
			mp.put("sortOrder", invoke(action, "getSortOrder"));
		}
	}

	public static void dealParamValue(Map mp) {
		dealParamValue(mp, false);
	}

	public static void dealParamValue(Map mp, boolean replaceNull) {
		if (mp == null) {
			return;
		}
		boolean isNumber = false;
		Iterator it = mp.keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			Object o = mp.get(key);
			mp.put(key, dealParam(o, isNumber, replaceNull));
		}

	}

	private static Object dealParam(Object o, boolean isNumber, boolean replaceNull) {
		Object value = null;
		if (o != null) {
			if (o instanceof String) {
				value = o;
				if (isNumber) {
					value = str2Doub((String) o);
				}
			} else if (o instanceof Object[]) {
				Object[] oo = (Object[]) o;
				if (oo.length == 0) {
					value = null;
				} else if (oo.length == 1) {
					value = oo[0];
					if (value instanceof String)
						value = ((String) value).trim();
					if (isNumber) {
						value = str2Doub((String) value);
					}
				} else {
					value = oo;
					if (isNumber) {
						Double[] dbs = new Double[oo.length];
						for (int i = 0; i < oo.length; i++) {
							dbs[i] = str2Doub((String) oo[i]);
						}
						value = dbs;
					}
				}
			}
		}
		if (value instanceof String) {
			if (!replaceNull)
				value = StringUtils.isEmpty((String) value) ? null : value;
		}
		if (value == null && replaceNull)
			value = "";
		return value;
	}

	private static Double str2Doub(String str) {
		try {
			if (StringUtils.isEmpty(str)) {
				str = "0";
			}
			return new Double(Double.parseDouble(str));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new Double(0);
	}

	public static void printMap(Map mp) {
		if (mp == null) {
			System.out.println("-----------mp is null");
		} else {
			System.out.println("----------------------------print map begin--------");
			Iterator it = mp.keySet().iterator();
			while (it.hasNext()) {
				String key = (String) it.next();
				Object value = mp.get(key);
				System.out.print("-------key=" + key + " value=" + value);
				if (value instanceof String) {
					System.out.println("   (String)");
				} else if (value instanceof String[]) {
					String[] ss = (String[]) value;
					System.out.println("   (String[])" + Arrays.toString(ss));
				} else {
					System.out.println("    (object)");
				}

			}
		}
		System.out.println("----------------------------print map end--------");
	}

	private static Object invoke(Object target, String methodName) {
		Class clazz = target.getClass();
		try {
			Method targetMethod = clazz.getMethod(methodName);
			targetMethod.setAccessible(true);
			return targetMethod.invoke(target);
		} catch (NoSuchMethodException e) {
			throw new RuntimeException("在对象" + target.getClass().getName() + "中未发现方法：" + methodName);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 
	 * @param org_id
	 *            eg:GXBH
	 * @param monthId
	 *            eg:201104
	 * @return
	 *
	 * 		能否结算
	 */
	public static boolean isSettle(String org_id, String monthId) {
		Map mp = new HashMap();
		mp.put("org_id", org_id);
		mp.put("monthId", monthId);
		List list = XUtils.getDaoHelper().queryForList("ec.monitor.isSettleAble", mp);
		return list.size() > 0 ? true : false;
	}

	/**
	 * 第二版绩效考核
	 * 
	 * @param org_id
	 *            eg:GXBH
	 * @param monthId
	 *            eg:201104
	 * @return
	 *
	 * 		能否结算 true 可以结算
	 */
	public static boolean isNewSettle(String org_rank, String monthId) {
		String org_id = getAreaNo(org_rank);
		Map mp = new HashMap();
		mp.put("org_id", org_id);
		mp.put("monthId", monthId);
		List list = XUtils.getDaoHelper().queryForList("newec.monitor.isSettleAble", mp);
		return list.size() > 0 ? true : false;
	}

	/*
	 * 保底佣金冻结判断
	 */
	public static boolean isNewBasicSettle(String areaNo, String monthId) {

		Map mp = new HashMap();
		mp.put("org_id", areaNo);
		mp.put("monthId", monthId);
		List list = XUtils.getDaoHelper().queryForList("newec.monitor.isBasicSettleAble", mp);
		return list.size() > 0 ? true : false;
	}

	/*
	 * 个人代扣项目冻结
	 */
	public static boolean isNewDKSettle(String areaNo, String monthId) {

		Map mp = new HashMap();
		mp.put("org_id", areaNo);
		mp.put("monthId", monthId);
		List list = XUtils.getDaoHelper().queryForList("newec.monitor.isDKSettleAble", mp);
		return list.size() > 0 ? true : false;
	}

	/*
	 * 非一线人员指标导入冻结判断
	 */
	public static boolean isNewFPSettle(String areaNo, String monthId) {

		Map mp = new HashMap();
		mp.put("org_id", areaNo);
		mp.put("monthId", monthId);
		List list = XUtils.getDaoHelper().queryForList("newec.monitor.isFPSettleAble", mp);
		return list.size() > 0 ? true : false;
	}

	/*
	 * 分公司奖罚与调整金额冻结
	 */
	public static boolean isNewDsAdjuSettle(String areaNo, String monthId) {

		Map mp = new HashMap();
		mp.put("org_id", areaNo);
		mp.put("monthId", monthId);
		List list = XUtils.getDaoHelper().queryForList("newec.monitor.isDsAdjuSettleAble", mp);
		return list.size() > 0 ? true : false;
	}

	/**
	 * 第三版绩效考核
	 * 
	 * @param org_id
	 *            eg:GXBH
	 * @param monthId
	 *            eg:201104
	 * @return
	 *
	 * 		能否结算 true 可以结算
	 */
	public static boolean isEcthreeSettle(String org_rank, String monthId) {
		// String org_id=getAreaNo(org_rank);
		Map mp = new HashMap();
		mp.put("org_id", org_rank);
		mp.put("monthId", monthId);
		List list = XUtils.getDaoHelper().queryForList("ecthree.monitor.isSettleAble", mp);
		return list.size() > 0 ? true : false;
	}

	/**
	 * 获取地市编号
	 * 
	 * @param _orgrank
	 * @return
	 */
	public static String getAreaNo(String _orgrank) {
		String areaNo = "";
		int fromIndex1 = _orgrank.indexOf('/', 1); // -1代表区公司 5代表地市存在
		int fromIndex2;
		if (-1 == fromIndex1) {
			areaNo = "root"; // EG：/root
		} else {
			fromIndex2 = _orgrank.indexOf("/", fromIndex1 + 1); // -1代表该人员为地市
			if (-1 == fromIndex2) {
				areaNo = _orgrank.substring(fromIndex1 + 1); // EG:/root/GXNN
			} else {
				areaNo = _orgrank.substring(fromIndex1 + 1, fromIndex2); // EG:/root/GXNN/WXGC
			}
		}
		// areaNo=validateAreaNo(areaNo);
		return areaNo;
	}

	/*
	 * 生成操作日志 logCode 日志编码 日志编码在bcstest.BCC_EC_OP_CODE_LOG表中维护 userId 被操作的用户ID
	 */
	public static void insertOpLog(String logCode, String userId) {
		Map mp = new HashMap();
		mp.put("OP_ID", XUtils.getLoginId());
		mp.put("OP_CODE", logCode);
		mp.put("OP_IP", ServletActionContext.getRequest().getRemoteAddr());
		mp.put("USER_ID", userId);
		XUtils.getDaoHelper().insert("newec.monitor.insertOpLogInfo", mp);
	}

	/*
	 * 生成操作日志(v3.0使用)
	 * 
	 * userId 被操作的用户ID
	 */
	public static void insertEcNewOpLog(String logDesc, String userId) {
		Map mp = new HashMap();
		mp.put("OP_LOGINID", XUtils.getLoginId());
		mp.put("OP_DESC", logDesc);
		mp.put("OP_IP", ServletActionContext.getRequest().getRemoteAddr());
		mp.put("USER_ID", userId);
		XUtils.getDaoHelper().insert("ecthree.monitor.insertEcNewOpLogInfo", mp);
	}

	/**
	 * add by fangming 20111122
	 * 
	 * @param orgId
	 *            组织机构编码
	 * @return
	 */

	public static boolean validateTop(String orgId, String id) {
		boolean flag = false;
		// 在设置结算信息前先判断是否嘉路人数已经达到上线
		// 1,先获取当前登陆用户的ORG_RANK
		String areaNo = orgId;
		Object o3 = XUtils.getDaoHelper().queryForObject("new.ec.calcObjInfo.getCount03", id);
		int c2 = (Integer) XUtils.getDaoHelper().queryForObject("new.ec.calcObjInfo.getCount02", areaNo);
		int c3 = 0;
		if (null == o3) {
			flag = true;
		} else {
			c3 = (Integer) o3;
			if (0 == c3) {
				flag = false;
			} else if (c3 <= c2) {
				flag = false;
			} else if (c3 > c2) {
				flag = true;
			}
		}
		return flag;
	}

	/**
	 * 获取当前登陆用户的ORG_RANK
	 */
	private static String getOrgRankCurrentUser(String _loginId) {
		String orgRank = "";
		// User u = XUtils.getUser();
		// String loginId = u.getLoginId();
		Map m = new HashMap();
		m = (Map) XUtils.getDaoHelper().queryForObject("new.ec.manParaInfo.initTree.getLoginUserInfo", _loginId);
		orgRank = m.get("ORG_RANK").toString();
		return orgRank;
	}

	/**
	 * 获取当前登录用户的orgrank
	 * 
	 * @return
	 */
	public static String getCurrentUserOrgRank() {
		return getOrgRankCurrentUser(XUtils.getLoginId());
	}

	/**
	 * 根据用户的loginId获取对应的orgrank
	 * 
	 * @param loginId
	 * @return
	 */
	public static String getOrgRankByLoginId(String loginId) {
		return getOrgRankCurrentUser(loginId);
	}

	/**
	 * 获取当前登录用户的orgId
	 * 
	 * @return
	 */
	public static String getCurrentUserOrgId() {
		return (String) XUtils.getDaoHelper().queryForObject("newec.monitor.getUserOrgId", XUtils.getLoginId());
	}

	/**
	 * 根据用户的loginId获取对应的orgId
	 * 
	 * @param loginId
	 * @return
	 */
	public static String getOrgIdByLoginId(String loginId) {
		return (String) XUtils.getDaoHelper().queryForObject("newec.monitor.getUserOrgId", loginId);
	}

	/**
	 * 返回服务器当前时间
	 * 
	 * @param format
	 *            日期格式，例如：yyyy/yyyyMM/yyyyMMdd 等等
	 * @return
	 */
	public static String getSysTime(String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String time = sdf.format(new Date());
		return time;
	}

	/**
	 * 返回服务器当前月份，格式：yyyyMM
	 * 
	 * @return
	 */
	public static String getSysMonthId() {
		return getSysTime("yyyyMM");
	}

	/**
	 * 返回服务器当前日期，格式：yyyyMMdd
	 * 
	 * @return
	 */
	public static String getSysDateId() {
		return getSysTime("yyyyMMdd");
	}
}
