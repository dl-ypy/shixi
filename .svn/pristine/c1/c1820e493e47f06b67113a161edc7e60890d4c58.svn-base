
Bonc.menu = {
	/** 菜单节点信息映射表 */
	nodeInfoMap : {},
	/**
	 * 获取菜单ID在页面中的ID值
	 * @param {string} menuId (必选)菜单ID
	 * @return {string} 菜单ID经过组装后，页面元素的ID
	 * @public
	 */
    getNodeId : function(menuId){
		return 'node_' + Bonc.menu.processSpecailChar(menuId);
	},
	/**
	 * 处理菜单ID里的特殊字符
	 * @param {String} menuId (必选)菜单ID
	 * @return {String} 处理后的菜单ID
	 * @public
	 */
	processSpecailChar : function(menuId){
		return menuId.replace(/\./g, '_');
	},
    /**
	 * 菜单
	 * 
	 * @param {JSONObject}
	 *            接受参数如下
	 * @param {String}
	 *            renderTo 渲染容器ID
	 * @param {Array}
	 *            data 扁平菜单数据
	 * @param {JSONObject}
	 *            root 树状化菜单数据
	 * @param {String}
	 *            [rootId] 菜单的顶级ID 默认为 'root'
	 * @param {String}
	 *            [parentNodeId] 菜单元素的父元素ID属性名 默认为 'parentId'
	 * @param {String}
	 *            [nodeId] 菜单元素的ID属性名 默认为 'id'
	 * @param {String}
	 *            [click] 点击菜单元素触发的操作
	 * @param {Object}
	 *            [listener] 监听，支持 beforerender、onrender、afterrender 3个事件
	 * @param {Number}
	 *			  [size] 每列显示行数
	 * @param {Number}
	 *			  [maxcolumn] 最大显示列数
	 * @extends Bonc.BaseComponent
	 * @example new Bonc.menu.PopMenu({ renderTo:'navMenuContent', data:<%=net.sf.json.JSONArray.fromObject(request.getAttribute("menuList")).toString()%>,
	 *          rootId:'<%=com.bonc.xframe.util.Constants.KB_MENU_ROOT%>',
	 *          parentNodeId:'parentId', nodeId:'id', click:function(node){ var
	 *          url = $j(node).attr('murl'); if (url && url != 'null' && url !=
	 *          '#') { url = Bonc.toFullPath(url); $j('#mainIframe').attr('src',
	 *          url); } }, listener:{ afterrender:function(menu){
	 *          menu.find('a[murl][murl!="null"][murl!=""]:first').click(); } }
	 *          });
	 */
    PopMenu: Bonc.extend(Bonc.BaseComponent, {
        clazz: 'Bonc.menu.PopMenu',
        cssClass:'pop-menu',
		nodeText:'text',
        parentNodeId:'parentId',
        rootId:'root',
        nodeId:'id',
        transition: {
            overtime: 100,
            outtime: 50
        },
        showhidedelay: {
            showdelay: 200,
            hidedelay: 50
        },
        /**
		 * 
		 * @param {Object}
		 *            data
		 * @param {Object}
		 *            lvl
		 */
        _getHTML: function(data, lvl){//data最原始的时候是横框上的那些节点的集合，lvl=0
            if (data && data.length > 0) {
                function getTotalChildren(tree){//求出来是不包含根节点的所有子节点数
                    var children = tree ? tree.children || tree : [], totalChildren = 0;
                    for (var i = 0; i < children.length; i++) {
                        totalChildren += getTotalChildren(children[i]) + 1;
                    }
                    return totalChildren;
                }
                var html = [''], size = this.size||10/** 一列大小 */, ch = 0/** 元素个数 */, totalChildren = getTotalChildren(data), maxcolumn = this.maxcolumn||5/** 最多多少栏 */, column = Math.ceil(totalChildren / size);
                if (column > maxcolumn) {
                    column = maxcolumn;
                    size = Math.ceil(totalChildren / column);
                }
                if (lvl == 1) 
                    html.push('<div><table class="column"><tbody><tr><td class="first" style="width:202px">');
                html.push('<ul class="lvl');
                html.push(lvl);
                html.push('">');
                
                for (var i = 0; i < data.length; i++) {
                    var node = data[i], parentId = node[this.parentNodeId];
                    var css = ((i == 0) ? " first " : "") + (node.children.length == 0 ? " leaf" : " collapsed ") + " lvl" + lvl + " ";
                   	html.push('<li class="');
                   	html.push(css);
                   	html.push('" lvl="');
                   	html.push(lvl);
                   	html.push('"><img src="');
                   	html.push(Bonc.Constants.BLANK_IMAGE_URL);
                   	html.push('"/>');
                   	if (lvl > 2) {
                   		for (var lvli = 2; lvli < lvl; lvli++) {
                   			html.push('&nbsp;');
                   		}
                   	}
                   	html.push('<a href="#" lvl="');
                   	html.push(lvl);
                   	html.push('" class="');
                   	html.push(css);
                   	html.push('"');                  
                    if (node.url) {
                        html.push(' murl="');
                        html.push(node.url);
                        /**添加节点的ID属性 李镇涛*/
                        var id = Bonc.menu.getNodeId(node[this.nodeId]);
                        html.push('" id="');
                        html.push(id);
                        html.push('"');
                        Bonc.menu.nodeInfoMap[id] = node;
                    }
                    /**注释data属性 李镇涛*/
                    //html.push(' jsondata=');
                    //html.push(data);
                    html.push(' toggle="');
                    html.push((node.toggle || '0'));
                    html.push('"');
                    html.push('>');
                    html.push(node.text)
                    html.push('</a>');
                    if (node.children.length > 0) {
                        html.push(this._getHTML(node.children, lvl + 1));
                    }
                    html.push('</li>');
                    if (lvl == 1) {
                        ch++;
                        ch += getTotalChildren(node);
                        if (i < data.length && (ch > size || (ch + 1 + getTotalChildren(data[i + 1])) > size)) {// 如果当前大于一半或者下一个大于一半则输出右边浮动
                            if (column > 0) {
                            	if(i+1<data.length){
                            		html.push('</ul></td><td style="width:202px"><ul>');
                            	}
                                ch = 0;
                                column--;
                            }
                        }
                    }
                }
                html.push('</ul>');
                if (lvl == 1) 
                    html.push('</td></tr></tbody></table></div>');
                return html.join('');
            }
            else {
                return '';
            }
        },
        hidemenu: function(el){
            if (this.fireEvent('beforehidemenu')) 
                el.removeClass('expanded').children('div').stop(true).hide();
        },
        showmenu: function(el){
            if (this.fireEvent('beforeshowmenu')) 
                el.addClass('expanded').children('div').slideDown(100);
        },
        render: function(){
            this.menu = jQuery('#' + this.renderTo).hide();
            this.fireEvent('beforerender', this.menu);
            if(this.data){
	            var data = Bonc.treelize({
	                data: this.data||[],
	                rootId: this.rootId,
	                parentNodeId: this.parentNodeId,
	                nodeId: this.nodeId
	            });
	            this.menu.html(this._getHTML(data, 0));
            }else if(this.root){
                this.menu.html(this._getHTML(this.root.children, 0));
            }
            if(this.cssClass){
            	this.menu.addClass(this.cssClass);
            }
            this.afterrender();
        },
        afterrender: function(){
            var menu = this.menu, thiz = this;
            menu.find('div').bgIframe({
                opacity: true
            });// 将子元素背景增加iframe挡住select
            this.menu.show();
            var lvl1 = jQuery('li.lvl0', menu);
            lvl1.each(function(){
                var el = jQuery(this);
                el.data("timers", {});
                el.hover(function(){
                    clearTimeout(el.data("timers").hidetimer);
                    clearTimeout(el.data("timers").showtimer);
                    var f = jQuery(this);
                    thiz.hidemenu(el);
                    //f.children('a').next('div').hide();
                    el.data("timers").showtimer = setTimeout(function(){
                        // 展现子菜单
                        var a = f.children('a'), p = a.position(), left = p.left, sub = a.next('div'), max = menu.position().left + menu.width();
                        if (!f.hasClass('leaf')) {
                            x = sub.find('td').length;
                            left = ((left + x * 202) < max) ? (left) : (max - x * 202);
                            if (left < 0) {
                                left = 0;
                            }
                            sub.css({
                                position: 'absolute',
                                top: (p.top + a.height() + 2) + 'px',
                                left: left + 'px',
                                width: x * 202 + 'px'
                            });
                            // 在IE6下宽度需要强制指定
                            thiz.showmenu(el);
                        }
                    }, 300);
                }, function(){
                    clearTimeout(el.data("timers").hidetimer);
                    clearTimeout(el.data("timers").showtimer);
                    el.data("timers").hidetimer = setTimeout(function(){
                        thiz.hidemenu(el);
                    }, 100);// 隐藏子菜单
                });
                el.delegate('a', 'click', function(e){
                    if (thiz.click) {
                        thiz.click(this, e);// 触发配置事件
                    }
                });
            });
            this.fireEvent('afterrender', this.menu);
        },
        /**
         * 初始选中菜单 李镇涛
         * @param {Array} selectedNodes (必选)选中菜单的路径（菜单ID数组）
         * @return {void}
         * @public
         */
    	initSelectedNodes : function(selectedNodes){
    		this.menu.find('#' + Bonc.menu.getNodeId(selectedNodes[selectedNodes.length - 1])).click();
    	}
    }),
    /**
	 * @param {JSONObject}
	 *            接受参数如下
	 * @param {String}
	 *            renderTo 渲染容器ID
	 * @param {Array}
	 *            data 菜单数据
	 * @param {String}
	 *            rootId 菜单的顶级ID 默认为 'root'
	 * @param {String}
	 *            parentNodeId 菜单元素的父元素ID属性名 默认为 'parentId'
	 * @param {String}
	 *            nodeId 菜单元素的ID属性名 默认为 'id'
	 * @param {String}
	 *            nodeText 菜单元素的描述属性名 默认为 'text'
	 * @param {String}
	 *            click 点击菜单元素触发的操作
	 * @param {Object}
	 *            listener 监听，支持 beforerender、onrender、afterrender 3个事件
	 * @param {Number}
	 */
    SlideMenu: Bonc.extend(Bonc.BaseComponent, {
        clazz: 'Bonc.menu.SlideMenu',
        cssClass:'slide-menu',
        transition: {
            overtime: 100,
            outtime: 50
        },
        showhidedelay: {
            showdelay: 200,
            hidedelay: 50
        },
        detectwebkit: navigator.userAgent.toLowerCase().indexOf("applewebkit") != -1,
        detectie6: document.all && !window.XMLHttpRequest,
        nodeText:'text',
        parentNodeId:'parentId',
        rootId:'root',
        nodeId:'id',
        _getHTML: function(data, lvl){
        	var max=data?data.length-1:-1;
            if (max >= 0) {
                var html = ['<ul class="lvl' , lvl , '">'];
                for (var i = 0; i <= max; i++) {
                    var node = data[i], parentId = node[this.parentNodeId];
                    var css = ((i == 0) ? " first " : "") + ((i == max) ? " last " : "") + (!node.children||node.children.length == 0 ? " leaf lvl"+lvl+"-leaf" : " collapsed lvl"+lvl+"-collapsed") + " lvl" + lvl + " ";
                    html.push('<li class="');
					html.push(css);
					html.push('" lvl="');
					html.push(lvl);
					html.push('">');
                    html.push('<a href="#" lvl="');
                    html.push(lvl);
                    html.push('" class="'); 
					html.push(css);
					html.push('" pid="');
					html.push(node.id);
					html.push('"');
                    if (node.url) {
						html.push(' murl="');
                        html.push(node.url||'');
						/**添加id属性，并将菜单项信息存入菜单信息映射表中 李镇涛2012/3/21*/
						var id = Bonc.menu.getNodeId(node.id);
                        html.push('" id="');
                        html.push(id);
                        html.push('"');
                        Bonc.menu.nodeInfoMap[id] = node;
                    }
					html.push('>');
					html.push(node[this.nodeText]);
					html.push('</a>');
                    if (node.children&&node.children.length > 0) {
                        html.push(this._getHTML(node.children, lvl + 1));
                    }
                    html.push('</li>');
                }
                html.push('</ul>');
                return html.join('');
            }
            else {
                return '';
            }
        },
        render: function(){
            this.menu = jQuery('#' + this.renderTo).hide();
            this.fireEvent('beforerender', this.menu);
            if(this.data){
	            var data = Bonc.treelize({
	                data: this.data,
	                rootId: this.rootId,
	                parentNodeId: this.parentNodeId,
	                nodeId: this.nodeId,
	                dataAdapt:this.dataAdapt
	            });
	            this.menu.html(this._getHTML(data, 0));
            }else if(this.root){
                this.menu.html(this._getHTML(this.root.children, 0));
            }
            if(this.cssClass){
            	this.menu.addClass(this.cssClass);
            }
            this.afterrender();
        },
        bindmenushow:function($menu){
        	var thiz=this;
        	$menu.find("ul").bgIframe({
                opacity: true
            }).parent().unbind().hover(function(e){
                var $this=jQuery(this).children('a:eq(0)').addClass('selected');
                if($this.is('.lvl0')&&$this.is('.collapsed')){
                	$this.addClass('lvl0-expanded')
                }
            }, function(e){
                jQuery(this).children('a:eq(0)').removeClass('selected lvl0-expanded');
            }).each(function(i){ 
                var $curobj = jQuery(this).css({
                    zIndex: 100 - i
                }),
                //设置子菜单显示，从而获取宽度和高度
                $subul = $curobj.find('ul:eq(0)').css({
                    display: 'block'
                });
                //
                this._dimensions = {
                    w: this.offsetWidth,
                    h: this.offsetHeight,
                    subulw: $subul.outerWidth(true),
                    subulh: $subul.outerHeight()
                };
                
                //设置顶部位置，一级子菜单设置为一级菜单的高度
                this.istopheader = $curobj.parents("ul").length == 1 ? true : false; 
                $subul.css({
                    top: this.istopheader ? ($curobj.parents("ul").outerHeight(true) + $curobj.parents("ul").position().top) + "px" : 0
                });
                
                $curobj.hover(function(e){
                    var header = this,$targetul = jQuery(header).children('ul');
                    if($targetul.length>0){
                    	if(!$targetul.data('timers')){
                        	$targetul.data('timers', {});
                        }else{
                        	clearTimeout($targetul.data('timers').hidetimer);
                        }
                        var $div = jQuery(this).parents("div"), divright = $div.position().left + $div.outerWidth(true);
                        $targetul.data('timers').showtimer = setTimeout(function(){
                            header._offsets = {
                                left: $curobj.offset().left,
                                top: $curobj.offset().top
                            };
                            var menuleft = header.istopheader ? $curobj.position().left : header._dimensions.w;
                            if (header.istopheader) {
                                if (menuleft + header._dimensions.subulw > divright) {
                                    menuleft = divright - header._dimensions.subulw;
                                }
                            }
                            else {
                                if (header._offsets.left + menuleft + header._dimensions.subulw > divright) {
                                    menuleft = -1 * $targetul.width();
                                }
                            }
                            if ($targetul.queue().length <= 1) { // if 1 or less
    																// queued
    																// animations
                                var maxW = 0;
                                $targetul.css({
                                    left: menuleft + "px"
                                    // ,width: header._dimensions.subulw + 'px'
    								// delete by liushimin 20111019
                                }).animate({
                                    height: 'show',
                                    opacity: 'show'
                                }, thiz.transition.overtime, function(){
                                    this.style.overflow = ''
                                });// 在IE6下发现动画会将元素的overflow设置为hidden.导致子菜单不能正常显示，因此强制将overflow置空
                                $targetul.find('>li>a').each(function(){
                                    var w = jQuery(this).width();
                                    maxW = maxW > w ? maxW : w;
                                });
                                if (maxW > 0) {
                                    $targetul.find('>li>a').width(maxW);
                                }
                            }
                        }, thiz.showhidedelay.showdelay);
                    }
                }, function(e){
                	var header = this,$targetul = jQuery(header).children('ul');
                	if($targetul.length>0){
	                	if(!$targetul.data('timers')){
	                    	$targetul.data('timers', {});
	                    }else{
	                    	clearTimeout($targetul.data('timers').showtimer);
	                    }
	                    $targetul.data('timers').hidetimer = setTimeout(function(){
	                        $targetul.animate({
	                            height: 'hide',
	                            opacity: 'hide'
	                        }, thiz.transition.outtime);
	                    }, thiz.showhidedelay.hidedelay);
                	}
                }) // end hover
            }).end().css({
                display: 'none',
                visibility: 'visible'
            });
        },
        updateMenu:function(id, root){
        	var menu=this.menu.find('a[pid="'+id+'"]:first');
        	menu.next('ul').replaceWith(this._getHTML(root,parseInt(menu.attr('lvl'),10)+1));
        	this.bindmenushow(menu.parent());
        },
        afterrender: function(){
            this.menu.show();
            var thiz = this, $mainmenu = this.menu.children("ul");
            if (thiz.click) {
                $mainmenu.delegate('a', 'click', function(e){
                    thiz.click(this,e);
                });
            }
            this.bindmenushow($mainmenu);
            this.fireEvent('afterrender', this.menu);
        },
        /**
         * 初始选中菜单 李镇涛
         * @param {Array} selectedNodes (必选)选中菜单的路径（菜单ID数组）
         * @return {void}
         * @public
         */
    	initSelectedNodes : function(selectedNodes){
        	this.menu.find('#' + Bonc.menu.getNodeId(selectedNodes[selectedNodes.length - 1])).click();
    	}
    }),
    Menu: Bonc.extend(Bonc.BaseComponent, {
        clazz: 'Bonc.menu.Menu',
        _getHTML: function(data, lvl){
            if (data && data.length > 0) {
                var html = '<ul class="lvl' + lvl + '">';
                for (var i = 0; i < data.length; i++) {
                    var node = data[i], parentId = node[this.parentNodeId];
                    var css = ((i == 0) ? " first " : "") + (node.children.length == 0 ? " leaf" : " collapsed ") + " lvl" + lvl + " ";
                    html += '<li class="' + css + '" lvl="' + lvl + '"><a href="#" lvl="' + lvl + '" class="' + css + '"';
                    if (node.url) {
                        html += ' url="' + node.url + '"';
                    }
					html+='menu='+jQuery.fn.toJSON(node);
                    html += '>' + node.text + '</a>';
                    if (node.children.length > 0) {
                        html += this._getHTML(node.children, lvl + 1);
                    }
                    html += '</li>';
                }
                html += '</ul>';
                return html;
            }
            else {
                return '';
            }
        },
        render: function(){
            this.menu = jQuery('#' + this.renderTo).hide();
            this.fireEvent('beforerender', this.menu);
            var data = Bonc.treelize({
                data: this.data,
                rootId: this.rootId,
                parentNodeId: this.parentNodeId,
                nodeId: this.nodeId
            });
            this.menu.html(this._getHTML(data, 0));
            this.afterrender();
        },
        afterrender: function(){
            this.menu.show();
            var thiz = this, $mainmenu = this.menu.children("ul");
            if (thiz.click) {
                $mainmenu.delegate('a', 'click', function(e){
                    thiz.click(this,e);
                });
            }
            this.fireEvent('afterrender', this.menu);
        }
    }),
    HorizonMenu : Bonc.extend(Bonc.BaseComponent, {
    	clazz : 'Bonc.menu.ClickMenu',
    	level : 1, //顶级菜单层级
    	totalLevel : 1, //上边菜单总层次
    	menuType : 'pure-menu-leftTree', //菜单类型
    	rootId : 'root', //根节点ID
    	verticalMenuContainer : '', //垂直菜单所在容器
    	nodes : null, //菜单的节点
    	allTypes : {
    		'Bonc.menu.TreeMenu' : {
    			jsClass: 'Bonc.menu.TreeMenu',
    			isHorizon : false,
    			click : function(el){
    			}
    		},
    		'Bonc.menu.PopMenu' : {
    			jsClass : 'Bonc.menu.PopMenu',
    			isHorizon : true,
    			click : function(el){
					var o = jQuery(el), nav = '', pageName=o.text(),
					node = Bonc.menu.nodeInfoMap[o.attr("id")]; //菜单信息对象
					url = Bonc.frame.getUrl(node);
					if (url) {
						while (o.length != 0) {
							nav = o.text() + ' ' + nav;
							o = o.parents('ul>li>ul:first,ul>li>div:first').first().prevAll('a');
							if (o.length != 0)
								nav = ' > ' + nav;
						}
						if(this.nav){
							nav = this.nav + ' > ' + nav;
						}
						this.frame.updateContent(url, pageName, node.id, nav, node["ext1"]);
					}
				}
    		},
    		'Bonc.menu.SlideMenu' : {
    			jsClass : 'Bonc.menu.SlideMenu',
    			isHorizon : true,
    			click : function(el){
					var o = jQuery(el), nav = '', pageName=o.text(),
					node = Bonc.menu.nodeInfoMap[o.attr("id")];
					url = Bonc.frame.getUrl(node);
					if (url) {
						while (o.length != 0) {
							nav = o.text() + ' ' + nav;
							o = o.parent().parent('ul').prevAll('a');
							if (o.length != 0)
								nav = ' > ' + nav;
						}
						if(this.nav){
							nav = this.nav + ' > ' + nav;
						}
						this.frame.updateContent(url, pageName, node.id, nav, node['ext1']);
					}
				}
    		}
    	},
    	render : function(){
    		this.parentNodeId = this.parentNodeId || 'parentId';
    		this.nodeId = this.nodeId || 'id';
    		this.nodeName = this.nodeName || 'text';
    		var $ = jQuery, thiz = this;
     		this.element = $('#' + this.renderTo); 	
			this.menuContainerId = this.renderTo;
			if(this.level <= this.totalLevel){ //水平菜单
        		this.menuContainerId = 'container_' + this.renderTo; //菜单内容区ID
        		this.leftId = 'left_' + this.renderTo; //左滚动按钮
        		this.rightId = 'right_' + this.renderTo; //右滚动按钮
         		this.element.addClass('horizon-menu').addClass('horizon-lev' + this.level);
         		if(this.level != 1 && this.level == this.totalLevel){
         			this.element.addClass('horizon-last-lev');
         		}
         		this.$menuContent = $('<div id="' + this.menuContainerId + '" class="scroll-menu-content"></div>').appendTo(this.element);
         		this.$scroll = $(['<div class="menu-scroll">',
         		                  '<span class="left" title="向左" id="',this.leftId,'"></span>',
         		                  '<span class="right" title="向右" id="', this.rightId,'"></span>',
         		                  '</div>'].join('')).appendTo(this.element);
         		this.scrollWidth = 45;
			}
     		
    		if(this.level > this.totalLevel || (this.level == this.totalLevel && this.allTypes[this.menuType].isHorizon)){
    			//显示其他类型菜单
    			var jsClass = eval(this.allTypes[this.menuType].jsClass);
    			this.menu = new jsClass({
    				renderTo : this.menuContainerId,
    				rootId : this.rootId,
    				root : this.root,
    				frame : this.frame,
    				level : this.level,
    				nav : this.nav,
    				click : function(el){
    					return thiz.allTypes[thiz.menuType].click.call(thiz.menu, el);
    				}
    			});
    		}else{
        		var nodes = this.root.children;//该组菜单的所有节点信息
        		this.nodes = [];
        		for(var i = 0; i < nodes.length; i++){
        			this.nodes.push(new Bonc.menu.HorizonMenu.Item({
        				renderTo : '#' + this.menuContainerId,
        				name : nodes[i][this.nodeName],
        				id : nodes[i][this.nodeId],
        				root : nodes[i],
        				horizonMenu : this,
        				url : nodes[i].url,
        				frame: this.frame,
        				listener : {
        					beforeselected : function(select){
        						return thiz._selectItem(this, select);
        					},
        					afterresize : function(width){
        						if(this.menu){
        							this.menu.resize(width);
        						}
        					}
        				}
        			}));
        		}
        		if(this.root.children && this.root.children.length > 0){
        			if(this.level == this.totalLevel){
        				this.$content = $('#' + this.verticalMenuContainer);
        			}else{
        				this.$content = $('<div class="horizon-menu-content"/>').insertAfter(this.element);
        			}
        		}
    		}
    	},
    	/**
    	 * 选中一个菜单节点
    	 * @param {Bonc.menu.HorizonMenu.Item} item (必选)选中操作作用的菜单节点对象
    	 * @param {boolean} select (必选)菜单选项是否选中
    	 * @return {void}
    	 * @private
    	 */
    	_selectItem : function(item, select){
			//选中菜单项
			if(select){
				var nav = item.name;
				if(this.nav){
					nav = this.nav + ' > ' + nav;
				}
				if(item.url){
					if(this.frame.updateContent(Bonc.frame.getUrl(item.root), item.name, item.id, nav, item.root['ext1']) === false){
						return false;
					}
				}
				if(!item.root.children || item.root.children.length == 0){
					return;
				}
				//显示下级菜单
				var  $ = jQuery,contentId = 'content_' + Bonc.menu.processSpecailChar(item.id);
				if(!item.$childMenu){
					item.$childMenu = $('<div id="' + contentId + '"/>').prependTo(this.$content);
					if(item.width && item.horizonMenu.level < item.horizonMenu.totalLevel){
						item.$childMenu.css('width', item.width + 'px');
					}
					item.menu = new Bonc.menu.HorizonMenu({
						renderTo : contentId,
						root : item.root,
						menuType : this.menuType,
						frame: this.frame,
						totalLevel : this.totalLevel,
						level : this.level + 1,
						nav : nav,
						verticalMenuContainer : this.verticalMenuContainer,
						rootId : this.rootId
					});
					
				}else{
					item.menu.show();
				}
				//=========================================//
				$("#"+contentId).find("a").first().click();
				//========================================//
			}else if(item.$childMenu){
				item.menu.hide();
			}
			$j(window).resize();
    	},
    	hide : function(){
    		if(this.nodes){
    			for(var i = 0; i < this.nodes.length; i++){
    				if(this.nodes[i].menu){
    					this.nodes[i].menu.hide();
    				}
    			}
    		}else if(this.level > this.totalLevel){
    			this.frame.showSubMenu(false);
    		}
    		jQuery('#' + this.renderTo).hide();
    	},
    	show : function(){
    		if(this.nodes){
    			for(var i = 0; i < this.nodes.length; i++){
    				if(this.nodes[i].menu && this.nodes[i] == Bonc.menu.HorizonMenu.selectedItems[this.nodes[i].horizonMenu.level]){
    					this.nodes[i].menu.show();
    				}
    			}
    		}else if(this.level > this.totalLevel){
    			this.frame.showSubMenu(true);
    		}
    		jQuery('#' + this.renderTo).show();
    	},
        /**
         * 初始选中菜单
         * @param {Array} selectedNodes (必选)选中菜单的路径（菜单ID数组）
         * @return {void}
         * @public
         */
    	initSelectedNodes : function(selectedNodes){
    		if(this.nodes){
    			var selectedNode = selectedNodes.shift();
    			for(var i = 0; i < this.nodes.length; i++){
    				if(this.nodes[i].id == selectedNode){
    					this.nodes[i].element.click();
    					if(this.nodes[i].menu && selectedNodes.length > 0){
    						this.nodes[i].menu.initSelectedNodes(selectedNodes);
    					}
    					return;
    				}
    			}
    		}else{
    			this.menu.initSelectedNodes(selectedNodes);
    		}
    	},
    	resize : function(width){
    		if(this.level > this.totalLevel){
    			return;
    		}
    		//设置下一级节点宽度
    		if(this.nodes){
    			for(var i = 0; i < this.nodes.length; i++){
    				this.nodes[i].resize(width);
    			}
    		}
    		var $ = jQuery;
    		//第一级菜单
    		if(this.level == 1){//第一级菜单前可能有日期
    			this.element.parent().css('width', width + 'px');
    			var $prev = this.element.prevAll();
    			if($prev.length > 0){
    				$prev.each(function(){
    					width -= $(this).outerWidth(true);
    				});
    				width -= 3;
    			}
    		}
    		this.element.css('width', width + 'px');
    		this.$menuContent.css('width', (width - this.scrollWidth) + 'px');
    		Bonc.menu.scrollMenu(this.menuContainerId, this.leftId, this.rightId);
    	}
    }),
    TreeMenu : Bonc.extend(Bonc.BaseComponent, {
    	clazz : 'Bonc.menu.TreeMenu',
    	render : function(){
    		var $ = jQuery, thiz = this;//当前处理的节点
    		this.nodeInfoMap = {};
    		
    		this.jstree = $.jstree._reference($('#' + this.renderTo).jstree({
				"json_data" : { 
		            "data" : this.getJsonNodes(this.root.children, true)
				},
				"themes" : {
					"theme" : "default",
					"dots" : false,
					"icons" : false
				},  

				"plugins" : [ "themes", "json_data" , "ui"] 
			}).bind('select_node.jstree', function(event, data){
				var $node = data.rslt.obj, //当前节点页面元素
				node = thiz.nodeInfoMap[$node.attr('id')], //节点信息
				nav = node.text, //导航文本
				$parent = false; //树节点的父节点对象
				do{
					$parent = thiz.jstree._get_parent($node);
					if($parent && $parent != -1){
						nav = thiz.nodeInfoMap[$parent.attr('id')].text + ' > ' + nav;
						$node = $parent;
					}else{
						break;
					}
				}while(true);
				if(thiz.nav){
					nav = thiz.nav + ' > ' + nav;
				}
				if(thiz.frame.updateContent(Bonc.frame.getUrl(node), node.text, node.id, nav, node['ext1']) === false){
					if(Bonc.menu.HorizonMenu.selectedItems[thiz.level]){
						thiz.clickItem(Bonc.menu.HorizonMenu.selectedItems[thiz.level].menuId);
						thiz.selectItem(node.id, false);
					}
					return false;
				}
				thiz.selectItem(node.id, true);
			}));
    		this.frame.showSubMenu(true);
    	},
    	/**
    	 * 将菜单信息解析成树的节点对象
    	 * @param {Object} nodeInfos (必选)菜单信息
    	 * @param {boolean} isFirst (可选)是否是第一个子节点。默认为false
    	 * @return {Array} 树的节点对象
    	 * @private
    	 */
    	getJsonNodes : function(nodeInfos, isFirst){
    		if(nodeInfos == null || nodeInfos.length == 0){
    			return null;
    		}
    		var nodes = [];
			for(var i = 0; i < nodeInfos.length; i++){
				var nodeId = Bonc.menu.getNodeId(nodeInfos[i].id),
				_node = {
	    				data : {
		    				title : nodeInfos[i].text,
		    				href:'javascript:void(0);'
			    		},
						attr : {id: nodeId},
			    		children : this.getJsonNodes(nodeInfos[i].children, i == 0)
					};
				if(_node.children && isFirst && i == 0){
					_node.state = 'open';
				}
				nodes.push(_node);
				this.nodeInfoMap[nodeId] = nodeInfos[i];
			}
			return nodes;
    	},
    	selectItem : function(menuId, select){
    		if(select !== false && (!Bonc.menu.HorizonMenu.selectedItems[this.level] 
    		        || Bonc.menu.HorizonMenu.selectedItems[this.level].menuId != menuId)){
    			if(Bonc.menu.HorizonMenu.selectedItems[this.level]){
    				Bonc.menu.HorizonMenu.selectedItems[this.level].menu.selectItem(Bonc.menu.HorizonMenu.selectedItems[this.level].menuId, false);
    			}
    			Bonc.menu.HorizonMenu.selectedItems[this.level] = {
    					menu : this,
    					menuId : menuId
    			};
    		}else if(select === false){
    			this.jstree.deselect_node('#' + Bonc.menu.getNodeId(menuId));
    		}
    	},
    	clickItem : function(menuId){
    		this.jstree.select_node('#' + Bonc.menu.getNodeId(menuId), false, false);
    		this.selectItem(menuId, true);
    	},
        /**
         * 初始选中菜单
         * @param {Array} selectedNodes (必选)选中菜单的路径（菜单ID数组）
         * @return {void}
         * @public
         */
    	initSelectedNodes : function(selectedNodes){
    		this.clickItem(selectedNodes[selectedNodes.length - 1]);
    	}
    }),
	/**
	 * 菜单左右滚动JS
	 *
	 * @author liushimin
	 * @param {String}
	 *            menuId 菜单ID
	 * @param {String}
	 *            leftId 左滚动控制元素ID
	 * @param {String}
	 *            rightId 右滚动控制元素ID
	 * @return none 无
	 * @version 1.0,2010-4-8
	 * @since 2.0.3
	 */
	scrollMenu : function(menuId, leftId, rightId) {
		var leftObj = jQuery('#' + leftId);
		var rightObj = jQuery('#' + rightId);
		var obj = jQuery('#' + menuId);
		if(obj.length > 0 && leftObj.length > 0 && rightId.length > 0) { w = obj[0].clientWidth, tw = obj[0].scrollWidth;
			if(w >= tw) {
				// 如果菜单无需滚动则隐藏元素
				if(obj.attr('scrollflag') != '0'){
					obj.parent().removeClass('withscroll').addClass('noscroll');
					obj.attr('scrollflag', '0');
				}
			} else {
				if(obj.attr('scrollflag') != '1'){
					obj.parent().removeClass('noscroll').addClass('withscroll');
					if(obj.attr('eventbinded') != '1'){
						leftObj.hover(function() {
							Bonc._scrollMenu(menuId, 'left');
						}, function() {
							Bonc._scrollMenu(menuId, 'stop');
						});
						rightObj.hover(function() {
							Bonc._scrollMenu(menuId, 'right');
						}, function() {
							Bonc._scrollMenu(menuId, 'stop');
						});
						obj.attr('eventbinded', '1');
					}
					obj.attr('scrollflag', '1');
				}
			}
		}
	}
};
/**
 * 水平菜单各级选中情况
 */
Bonc.menu.HorizonMenu.selectedItems = {};

Bonc.menu.HorizonMenu.Item = Bonc.extend(Bonc.BaseComponent, {
	clazz : 'Bonc.menu.HorizonMenu.Item',
	horizonMenu : null, //菜单项所在横向菜单
	/**
	 * 渲染
	 * @return {void}
	 * @protected
	 */
	render : function(){
		var $ = jQuery, thiz = this;
		this.element = $('<span class="menu-item"><span class="menu-item-1"><span class="menu-item-2">' + this.name + '</span></span></span>')
		.appendTo(this.renderTo).bind('click', function(e){
			thiz.select(true);
		}).bind('mouseover', function(){
			if(!thiz.selected){
				thiz.element.addClass('menu-item-hover');
			}
		}).bind('mouseout', function(){
			thiz.element.removeClass('menu-item-hover');
		});
	},
	/**
	 * 选中菜单项
	 * @param {boolean} select (可选)是否是选中菜单项。默认为true
	 * @return {void}
	 * @public
	 */
	select : function(select){
		if(select !== false){
			if(Bonc.menu.HorizonMenu.selectedItems[this.horizonMenu.level]){
				Bonc.menu.HorizonMenu.selectedItems[this.horizonMenu.level].select(false);
			}
			if(this.fireEvent('beforeselected', true) === false){
				if(Bonc.menu.HorizonMenu.selectedItems[this.horizonMenu.level]){
					Bonc.menu.HorizonMenu.selectedItems[this.horizonMenu.level].select(true);
				}
				return;
			}
			Bonc.menu.HorizonMenu.selectedItems[this.horizonMenu.level] = this;
			this.selected = true;
			this.element.addClass('menu-item-selected');
			this.fireEvent('afterselected', true);
		}else if(select === false){
			if(this.fireEvent('beforeselected', false) === false){
				return;
			}
			this.element.removeClass('menu-item-selected');
			this.selected = false;
			this.fireEvent('afterselected', false);
		}
	},
	/**
	 * 销毁对象
	 * @return {void}
	 */
	destroy : function(){
		this.element.remove();
		delete this.element;
	},
	/**
	 * 设置菜单节点宽度。
	 * @param {integer} width (必选)菜单新宽度
	 * @return {void}
	 * @public
	 */
	resize : function(width){
		this.width = width;
		this.fireEvent('afterresize', width);
	}
});