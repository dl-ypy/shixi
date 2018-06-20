package com.bonc.pure.web.util;

public class WebIconUtil {
	public static String getIconHtml(String condition) {
		String[] conditions = condition.split("\\s*:\\s*");
		if (conditions.length > 1) {
			String iconSet = conditions[0];
			String icon = conditions[1];

			if (iconSet.equals("gi")) {
				return getGlyphiconsHtml(icon);
			} else if (iconSet.equals("mi")) {
				return getMaterialIconsHtml(icon);
			} else if (iconSet.equals("fa")) {
				return getFontAwesomeHtml(icon);
			} else {
				return "";
			}
		} else {
			return getGlyphiconsHtml(condition);
		}
	}

	private static String getGlyphiconsHtml(String icon) {
		return "<span class=\"epm-icon glyphicon glyphicon-" + icon + "\"></span>";
	}

	private static String getMaterialIconsHtml(String icon) {
		return "<i class=\"epm-icon material-icons\">" + icon + "</i>";
	}

	private static String getFontAwesomeHtml(String icon) {
		return "<i class=\"epm-icon fa fa-" + icon + "\"></i>";
	}
}
