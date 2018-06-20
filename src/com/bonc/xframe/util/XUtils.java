package com.bonc.xframe.util;

import java.util.regex.Pattern;

import com.bonc.base.dao.DaoHelper;
import com.bonc.base.util.Utils;
import com.bonc.commons.spring.SpringUtils;
import com.bonc.commons.struts2.Struts2Utils;
import com.bonc.xframe.service.security.User;
import javax.servlet.http.HttpServletRequest;


public class XUtils
{
  public static DaoHelper getDaoHelper()
  {
    return ((DaoHelper)SpringUtils.getBean("daoHelper", DaoHelper.class));
  }

  public static User getUser(HttpServletRequest request)
  {
    if (null != request) {
      User user = (User)request.getSession(true).getAttribute("LOGIN_USER");
      if (null != user) {
        return user;
      }
      user = (User)request.getSession(true).getAttribute(Constants.OLD_SESSION_LOGIN_USER);
      if (user != null) {
        return user;
      }
    }

    return null;
  }

  public static User getUser()
  {
    HttpServletRequest request = null;
    try {
      request = Struts2Utils.getRequest();
    } catch (Exception e) {
      request = SpringUtils.getRequest();
    }
    return getUser(request);
  }

  public static String getLoginId()
  {
    User user = getUser();
    return ((user == null) ? null : user.getLoginId());
  }
  public static String filterAreaId(String areaId, boolean auth)
  {
    if (!(Utils.isEmpty(areaId))) {
      return areaId;
    }
    if (!(auth)) {
      return "-1";
    }
    return getUser().getAreaId();
  }

  public static String filterCityId(String cityId, boolean auth)
  {
    if (!(Utils.isEmpty(cityId))) {
      return cityId;
    }
    if (!(auth)) {
      return "-1";
    }
    return getUser().getCityId();
  }

  public static String filterTownId(String townId, boolean auth)
  {
    if (!(Utils.isEmpty(townId))) {
      return townId;
    }
    if (!(auth)) {
      return "-1";
    }
    return getUser().getTownId();
  }
  
  public static String filterNodeId(String nodeId, boolean auth)
  {
    if (!(Utils.isEmpty(nodeId))) {
      return nodeId;
    }
    if (!(auth)) {
      return "-1";
    }
    return getUser().getNodeId();
  }
  
  /**
   * 该公共方法判断项目是经分项目或是报表中心项目
   * @return
   */
  public static boolean isDssWebProject(HttpServletRequest request)
  {
	  boolean flag=true;
	  String contextPath=request.getContextPath();
      Pattern p=Pattern.compile("report");
      if(p.matcher(contextPath).find())
      {
    	  flag=false;
      }else
      {
    	  flag=true;
      }
      return flag;
  }
}

/* Location:           D:\workspace2\pure-dss-hn2012\app\WEB-INF\lib\bonc-pure-1.0.1.jar
 * Qualified Name:     com.bonc.xframe.util.XUtils
 * Java Class Version: 5 (49.0)
 * JD-Core Version:    0.5.3
 */