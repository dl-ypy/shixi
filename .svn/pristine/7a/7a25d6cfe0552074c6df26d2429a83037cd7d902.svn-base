<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List,net.sf.json.JsonConfig,net.sf.json.*,net.sf.json.processors.JsonBeanProcessor,com.bonc.pure.domain.*,com.bonc.pure.PureUtils"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="p" uri="/pure-tags"%>
<b:doctype />
<html>
<head>
<s:head />
<style type="text/css">
.resources-type{margin:5px;border-bottom:1px solid #ccc;padding:3px;}
.resources-type li{display: inline;list-style:none;background:#fff left center no-repeat;padding-left:16px;margin:4px;}
</style>
</head>
<body>
	<b:appletBox title="系统资源管理" showMM="false" />
	<table>
	  <tr>
	     <td style="width:30%">
	     	<s:select id="appSystemId" name="appSystemId" list="appSystemOptions" listKey="appSystemId" 
	     	   listValue="appSystemName" headerKey="" headerValue="全部" label="应用系统" cssStyle="width:200px;">
	     	</s:select>
	     </td>
	     <td style="width:30%">
	         <s:select id="resourcesTypeId" name="resourcesTypeId" list="resourcesTypeOptions"
				listKey="resourcesTypeId" listValue="resourcesTypeName" headerKey="" headerValue="全部" 
				label="资源类型" cssStyle="width:200px;">
			 </s:select>
		 </td>
		 <td style="width:30%"><input type="submit" class="submit" value="查询" id="submitBtn"/></td>
	  </tr>
	</table>
	<ul class="resources-type">
		<li style="font-weight:bolder">图例:</li>
		<s:iterator value="resourcesTypeOptions">
			<li class="resources-id resources-id-${resourcesTypeId}">${resourcesTypeName}</li>
		</s:iterator>
	</ul>
	<s:if test="null==resourcesList">您没有任何系统资源可以管理</s:if>
	<s:else>
		<s:head template="head_ext.ftl" />
		<script type="text/javascript" src="<s:url value='/struts/ext3/ux/Spinner.js'/>"></script>
		<script type="text/javascript" src="<s:url value='/struts/ext3/ux/SpinnerField.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<s:url value='/struts/ext3/ux/css/Spinner.css'/>" />
		<div id="tree" ></div>
		<div id="form" ></div>
		<script type="text/javascript">
		Ext.QuickTips.init(); //为组件提供提示信息功能，form的主要提示信息就是客户端验证的错误信息。
		Ext.form.Field.prototype.msgTarget='qtip';//
	   
		var tree = null,
		    resAttributes ={'APP_SYSTEM_ID':'resources.appSystem.appSystemId','EXT1':'resources.ext1',
				'RESOURCES_TYPE_ID':'resources.resourcesType.resourcesTypeId','EXT4':'resources.ext4',
				'RESOURCES_NAME':'resources.resourcesName','URL':'resources.url','EXT3':'resources.ext3',
				'EXT2':'resources.ext2','MEMO':'resources.memo','ORD':'resources.ord','FROM_SIGN':'resources.fromSign'},					
	    loadMask = new Ext.LoadMask(document.body, {  
	            msg: "处理中"  
	    }),
	    win=new Ext.Window({
	        	title: '系统资源管理',
	            applyTo:'form',
	            layout:'fit',
	            width:520,
	            height:450,
	            closeAction:'hide',
	            modal:true,
	            plain: true,
	            items: new Ext.FormPanel({
	            	id:'form',
		            url: 'Resources!doCreate.action',
		            bodyStyle: 'padding:5px 5px 0',
		            trackResetOnLoad: true,
		            width: 550,
		            labelWidth: 95,
		            defaultType: 'textfield',
		            defaults: {
		                anchor: '100%'
		            },
		            items: [{
		                name: 'url',
		                xtype: 'hidden'
		            },{
		            	fieldLabel: '系统资源编码',
		            	id:'form-resourcesId',
		                name: 'resources.resourcesId',
		                allowBlank: false,
		                vtype:'alphanum',
		                blankText:'系统资源编码必须是字母和数字、下划线的组合且不能为空'
		            },{
		                name: 'resources.parentId',
		                xtype: 'hidden'
		            },{
		                name: 'resources.path',
		                xtype: 'hidden'
		            },{
		                name: 'resources.onlyRead',
		                xtype: 'hidden'
	                },{
		                name: 'resources.fromSign',
		                xtype: 'hidden'
	                },{
		                name: 'resources.modifyFields',
		                xtype: 'hidden'
	                },{
		                fieldLabel: '系统资源名称',
		                name: 'resources.resourcesName',
		                allowBlank: false
		            },{
		                fieldLabel: '所属系统',
		                xtype: 'combo',
		                mode: 'local',
		                triggerAction:  'all',
		                forceSelection: true,
		                allowBlank: false,
		                editable:       false,
		                name: 'resources.appSystem.appSystemId',
		                hiddenName: 'resources.appSystem.appSystemId',
		                displayField:   'appSystemName',
		                valueField:     'appSystemId',
		                store: new Ext.data.JsonStore({
		                    fields : ['appSystemId', 'appSystemName'],
		                    data : <%=JSONArray.fromObject(request.getAttribute("appSystemOptions")).toString()%>
		                })
		            }, {
		            	id:'resource_type',
		                fieldLabel: '资源类型',
		                xtype: 'combo',
		                mode: 'local',
		                triggerAction:  'all',
		                forceSelection: true,
		                allowBlank: false,
		                editable:       false,
		                name:           'resources.resourcesType.resourcesTypeId',
		                hiddenName:     'resources.resourcesType.resourcesTypeId',
		                displayField:   'resourcesTypeName',
		                valueField:     'resourcesTypeId',
		                store: new Ext.data.JsonStore({
		                    fields : ['resourcesTypeId', 'resourcesTypeName'],
		                    data : <%=JSONArray.fromObject(request.getAttribute("resourcesTypeList")).toString()%>
		                }),
		                listeners:{
		                	select:function(combo,record,index ){
		                		if(index==0){
		                			document.getElementById("ext1").parentNode.previousSibling.innerHTML ="扩展字段1:";
		                		    Ext.getCmp("ext1").setVisible(false);  
		                		    Ext.getCmp("ext1").setDisabled(true);	
		                		    Ext.getCmp("ext1_mode").setVisible(true);  
		                		    Ext.getCmp("ext1_mode").setDisabled(false);
		                		    Ext.getCmp("ext2").setVisible(true);  
		                		    Ext.getCmp("ext2").setDisabled(false);
		                			Ext.getCmp("ext2_mode").setVisible(false);  
		                		    Ext.getCmp("ext2_mode").setDisabled(true);
		                		}else if(index==5){
		                			document.getElementById("ext1").parentNode.previousSibling.innerHTML ="高度:";
		                			Ext.getCmp("ext1").setVisible(true);  
		                		    Ext.getCmp("ext1").setDisabled(false);
		                		    Ext.getCmp("ext1_mode").setVisible(false);  
		                		    Ext.getCmp("ext1_mode").setDisabled(true);
		                		    Ext.getCmp("ext2").setVisible(false);  
		                		    Ext.getCmp("ext2").setDisabled(true);
		                			Ext.getCmp("ext2_mode").setVisible(true);  
		                		    Ext.getCmp("ext2_mode").setDisabled(false);
		                		}else{
		                			document.getElementById("ext1").parentNode.previousSibling.innerHTML ="扩展字段1:";
		                		    Ext.getCmp("ext1").setVisible(true);  
		                		    Ext.getCmp("ext1").setDisabled(false);
		                			Ext.getCmp("ext1_mode").setVisible(false);  
		                		    Ext.getCmp("ext1_mode").setDisabled(true);
		                		    Ext.getCmp("ext2").setVisible(true);  
		                		    Ext.getCmp("ext2").setDisabled(false);
		                			Ext.getCmp("ext2_mode").setVisible(false);  
		                		    Ext.getCmp("ext2_mode").setDisabled(true);
		                		}
		                	}
		                }
		            },{
		    	        xtype: 'checkboxgroup',
		    	        fieldLabel:'操作类型',
		    	        columns : 5, 
		    	        name: 'optTypes',
		    	        id:'optTypes',
		    	        <%
		    	        List<OperationType> operationTypeList=(List<OperationType>)request.getAttribute("operationTypeList");
		                JsonConfig jsonConfig = new JsonConfig();
			    		jsonConfig.registerJsonBeanProcessor(OperationType.class,
			    				new JsonBeanProcessor() {
			    					public JSONObject processBean(Object o,
			    							JsonConfig jsonConfig) {
			    						if (o == null || !(o instanceof OperationType)) {
			    							return new JSONObject(true);
			    						}
			    						OperationType opt = (OperationType) o;
			    						JSONObject json = new JSONObject()
			    								.element("boxLabel", opt.getOptTypeName())
			    								.element("inputValue", opt.getOptType())
			    								.element("name", "optTypes")
			    								.element("id",  opt.getOptType())
			    								.element("checked",false);
			    						return json;
			    					}
			    				});
		    	        %>
		    	        items:<%=JSONSerializer.toJSON(operationTypeList, jsonConfig).toString()%>
		              },{
		                fieldLabel: '资源路径',
		                id:'resources.url',
		                name: 'resources.url'
		             },{
		                fieldLabel: '页面加载方式',
		                id:'ext1_mode',
		                xtype: 'combo',
		                mode: 'local',
		                triggerAction:  'all',
		                forceSelection: true,
		                allowBlank: false,
		                editable:       false,
		                name:           'resources.ext1',
		                hiddenName:     'resources.ext1',
		                displayField:   'resourcesExtName',
		                valueField:     'resourcesExtId',
		                store: new Ext.data.JsonStore({
		                    autoLoad : true,
		                    fields : ['resourcesExtId', 'resourcesExtName'],
		                    data : [{"resourcesExtId":0,"resourcesExtName":"内容区加载"},{"resourcesExtId":1,"resourcesExtName":"打开新窗口"}]
		                })
		            },{
		            	id:'ext1',
		                fieldLabel: '扩展字段1',
		                name: 'resources.ext1'
		            },{
		                fieldLabel: '加载方式',
		                id:'ext2_mode',
		                xtype: 'combo',
		                mode: 'local',
		                triggerAction:  'all',
		                forceSelection: true,
		                allowBlank: false,
		                editable:       false,
		                name:           'resources.ext2',
		                hiddenName:     'resources.ext2',
		                displayField:   'TypeId',
		                valueField:     'TypeName',
		                store: new Ext.data.JsonStore({
		                    autoLoad : true,
		                    fields : ['TypeId', 'TypeName'],
		                    data : [{'TypeId':'iframe','TypeName':'iframe'},{'TypeId':'ajax','TypeName':'ajax'}]
		                })
		            },{
		            	id:'ext2',
		                fieldLabel: '扩展字段2',
		                name: 'resources.ext2'
		            },{
		                fieldLabel: '扩展字段3',
		                name: 'resources.ext3'
		            },{
		                fieldLabel: '扩展字段4',
		                name: 'resources.ext4'
		            },{
		                fieldLabel: '系统资源描述',
		                name: 'resources.memo',
		                xtype: 'textarea'
		            },new Ext.ux.form.SpinnerField({
		                fieldLabel: '排序',
		                name: 'resources.ord'
		            })]
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
	                	if(baseform.isValid()) {
	                    	var resourcesId=baseform.findField('resources.resourcesId').getValue(),reg = /^[0-9a-zA-Z_-]+$/;
	                    	if(!reg.test(resourcesId)){
	                    		alert('系统资源编码必须是字母、数字、下划线和中划线的组合，您输入的资源编码包含特殊字符。');
		                	    return;
	                    	}
	
	                    	loadMask.show();
	                        var url = baseform.findField('url').getValue();
	                        if(url.indexOf('doUpdate')>-1){
	                        	for(var value in resAttributes){
			               			var item = baseform.findField(resAttributes[value]);
			                		if(item){
			                			item.enable();
			                       	} 
			           			}
	                        	url+='?resources.resourcesId='+form.findById('form-resourcesId').getValue();
	                        }
	                        baseform.submit({
	                            url: url,
	                            success: function(form, action){
	                                var data = action.result.data,node=tree.contextMenu.contextNode;
	                                if (url.indexOf('doUpdate') != -1) {
	                                    node.setText(data.text);
	                                    var img=node.getUI().getIconEl();
	                                    img.className=img.className.replace('resources-id-'+node.attributes.resourcesTypeId,'resources-id-'+data.resourcesTypeId);
										node.attributes=data;
	                                }
	                                else {
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
									tree.getNodeById(node.parentNode.id).reload();
	                                Ext.Msg.alert('成功', '操作成功!');
	                            },
	                            failure: function(form, action){
	                            	loadMask.hide();
	                            	Ext.Msg.alert('失败', '操作失败，请重新尝试!');
	                            }
	                        });  	
	                    }
	                }
	            }]
	        });
	    
	    //先隐藏不该显示的选项
    	Ext.getCmp("ext1_mode").setVisible(false);  
		Ext.getCmp("ext1_mode").setDisabled(true);
		Ext.getCmp("ext2_mode").setVisible(false);  
	    Ext.getCmp("ext2_mode").setDisabled(true);
	      
        //资源树上的右键菜单
        var contextmenu = new Ext.menu.Menu();
       <p:auth resourcesId="PURE_RESOURCES" optType="<%=PureUtils.AUTH_CREATE%>">
        contextmenu.add({
            	itemId:'menu-create',
                text: '新增',
                iconCls: 'icon-add',
                handler: function(item){
                	item.parentMenu.hide();
                    var data = item.parentMenu.contextNode.attributes,form=win.findById('form');
                    win.setTitle('新增系统资源');
                    form.findById('form-resourcesId').enable();
                    for(var value in resAttributes){
               			if(form.getForm().findField(resAttributes[value])){
               				form.getForm().findField(resAttributes[value]).enable();
                       	} 
           			} 
                    form.getForm().setValues([{
                        id: 'url',
                        value: 'Resources!doCreate.action'
                    }, {
                        id: 'resources.resourcesId',
                        value: ''
                    }, {
                        id: 'resources.parentId',
                        value: data.id
                    }, {
                        id: 'resources.path',
                        value: data.path
                    }, {
                        id: 'resources.resourcesName',
                        value: ''
                    },{
                        id: 'resources.appSystem.appSystemId',
                        value: ''
                    },{
                        id: 'resources.resourcesType.resourcesTypeId',
                        value: ''
                    },{
                        id: 'resources.memo',
                        value: ''
                    },{
                    	id:'resources.url',
                    	value:''
                    },{
                    	id:'ext1',
                    	value:''
                    },{
                    	id:'ext1_mode',
                    	value:''
                    },{
                    	id:'ext2',
                    	value:''
                    },{
                    	id:'ext2_mode',
                    	value:''
                    },{
                    	id:'resources.ext3',
                    	value:''
                    },{
                    	id:'resources.ext4',
                    	value:''
                    },{
                        id: 'resources.ord',
                        value: '0'
                    }]);
                    var optTypeCmp=Ext.getCmp('optTypes');
                    optTypeCmp.items.each(function(item){
                    	item.setValue(false);
                    });
                    Ext.getCmp("ext1_mode").setDisabled(false);
                    Ext.getCmp("ext2_mode").setDisabled(false);
                    Ext.getCmp("ext1").setDisabled(false);
                    win.setVisible(true);
                }
          });
      </p:auth>
        
      <p:auth resourcesId="PURE_RESOURCES" optType="<%=PureUtils.AUTH_UPDATE%>">
        contextmenu.add({
            	itemId:'menu-update',
                text: '修改',
                iconCls: 'icon-edit',
                handler: function(item){
                	item.parentMenu.hide();
                    var data = item.parentMenu.contextNode.attributes,form=win.findById('form'); 
                    if(data){
                    	data=data;
                    }
                    var index=data.resourcesTypeId;
                    //系统菜单
                    if(index==1){
    		   			document.getElementById("ext1").parentNode.previousSibling.innerHTML ="扩展字段1:";
                   		Ext.getCmp("resource_type").setDisabled(false);
	                	Ext.getCmp("resources.url").setDisabled(false);
    		   		    Ext.getCmp("ext1").setVisible(false);  
    		   		    Ext.getCmp("ext1").setDisabled(true);	
    		   		    Ext.getCmp("ext1_mode").setVisible(true);  
    		   		    Ext.getCmp("ext1_mode").setDisabled(false);
    		   		    Ext.getCmp("ext2").setVisible(true);  
    		   		    Ext.getCmp("ext2").setDisabled(false);
    		   			Ext.getCmp("ext2_mode").setVisible(false);  
    		   		    Ext.getCmp("ext2_mode").setDisabled(true);
    		   		}else if(index == 6){
    		   			document.getElementById("ext1").parentNode.previousSibling.innerHTML ="高度:";
    		   			Ext.getCmp("ext1").setVisible(true);  
    		   		    Ext.getCmp("ext1").setDisabled(true);
    		   		    Ext.getCmp("ext1_mode").setVisible(false);  
    		   		    Ext.getCmp("ext1_mode").setDisabled(true);
    		   		    Ext.getCmp("ext2").setVisible(false);  
    		   		    Ext.getCmp("ext2").setDisabled(true);
    		   			Ext.getCmp("ext2_mode").setVisible(true);  
    		   		    Ext.getCmp("ext2_mode").setDisabled(false);
    		   		}else{
    		   			document.getElementById("ext1").parentNode.previousSibling.innerHTML ="扩展字段1:";
                   		Ext.getCmp("resource_type").setDisabled(false);
	                	Ext.getCmp("resources.url").setDisabled(false);
    		   		    Ext.getCmp("ext1").setVisible(true);  
    		   		    Ext.getCmp("ext1").setDisabled(false);
    		   			Ext.getCmp("ext1_mode").setVisible(false);  
    		   		    Ext.getCmp("ext1_mode").setDisabled(true);
    		   		    Ext.getCmp("ext2").setVisible(true);  
    		   		    Ext.getCmp("ext2").setDisabled(false);
    		   			Ext.getCmp("ext2_mode").setVisible(false);  
    		   		    Ext.getCmp("ext2_mode").setDisabled(true);
    		   		}
                    var optTypeCmp=Ext.getCmp('optTypes'),optList=data.optList;
                    optTypeCmp.items.each(function(item){
                    	item.setValue(false);
                    });
                    for(var opt in optList){   
                    	if(opt<optList.length){
                    	  var optId=optList[opt].optType;
                    	  Ext.getCmp(optId).setValue(true);
                    	}
                    }
                    win.setTitle("修改系统资源--<span style='color:red;font-size:smaller'>不可修改字段为只读字段</span>");
                    form.findById('form-resourcesId').disable();

                    //可修改字段处理
                    var str = data.modifyFields,modifyFields=[]; 
                    if(str){
                    	str = str.split(',');
         				for (var i=0; i < str.length; i++){
         					modifyFields.push(str[i].toUpperCase());
                     	}
                    }
                    for(var key in resAttributes){
               			if(form.getForm().findField(resAttributes[key])){
               				form.getForm().findField(resAttributes[key]).enable();
                       	} 
           			} 
                    //只读资源所有字段都不允许修改
                    if(data.onlyRead==1){
                    	for(var key in resAttributes){
                   			if(form.getForm().findField(resAttributes[key])){
                   				form.getForm().findField(resAttributes[key]).disable();
                           	} 
               			}
                    }
                    if(modifyFields!=null && modifyFields.length!=0){
                        for(var key in resAttributes){
                   			if(form.getForm().findField(resAttributes[key])){
                   				form.getForm().findField(resAttributes[key]).disable();
                           	} 
               			} 
                    	for(var i=0; i < modifyFields.length; i++){
                    		for(var key in resAttributes){
                    			if(modifyFields[i]==key){
    	                   			if(form.getForm().findField(resAttributes[modifyFields[i]])){
    	                   				form.getForm().findField(resAttributes[modifyFields[i]]).enable();
    	                           	} 
                    			}
                   			}
                   	    } 
                    }
                    form.getForm().setValues([{
                        id: 'url',
                        value: 'Resources!doUpdate.action'
                    },{
                        id: 'resources.resourcesId',
                        value: data.id
                    },{
                        id: 'resources.parentId',
                        value: data.parentId
                    },{
                        id: 'resources.path',
                        value: data.path
                    },{
                        id: 'resources.appSystem.appSystemId',
                        value: data.appSystemId
                    },{
                        id: 'resources.resourcesType.resourcesTypeId',
                        value: data.resourcesTypeId
                    },{
                        id: 'resources.resourcesName',
                        value: data.text
                    }, {
                        id: 'resources.memo',
                        value: data.memo
                    }, {
                    	id:'resources.url',
                    	value:data.url
                    },{
                    	id:'ext1',
                    	value:data.ext1
                    },{
                    	id:'ext1_mode',
                    	value:data.ext1==null?0:data.ext1
                    },{
                    	id:'ext2',
                    	value:data.ext1
                    },{
                    	id:'ext2_mode',
                    	value:data.ext2==null?0:data.ext2
                    },{
                    	id:'resources.ext3',
                    	value:data.ext3
                    },{
                    	id:'resources.ext4',
                    	value:data.ext4
                    },{
                        id: 'resources.onlyRead',
                        value: data.onlyRead
                    },{
                        id: 'resources.fromSign',
                        value: data.fromSign
                    },{
                        id: 'resources.modifyFields',
                        value: data.modifyFields
                    },{
                        id: 'resources.ord',
                        value: data.ord
                    }]);
                    win.setVisible(true);
                }	
            });
    </p:auth>
    
	<p:auth resourcesId="PURE_RESOURCES" optType="<%=PureUtils.AUTH_DELETE%>">
		contextmenu.add({
            	itemId:'menu-delete',
                text: '删除',
                iconCls: 'icon-del',
                handler: function(item){
                    var node = item.parentMenu.contextNode;
                    var data = item.parentMenu.contextNode.attributes; 
                    if(data){
                    	data=data;
                    }
                    var index=data.resourcesTypeId;
                    if(node.childNodes.length==0&&node.parentNode){
                    	 var id = node.attributes.id;
                    	 Ext.MessageBox.show({
                             title: '删除系统资源确认',
                             msg: '您确认要删除系统资源吗?',
                             buttons: Ext.MessageBox.OKCANCEL,
                             animEl: 'mb9',
                             icon: 'ext-mb-question',
                             fn:function(btn){
    					      		if("ok"==btn){
    					      			loadMask.show();
   					      				Ext.Ajax.request({
   	    					      			   url: 'Resources!delete.action',
   	    					      			   success: function(req){
   	    					      				   loadMask.hide();
   	    					      				   var res=Ext.decode(req.responseText);
   	    					      				   if(res.success==true){
   	    					      					   node.remove();
   	    					      					   Ext.Msg.alert('成功', '删除系统资源成功!');
   	    					      				   }else{
   	    					      					   Ext.Msg.alert('失败', res.msg);
   	    					      				   }
   	    					      			   },
   	    					      			   failure: function(){
   	    					      				 loadMask.hide();
   	    					      				 Ext.Msg.alert('失败', '删除系统资源失败!');
   	    					      			   },
   	    					      			   params: {id:id,resourcesTypeId:index}
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
    
        //异步加载树
        var root= new Ext.tree.AsyncTreeNode( { id:'root',  text: '系统资源',iconCls:'resources-root' } );
        var loader= new Ext.tree.TreeLoader( {dataUrl: 'Resources!getTreeData.action'});
        tree= new Ext.tree.TreePanel({
	         renderTo: 'tree',
	         autoScroll:true,
	         width: 300,
	         height:400,
	         enableDD : true,
	         useArrows: true,
	         root: root,
	         loader: loader,
	         contextMenu : contextmenu,
	         listeners : {
	        	 <p:auth resourcesId="PURE_RESOURCES" optType="<%=PureUtils.AUTH_UPDATE%>"> 
		         //移动节点
				 nodedragover:function(e){
					var node=e.target;
			   	  	if(node.isLeaf()){
			   	  		node.leaf=false;	
			   	  	}
			   	  	return true;
			   	 },
			   	 beforemovenode:function(tree, node, oldParent, newParent, index){
			   		 //资源不可以拖动调整同一层级的位置（调整位置使用右键编辑修改排序字段）
			   		  if(newParent.attributes.id==oldParent.attributes.id){
				   		  return false;
				   	  }
				   	  var data=node.attributes;
				   	  if(confirm('您确认要移动系统资源吗?')){
				   			loadMask.show();
			      			$j.ajax({
			      			   async:false,
			      			   url: 'Resources!doMove.action',
			    			   data: {
			                      'resources.resourcesId': data.id,
			                      'resources.parentId': newParent.attributes.id
			                   },
			    			   dataType:'json',
			      			   success: function(res){
			      				   loadMask.hide();
			      				   if(res.success==true){
			      					 Ext.Msg.alert('成功', '移动系统资源成功!');
			      					   return true;
			      				   }else{
			      					 Ext.Msg.alert('失败', '移动系统资源失败!');
			      					   return false;
			      				   }
			      			   },
			      			   error: function(XMLHttpRequest, textStatus, errorThrown){
			      				 loadMask.hide();
			      				 Ext.Msg.alert('失败', '移动系统资源失败!');
			      				 return false;
			      			   }
			      			});
			   		  }else{
			   			return false;	
			   	 	 }
			    },
			    </p:auth>
	        	contextmenu : function(node, e) {
					node.select();
					e.preventDefault();//防止浏览器的默认事件操作发生。
					var data = node.attributes, contextMenu = node.getOwnerTree().contextMenu;
					contextMenu.items.each(function(et) {
						et.show();
						//只读资源、根资源不允许删除
						if(et.itemId == 'menu-delete'){
							if(data.onlyRead==1||data.id=='root'){
								et.disable();
							}else{
							  et.enable();
							}
						}
						//根资源不允许修改
						if(et.itemId == 'menu-update'){
							if(data.id=='root'){
								et.disable();
							}else{
								et.enable();
							}
						}
					});
					contextmenu.showAt(e.getXY()); 
					contextMenu.contextNode = node;
				}
	         }
        });
        
       loader.on('beforeload',function(loader,node){
                      this.baseParams.rootId=node.id; //点一个节点出来它的子节点来实现异步加载
                      this.baseParams.appSystemId=jQuery('#appSystemId').val();
                      this.baseParams.resourcesTypeId=jQuery('#resourcesTypeId').val();
               },loader);
       root.expand(false,false); 
        
        //查询按钮事件 
        jQuery('#submitBtn').click(function(){
       		 root.reload();
        });
         
		Ext.apply(Ext.form.VTypes, {
		    alphanum:  function(v) {//此处的alphanum是vtype的值，而不是name的值
		    	var flag=false;
			    $j.ajax({
				  url: 'Resources!validResourcesId.action',
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
					  if(json.success){
						  flag=true;
					  }
				  }
				});
				return flag;
		    },
		    alphanumText: '该资源编码已存在'
		});
	</script>
	</s:else>
</body>
</html>
