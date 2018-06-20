package com.bonc.pure.struts2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.bonc.pure.PureUtils;
import com.bonc.pure.domain.CustomPortalBasic;
import com.bonc.pure.domain.Resources;
import com.bonc.pure.service.ICustomPortalService;
import com.bonc.pure.service.IResourcesService;
import com.bonc.pure.service.IResourcesTypeService;
import com.bonc.pure.service.IUserPermissionService;

/**
 * Bootstrap框架页面，可以通过BIndex页面跳转BFrame，也可以直接访问BFrame
 * 
 * @author 李志浩
 */
public class BFrameAction {

	private List<Map> menu;
	private Map param;
	private String id;

	private IResourcesService resourcesService;
	private IResourcesTypeService resourcesTypeService;
	private IUserPermissionService userPermissionService;
	private ICustomPortalService customPortalService;

	public String execute() {
		param = new HashMap();
		param.put("userName", PureUtils.getUser().getUserName());
		boolean showIndex = true;
		if ("".equals(id) || id == null) {
			showIndex = false;
		}
		menu = getMenuList(id);
		if (menu == null || menu.size() == 0) {
			menu = getResourceById(id);
		}
		Map fristRes = getFristUrlResource(menu);
		if (fristRes != null) {
			String click = "";
			String fristResPath = (String) fristRes.get("path");
			String fristResPathRes[] = fristResPath.replaceAll("/root/", "").split("/");
			for (String temp : fristResPathRes) {
				click += "$('#a_" + temp + "').click();";
			}
			param.put("click", click);
		} else {
			param.put("click", "$('#content-main iframe').attr('src','BDefault.action');");
		}
		return "success";
	}

	private List<Map> getMenuList(String resourceId) {
		if ("".equals(resourceId) || resourceId == null) {
			IResourcesService resourcesService = PureUtils.getResourcesService();
			resourceId = resourcesService.getRootId();
		}

		// 方式1: 手工过滤所有有权限的权限
		Long userId = PureUtils.getUserId(ServletActionContext.getRequest());
		// Map<String, Resources> allPermissionResourcesMap = new HashMap<String, Resources>();
		//
		// // 全部角色权限菜单
		// IRolePermissionService rolePermissionService = PureUtils.getRolePermissionService();
		// List<RolePermission> rolePermissionList = rolePermissionService.findOptByUserId(userId, null, null, null);
		// for (RolePermission rolePermission : rolePermissionList) {
		// Resources tempRes = rolePermission.getResources();
		// if (!allPermissionResourcesMap.containsKey(tempRes.getResourcesId())) {
		// allPermissionResourcesMap.put(tempRes.getResourcesId(), tempRes);
		// }
		// }
		// // 全部用户权限菜单
		// IUserPermissionService userPermissionService = PureUtils.getUserPermissionService();
		// List<UserPermission> userPermissionList = userPermissionService.findOptByUserId(userId, null, null, null);
		// for (UserPermission userPermission : userPermissionList) {
		// Resources tempRes = userPermission.getResources();
		// if (!allPermissionResourcesMap.containsKey(tempRes.getResourcesId())) {
		// allPermissionResourcesMap.put(tempRes.getResourcesId(), tempRes);
		// }
		// }
		//
		// IResourcesService resourcesService = PureUtils.getResourcesService();
		// IResourcesTypeService resourcesTypeService = (IResourcesTypeService) SpringUtils.getBean("resourcesTypeService");
		// Long sysMenuId = resourcesTypeService.getSysMenuId();
		// List<Resources> allResourcesList = resourcesService.findResources(null, sysMenuId, null, null, parentId, "ord", true);
		// List<Resources> allPermissionResourcesList = new ArrayList<Resources>();
		// for (Resources resources : allResourcesList) {
		// if (allPermissionResourcesMap.containsKey(resources.getResourcesId())) {
		// allPermissionResourcesList.add(resources);
		// }
		// }

		// 方式2
		// IResourcesService resourcesService = PureUtils.getResourcesService();
		// IResourcesTypeService resourcesTypeService = (IResourcesTypeService) SpringUtils.getBean("resourcesTypeService");
		// Long sysMenuId = resourcesTypeService.getSysMenuId();
		// IUserPermissionService userPermissionService = PureUtils.getUserPermissionService();
		// List<Resources> allPermissionResourcesList = userPermissionService.findResCascadeParents(userId, null, sysMenuId, null, "READ", parentId, userId, "ord", true);

		// 方式3 参考FrameAction
		Long sysMenuId = this.resourcesTypeService.getSysMenuId();
		List<Resources> allPermissionResourcesList = new ArrayList<Resources>();
		if (PureUtils.isAdmin(userId)) {
			allPermissionResourcesList.addAll(resourcesService.findResources(null, sysMenuId, null, null, resourceId, "ord", true));
		} else {
			List list = userPermissionService.findResCascadeParents(userId, null, sysMenuId, null, "READ", resourceId, userId, "ord", true);
			List values = processResourcesForCustomPortal(list, userId);
			allPermissionResourcesList.addAll(values);
		}

		List<Map> mapList = new ArrayList<Map>();
		Map map = null;
		if (allPermissionResourcesList.size() > 0) {
			for (Resources resource : allPermissionResourcesList) {
				map = new HashMap();
				map.put("id", resource.getResourcesId());
				map.put("text", resource.getResourcesName());
				if (resource.getUrl() != null) {
					map.put("url", resource.getUrl());
				}
				map.put("path", resource.getPath());
				map.put("children", this.getMenuList(resource.getResourcesId()));
				mapList.add(map);
			}
			return mapList;
		} else {
			return null;
		}
	}

	private List<Resources> processResourcesForCustomPortal(List<Resources> resList, Long userId) {
		List values = new ArrayList();
		if (null == resList) {
			return values;
		}
		List portalRes = new ArrayList();

		Long sysMenuId = this.resourcesTypeService.getSysMenuId();
		for (int i = 0; i < resList.size(); ++i) {
			if ((StringUtils.isNotBlank(((Resources) resList.get(i)).getFromSign())) && (((Resources) resList.get(i)).getFromSign().contains("CUSTOM_PORTAL"))) {
				portalRes.add(resList.get(i));
			} else if (sysMenuId.equals(((Resources) resList.get(i)).getResourcesType().getResourcesTypeId())) {
				values.add(resList.get(i));
			}
		}
		if (null == portalRes) {
			return values;
		}

		for (int i = 0; i < portalRes.size(); ++i) {
			if (userId.equals(((Resources) portalRes.get(i)).getCreater().getUserId())) {
				CustomPortalBasic portal = this.customPortalService.findCustomPortalBasicById(((Resources) portalRes.get(i)).getResourcesId());

				for (int j = 0; j < portalRes.size(); ++j) {
					if ((portal != null) && (((Resources) portalRes.get(j)).getResourcesId().equals(portal.getPortalParentId()))) {
						((Resources) portalRes.get(i)).setResourcesName(((Resources) portalRes.get(j)).getResourcesName());
						portalRes.remove(j);
						break;
					}
				}
			}
		}
		values.addAll(portalRes);
		return values;
	}

	private List<Map> getResourceById(String resourceId) {
		if ("".equals(resourceId) || resourceId == null) {
			IResourcesService resourcesService = PureUtils.getResourcesService();
			resourceId = resourcesService.getRootId();
		}
		Long userId = PureUtils.getUserId(ServletActionContext.getRequest());
		// 方式3 参考FrameAction
		Long sysMenuId = this.resourcesTypeService.getSysMenuId();
		List<Resources> allPermissionResourcesList = new ArrayList<Resources>();
		allPermissionResourcesList.addAll(resourcesService.findResources(null, sysMenuId, resourceId, null, null, "ord", true));

		List<Map> mapList = new ArrayList<Map>();
		Map map = null;
		if (allPermissionResourcesList.size() > 0) {
			for (Resources resource : allPermissionResourcesList) {
				map = new HashMap();
				map.put("id", resource.getResourcesId());
				map.put("text", resource.getResourcesName());
				if (resource.getUrl() != null) {
					map.put("url", resource.getUrl());
				}
				map.put("path", resource.getPath());
				map.put("children", this.getMenuList(resource.getResourcesId()));
				mapList.add(map);
			}
			return mapList;
		} else {
			return null;
		}
	}

	private Map getFristUrlResource(List<Map> menuList) {
		if (menuList == null) {
			return null;
		}
		Map map = null;
		for (Map tempMap : menuList) {
			if (tempMap.get("url") != null && !"".equals(tempMap.get("url"))) {
				map = tempMap;
				break;
			} else {
				map = getFristUrlResource((List<Map>) tempMap.get("children"));
			}
			if (map != null) {
				break;
			}
		}
		return map;
	}

	public List<Map> getMenu() {
		return menu;
	}

	public void setMenu(List<Map> menu) {
		this.menu = menu;
	}

	public Map getParam() {
		return param;
	}

	public void setParam(Map param) {
		this.param = param;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public IResourcesService getResourcesService() {
		return resourcesService;
	}

	public void setResourcesService(IResourcesService resourcesService) {
		this.resourcesService = resourcesService;
	}

	public IResourcesTypeService getResourcesTypeService() {
		return resourcesTypeService;
	}

	public void setResourcesTypeService(IResourcesTypeService resourcesTypeService) {
		this.resourcesTypeService = resourcesTypeService;
	}

	public IUserPermissionService getUserPermissionService() {
		return userPermissionService;
	}

	public void setUserPermissionService(IUserPermissionService userPermissionService) {
		this.userPermissionService = userPermissionService;
	}

	public ICustomPortalService getCustomPortalService() {
		return customPortalService;
	}

	public void setCustomPortalService(ICustomPortalService customPortalService) {
		this.customPortalService = customPortalService;
	}

}
