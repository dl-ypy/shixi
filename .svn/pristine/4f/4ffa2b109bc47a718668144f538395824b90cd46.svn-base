package com.bonc.pure.web.util;

import java.net.URLEncoder;

import org.apache.struts2.ServletActionContext;

import com.bonc.pure.PureUtils;
import com.bonc.pure.domain.Resources;

public class ResourceUrlHandlerUtil {

	public static String getResourceUrl(Resources resources) {
		return ValueUtils.isNotEmpty(resources.getUrl()) ? getOrganizdUrl(resources) : getChildUrl(resources);
	}

	private static String getChildUrl(Resources resources) {

		String destUrl = "";
		if (resources.getChildren() != null && resources.getChildren().size() > 0) {
			for (Resources res : resources.getChildren()) {
				if (ValueUtils.isNotEmpty(res.getUrl())) {
					destUrl = getOrganizdUrl(res);
					break;
				} else {
					destUrl = getChildUrl(res);
				}
			}
		}

		return destUrl;
	}

	private static String getOrganizdUrl(Resources res) {
		String url = res.getUrl();
		StringBuffer surl = new StringBuffer();
		if (url != null && !"".equals(url)) {
			url = PureUtils.getFullUrl(res.getAppSystem(), res.getUrl(), ServletActionContext.getRequest().getContextPath());
			surl.append(url);
			// surl.append(url.indexOf('?')==-1?"?":"&");
			// surl.append("__PID=").append(res.getResourcesId());
			if (url.startsWith("http")) {
				if (res.getExt4() != null && !"".equals(res.getExt4())) {
					surl = new StringBuffer(URLEncoder.encode(surl.toString()));
					surl.insert(0, ServletActionContext.getRequest().getContextPath() + "/classical?url=");
				} else {
					surl.insert(0, ServletActionContext.getRequest().getContextPath() + "/pure/proxy/Dispatch.action?url=");
				}
			}
		}
		return surl.toString();
	}
}
