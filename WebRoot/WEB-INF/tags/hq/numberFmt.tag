
<%@tag import="java.math.RoundingMode"%>
<%@tag import="java.text.DecimalFormat"%>
<%@ tag body-content="empty"  pageEncoding="UTF-8"  description="数字格式化"%>

<%@ attribute name="value" required="true"  rtexprvalue="true"  description="要格式化的数据"%>
<%@ attribute name="fmt" required="true"  rtexprvalue="true" description="数据格式化字符串"%>
<%@ attribute name="colorable" required="false"  rtexprvalue="true" description="是否启用颜色"%>
<%@ attribute name="extendVal" required="false"  rtexprvalue="true" description="额外值"%>
<%@ attribute name="ignoreVal" required="false"  rtexprvalue="true" description="忽略的值,即当被格式化的数字的绝对值>=指定值；那么就会被转换成--"%>
<%
	if(extendVal==null){
		extendVal="";
	}
	if(value==null||value.length()<1){
		out.print("--");
	}else{
		try{
			double d=Double.parseDouble(value);
			boolean ignore=false;
			if(ignoreVal!=null&&ignoreVal.length()>0){
				double ig=Double.parseDouble(ignoreVal);
				if(Math.abs(d)>=Math.abs(ig)){
					ignore=true;
				}
			}
			if(ignore==true){
				out.print("--");
			}else{
				fmt=fmt==null||fmt.length()<1?"#,##0.00":fmt;
				DecimalFormat sdf=new DecimalFormat(fmt);
				sdf.setRoundingMode(RoundingMode.HALF_UP);
				String val=sdf.format(d);
				if("true".equals(colorable)){
					if(d<0){
						out.print("<span class='datared'>"+(val+extendVal)+"</span>");
					}else{
						out.print("<span class='datagreen'>"+(val+extendVal)+"</span>");
					}
				}else{
					out.print(val+extendVal);
				}
			}
		}catch(Exception e){}
	}
%>