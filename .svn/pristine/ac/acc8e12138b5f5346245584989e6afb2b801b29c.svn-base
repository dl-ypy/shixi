package com.bonc.pure.web.action.custom.tag;

import java.math.BigDecimal;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;

import com.bonc.pure.web.action.custom.tag.tagUtils.TagUtils;

public class KpiTreeTag extends TagSupport {
	private Object data;//数据
	private int step=30;//缩进步长
	//private final static int SPACE_STEP=29;//其中:的px
	private final static Pattern pattern=Pattern.compile("[0-9]*");
	
	private boolean normal=true;//true:父结点都有+-表示,false:只有特殊标识的父结点才有
	private String onclick;//单击事件
	private String ondblclick;//双击事件
	private String params;//<a params="xx"></a>,对应超链接A的params属性
	private String aClass;//超链接的样式
	private String nodeClass;//指标树展开、关闭样式[暂未使用]
	private String title;
	@Override
	public int doEndTag() throws JspException {
		StringBuffer sb=new StringBuffer();
		Map d=null;
		if(data instanceof Map){
			d=(Map)data;
		}
		if(d!=null){
			int lvl=0;
			try{
			 lvl=((BigDecimal)d.get("lvl")).intValue();
			}catch (Exception e)
			{
			   //e.printStackTrace();
			   lvl= Integer.parseInt((d.get("lvl")+""));
			}
			String spacePath= (String)d.get("spacePath");

			int indentNum=0;
			//根据路径分隔
			if(spacePath != null && spacePath.length() > 0) {
				String[] indentArr = spacePath.split("/");
				for(int i=0; i<indentArr.length; i++){
					String indentStr = indentArr[i];
					//缩进为数字时，累加
					if(!StringUtils.isEmpty(indentStr) && pattern.matcher(indentStr).matches()){
						indentNum += Integer.parseInt(indentStr);
					}
				}
			}
			if("1".equals(String.valueOf(d.get("childs")))&&lvl!=1){
				if(normal){
					indentNum-=13;
				}else{
					if("1".equals(String.valueOf(d.get("isExtended")))){
						if("1".equals(String.valueOf(d.get("isExtend")))){
							indentNum-=13;
						}else{
							indentNum-=13;
						}
					}
				}
			}
			sb.append("<span style='display:inline-block;width:");
			sb.append((lvl-1)*(step!=0?step:30) + indentNum);
			sb.append("px;'></span>");

			if("1".equals(String.valueOf(d.get("childs")))){
				if(normal){
					sb.append("<span class='kpi-dir kpi-dir-open'></span>");
				}else{//是否显示加减号
					if("1".equals(String.valueOf(d.get("isExtended")))){
						//是否展开
						if("1".equals(String.valueOf(d.get("isExtend")))){
							sb.append("<span class='kpi-dir kpi-dir-open' opened='1'></span>");
						}else{
							sb.append("<span class='kpi-dir kpi-dir-open'></span>");
						}
					}
				}
			}
			if((onclick!=null&&onclick.length()>0)||(ondblclick!=null&&ondblclick.length()>0))
			{
				sb.append("<a title='"+(title!=null?title:"")+"' class='"+aClass+"' href='javascript:;' ");
				if(onclick!=null&&onclick.length()>0){
					sb.append(" onclick=\""+onclick+"\"");
				}
				if(ondblclick!=null&&ondblclick.length()>0){
					sb.append(" ondblclick=\""+ondblclick+"\"");
				}
				sb.append(" params='"+params+"'>"+d.get("kpiName")+"</a>");
			}else
			{
				sb.append(d.get("kpiName"));
			}
		}
		TagUtils.print(this.pageContext,sb);
		destroy();
		return 6;
	}
	public void destroy(){
		this.data=null;
		this.normal=true;
		this.step=30;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public boolean isNormal() {
		return normal;
	}
	public void setNormal(boolean normal) {
		this.normal = normal;
	}
	public String getOnclick() {
		return onclick;
	}
	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}
	public String getOndblclick() {
		return ondblclick;
	}
	public void setOndblclick(String ondblclick) {
		this.ondblclick = ondblclick;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	public String getaClass() {
		return aClass;
	}
	public void setaClass(String aClass) {
		this.aClass = aClass;
	}
	public String getNodeClass() {
		return nodeClass;
	}
	public void setNodeClass(String nodeClass) {
		this.nodeClass = nodeClass;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
