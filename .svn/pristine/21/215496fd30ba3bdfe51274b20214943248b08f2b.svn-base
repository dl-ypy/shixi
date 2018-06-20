<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@	page import="java.util.*"%>
<%@	page import="com.bonc.pure.domain.Message"%>
<%@	page import="java.text.SimpleDateFormat"%>

	 <%List<Message> data=(List<Message>)request.getAttribute("data"); 
	  long userId=Long.parseLong(request.getAttribute("userId").toString());
	  SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  long secondGap=0;
	  boolean startFlag=true;
	  String timeFlag="";
	  String newMsgContent="";
	  for(Message msg:data){
		 String createTime=df.format(msg.getCreateTime());
 		 if(userId==msg.getFromAddrId()){
		 if(startFlag){
			 timeFlag=createTime;
			 startFlag=false;
		 %>
		 <div class="msg-time">
		    <%=createTime%>
		 </div>
		 <%}else{
			 secondGap=(df.parse(createTime).getTime()-df.parse(timeFlag).getTime())/1000;
 			 if(secondGap>=180){
				timeFlag=createTime; %>
			 <div class="msg-time">
		    <%=createTime%>
		    </div>	
			 <%}%>
		 
		 <% }  if(null!=msg.getMsgContent()){
    	   newMsgContent= msg.getMsgContent().replaceAll("\\n","<br/>");
         }%>
     <div style="width:290px;float:right;">  
		 <div class="msg-trans"> 
	 		 <%=newMsgContent %>
	 	 </div>
 	 </div>
	 <%} else{
		 if(startFlag){
 			 timeFlag=createTime;
			 startFlag=false;
		 %>
		 <div class="msg-time">
		    <%=createTime %>
		 </div>
		 <%}else{
			 secondGap=(df.parse(createTime).getTime()-df.parse(timeFlag).getTime())/1000;
 			if(secondGap>=180){
				timeFlag=createTime; %>
			 <div class="msg-time">
		    <%=createTime%>
		    </div>	
			 <%}%>
		 
		 <% }   if(null!=msg.getMsgContent()){
    	   newMsgContent= msg.getMsgContent().replaceAll("\\n","<br/>");
         }%>
     <div style="width:290px;float:left;">   
		 <div class="msg-receipt"> 
	 		 <%=newMsgContent %>
	 	 </div>
 	 </div>
	 <%} } %>
	
 