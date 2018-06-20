package com.bonc.pure.web.action.sso;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;

import com.bonc.base.dao.DaoHelper;
import com.bonc.commons.struts2.Struts2Utils;
import com.bonc.pure.PureConstant;
import com.bonc.pure.domain.User;
import com.bonc.pure.interceptor.SkipAuth;
import com.bonc.pure.service.IAuthentication;
import com.bonc.pure.service.IEncrypt;
import com.bonc.pure.service.IUserService;
import com.sso.hp.utils.HttpUtil;
import com.sso.hp.utils.UserEntry;
import com.sso.hp.utils.XmlUtil;

public class PssoLoginAction implements SkipAuth{
	private IAuthentication authentication = null;
	private IUserService userService = null;
	private String msg = null;
	private DaoHelper daoHelper;
	private IEncrypt encrypt = null;
	
	//rUrl 是oa单点传递过来的参数
	private String rUrl = null;
	//存放跳转到CPLogin-auto.jsp后,需要使用的值
	private Map<String, String> params = new HashMap<String, String>();
	
    public String execute(){
		HttpServletRequest request = Struts2Utils.getRequest();
		HttpSession session = request.getSession();
		insertDbLog(null, session.getId(), "no", "1", "进入execute方法");
		if(authentication.auth(request)){
			String tempUrl = getTargetUrl(request.getParameter("rUrl"));
			params.put("flowUrl", tempUrl);
			params.put("firstFlag", "0");
			insertDbLog(authentication.getAuthUser(request).getLoginId(), session.getId(), "yes", "1.1", "进入execute方法->直接跳转");
			return "auto";
		}else{
			insertDbLog(null, session.getId(), "no", "1.2", "进入execute方法->需要验证");
			return "sso";
		}
	}
    
    @SuppressWarnings({ "rawtypes", "unused" })
	public String login() {
		HttpServletRequest request = Struts2Utils.getRequest();
		HttpSession session = request.getSession();
		String certPath = request.getSession().getServletContext().getRealPath("") + "/WEB-INF/lib/server_rsa.cer";
		String tempUrl = getTargetUrl(request.getParameter("return"));
		params.put("flowUrl", tempUrl);
		insertDbLog(null, session.getId(), "no", "2", "进入login方法, certPath=" + certPath);
		//如果认证通过,直接跳转
		if(authentication.auth(request)){
			params.put("firstFlag", "0");
			insertDbLog(authentication.getAuthUser(request).getLoginId(), session.getId(), "yes", "2.1", "进入login方法->直接跳转");
			return "auto";
		}else{//云门户验证, 模拟登录
			String soap = request.getParameter("token");
			String token = XmlUtil.GetToken(soap);
			boolean status = false;
			String error_info = "IDP处理出错  token为空";
			UserEntry userentry = null;
			String sso_url = new String("");
			String temp_str = new String("");
			String temp_xml = new String("");
			insertDbLog(null, session.getId(), "no", "2.2", "进入login方法->云门户验证开始    soap=" + soap + " token=" + token);
			
			//获取云门户系统的token
			if (token != null && token.length() > 0) {
				
				String url = SsoParmater.SSO_AUTHENTICATION_CHECK_URL + "?token="	+ token + "&appid=" + SsoParmater.SSO_APP_ID;
				sso_url = url;
				//System.out.println("====================="+url);
				insertDbLog(null, session.getId(), "no", "2.2.1", "HttpUtil.XmlForSendRequest(url) 开始    soap=" + soap + " token=" + token +  " sso_url=" + url);
				Document doc = HttpUtil.XmlForSendRequest(url);
				
				if(doc == null){
					temp_xml = "Document doc = HttpUtil.XmlForSendRequest(url) 返回值为空";
				}else{
					temp_xml = doc.asXML();
				}
				insertDbLog(null, session.getId(), "no", "2.2.2", "HttpUtil.XmlForSendRequest(url) 结束    soap=" + soap + " token=" + token +  " sso_url=" + url + " doc=" + temp_xml);
				if (XmlUtil.CheckSign(doc, certPath)) {
					String str = XmlUtil.GetStatus(doc);
					temp_str = str;
					System.out.println("============str=" + str);
					if (str != null && str.equals("urn:oasis:names:tc:SAML:2.0:status:Success")) {
						userentry = XmlUtil.get_userinfo(doc);// 获取SAML中的用户信息
						status = true;
					} else if (str != null && str.equals("urn:oasis:names:tc:SAML:2.0:status:Responder")) {
						error_info = "IDP处理出错";
					} else if (str != null && str.equals("urn:oasis:names:tc:SAML:2.0:status:VersionMismatch")) {
						error_info = "请求版本错误";
					} else if (str != null && str.equals("urn:oasis:names:tc:SAML:2.0:status:PartialLogout")) {
						error_info = "其他站点已注销";
					} else if (str != null && str.equals("urn:oasis:names:tc:SAML:2.0:status:RequestDenied")) {
						error_info = "拒绝该SP的请求";
					} else if (str != null && str.equals("urn:oasis:names:tc:SAML:2.0:status:RequestDenied")) {
						error_info = "不支持的请求";
					} else if (str != null && str.equals("urn:oasis:names:tc:SAML:2.0:status:Forbid")) {
						error_info = "该账号不允许访问该应用系统";
					}
				}
			}
			
			insertDbLog(null, session.getId(), "no", "2.3", "进入login方法->云门户验证结束    error_info=" + error_info + " sso_url=" + sso_url + " str=" + temp_str + " doc=" + temp_xml);
			
			if (!status) {
				System.out.println("==================================error_info" + error_info);
				msg = error_info;
				insertDbLog(null, session.getId(), "no", "9", "验证失败跳转登录页面   error_info=" + error_info + " sso_url=" + sso_url + " str=" + temp_str + " doc=" + temp_xml);
				return PureConstant.PAGE_lOGIN_INPUT;
			}
			
			String loginId = userentry.getUserid().trim();
			//String loginId = "admin";
			insertDbLog(null, session.getId(), "no", "2.4", "获取用户信息开始");
			
			System.out.println("==================================loginId===============================" + loginId);
			
			Map userInfo = (Map)daoHelper.queryForObject("cw.common.getPureStaffNo", loginId);
			
			insertDbLog(null, session.getId(), "no", "2.5", "获取用户信息结束");
			if(userInfo == null){
				msg = "账号不存在";
				insertDbLog(loginId, session.getId(), "no", "9", "账号不存在跳转登录界面");
				return PureConstant.PAGE_lOGIN_INPUT;
			}
			System.out.println("==================================user 不为空===============================");
		    session.setAttribute("authToken", token);
		    
		    insertDbLog(loginId, session.getId(), "no", "2.6", "模拟登录开始");
		    
			//登录
		    User user = this.userService.getByLoginId(loginId);
			this.authentication.login(Struts2Utils.getRequest(), user);
			
			//初次登陆,需要执行模拟登录
			params.put("firstFlag", "1");
			insertDbLog(loginId, session.getId(), "no", "2.7", "模拟登录结束");
			return "auto";
		}
	}
    
    //获取跳转到的url
  	private String getTargetUrl(String s_url){
  		StringBuffer resBuffer = new StringBuffer();
  		String rUrlEncode = s_url;
  		String returnUrl = null;
  		if(StringUtils.isNotEmpty(rUrlEncode)){
  			try {
  				returnUrl = java.net.URLDecoder.decode(rUrlEncode, "UTF-8");
  				resBuffer.append(returnUrl);
  			} catch (UnsupportedEncodingException e) {
  				e.printStackTrace();
  			}
  		}
  		return resBuffer.toString();
  	}
  	
  	private void insertDbLog(String login_id, String session_id,  String if_check, String type_id,  String type_desc){
		//内存实时统计
		CloudStorm.getInstance().log(login_id, session_id, if_check, type_id, type_desc);
	}

	public IAuthentication getAuthentication() {
		return authentication;
	}

	public void setAuthentication(IAuthentication authentication) {
		this.authentication = authentication;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public DaoHelper getDaoHelper() {
		return daoHelper;
	}

	public void setDaoHelper(DaoHelper daoHelper) {
		this.daoHelper = daoHelper;
	}

	public IEncrypt getEncrypt() {
		return encrypt;
	}

	public void setEncrypt(IEncrypt encrypt) {
		this.encrypt = encrypt;
	}

	public String getrUrl() {
		return rUrl;
	}

	public void setrUrl(String rUrl) {
		this.rUrl = rUrl;
	}

	public Map<String, String> getParams() {
		return params;
	}

	public void setParams(Map<String, String> params) {
		this.params = params;
	}
	
}
