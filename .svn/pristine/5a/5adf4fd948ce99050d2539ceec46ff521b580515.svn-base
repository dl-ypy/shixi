<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List,net.sf.json.JsonConfig,net.sf.json.*,net.sf.json.JSONObject,net.sf.json.processors.JsonBeanProcessor,com.bonc.pure.domain.*,com.bonc.pure.PureUtils"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
<head>
<s:head />
<s:if test="null!=resourcesList">
	<s:head template="head_ext.ftl" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/struts/ext3/ux/treegrid/treegrid.css'/>" rel="stylesheet" />
	<style type="text/css">.x-treegrid-col {vertical-align: middle;}</style>
	<script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGridSorter.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGridColumnResizer.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGridNodeUI.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGridLoader.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGridColumns.js'/>"></script>
    <script type="text/javascript" src="<s:url value='/struts/ext3/ux/treegrid/TreeGrid.js'/>"></script>
	<script type="text/javascript">
	Ext.override(Ext.tree.TreeNodeUI,{onCheckChange:function(){
		if(this.checkbox){
			var checked = this.checkbox.checked;
			this.checkbox.defaultChecked = checked;
			this.node.attributes.checked = checked;
			this.fireEvent('checkchange', this.node, checked);
		}
	}});
	
	//checkbox：1.需要显示（该资源是否有该权限；）2.是否选中（该角色是否赋予了该权限）
	var getTemplate=function(optType){
		return new Ext.XTemplate('{'+optType+':this.isCheck('+optType+')}'
   			  ,{
 		         isCheck:function(v,node){
 		        	var opts=node.resOpt,nodeId=node.id;
 		        	for(var i=0;i<opts.length;i++){
 		        			if(opts[i].type==optType){
 		        				if(opts[i].isUsed==true){
 		        				   return '<input type="checkbox" name="optType" value="'+optType+'"  resid="'+nodeId+'"   checked/>';
 		        				}else{
 		        				   return '<input type="checkbox" name="optType" value="'+optType+'"  resid="'+nodeId+'" />';
 		        				}
 		        			}
 		        		}
 		        		return '<input type="checkbox" value="'+optType+'"  hidden/>';
 		         }
 	       })

	};
	
	//资源授权“全选”
	var clickAllItem=function(obj,resId){
		if (obj.checked == true){
			 jQuery('input:checkbox[resid=\''+resId+'\']').each(function(){
				 jQuery(this).attr("checked",true);
			 });
		}else {
			 jQuery('input:checkbox[resid=\''+resId+'\']').each(function(){
				 jQuery(this).attr("checked",false);
			 });
		}
	};
	
	$j(function(){
	   var roleId='${roleId}';
       var loadMask = new Ext.LoadMask(document.body, {  
           msg: "处理中"  
       }),resourcesTree = new Ext.ux.tree.TreeGrid({
           enableSort:false,
           width:570,
           height:450,
           loader: new Ext.ux.tree.TreeGridLoader({  
    		   dataUrl : 'RolePermission!getTreeData.action'
 		    }),
        <p:auth resourcesId="PURE_ROLE_PERMISSION" optType="<%=PureUtils.AUTH_AUTH%>">
           tbar:[{xtype:'label',text:'角色授权',style:'margin-left:5px;margin-right:450px'},
                 {text:'保存',iconCls: 'icon-save',handler:function(btv,event){
			        	  var newResOpt=[];//新选中的资源授权
			        	  jQuery('input:checkbox[name=optType]').each(function(){
			        		  if(this.checked){
			        			 var resId=jQuery(this).attr('resid'),optType=jQuery(this).attr('value');
			        		    var data={resourcesId:resId,optType:optType};
			        		    newResOpt.push(data);
			        		  }
			        	   });
			               loadMask.show();
			               //页面展示的可供操作的资源id
			               var resourcesIds=[];
			               if(null!=resourcesTree){
			            	   resourcesTree.root.cascade(function(){
			     	            	resourcesIds.push(this.id);
			     	    		});
			               }
			           	Ext.Ajax.request({
			     			   url: 'RolePermission!doUpdate.action',
			     			   method:'post',
			     				params : {'roleId':roleId,'resourcesData': Ext.encode(newResOpt),'resourcesIds':resourcesIds},
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
           		}}],
        </p:auth>
           columns:  [{header:'模块名称',width:200,dataIndex:'text'},
   	              	 {header:'全选',width:60,dataIndex:'all',
							tpl:new Ext.XTemplate('{all:this.isCheck("all")}'           
   			   						,{
	                      				isCheck:function(v,node){
	                    	  				return '<input type="checkbox" value="all" onclick="clickAllItem(this,\''+node.id+'\');"/>';
	                      			}
							})
             		}
		           <s:iterator value="operationTypeList">
				 	,{header:'${optTypeName}',width:60,dataIndex:'${optType}',tpl:getTemplate('${optType}')}
					</s:iterator> 
           ],
           listeners:{
	        	 'beforeload':function(node){
	        		 this.loader.baseParams.rootId=node.id; //点一个节点出来它的子节点来实现异步加载
	        		 this.loader.baseParams.roleId=roleId;
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
         resourcesTree.render(Ext.getBody());
         resourcesTree.expand(false,false);
	});
	
	</script>
</s:if>
</head>
<body>
<s:if test="null==resourcesList||resourcesList.size()==0">您没有权限</s:if>
</body>
</html>