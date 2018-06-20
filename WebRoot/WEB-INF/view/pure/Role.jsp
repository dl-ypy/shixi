<%@ page contentType="text/html;charset=UTF-8" language="java" import="net.sf.json.JsonConfig,net.sf.json.*,net.sf.json.JSONObject,net.sf.json.processors.JsonBeanProcessor,com.bonc.pure.domain.Role,com.bonc.pure.PureUtils"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
<head>
<s:head />
</head>
<body>
	<b:appletBox title="角色管理" id="pageTitle" showMM="false" />
	<s:if test="null==root">您没有任何角色可以管理</s:if>
	<s:else>
		<s:head template="head_ext.ftl" />
		<script type="text/javascript" src="<s:url value='/struts/ext3/ux/Spinner.js'/>"></script>
		<script type="text/javascript" src="<s:url value='/struts/ext3/ux/SpinnerField.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<s:url value='/struts/ext3/ux/css/Spinner.css'/>" />
		<div id="tree" style="width: 380px;overflow: auto;position: absolute;left:20px;"></div>
		<div id="form"></div>
		<iframe id="roleOpIframe"  width="100%" scrolling="auto" frameborder="no" border="0" style="width: 600px;position:absolute;top:25px;right:20px;"></iframe>
		<script type="text/javascript">
		Ext.QuickTips.init(); //为组件提供提示信息功能，form的主要提示信息就是客户端验证的错误信息。
		Ext.form.Field.prototype.msgTarget='qtip';//
		$j(window).resize(function(){
			setTimeout(function(){
				$j('#roleOpIframe').height($j(window).height()-30);
			},100);
		}).resize();
        var tree = null,
        loadMask = new Ext.LoadMask(document.body, {  
            msg: "处理中"  
        }),
        win = new Ext.Window({
            title: '角色管理',
            applyTo:'form',
            layout:'fit',
            width:500,
            height:300,
            closeAction:'hide',
            modal:true,
            plain: true,
            items: new Ext.FormPanel({
            	id:'form',
                url: 'Role!doCreate.action',
                bodyStyle: 'padding:5px 5px 0',
                width: 350,
                labelWidth: 75,
                defaultType: 'textfield',
                defaults: {
                    anchor: '100%'
                },
                items: [{
                    name: 'url',
                    xtype: 'hidden'
                }, {
                	fieldLabel: '角色编码',
                	id:'form-roleId',
                    name: 'role.roleId',
                    allowBlank: false,
                    vtype:'alphanum',
                    blankText:'角色编码必须是字母和数字的组合且不能为空'
                }, {
                    name: 'role.parentId',
                    xtype: 'hidden'
                }, {
                    fieldLabel: '角色名称',
                    name: 'role.roleName',
                    allowBlank: false
                }, {
                    fieldLabel: '角色描述',
                    name: 'role.memo',
                    xtype: 'textarea'
                },{
                    fieldLabel: '排序',
                    name: 'role.ord',
                    xtype: 'spinnerfield'
                }]
            }),
            tools:[{
            	id:'close',
            	handler:function(event,toolEl,panel){
            		panel.setVisible(false);
            	}
            }],
            buttons: [{
                text: '提交',
                handler: function(button,e){
                    var form=win.findById('form'),baseform = form.getForm();
                    if (baseform.isValid()) {
                    	var roleId=baseform.findField('role.roleId').getValue(),reg = /^[0-9a-zA-Z_-]+$/;
                    	if(reg.test(roleId)){
                    		loadMask.show();
                            var url = baseform.findField('url').getValue();
                            if(url.indexOf('doUpdate')>-1){
                            	url+='?role.roleId='+form.findById('form-roleId').getValue();
                            }
                            baseform.submit({
                                url: url,
                                success: function(form, action){
                                    var data = action.result.data,node=tree.contextMenu.contextNode;
                                    data.editable=true;
                                    data.checked=null;
                                    data.text=data.roleName;
                                    data.iconCls="node-group";
                                    if (url.indexOf('doUpdate') != -1) {
                                        node.setText(data.roleName);
    									node.attributes=data;
                                    }
                                    else {
                                        data.leaf = true;
    									if(!node.isExpanded()){
    										node.expand();
    									}
    									if(node.isLeaf()){
    										node.leaf=false;
    									}
                                        node.appendChild(new Ext.tree.TreeNode(data));
                                    }
    								win.setVisible(false);
    								loadMask.hide();
                                    Ext.Msg.alert('成功', '操作成功!');
                                },
                                failure: function(form, action){
                                	loadMask.hide();
                                	Ext.Msg.alert('失败', '操作失败，请重新尝试!');
                                }
                            });
                    	}else{
                    		alert('角色编码必须是字母、数字、中划线和下划线的组合，您输入的角色编码包含特殊字符。');
                    	}
                    }
                }
            }]
        });
        
        var menuItems=[];
        <p:auth resourcesId="PURE_ROLE" optType="<%=PureUtils.AUTH_CREATE%>">
        menuItems.push({
        	itemId:'menu-create',
            text: '新增',
            iconCls: 'icon-add',
            handler: function(item){
            	item.parentMenu.hide();
                var data = item.parentMenu.contextNode.attributes,form=win.findById('form');
                win.setTitle('新增角色');
                form.findById('form-roleId').enable();
                form.getForm().setValues([{
                    id: 'url',
                    value: 'Role!doCreate.action'
                }, {
                    id: 'role.roleId',
                    value: ''
                }, {
                    id: 'role.parentId',
                    value: data.roleId
                }, {
                    id: 'role.roleName',
                    value: ''
                }, {
                    id: 'role.memo',
                    value: ''
                },{
                    id: 'role.ord',
                    value: 0
                }]);
                win.setVisible(true);
            }
        });
        </p:auth>
        <p:auth resourcesId="PURE_ROLE" optType="<%=PureUtils.AUTH_UPDATE%>">
        menuItems.push({
        	itemId:'menu-update',
            text: '修改',
            iconCls: 'icon-edit',
            handler: function(item){
            	item.parentMenu.hide();
                var data = item.parentMenu.contextNode.attributes,form=win.findById('form');
                win.setTitle('修改角色');
                form.findById('form-roleId').disable();
                form.getForm().setValues([{
                    id: 'url',
                    value: 'Role!doUpdate.action'
                }, {
                    id: 'role.roleId',
                    value: data.roleId
                }, {
                    id: 'role.parentId',
                    value: data.parentId
                }, {
                    id: 'role.roleName',
                    value: data.roleName
                }, {
                    id: 'role.memo',
                    value: data.memo
                }, {
                    id: 'role.ord',
                    value: data.ord
                }]);
                win.setVisible(true);
            }
        });
        </p:auth>
        <p:auth resourcesId="PURE_ROLE" optType="<%=PureUtils.AUTH_DELETE%>">
        menuItems.push({
        	itemId:'menu-delete',
            text: '删除',
            iconCls: 'icon-del',
            handler: function(item){
            	item.parentMenu.hide();
                var node = item.parentMenu.contextNode;
                if(node.childNodes.length==0&&node.parentNode){
                	 var id = node.attributes.roleId;
                	 Ext.MessageBox.show({
                         title: '删除角色确认',
                         msg: '您确认要删除角色吗?',
                         buttons: Ext.MessageBox.OKCANCEL,
                         animEl: 'mb9',
                         icon: 'ext-mb-question',
                         fn:function(btn){
					      		if("ok"==btn){
					      			loadMask.show();
					      			Ext.Ajax.request({
					      			   url: 'Role!delete.action',
					      			   success: function(req){
					      				   loadMask.hide();
					      				   var res=Ext.decode(req.responseText);
					      				   if(res.success==true){
					      					   node.remove();
					      					   Ext.Msg.alert('成功', '删除角色成功!');
					      				   }else{
					      					   Ext.Msg.alert('失败', res.msg);
					      				   }
					      			   },
					      			   failure: function(){
					      				 loadMask.hide();
					      				 Ext.Msg.alert('失败', '删除角色失败!');
					      			   },
					      			   params: {id:id}
					      			});
					      		}
					      		return false;
                         }
                     });
                }else{
                	Ext.Msg.alert('失败', '不能删除非叶子节点或根节点!');
                }
            }
        });
        </p:auth>
        <p:auth resourcesId="PURE_ROLE_PERMISSION" optType="<%=PureUtils.AUTH_AUTH%>">
        menuItems.push('-');
        menuItems.push({
        	itemId:'menu-permission',
        	iconCls: 'icon-vcard-role',
            text: '授权',
            handler: function(item){
            	item.parentMenu.hide();
                var node = item.parentMenu.contextNode;
                $j('#roleOpIframe').attr('src',Bonc.toFullPath('/pure/RolePermission.action?roleId='+item.parentMenu.contextNode.attributes.roleId));
            }
        });
        </p:auth>
        <p:auth resourcesId="PURE_USER_PERMISSION" optType="<%=PureUtils.AUTH_AUTH%>">
         menuItems.push({
        	itemId:'authorize-permission',
        	iconCls: 'icon-vcard-role',
            text: '给用户授权',
            handler: function(item){
            	item.parentMenu.hide();
                var node = item.parentMenu.contextNode;
                $j('#roleOpIframe').attr('src',Bonc.toFullPath('/pure/UserRole!authorize.action?roleId='+item.parentMenu.contextNode.attributes.roleId));
            }
        });
        </p:auth>
        <p:auth resourcesId="PURE_USER_PERMISSION" optType="<%=PureUtils.AUTH_AUTH%>">
         menuItems.push({
        	itemId:'unauthorize-permission',
        	iconCls: 'icon-vcard-role',
            text: '收回用户权限',
            handler: function(item){
            	item.parentMenu.hide();
                var node = item.parentMenu.contextNode;
                $j('#roleOpIframe').attr('src',Bonc.toFullPath('/pure/UserRole.action?roleId='+item.parentMenu.contextNode.attributes.roleId));
            }
        });
        </p:auth>
        
        tree = new Ext.tree.TreePanel({
            renderTo: 'tree',
            autoScroll:true,
            //width:'100%',
            <p:auth resourcesId="PURE_ROLE" optType="<%=PureUtils.AUTH_UPDATE%>"> enableDD: true, </p:auth>
            useArrows: true,
            loader:new Ext.tree.TreeLoader(),
            <%
            JsonConfig jsonConfig = new JsonConfig();
    		jsonConfig.registerJsonBeanProcessor(Role.class,
  				new JsonBeanProcessor() {
  					public JSONObject processBean(Object bean, JsonConfig jsonConfig) {
  						if (null==bean||!(bean instanceof Role)) {
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
  								.element("editable", null!=role.hasPermission()&&role.hasPermission()==true)
  								.element("memo", role.getMemo())
  								.element("iconCls", "node-group");
  						return json;
  					}
  				}
    		);
            %>
            root:new Ext.tree.AsyncTreeNode(<%=JSONSerializer.toJSON(request.getAttribute("root"), jsonConfig).toString()%>),
            contextMenu: new Ext.menu.Menu({
                items: menuItems
            }),
            listeners: {
                contextmenu: function(node, e){
                	var data=node.attributes;
					if(data.editable&&menuItems.length>0){
						node.select();
	                    var contextMenu = node.getOwnerTree().contextMenu;
                        contextMenu.items.each(function(et){
                            if (et.itemId && et.itemId == 'menu-update') {
                            	if(data.roleId!='${rootId}'){
                                	et.enable();
                            	}else{
                            		et.disable();
                            	}
                            }
                            if (et.itemId && et.itemId == 'menu-delete') {
                            	if(data.roleId!='${rootId}'){
                                	et.enable();
                            	}else{
                            		et.disable();
                            	}
                            }
                        });
                        contextMenu.contextNode = node;
                        contextMenu.showAt(e.getXY());
					}
                }
            	<p:auth resourcesId="PURE_ROLE" optType="<%=PureUtils.AUTH_UPDATE%>">,
				nodedragover:function(e){
					var node=e.target;
			   	  	if(node.isLeaf())
			   	  		node.leaf=false;
			   	  	return true;
			   	},
			   	beforemovenode:function(tree, node, oldParent, newParent, index){
		   			var data=node.attributes;
		   			if(!data.editable){
			   			Ext.Msg.alert('无权限', '无权移动该节点!');
			   			return false;
			   		}
			   		if(confirm('您确认要移动角色吗?')){
			   			loadMask.show();
		      			$j.ajax({
		      			   async:false,
		      			   url: 'Role!doMove.action',
		      			   success: function(res){
		      				   loadMask.hide();
		      				   if(res.success==true){
		      					   Ext.Msg.alert('成功', '移动角色成功!');
		      					   return true;
		      				   }else{
		      					   Ext.Msg.alert('失败', '移动角色失败!');
		      					   return false;
		      				   }
		      			   },
		      			   error: function(XMLHttpRequest, textStatus, errorThrown){
		      				 loadMask.hide();
		      				 Ext.Msg.alert('失败', '移动角色失败!');
		      				 return false;
		      			   },
		      			   data: {
	                            'role.roleId': data.roleId,
	                            'role.parentId': newParent.attributes.roleId
	                        },
		      			   dataType:'json'
		      			});
			   		}else{
			   			return false;	
			   		}
			    }
			   	</p:auth>
            }
        });
        tree.expandAll();
		/* 设置iframe的高度，由于IE存在bug，因此采用延迟执行的方式解决假死状态 */
		$j(window).resize(function(){
			setTimeout(function(){
				$j('#tree').css('height', ($j(window).height() - $j('#pageTitle').height() - 2) + 'px');
			},100);
		});
		$j(window).resize();
		
		Ext.apply(Ext.form.VTypes, {
		    alphanum:  function(v) {//此处的alphanum是vtype的值，而不是name的值
		    	var flag=false;
			    $j.ajax({
				  url: 'Role!validRoleId.action',
				  cache: false,
				  global:false,
				  async:false,
				  dataType:'JSON',
				  data: 'id='+v,
				  type: 'POST',
				  error :function(){
					  alert('验证失败');
				  },
				  success: function(json){
					  if(json){
						  flag=true;
					  }
				  }
				});
				return flag;
		    },
		    alphanumText: '该角色编码已存在'
		});
				
	</script>
	</s:else>
</body>
</html>