package com.bonc.xframe.service.security;

import com.bonc.security.loginuser.IUserProperty;
import com.bonc.security.loginuser.LoginUserInfo;
import java.util.HashMap;
import java.util.Map;

public class UserXFrame
  implements User, LoginUserInfo
{
  private static final long serialVersionUID = 1L;
  private boolean login;
  private String loginId;
  private String staffId;
  private boolean admin;
  private String username;
  private String password;
  private String email;
  private String areaId;
  private String cityId;
  private String townId;
  private String nodeId;
  private String sectId;
  private String department;
  private String deptName;
  private int deptLevel;
  private String deptParentNo;
  private String markArea;
  private String markAreaDesc;
  private String sellArea;
  private String sellAreaDesc;
  private String serviceArea;
  private String serviceAreaDesc;
  private Map<String, Object> properties;

  public UserXFrame()
  {
    this.login = true;

    this.admin = false;

    this.properties = new HashMap(); }

  public String getAreaID() {
    return this.areaId;
  }

  public void setAreaID(String areaID) {
    this.areaId = areaID;
  }

  public String getCityID() {
    return this.cityId;
  }

  public void setCityID(String cityID) {
    this.cityId = cityID;
  }

  public String getSectID() {
    return this.sectId;
  }

  public void setSectID(String sectID) {
    this.sectId = sectID;
  }

  public String getTownID() {
    return this.townId;
  }

  public void setTownID(String townID) {
    this.townId = townID;
  }

  public String getExtendedPropertiy(String key) {
    return ((String)this.properties.get(key));
  }

  public void setExtendedPropertiy(String key, String value) {
    this.properties.put(key, value);
  }

  public IUserProperty getExtendedProperty(String key) {
    return ((IUserProperty)this.properties.get(key));
  }

  public void setExtendedProperty(String key, IUserProperty value) {
    this.properties.put(key, value);
  }

  public String getRoleList() {
    throw new UnsupportedOperationException();
  }

  public void setRoleList(String arg0) {
    throw new UnsupportedOperationException();
  }

  public String getLoginId() {
    return this.loginId;
  }

  public void setLoginId(String loginId) {
    this.loginId = loginId;
  }

  public String getUserID() {
    return getLoginId();
  }

  public void setUserID(String userID) {
    setLoginId(userID);
  }

  public int getVisitID() {
    throw new UnsupportedOperationException();
  }

  public void setVisitID(int arg0) {
    throw new UnsupportedOperationException();
  }

  public boolean isLogin() {
    return this.login;
  }

  public void setLogin(boolean arg0) {
    this.login = false;
  }

  public String getName() {
    return getUserName();
  }

  public void setName(String name) {
    setUserName(name);
  }

  public String getAreaId() {
    return this.areaId;
  }

  public void setAreaId(String areaId) {
    this.areaId = areaId;
  }

  public String getCityId() {
    return this.cityId;
  }

  public void setCityId(String cityId) {
    this.cityId = cityId;
  }

  public String getTownId() {
    return this.townId;
  }

  public void setTownId(String townId) {
    this.townId = townId;
  }

  public String getSectId() {
    return this.sectId;
  }

  public void setSectId(String sectId) {
    this.sectId = sectId;
  }

  public String getDepartment() {
    return this.department;
  }

  public void setDepartment(String department) {
    this.department = department;
  }

  public String getDeptName() {
    return this.deptName;
  }

  public void setDeptName(String deptName) {
    this.deptName = deptName;
  }

  public int getDeptLevel() {
    return this.deptLevel;
  }

  public void setDeptLevel(int deptLevel) {
    this.deptLevel = deptLevel;
  }

  public String getDeptParentNo() {
    return this.deptParentNo;
  }

  public void setDeptParentNo(String deptParentNo) {
    this.deptParentNo = deptParentNo;
  }

  public long getActiveTime() {
    throw new UnsupportedOperationException();
  }

  public void setActiveTime(long activeTime) {
    throw new UnsupportedOperationException();
  }

  public Object getProperty(String key) {
    return this.properties.get(key);
  }

  public void setProperty(String key, Object value) {
    this.properties.put(key, value);
  }

  public Map<String, Object> getProperties() {
    return this.properties;
  }

  public void setProperties(Map<String, Object> properties) {
    this.properties = properties;
  }

  public String getStaffId() {
    return this.staffId;
  }

  public void setStaffId(String staffId) {
    this.staffId = staffId;
  }

  public String getUserName() {
    return this.username;
  }

  public void setUserName(String username) {
    this.username = username;
  }

  public String getPassword() {
    return this.password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getEmail() {
    return this.email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public boolean isAdmin() {
    return this.admin;
  }

  public String getMarkArea() {
    return this.markArea;
  }

  public void setMarkArea(String markArea) {
    this.markArea = markArea;
  }

  public String getMarkAreaDesc() {
    return this.markAreaDesc;
  }

  public void setMarkAreaDesc(String markAreaDesc) {
    this.markAreaDesc = markAreaDesc;
  }

  public String getSellArea() {
    return this.sellArea;
  }

  public void setSellArea(String sellArea) {
    this.sellArea = sellArea;
  }

  public String getSellAreaDesc() {
    return this.sellAreaDesc;
  }

  public void setSellAreaDesc(String sellAreaDesc) {
    this.sellAreaDesc = sellAreaDesc;
  }

  public String getServiceArea() {
    return this.serviceArea;
  }

  public void setServiceArea(String serviceArea) {
    this.serviceArea = serviceArea;
  }

  public String getServiceAreaDesc() {
    return this.serviceAreaDesc;
  }

  public void setServiceAreaDesc(String serviceAreaDesc) {
    this.serviceAreaDesc = serviceAreaDesc;
  }

  public boolean equals(Object obj)
  {
	  return (obj instanceof User && this.getLoginId() != null && this
				.getLoginId().equals(((User) obj).getLoginId()));
  }

  public int compareTo(User obj)
  {
    if (equals(obj))
      return 0;
    long re = getActiveTime() - obj.getActiveTime();
    return ((re > 0L) ? 1 : (re == 0L) ? -1 : -1);
  }

	public String getNodeId() {
		return this.nodeId;
	}
	
	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}
}