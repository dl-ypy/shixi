<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@	page import="java.util.*"%>
<%@	page import="com.bonc.pure.domain.Message"%>
<%@	page import="java.text.SimpleDateFormat"%>

	<%  List<Message> data=(List<Message>)request.getAttribute("data");
		String nearestTime=request.getAttribute("nearestTime").toString();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currTime;
		long secondGap=0;
		String newMsgContent="";
		for(Message msg:data){ 
			currTime=df.format(msg.getCreateTime());
			if(!"".equals(nearestTime)){
			    secondGap=(df.parse(currTime).getTime()-df.parse(nearestTime).getTime())/1000;
			}
			if("".equals(nearestTime)||secondGap>=180){
				nearestTime=currTime;
		%>
		<div timeId="flag" val="<%=currTime%>" class="msg-time" >
		<%=currTime%>
		</div>
		<%} 
	         if(null!=msg.getMsgContent()){
	        	newMsgContent= msg.getMsgContent().replaceAll("\\n","<br/>");
	         }	 
		%>
		<div style="width:290px;float:left;"> 
			<div time="<%=currTime %>" class="msg-receipt">
	 		    <%=newMsgContent%>
	  		</div>
  		</div>
	<%} %>
	