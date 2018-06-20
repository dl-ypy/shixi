Bonc.frame = {
		frameTypes : {
			'Bonc.menu.SlideMenu' : 'Bonc.frame.Frame1',
			'Bonc.menu.PopMenu' : 'Bonc.frame.Frame1',
			'Bonc.menu.TreeMenu' : 'Bonc.frame.Frame2'
		},
		/**
		 * 创建框架对象
		 * @param {Object} cfg (必选)创建的框架的构造参数
		 * @return {frame}
		 * @public
		 */
		createFrame : function(cfg){
			var jsClass = eval(Bonc.frame.frameTypes[cfg.menuType]), //框架js类型
			originSelectedNodes = Bonc.frame.getOriginSelectedNodes(cfg.root), //初始选中菜单的ID路径
			frame = new jsClass(cfg); //创建的框架对象
		    if(originSelectedNodes && originSelectedNodes.length > 1){
		    	originSelectedNodes.shift();
		        frame.menu.initSelectedNodes(originSelectedNodes);
		    }
		    return frame;
		},
		/**
		 * 框架中url路径集中处理
	     * @param {String} url (必选)菜单路径
	     * @param {String} menuId (必选)菜单的菜单ID
	     * @return {String} 当前应用中菜单访问路径
	     * @public 
		 */
		getUrl : function(url, menuId){
	    	if (url && url != null && url !== 'null'){
				return url;
	    	}else{
	        	return false;
	        }
		},
	    /**
	     * 获取菜单初始选中第一次加载选中菜单的路径
	     * @param {Object} nodeInfo (必选)节点信息
	     * @param {Array} selectedNodes (可选)选中菜单节点ID数组组成的路径
	     * @public
	     */
	    getOriginSelectedNodes : function(nodeInfo, selectedNodes){
	        if(selectedNodes == null){
	            selectedNodes = [];
	        }
	        if(null!=nodeInfo){
	        	 selectedNodes.push(nodeInfo.id);
	        	 if(nodeInfo.url && nodeInfo.url != null && nodeInfo.url !== 'null'){
	 	            return selectedNodes;
	 	        }
	 	        if(nodeInfo.children){
	 	            for(var i = 0; i < nodeInfo.children.length; i++){
	 	                if(Bonc.frame.getOriginSelectedNodes(nodeInfo.children[i], selectedNodes) !== false){
	 	                    return selectedNodes;
	 	                }
	 	            }
	 	        }
	        }
	        selectedNodes.pop();
	        return false;
	    },
		/**
		 * 上下布局方式的框架
		 */
		Frame1 : Bonc.extend(Bonc.BaseComponent, {
			clazz : 'Bonc.frame.Frame1',
			menuBar : null,
			cardWidth : 130,
			cardNumb : 20,
			menuRenderTo : function(menu){menu.appendTo(this.menuBar);},
			/**
			 * 渲染
			 * @return {void}
			 * @protected
			 */
			render : function(){
				var $ = jQuery;
				this.element = $('<div class="frame" id="frame_011"/>').appendTo(this.renderTo);
				if(this.menuBar){
					this.$top = $('<div class="top-area" style="height:32px"/>').appendTo(this.element);
					$(this.menuBar).appendTo(this.$top);
					this.menuRenderTo.call(this, $('<div class="top-menu" id="top_menu_01"/>'));
					this.$top.append('<br class="clearfloat" />');
					delete this.menuBar;
				}else{
					this.$top = $('<div class="top-area"/>').append('<div class="top-menu" id="top_menu_01"/>').append('<br class="clearfloat" />').appendTo(this.element);
				}
				this.$bottom = $('<div class="main-frame" id="main_frame_01"/>').appendTo(this.element);
				//内容展示区
				this.frameContent = new Bonc.frame.Content({
					renderTo : this.$bottom,
					cardWidth : this.cardWidth,
					cardNumb : this.cardNumb,
					titleSize : 16,
					tabOperationMode : this.tabOperationMode
				});
				//菜单
				this.menu = new Bonc.menu.HorizonMenu({
					renderTo : 'top_menu_01',
					root : this.root,
					menuType : this.menuType,
					totalLevel : this.totalLevel,
					frame: this,
					rootId : this.rootId
				});
			},
			/**
			 * 销毁对象
			 * @return {void}
			 * @public
			 */
			destroy : function(){
				this.menu.destroy();
				delete this.menu;
				this.frameContent.destroy();
				delete this.frameContent;
				this.$bottom.remove();
				delete this.$bottom();
				this.$top.remove();
				delete this.$top;
				this.element.remove();
				delete this.element;
			},
			/**
			 * 指定url更新内容区
			 * @param {string} url (必选)内容区使用url
			 * @param {string} pageName (必选)菜单名称
			 * @param {string} menuId (必选)菜单编号，用于选项卡方式展示菜单内容时，标识选项卡与菜单的对应关系
			 * @param {String} nav (必选)非选项卡方式展示内容时，菜单所在的位置导航
			 * @param {byte} opType (可选)菜单展开类型。0-内容区展开，1-打开新窗口。默认为0
			 * @return {boolean} 是否打开页面
			 */
			updateContent : function(url, pageName, menuId, nav, opType){
				return this.frameContent.updateContent(url, pageName, menuId, nav, opType);
			},
			/**
			 * 设置内容区大小
			 * @param {Object} newSize (必选)内容区的新尺寸
			 * @return {void}
			 * @public
			 */
			resize : function(newSize){
				this.element.css({'width':newSize.width + 'px','height':newSize.height + 'px'});
				this.menu.resize(newSize.width);
				var contentHeight = newSize.height - this.$top.outerHeight(true);
				this.$bottom.css({
					'width' : newSize.width + 'px',
					'height' : contentHeight + 'px'
				});
				this.frameContent.resize({
					width : newSize.width - 2,
					height : contentHeight
				});
			}
		}),
		/**
		 * 上下左右布局方式的框架
		 */
		Frame2 : Bonc.extend(Bonc.BaseComponent, {
			clazz : 'Bonc.frame.Frame2',
			cardWidth : 130,
			cardNumb : 20,
			menuRenderTo : function(menu){menu.appendTo(this.menuBar);},
			/**
			 * 渲染
			 * @return {void}
			 * @protected
			 */
			render : function(){
				var $ = jQuery, thiz = this;
				this.element = $('<div class="frame" id="frame_011"/>').appendTo(this.renderTo)
				.append(['<table height="100%" width="100%" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%;">',
				              	'<tbody>',
				        		'<tr><td colspan="3" class="top-area" valign="top" height="1px"></td>',
				        		'</tr>',
				        		'<tr>',
				        		'<td class="left-menu-area" style="width:1px;height:100%;" valign="top">',
				        		'</td>',
				        		'<td class="op-area" valign="middle" style="width:1px;"></td>',
				        		'<td class="main-frame" valign="top" style="width:100%; padding-top:1px;" id="main_frame_01">',
				        		'</td>',
				        		'</tr>',
				        		'</tbody>',
				        		'</table>'].join(''));
				if(this.menuBar){
					this.$top = this.element.find('td.top-area');
					$(this.menuBar).appendTo(this.$top);
					this.menuRenderTo.call(this, $('<div class="top-menu" id="top_menu_01"/>'));
					delete this.menuBar;
				}else{
					this.$top = this.element.find('td.top-area').append('<div class="top-menu" id="top_menu_01"/>');
				}
				if(!this.displayTreeMenu){
					this.element.addClass('treemenu-uncollapse');
				}
				this.$left = this.element.find('td.left-menu-area');
				this.$leftMenu = $('<div id="left_menu_01" class="left-menu" style="width:' + this.leftWidth + ';"/>').appendTo(this.$left);
				this.$op = this.element.find('td.op-area');
				this.$leftMenuOp = $('<span class="op-left-menu">&nbsp;</span>').appendTo(this.$op)
				.bind('mouseover', function(){
					thiz.$leftMenuOp.addClass('op-left-menu-hover');
				}).bind('mouseout', function(){
					thiz.$leftMenuOp.removeClass('op-left-menu-hover');
				}).bind('click', function(){
					if(thiz.hideLeftMenu){
						thiz.element.removeClass('left-menu-collapse');
						thiz.hideLeftMenu = false;
					}else{
						thiz.element.addClass('left-menu-collapse');
						thiz.hideLeftMenu = true;
					}
					$j(window).resize();
				});
				this.$main = this.element.find('td.main-frame');
				//内容展示区
				this.frameContent = new Bonc.frame.Content({
					renderTo : this.$main,
					cardWidth : this.cardWidth,
					cardNumb : this.cardNumb,
					titleSize : 16,
					tabOperationMode : this.tabOperationMode
				});
				//菜单
				this.menu = new Bonc.menu.HorizonMenu({
					renderTo : 'top_menu_01',
					root : this.root,
					menuType : this.menuType,
					frame : this,
					totalLevel : this.totalLevel,
					verticalMenuContainer : 'left_menu_01',
					rootId : this.rootId
				});
			},
			/**
			 * 销毁对象
			 * @return {void}
			 * @public
			 */
			destroy : function(){
				this.menu.destroy();
				delete this.menu;
				this.frameContent.destroy();
				delete this.frameContent;
				
				this.$leftMenuOp.remove();
				delete this.$leftMenuOp;
				this.$leftMenu.remove();
				delete this.$leftMenu;
				delete this.$top;
				delete this.$left;
				delete this.$op;
				delete this.$main;
				this.element.remove();
				delete this.element;
			},
			/**
			 * 指定url更新内容区
			 * @param {string} url (必选)内容区使用url
			 * @param {string} pageName (必选)菜单名称
			 * @param {string} menuId (必选)菜单编号，用于选项卡方式展示菜单内容时，标识选项卡与菜单的对应关系
			 * @param {String} nav (必选)非选项卡方式展示内容时，菜单所在的位置导航
			 * @param {byte} opType (可选)菜单展开类型。0-内容区展开，1-打开新窗口。默认为0
			 * @return {boolean} 是否打开页面
			 */
			updateContent : function(url, pageName, menuId, nav, opType){
				return this.frameContent.updateContent(url, pageName, menuId, nav, opType);
			},
			/**
			 * 显示次级菜单（显示左边树）
			 * @param {boolean} show (必选)是否显示次级菜单
			 * @return {void}
			 * @public
			 */
			showSubMenu : function(show){
				if(this.subMenuShow && show === false){
					this.element.removeClass('show-sub-menu');
					this.subMenuShow = false;
					$j(window).resize();
				}else if(!this.subMenuShow && show !== false){
					this.element.addClass('show-sub-menu');
					this.subMenuShow = true;
					$j(window).resize();
				}
			},
			/**
			 * 设置内容区大小
			 * @param {Object} newSize (必选)内容区的新尺寸
			 * @return {void}
			 * @public
			 */
			resize : function(newSize){
				this.element.css({'width':newSize.width + 'px','height':newSize.height + 'px'});
				this.menu.resize(newSize.width);
				var contentHeight = newSize.height - this.$top.outerHeight(true), //内容区高度
				lpt = parseInt(this.$leftMenu.css('padding-top'), 10), //左边树上边距
				lpb = parseInt(this.$leftMenu.css('padding-bottom'), 10); //左边树下边距
				
				this.$leftMenu.css({
					height : (contentHeight - (isNaN(lpt) ? 0 : lpt) -(isNaN(lpb) ? 0 : lpb)) + 'px'
				});
				this.frameContent.resize({
					width : newSize.width - (this.$leftMenu.css('display') == 'none' ? 0 : this.$leftMenu.outerWidth(true)) - (this.$op.css('display') == 'none' ? 0 : this.$op.outerWidth(true)) - 2,
					height : contentHeight - 1
				});
			}
		})
}