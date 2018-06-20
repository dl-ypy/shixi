package com.bonc.pure.struts2;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.bonc.pure.PermissionTreeUtils;
import com.bonc.pure.PureUtils;
import com.bonc.pure.domain.CustomPortalBasic;
import com.bonc.pure.domain.Resources;
import com.bonc.pure.service.ICustomPortalService;
import com.bonc.pure.service.IResourcesService;
import com.bonc.pure.service.IResourcesTypeService;
import com.bonc.pure.service.IUserPermissionService;
import com.bonc.pure.web.util.ResourceUrlHandlerUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Bootstrap一级菜单页面
 * 
 * @author 李志浩
 */
public class BIndexAction extends ActionSupport {
	private static final long serialVersionUID = 6515718466615705229L;
	private Resources resources;

	private IResourcesService resourcesService;
	private IResourcesTypeService resourcesTypeService;
	private IUserPermissionService userPermissionService;
	private ICustomPortalService customPortalService;
	private boolean mini = false;

	public String execute() {
		resources = getPureResources();
		if (mini) {
			return "mini";
		} else {
			if (resources != null && resources.getChildren() != null && resources.getChildren().size() == 1) {
				try {
					ServletActionContext.getResponse().sendRedirect(ResourceUrlHandlerUtil.getResourceUrl(resources.getChildren().get(0)));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			ServletActionContext.getRequest().setAttribute("epmFramePureUser", PureUtils.getUser());
			return "success";
		}
	}

	private Resources getPureResources() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		// Resources resourcesTemp = (Resources) session.getAttribute("pureResources");
		// if (resourcesTemp == null) {

		Resources resourcesTemp = null;
		Long userId = PureUtils.getUserId(ServletActionContext.getRequest());

		// 方式1: 手工过滤所有有权限的权限
		// Map<String, Resources> allPermissionResourcesMap = new HashMap<String, Resources>();
		//
		// // 全部角色权限菜单
		// IRolePermissionService rolePermissionService = PureUtils.getRolePermissionService();
		// List<RolePermission> rolePermissionList = rolePermissionService.findOptByUserId(userId, null, "READ", null);
		// for (RolePermission rolePermission : rolePermissionList) {
		// Resources tempRes = rolePermission.getResources();
		// if (!allPermissionResourcesMap.containsKey(tempRes.getResourcesId())) {
		// allPermissionResourcesMap.put(tempRes.getResourcesId(), tempRes);
		// }
		// }
		// // 全部用户权限菜单
		// IUserPermissionService userPermissionService = PureUtils.getUserPermissionService();
		// List<UserPermission> userPermissionList = userPermissionService.findOptByUserId(userId, null, "READ", null);
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
		// List<Resources> allResourcesList = resourcesService.findResources(null, sysMenuId, null, null, null, "ord", true);
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
		// List<Resources> allPermissionResourcesList = userPermissionService.findResCascadeParents(userId, null, sysMenuId, null, "READ", null, userId, "ord", true);

		// 方式3 参考FrameAction
		Long sysMenuId = this.resourcesTypeService.getSysMenuId();
		List<Resources> allPermissionResourcesList = new ArrayList<Resources>();
		if (PureUtils.isAdmin(userId)) {
			allPermissionResourcesList.addAll(resourcesService.findResources(null, sysMenuId, null, null, null, "ord", true));
		} else {
			List list = userPermissionService.findResCascadeParents(userId, null, sysMenuId, null, "READ", null, userId, "ord", true);
			List values = processResourcesForCustomPortal(list, userId);
			allPermissionResourcesList.addAll(values);
		}

		resourcesTemp = PermissionTreeUtils.treeDataResources(userId, allPermissionResourcesList, resourcesService.getRootId());
		session.setAttribute("pureResources", resourcesTemp);
		return resourcesTemp;
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

	public Resources getResources() {
		return resources;
	}

	public void setResources(Resources resources) {
		this.resources = resources;
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

	public boolean isMini() {
		return mini;
	}

	public void setMini(boolean mini) {
		this.mini = mini;
	}

}
