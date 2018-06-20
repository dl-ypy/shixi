<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@	page import="java.util.*"%>
<%@	page import="com.bonc.pure.domain.User"%> 
  <%List<User> data=(List<User>)request.getAttribute("data");if(data!=null&&data.size()>0){%>
 	  <table id="usersList" class="tableAddr"><tbody> <% for(User user:data){ %>
 	  <tr>
 	  <td style="display:none">
 	  <%=user.getUserId() %>
 	  </td>
 	  <td style="color:#5490FF;font-weight:bold;">
 	  <%=user.getUserName()%>
 	  </td></tr>
 	  <% }}%>
 	   <script type="text/javascript">
      usersPageCount=${totalPageCount};
      currentPageNum=${currentPage};
      jQuery("#totalPageNum").html(usersPageCount);
      jQuery("#currentPage").val(currentPageNum);

      </script>
	 