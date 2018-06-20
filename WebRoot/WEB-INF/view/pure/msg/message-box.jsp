<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@	page import="com.bonc.pure.SystemConfigProperty"%>
 
<style>		 
	.jframe{
	 
	}
	.user{
	 	float:left;
		width:100%;
		border-right:1px solid whitesmoke;
		height:460px;
	}
	.tip-down{
		height:24px;
		border:1px solid #E2E3EA;
		border-width:1px 0;
		padding-top:8px;
		padding-left:10px;
		position:relative;
		width:97%;
	}
	.msg-body{
		overflow-x:hidden;
		overflow-y:visible;
		padding:3px 10px;
		width:440px;
  	}
 	.message-send{
	 	width:453px;
	 	height:50px;
	   	overflow-y:auto;
    }
	.addr-book{
		margin-top:10px;
		font-weight:bold;
	}
	.msg{
	 	float:left;
		width:100%;
		overflow-x:hidden;
		overflow-y:hidden;
  	}
 	.msg-time{
	 	width:200px;
	 	margin:0 auto;
	 	text-align:center;
	 	clear:both;
 	}
 	.msg-receipt,.msg-trans{
 	 	max-width:290px;
 	 	margin-top:5px;
 	 	margin-bottom:5px;
	 	text-align:left;
 	 	word-break:break-all;
  	 	background-color:#E6E6E6;
 	 	border:1px solid #C7E2F1;
 	 	padding:3px 5px;
 	
  	}
  	.msg-trans{
  		float:right;
  	}
  	.msg-receipt{
	  	float:left;
  	}
	.search{
		border: 1px solid whitesmoke;
		color:#999999;
		width:120px;
		height:18px;
 	  }
 	div.union-search{
 		background-color: #FFFFFF;
 		border:1px solid #EEEEEE;
 		width:140px;
 		margin:8px 0 0 3px;
 	}
 	div.union-search input{
 	  border-width:0px;
 	  background-color: #FFFFFF;
 	}
 	.input{
		background: none repeat scroll 0 0 #FFFFFF;
		background: url(../struts/pure/msg/imgs/text-bg.gif) repeat-x scroll 0 0 white;
	    border: 1px solid #B5B8C8;
	    padding: 1px 3px;
	}
	
 	.diselected{
	 	text-decoration:none;
	 	padding-left:3px;
	 	cursor:pointer;
 	}
 	.addr-list{
	 	margin-top:5px;
	 	padding-left:6px;
	  	height:350px;
	 	overflow-y:auto;
 	}
 	table.tableAddr tbody tr{
 		line-height:18px;
 	}
 	table.tableAddr tbody tr td{
	 	cursor:pointer;
	 	padding:3px 5px;
  	}
  	table.tableAddr tbody tr td div.msg-headon{
  	  background:url(../struts/pure/msg/imgs/msg-headon.gif) no-repeat left center;
  	  padding-left:25px;
  	}
  	table.tableAddr tbody tr td div.msg-headoff{
  	  background:url(../struts/pure/msg/imgs/msg-headoff.gif) no-repeat left center;
  	  padding-left:25px;
  	}
  	
  	table.info tr td{
  	   padding:5px;
  	   text-align:left;
  	} 
  	table.info{
  	   border-collapse: collapse;
  	   border:1px solid whitesmoke;
  	   border-width:1px 0;
  	   width:290px;
  	}
  	.botton{
	    text-align:center;
		padding:35px 0 25px;
		font-size:12px;
	}
	.botton a{
		background:url(../struts/pure/msg/imgs/pages.gif) no-repeat;
		padding-left:10px;
		display:inline-block;
		margin:0 3px;color:#333;
		text-decoration:none;
	}  
 	.botton a span{
	   height:20px;
  	   line-height:20px;
  	   display:inline-block;
  	   padding:2px 9px 0 0;
  	   background:url(../struts/pure/msg/imgs/pages.gif) no-repeat 100% 0;
  	   cursor:pointer;
	}
	.botton a:hover {
       background:url(../struts/pure/msg/imgs/pages.gif) no-repeat 0 -28px;
       text-decoration:none;
	 }
	 .botton a:hover span{background:url(../struts/pure/msg/imgs/pages.gif) no-repeat 100% -28px;
	   color:#fff;
	 }
	
	.botton a:link,a:visited{color:#333}
	.botton	.navigation-seleced-item{
	   display:inline-block;
	   font-weight:700;
	   color:red;
	   padding:3px 10px;
	}
	div.over-text-omit{
	 	overflow:hidden;/*超出部分隐藏*/
	    white-space:nowrap;
	    text-overflow:ellipsis;                    /*适用IE*/
	    -o-text-overflow:ellipsis;                 /*适用opera*/
	 	cursor:pointer;
	 	width:80px;
	}
	 div.scrollClass {
		scrollbar-arrow-color: #C13536; /*图6,三角箭头的颜色*/
		scrollbar-face-color: #F1F2F4; /*图5,立体滚动条的颜色*/
		scrollbar-3dlight-color: #F1F2F4; /*图1,立体滚动条亮边的颜色*/
		scrollbar-highlight-color: #F1F2F4; /*图2,滚动条空白部分的颜色*/
		scrollbar-shadow-color: #F1F2F4; /*图3,立体滚动条阴影的颜色*/
		scrollbar-darkshadow-color: #F1F2F4; /*图4,立体滚动条强阴影的颜色*/
		scrollbar-track-color: white; /*图7,立体滚动条背景颜色*/
		scrollbar-base-color:white; /*滚动条的基本颜色*/
		
	}
	#usersFoot div span{
		padding:0 4px;
		background:no-repeat 0 0;
	}
 </style>
	<div class="jframe" >
	 <table >
	 <tr>
	 <td style="width:24%;">
 		<div id='user' class="user">
			<div class="union-search">
				<input type="text" id="user-words"   style="width:100px;height:16px;vertical-align:middle;" onkeydown="doSeaPerson();" />
	 			<img src="../struts/pure/msg/imgs/icon_head_search.png" title="搜索" onclick="seaPerson();" style="margin: 1px 0 0 5px;cursor:pointer;vertical-align:middle;" />
			</div>
		<div class="addr-book">
		<a id="addrBook" selectedFlag="false" class="diselected" style="margin-left:2px;" onclick="doListBook();">联系人<span id="on-off" style="display:inline-block;width:52px;"></span></a>
		<a id="allUsers" selectedFlag="false" class="diselected" style="margin-left:18px;" onclick="doAddBook();">添加</a>
		</div>
			 <div pageFlag="address" id="addr-list" class="addr-list scrollClass">
			 
			 </div>
			 <div id="usersFoot" style="display:none;">	
 				<div style="width:130px;font-size:9pt;margin:10px 0 0 5px;border-bottom:1px solid whitesmoke;">
  				  
	  				     <span  onclick="pageTurn(currentPageNum,usersPageCount,dataUserUrl,'addr-list','currentPage','first',keyword);" 
					    	 style="cursor:pointer;background-image:url(../struts/pure/css/images/pagi/page-first.gif)"  >
					     &nbsp;
					     </span>
				     
					     <span  onclick="pageTurn(currentPageNum,usersPageCount,dataUserUrl,'addr-list','currentPage','up',keyword);" 
					     style="cursor:pointer;background-image:url(../struts/pure/css/images/pagi/page-prev.gif)" >
					     &nbsp;
					     </span>
				   
				        <span style="cursor:pointer;" >
				     	 <input id="currentPage" style="line-height:10px;width:10px;height:10px;"  type="text" />
				     	  /<span id="totalPageNum"></span>页 
				     	</span>
				     
	 				     <span  onclick="pageTurn(currentPageNum,usersPageCount,dataUserUrl,'addr-list','currentPage','down',keyword);" 
					      style="cursor:pointer;background-image:url(../struts/pure/css/images/pagi/page-next.gif);" >
					        &nbsp;
					     </span>
				    
					     <span  onclick="pageTurn(currentPageNum,usersPageCount,dataUserUrl,'addr-list','currentPage','last',keyword);" 
					     style="cursor:pointer;background-image:url(../struts/pure/css/images/pagi/page-last.gif)" > 
					      &nbsp; 
					     </span>
				    
   				 </div>
 		    </div> 
		</div>
		</td>
		<td>
		<div id="msg" class="msg">
		<div>
			<div id="tip-down" class="tip-down"  >
			  <span style="display:none;"></span>
			   <a onclick="txtDown();" style="display:none;text-decoration:none;position:absolute;left:400px;">文本下载</a>
			</div>
			<div id="msg-frame" style="height:320px;overflow-y:auto;width:480px;margin:1px;" class="scrollClass">
				<div id="msg-body" class="msg-body"></div>
		   </div>
		</div>
		<div id="msg-foot" >
		  <div id="msg-senddiv" style="height:60px;" >
			<textarea id="message-send" class="message-send input"  ></textarea>
		  </div> 
		  <div style="margin:3px;">	
 	 		<span>
 	 			<a onclick="msgseaStyle(this);" style="vertical-align:middle;cursor:pointer;border:1px solid #FCF9E7;padding:2px 5px;background-color:#FDFBD2;" onmouseover="jQuery(this).css('border','1px solid #79786F');"
 	 		    onmouseout="jQuery(this).css('border','1px solid #FCF9E7');">查找消息</a>  
 	 		</span>  
  	 		<span id="msglog-sea" style="width:200px;">
 	 			<input type="text" id="log-words" class="search input " style="vertical-align:middle;" />  
 	 			<img onclick="msgseaLog();" style="cursor:pointer;vertical-align:middle;" src="../struts/pure/msg/imgs/sea-flag.gif" /> 
 	 		</span> 
 	 		<span class="botton" id="btn-receive" style="margin-left:60%;_margin-left:280px;" >
					<a  href="javascript:void(0);" onclick="receiveOneMsg();">
						<span style="line-height:21px;" >收取</span>
					</a>
			</span>
  			<span class="botton" id="btn-send" >
					<a  href="javascript:void(0);" onclick="sendMsg();">
						<span style="line-height:21px;" >发送</span>
					</a>
			</span>
 		  </div> 	
		</div>
		</div>
		</td>
		</tr>
		</table>
	</div>
	 <script type="text/javascript">  
     var currentPageNum;                                                                                         //默认用户列表的当前页
     var usersPageCount;                                                                                         //默认用户列表的总页数
	 var dataUserUrl=Bonc.toFullPath('/pure/message/messageusers');                                              //默认用户列表的请求url
     var msgbodyStyle="chat-model";                                                                              //消息窗口模式 chat-model:聊天模式；log-model:查询聊天记录模式。
     var keyword=jQuery("#user-words").val();                                                                    //联系人、用户输入框查询关键词
     var currId=null;                                                                                            //当前通话联系人Id
     var currName=null;  
     //当前通话联系人姓名
      /**
      *ajax请求数据
      *@param reqType
      *           请求类型get或post
      *@param cacheWay
      *           缓存方式
      *@param asyncWay
      *           同步或者异步
      *@param dataUrl
      *           请求url
      *@param param
      *           请求参数
      *@param callbackFunc
      *           请求成功回调函数
      */
     var _ajaxRequest=function(reqType,cacheWay,asyncWay,dataUrl,param,callback){
         jQuery.ajax({
              type:reqType,
              url:dataUrl,
              data:param,
              cache:cacheWay,
              async:asyncWay,
              success:callback
         });
     };
     /**
      *选中某个联系人时初始化消息体
      */
     var msgRender=function(){
    	 var callbackFunc=function(data){
             jQuery('#msg-body').empty().html(data);
             if(jQuery("#msg-body").children().length>0){
		         jQuery("#tip-down > span").css("display","inline");
		         jQuery("#tip-down > a").css("display","inline");
		         var totalRecord=jQuery(".msg-trans").length+jQuery(".msg-receipt").length;
		         jQuery("#tip-down > span").text(currName+"(共"+totalRecord+"条)");
		     }
    	    else{
		         jQuery("#tip-down > span").css("display","inline");
     		     jQuery("#tip-down > span").text("尚无消息记录。");
     		     jQuery("#tip-down > a").css("display","none");
    	    }
          };
         _ajaxRequest("get",false,false,Bonc.toFullPath("/pure/message/messagelog"),{"currId":currId,"keyWord":""},callbackFunc);
	 	 	
     };
     /**
      *查找联系人(响应输入框的onkeydown事件)
      */
	 var doSeaPerson=function(){
		 var event=arguments.callee.caller.arguments[0]||window.event;      //消除浏览器差异  
			if(event.keyCode == 13){
				seaPerson();
				}
	 };
     /**
      *查找联系人(响应搜索图片的onclick事件)
      */
	 var seaPerson=function(){
		 keyword=jQuery("#user-words").val();
		 if(keyword==null||keyword==""){
			 jQuery.jBox.tip('请输入用户ID、名称、手机号或者邮箱！', '提示');  
			 return;
		 }
		 dataUserUrl=Bonc.toFullPath("/pure/message/messageseaUsers");   
		 var trs=jQuery("#addr-list table tbody tr");
         if(jQuery("#addr-list").attr("pageFlag")=="address"){
             var tr,td,_objId,_objName,_objMobile,_objEmail;
             var num=0;
           for(var k=0;k<trs.length;k++){
               tr=trs.get(k);
               td=jQuery(tr).children();
               _objId=jQuery(td).attr("_objId");
               _objName=jQuery(td).attr("_objName");
               _objMobile=jQuery(td).attr("_objMobile");
               _objEmail=jQuery(td).attr("_objEmail");
               if(_objId.indexOf(keyword)>-1||_objName.indexOf(keyword)>-1||_objMobile.indexOf(keyword)>-1
                       ||_objEmail.indexOf(keyword)>-1){
                      jQuery(tr).css({"display":"block","color":"gray","font-weight":"bold"});
                      num++;
               }
               else{
          	       jQuery(tr).css("display","none");
               }
          }
          if(num==0){
         	 jQuery.jBox.tip('没有符合查找条件的联系人！', '提示'); 
          }
         }else{
        	/*  var callbackFunc=function(data){
            	 jQuery('#addr-list').empty();
                 jQuery('#addr-list').html(data);
          		};
       	  _ajaxRequest("post",false,true,Bonc.toFullPath("/pure/message/messageusers"),{"keyWord":keyword},callbackFunc);
   */      doAddBook();
   }
	 };
	 /**
	  *加载联系人列表数据
	  */	 
	 var doListBook=function(){
    	  jQuery("#addrBook").css("color","#FF0000").attr("selectedFlag","true");
	      jQuery("#allUsers").css("color","#444444").attr("selectedFlag","false");
	      jQuery('#addr-list').empty().html("正在加载..").attr("pageFlag","address");
          jQuery("#usersFoot").css("display","none");
	      jQuery("#msg").css("display","block");
          jQuery("#user-words").val("");
         
	      var callbackFunc=function(data){
        	jQuery('#addr-list').html(data);
        	if(currId!=null){
   	        	var src=jQuery("#addr-list table tbody tr td[_objId='"+currId+"']");
   	            jQuery(src).css("color","#5490FF").css("font-weight","bold").attr("flag","true");
        	}
          };
         
          _ajaxRequest("post",false,true,Bonc.toFullPath("/pure/message/messageaddress"),{},callbackFunc);
     };

     /**
	  *加载用户列表数据
	  */	
	  var doAddBook=function(){ 
		   jQuery('#addr-list').empty().html("正在加载..");
		   jQuery("#addrBook").css("color","#444444").attr("selectedFlag","false");
		   jQuery("#allUsers").css("color","#FF0000").attr("selectedFlag","true");
 		   jQuery("#addr-list").attr("pageFlag","users");
   		   jQuery("#usersFoot").css("display","block");
    	   keyword=jQuery("#user-words").val();
      	   var callbackFunc=function(data){
     		   jQuery('#addr-list').html(data);
    	   };
    	   _ajaxRequest("post",false,true,Bonc.toFullPath("/pure/message/messageusers"),{keyWord:keyword},callbackFunc);

	  };
	  /**
	   *用户选中或取消选中
	   */
	  var selectedOnOff=function(src){
	      if(jQuery(src).attr("flag")=="false"){
	         jQuery(src).css("color","#5490FF").css("font-weight","bold").attr("flag","true");
  	      }else  {
	    	 jQuery(src).css("color","#444444").css("font-weight","normal").attr("flag","false");
  	      }
		};
	  /**
	   *联系人选中或取消选中
	   */
	  var currAutoGetId=null;
	  var selectedOnOffAddr=function(src){
		  jQuery("#log-words").val("");
 		  if(jQuery(src).attr("_objMsg")=="hasMsg"){
             var txt=jQuery(src).children("div").text().split("(");
             jQuery(src).children("div").text(txt[0]);
		  }
 		        
 		         if(currId!=null){
                     jQuery("#addr-list table tbody tr td[_objId='"+currId+"']").attr("flag","false").css("color","#444444").css("font-weight","normal"); 
                      jQuery("#msg-body").empty();
 			     }
 		        jQuery(src).css("color","#5490FF").css("font-weight","bold").attr("flag","true");
 		        currId=jQuery(src).attr("_objId");
 		        currName=jQuery(src).attr("_objName");
		        msgRender();
		        
 		      if(<%=SystemConfigProperty.IS_MSG_CHAT_MODE%>){
 		    	  if(currAutoGetId){//clear 
 		    		 window.clearInterval(currAutoGetId);
 		    	  }
 		    	 currAutoGetId=setInterval(msgRefresh,<%=SystemConfigProperty.MSG_INTERVAL_SEC%>);
		       }
	 	 
	   };
	 
 	  /**
	   * 向联系人发送消息(响应消息文本框的ctrl+enter)
	   */
      var doSendMsg=function(event){
      	  var event=event||arguments.callee.caller.arguments[0]||window.event;      //消除浏览器差异  
    	  var maySend=event.ctrlKey&&(event.keyCode==13||event.keyCode==10);
      	  if(maySend){
    		  sendMsg();
    	  }
      };
	  /**
	   * 向联系人发送消息(响应发送按钮的onclick)
	   */
	   var sendMsg=function(){
          var msgContent=jQuery("#message-send").val();
          var nearestTime=jQuery(".msg-time:last").attr("val");
          if(nearestTime==null||nearestTime.trim()==""){
        	 nearestTime="";
          }
          if(jQuery("#message-send").val()==""){
             return;
          }
          if(currId==null){
        	 jQuery.jBox.tip('请选择联系人！', '提示');  
        	 return;
          } 
          var callbackFunc=function(data){
          	 jQuery("#msg-body").append(data);
          	 jQuery("#msg-frame").scrollTop ("1000000");
             jQuery("#message-send").val("");
             tipRecordNum();
          }
          _ajaxRequest("post",false,true,Bonc.toFullPath("/pure/message/messagesend"),{"msgContent":msgContent,"currId":currId,"nearestTime":nearestTime},callbackFunc);
 	   };
       /**
        * 收取消息（点击“收取按钮”时）
        */  
       var receiveOneMsg=function(){
           if(null==currId){
        	  jQuery.jBox.tip('请在联系人中选择消息发送方！', '提示'); 
           }
           else{
        	  msgRefresh();
           }
        };
 	  /**
  	   * 点击消息记录时样式调整
   	   */
 	   var msgseaStyle=function(src){
 	 	  if(msgbodyStyle=="chat-model"){
	 	 	  jQuery(src).text("返回");	  
	  		  jQuery("#msglog-sea").append("<input type='text' id='log-words' style='vertical-align:middle;' class='search input' onkeydown='doMsgseaLog();' />"+
	 		 		  "<img onclick='msgseaLog();' style='cursor:pointer;vertical-align:middle;' src='../struts/pure/msg/imgs/sea-flag.gif' />");
		 	  jQuery("#msg-senddiv").css("display","none");
	   		  var msgHeight=jQuery("#msg-frame").height();
	  		  jQuery("#msg-frame").css("height",msgHeight+58);
		 	  jQuery("#btn-send").css("display","none");	
		 	  jQuery("#btn-receive").css("display","none");	
	 		  msgbodyStyle="log-model";
	 		  return;
 	 	  }
 	 	  else{
	 	      jQuery(src).text("查找消息");
	 	 	  jQuery("#msglog-sea").empty();
	 		  var msgHeight=jQuery("#msg-frame").height();
	  		  jQuery("#msg-frame").css("height",msgHeight-58);
	 	 	  jQuery("#msg-senddiv").css("display","block");
	 	 	  jQuery("#btn-send").css("display","inline");	
	 	 	  jQuery("#btn-receive").css("display","inline");  	
	 	 	  msgbodyStyle="chat-model";
	 	 	  if(currId!=null){
	              msgRender();
	 	 	  }
	 	 	  return;
 	 	  }
 	   };
 	  /**
    	* 查询消息记录(响应输入框的onkeydown事件)
        */
 	   var doMsgseaLog=function(){
  		  var event=arguments.callee.caller.arguments[0]||window.event;      //消除浏览器差异  
    	  if(event.keyCode==13){
    		  msgseaLog();
    	  }
 	   }
 	  /**
   	   * 查询消息记录(响应按钮的onclick事件)
       */
 	   var msgseaLog=function(){
 	 	   if(currId==null){
 	 		  jQuery.jBox.tip('请选择一个联系人！', '提示');  
	 		  return;
 	 	   }
  	 	   var logKeyword=jQuery("#log-words").val();
 	 	   var callbackFunc=function(data){
 	 		   jQuery('#msg-body').empty();
	 	 	   if(data.trim()==""){
	 	 		   data="<div class='msg-time'>没有消息记录！</div>";
	 	 	   }
	           jQuery('#msg-body').html(data);
	           jQuery("#tip-down > span").css("display","inline");
		       jQuery("#tip-down > a").css("display","inline");
		       tipRecordNum();
 	 	   };
  	 	   _ajaxRequest("post",false,false,Bonc.toFullPath("/pure/message/messagelog"),{"currId":currId,"keyWord":logKeyword},callbackFunc);
            
  	   };
  	   /**
    	* 收取消息
    	*/
       var msgRefresh=function(){
    	   var nearestTime=jQuery(".msg-time:last").attr("val");
           if(nearestTime==null||nearestTime.trim()==""){
        	    nearestTime="";
           }
           if(currId!=null){
	             var callbackFunc=function(data){
	            	 if(null!=data&&""!=data.trim()){
	            		jQuery("#msg-body").append(data);
	            	    jQuery("#msg-frame").scrollTop ("1000000");
	            	    tipRecordNum();
	            	 }
	             };
	    	     _ajaxRequest("get",false,true,Bonc.toFullPath("/pure/message/messagereceive"),{"currId":currId,"nearestTime":nearestTime},callbackFunc);
           }
       }
       /**
        * 显示消息记录条数
        */
       var tipRecordNum=function(){
    	   var totalRecord=jQuery(".msg-trans").length+jQuery(".msg-receipt").length; 	     
 	       jQuery("#tip-down > span").text(currName+"(共"+totalRecord+"条)"); 
       };
       /**
         *下载聊天记录
         */    
        var txtDown=function(){
            var keyword;
            if(jQuery("#msglog-sea > input").length<=0){
             	keyword="";
            }
            else{
                keyword=jQuery("#log-words").val().trim();
            }
            window.location.href=Bonc.toFullPath("/pure/message/messagedown")+"?currId="+currId+"&keyWord="+keyword;
        };
       /**
         *查看资料
         */
       var viewInfo=function(node){
    	  if(!node){
    		  return;
    	  }
          var info="<table class='info'><tr><td style='width:15%;' > 编号 :</td><td>"+ node.getAttribute("_objId")+"</td></tr><tr><td>姓名:</td><td>"+
          node.getAttribute("_objName")+"</td></tr><tr><td>手机:</td><td>"+node.getAttribute("_objMobile")+
          "</td></tr><tr><td>邮箱:</td><td>"+node.getAttribute("_objEmail")+"</td></tr></table>";
          jQuery.jBox.info(info,"基本资料");
       };

       if(jQuery("#allUsers").attr("selectedFlag")=="false"){
 		  doListBook();
 	   }
 	   if(msgbodyStyle=="chat-model"){
 	      jQuery("#msglog-sea").empty();
 	   }
   	   
 	   jQuery(".jbox-button-panel button").click(function(){
   	 	  currId=null;  
  	   });
  	   jQuery(".jbox-close").click(function(){
          currId=null;
  	   });
        jQuery("#message-send").keypress(function(e){
        	
        	doSendMsg(e);
        	
        });
     
	 </script>
