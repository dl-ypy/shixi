<%@ page contentType="text/html;charset=UTF-8" language="java"  import="net.sf.json.JsonConfig,net.sf.json.*,net.sf.json.JSONObject,net.sf.json.processors.JsonBeanProcessor,net.sf.json.processors.JsonBeanProcessor,com.bonc.pure.domain.*,java.util.*"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
<head>
	<s:head />
	<s:head template="head_ext.ftl" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/struts/ext3/ux/treegrid/treegrid.css'/>" rel="stylesheet" />
	<style type="text/css">.x-treegrid-col {vertical-align: middle;}</style>
	<script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGridSorter.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGridColumnResizer.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGridNodeUI.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGridLoader.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGridColumns.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGrid.js'/>"></script>
    <style type="text/css">
    	#resources-tree{
    		position:absolute;
    		right:20px;
    		width:580px;
    		margin-left:50px;
    	}
    	#role-tree{
    		position:absolute;
    		left:20px;
    		width:370px;
    	}
    </style>
</head>
<body>
	<b:appletBox title="${user.userName}(${user.loginId})【用户授权管理】" showMM="false" />
	<div class="text-right" style="padding:5px 25px"><input type="button" value="保存" class="submit" id="save"/></div>
	<div id="role-tree" ></div>
	<div id="resources-tree"></div>
	<div class="float-clear"></div>
	
	<script type="text/javascript">
		Ext.override(Ext.tree.TreeNodeUI,{onCheckChange:function(){
			if(this.checkbox){
				var checked = this.checkbox.checked;
				this.checkbox.defaultChecked = checked;
				this.node.attributes.checked = checked;
				this.fireEvent('checkchange', this.node, checked);
			}
		}});
		Ext.override(Ext.tree.TreePanel,{
			getAllChecked:function(a, startNode){
		        var startNode = startNode || this.root;
		        var r = [];
		        var f = function(){
		        	if(this.attributes.checked==true||this.attributes.checked==false){
		            	r.push(!a ? this : (a == 'id' ? this.id : this.attributes[a]));
		        	}
		        };
		        startNode.cascade(f);
		        return r;
		    }
		});
		
		var loadMask = new Ext.LoadMask(document.body, {  
            msg: "处理中"  
        }),roleTree = null,resourcesTree=null;
		
		<s:if test="roleRoot!=null">
		var $resourcesCheckList=null;
		roleTree=new Ext.tree.TreePanel({
			title:'角色授权',
	        renderTo:'role-tree',
	        width:370,
	        useArrows:true,
	        autoScroll:true,
	        animate:true,
	        containerScroll: true,
	        rootVisible: true,
	        loader:new Ext.tree.TreeLoader(),
	        <%
            JsonConfig jsonConfig = new JsonConfig();
    		jsonConfig.registerJsonBeanProcessor(Role.class,
  				new JsonBeanProcessor() {
  					public JSONObject processBean(Object bean, JsonConfig jsonConfig) {
  						if (!(bean instanceof Role)) {
  							return new JSONObject(true);
  						}
  						Role role = (Role) bean;
  						JSONObject json = new JSONObject()
	 							.element("id", role.getRoleId())
								.element("text", role.getRoleName())
								.element("parentId", role.getParentId())
								.element("leaf", role.getChildren().size() == 0)
								.element("children", JSONSerializer.toJSON(role.getChildren(), jsonConfig).toString())
								.element("roleId", role.getRoleId())
								.element("roleName", role.getRoleName())
								.element("ord", role.getOrd())
								.element("memo", role.getMemo())
  								.element("iconCls", "node-group");
  						if (role.hasPermission()!= null && role.hasPermission() ==true && role.getChecked()!= null) {
  							json.element("checked", role.getChecked());
  						}
  						return json;
  					}
  				}
    		);
            %>
            root:new Ext.tree.AsyncTreeNode(<%=JSONSerializer.toJSON(request.getAttribute("roleRoot"), jsonConfig).toString()%>),
            listeners: {
            		checkchange :function(node,checked){
            		var roleIdList=roleTree.getChecked("id");
            		if(null==$resourcesCheckList){
            			$resourcesCheckList=$j('#resources-tree :checkbox');
            	    }
            		$resourcesCheckList.filter(':disabled:checked').prop({checked:false,disabled:false}).val(function(){return this.value&11});
            		if(roleIdList.length!=0){
            			 Ext.Ajax.request({
      					   url:Bonc.toFullPath("UserPermission!queryRolePermission.action"),
      					   params: {"checkedRoleIds":roleIdList},
      					   success: function(response){
      					        if(response&&response.responseText){
      					   		 	var objArray=Ext.decode(response.responseText).list;
      					   		 	if(objArray){
	      					   			setCheckBoxState=function(id,end,value){
	      					   			   if(value>0){	      			
		      					   		 		var domObj=document.getElementById(id+'-'+end);
		      					   		 		if(domObj){
		      					   		 			if(domObj.hidden!=true&&domObj.checked==false){
		      					   		 				domObj.checked=true;
		      					   		 				domObj.disabled=true;
		      					   		 			}
		      					   		 		    domObj.value=(domObj.value|(value==1?4:0));
		      					   		 		}
	      					   			   }
	      					   		 	};
	      					   		 	var jsonObj=null,id=null,optType=null;
	      					   		 	for(var i=0;i<objArray.length;i++){
	      					   		 		jsonObj=objArray[i];
	      					   		 		id=jsonObj.resourcesId;
	      					   		 		optType=jsonObj.optType;
	      					   		 		if(id){
	      						   		 		setCheckBoxState(id,optType,1);
	      					   		 		}
	      					   		 	}
      					   		 	}
      					   		}
      					   },
      					   failure:function(response){
      						 	Ext.Msg.alert('系统提示',Ext.decode(response.responseText).msg);
      					   }
      					});
            		}
            	}
            }
	    });
		roleTree.expandAll();
		</s:if>
		
		
		<s:if test="resourcesList!=null&&resourcesList.size>0">
		
		//checkbox：1.需要显示（该资源是否有该权限；）2.是否选中（该角色是否赋予了该权限）
			var getTemplate=function(optType){
				return new Ext.XTemplate('{'+optType+':this.isCheck('+optType+')}'
		   			  ,{
		 		         isCheck:function(v,node){
		 		        	var opts=node.resOpt,nodeId=node.id;
		 		        	for(var i=0;i<opts.length;i++){
		 		        		var auth=opts[i].auth;
		 		        		if(opts[i].type==optType){
		 		        	       var inputStr='<input type="checkbox" name="optType" opt="'+optType+'" value="'+auth+'"  id="'+nodeId+'-'+optType+'" resid="'+nodeId+'" ';
		 		        			if((auth&12)==4){
										inputStr+=' disabled ';
									}
									if((auth&12)!=0){
										inputStr+=' checked ';
									}
		 		        	       inputStr+=' />';
		 		        		   return inputStr;
		 		        		}
		 		        	 }
		 		        		return '';
		 		         }
		 	       });
			};

			
	//用户授权资源树
		 resourcesTree = new Ext.ux.tree.TreeGrid({
			 title:'用户授权',
	         enableSort:false,
	         width:570,
	         height:450,
	         loader:new Ext.ux.tree.TreeGridLoader({ dataUrl : 'UserPermission!getTreeData.action'}),
	         columns:[{header:'模块名称',width:200,dataIndex:'text'},
	                  {header:'全选',width:60,dataIndex:'all',tpl:new Ext.XTemplate('<input type="checkbox" value="all" class="checkall" allid="{id}" ')}
					<s:iterator value="operationTypeList">
						,{header:'${optTypeName}',width:60,dataIndex:'${optType}',tpl:getTemplate('${optType}')}
					</s:iterator>
				],
	         listeners:{
	        	 'beforeload':function(node){
	        		 roleTree.expandAll();
	 				var checkRoleIds=[];
	 			  //选中的角色
	 		       	if(null!=roleTree){
	 		       	   checkRoleIds=roleTree.getChecked('id');
	 	            }
	 		         this.loader.baseParams.rootId = node.id; //点一个节点出来它的子节点来实现异步加载
	 		         this.loader.baseParams.checkRoleIds = checkRoleIds;
	 		         this.loader.baseParams.userId = '${userId}';
	 	           }
	         },
	         enableHdMenu :false
	     });
	
		 var rootnode = new Ext.tree.AsyncTreeNode({
	    	   id : 'root',
	    	   draggable : false,// 根节点不容许拖动
	    	   expanded : true
	     }); 
		 resourcesTree.setRootNode(rootnode); 
		 resourcesTree.render('resources-tree');
		 resourcesTree.expand(false,false);
		 $j('#resources-tree').delegate(':checkbox[class!="checkall"]','click',function(){
	    	 if(this.checked){
	    		 this.value=this.value|8;
	    	 }else{
	    		 this.value=this.value&7;
	    		 if((this.value&4)>0){
	    			 this.disabled=true;
	    			 this.checked=true;
	    		 }
	    	 }
	     }).delegate(':checkbox[class*="checkall"]','click',function(){//全选
	    	 var obj=this,resId=obj.getAttribute("allid");
	    	 if (obj.checked == true){
				 jQuery('input:checkbox:enabled[resid=\''+resId+'\']').each(function(){
					 jQuery(this).attr("checked",true);
				 });
			}else {
				 jQuery('input:checkbox:enabled[resid=\''+resId+'\']').each(function(){
					 jQuery(this).attr("checked",false);
				 });
			}
	     });
	     </s:if>
	     
 	    
	     $j('#save').click(function(){
	    	 roleTree.expandAll();
             loadMask.show();
             var userId='${userId}';
             var params={"userId":userId};
             //用户授权选中的资源
              var resourcesData=[];
	       	  jQuery('input:enabled[name=optType]').each(function(){
	       		  if(this.checked&&!this.disabled){
	       		  	var resId=jQuery(this).attr('resid'),optType=jQuery(this).attr('opt');
	       		    var data={resourcesId:resId,optType:optType};
	       		    resourcesData.push(data);
	       		  }
	       	   });
	       	  if(null!=resourcesData){
	       		params.resourcesData=Ext.encode(resourcesData);
	       	  }
             //选中的角色
	       	if(null!=roleTree){
           		 params.checkedRoleIds=roleTree.getChecked('id');
            }
             //页面展示的可供操作的资源id
             var resourcesIds=[];
             if(null!=resourcesTree){
     	    		resourcesTree.root.cascade(function(){
     	            	resourcesIds.push(this.id);
     	    		});
     	    		params.resourcesIds=resourcesIds;
             }
	          	Ext.Ajax.request({
	    			   url: 'UserPermission!doUpdate.action',
	    			   method:'post',
	    				params : params,
	    			   success: function(req){
	    				   loadMask.hide();
	    				   var res=Ext.decode(req.responseText);
	    				   if(res.success==true){
	    					   Ext.Msg.alert('成功', '修改角色权限成功!');
	    				   }else{
	    					   Ext.Msg.alert('失败', '修改角色权限失败!');
	    				   }
	    			   },
	    			   failure: function(){
	    				 loadMask.hide();
	    				 Ext.Msg.alert('失败', '修改角色权限失败!');
	    			   }
	    			});
	     });
	     <s:elseif test="resourcesList==null">Ext.Msg.alert('授权提醒', '您没有权限可以赋予给其他用户！');</s:elseif>
	</script>
</body>
</html>