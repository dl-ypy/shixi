<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@	page import="java.util.*"%>
<%@	page import="com.bonc.pure.domain.User"%>
<%List<User> data=(List<User>)request.getAttribute("data");if(data!=null&&data.size()>0){ int i=0;%>
<table id="usersList" class="tableAddr">
	<tbody>
		<% for(User user:data){ %>
		<tr>
			<td flag="false" id="user-person<%=i++%>"
				_objId=<%=user.getUserId()%>
				_objMobile=<%=(user.getMobile()==null?"暂无":user.getMobile())%>
				_objName=<%=user.getUserName()%>
				_objEmail=<%=(user.getEmail()==null?"暂无":user.getEmail())%>
				onclick="selectedOnOff(this);">
					<div class="text-over-omit msg-headon" title="	<%=user.getUserName()%>" style="width:80px;" >
						<%=user.getUserName()%>
					</div>
				</td>
		</tr>
		<%;}} %>
	</tbody>
</table>
<script type="text/javascript">
      usersPageCount=${totalPageCount};
      currentPageNum=${currentPage};
      jQuery("#totalPageNum").html(${totalPageCount});
      jQuery("#currentPage").val(${currentPage});
      var userIds=new Array(); //选中的用户Id数组
      Ext.getDoc().on("contextmenu", function(e){
	        e.stopEvent();
	   });
      var contxtMenu=new Ext.menu.Menu({
			items:[
                {   
                         text:"查看资料",
 			             iconCls: 'icon-info',
                         handler:function(e){ 
                         viewInfo(node);
                    }
                },
                {
                         text:"加为好友",
			     		 iconCls: 'icon-add',
                         handler:function(item){
	                	     var tds=jQuery("#addr-list table tbody tr td[flag='true']");
	                	     if(tds.length<=0){
	                	    	 Ext.MessageBox.alert("提示","请至少选择一个用户！");
		                	     return;
	                	     }
	                	     var users=jQuery("#addr-list table tbody tr td[flag='true']");
	                	     var k=0;
	                	     jQuery(users).each(function(){
                                 userIds.push(jQuery(this).attr("_objId"));  
		                	 });
  	                	     var html="<div style='width:100%;' id='jTable'><table style='margin:5px auto;'><tbody>";
 	                	     var user;
	                	     for(var i=0;i<users.length;i++){
 		                	     user=users.get(i);
                                 if(i%4==0){
                                     html+="<tr><td style='width:60px;' _objId='"+jQuery(user).attr("_objId")+
                                     "'><input type='checkbox' checked=true val='true' onclick='selectedCheck(this)' />"+jQuery(user).attr("_objName")+"</td>";
                                 }else if(i%5==4){
                                     html+="<td style='width:60px;' _objId='"+jQuery(user).attr("_objId")+
                                     "'><input type='checkbox' checked=true val='true' onclick='selectedCheck(this)' />"+jQuery(user).attr("_objName")+"</td></tr>";
                                 }else{
                                     html+="<td style='width:60px;' _objId='"+jQuery(user).attr("_objId")+
                                     "'><input type='checkbox' checked=true val='true' onclick='selectedCheck(this)' />"+jQuery(user).attr("_objName")+"</td>";
                                 }
	                	     }
	                	     html+="</tbody></table></div>";
                             var submit=function(v,h,f){
                                  if(v){
                                	 
                                        addUsers(userIds);
                                   }
                             };
	                	     jQuery.jBox(html,{title:"确认选择",submit:submit,buttons: {'确定': true,'取消':false}});

                        }      
              }
          ]});
      var personNum=<%=data.size()%>;
      var node=null;
      for(var k=0;k<personNum;k++){
		  Ext.get("user-person"+k).on("contextmenu",function(e){
		  contxtMenu.showAt(e.getXY()); 
		  node=this;
 		  });
      }
     /**
      * 复选框选中或取消选中时事件
      */
      var selectedCheck=function(src){
          if(jQuery(src).attr("val")=="true"){
        	  jQuery(src).attr("val","false");
        	  elemRemove(jQuery(src).parent().attr("_objId"));
           } else{
        	  jQuery(src).attr("val","true");
        	  userIds.push(jQuery(src).parent().attr("_objId"));
           }
      };
      /**
       * 从userIds中移除指定元素
       */
      var elemRemove=function(elem){
         var k=0;
         for(;k<userIds.length;k++){
            if(userIds[k]==elem){
               break;
            }
         }
         userIds.splice(k,1);
       };
     /**
	   * 添加联系人
	   */
	  var addUsers=function(ids){
    	 if(!ids){
    		 return;
    	 }
          var callbackOutFunc=function(){
	       	  var callbackInnerFunc=function(data){
	        	     jQuery('#addr-list').empty();
					 jQuery('#addr-list').html(data);
					 jQuery.jBox.tip('成功添加好友', '提示');
					 var onNum=jQuery("#on-off").attr("onNum"),totalNum=jQuery("#on-off").attr("totalNum");
					 totalNum=parseInt(totalNum,10);
					 totalNum+=ids.length;
					 jQuery("#on-off").attr("onNum",onNum).attr("totalNum",totalNum).text("(" + onNum + "/" + totalNum + ")");
	          };
    	      _ajaxRequest("get",false,true,Bonc.toFullPath("/pure/message/messageusers"),{},callbackInnerFunc);
     	       
          };
          _ajaxRequest("get",false,true,Bonc.toFullPath("/pure/message/messageaddF"),{"IDS":ids.join(",")},callbackOutFunc);
	  };
       </script>