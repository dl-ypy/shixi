(function($) {
  $.bdt = {
    version: '0.0.1',
    
    groups: {},
    
    extend: function(addition) {
      $.extend(this.groups, addition);
    },
    
    getComponent: function(group, component) {
      return this.groups[group].components[component];
    },
    
    form: $('#container').data('epm-form'),
    
    thirdComp: new Map(),
    
    doc: {
      $container: $('#container'),
      $components: $('#components'),
      $propertys: $('#propertys'),

      getComponents: function() {
        return $('#container .com-container.component');
      },
      getComponentContainers: function() {
        return $('#container .com-container');
      },
      configHelperHtml: '<a class="btn btn-default btn-xs config"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 配置</a>',
      dragHelperHtml: '<a class="btn btn-default btn-xs drag"><span class="glyphicon glyphicon-move" aria-hidden="true"></span> 拖动</a>',
      removeButtonHtml: '<a class="btn btn-danger btn-xs remove"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 删除</a>',
      layoutSettingButtonHtml: '<a class="btn btn-default btn-xs setting"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 布局设置</a>',
      addCompHelperHtml: '<a class="btn btn-default btn-xs add-comp"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 创建业务组件</a>',
    
      colsSelector: 'div.col-md-1, div.col-md-2, div.col-md-3, div.col-md-4, div.col-md-5, div.col-md-6, div.col-md-7, div.col-md-8, div.col-md-9, div.col-md-10, div.col-md-11, div.col-md-12'
    },
    
    load: function() {
      var self = this;
      // 加载控件到列表
      for(var g in self.groups) {
        var title = self.groups[g].title;
        var components = self.groups[g].components;

        var group = $('<div class="components-group"><div class="title active"><span class="glyphicon arrow" aria-hidden="true"></span>' + title + '</div></div>');
        var ul = $('<ul></ul>');
        for(var c in components) {
          var com = components[c];
          var li = $('<li data-bdt-group="' + g + '" data-bdt-name="' + c + '"><span class="inner-span" title=' + com.title + '>' + com.title + '</span>' + self.doc.dragHelperHtml + '</li>');
          ul.append(li);
        }
        group.append(ul);
    
        self.doc.$components.append(group);
      }
      //异步加载自定义业务组件
      $.ajax({
      	url: "workspace!getSubCompList",
      	async: false,
      	dataType: "json",
      	success: function(data){
      		if(data && data.success){
				var subComponent = data.data;
				var f = subComponent.length;
				for(var i=0;i<f;i++){
					if(subComponent[i].compName){
						$("li[data-bdt-group=\"business\"]:first").after('<li data-bdt-group="' + g + '" data-bdt-name="' + subComponent[i].compName + '" data-bdt-id="' + subComponent[i].compId + '"><span class="inner-span" title=' + subComponent[i].compName + '>' + subComponent[i].compName + '</span>' + self.doc.dragHelperHtml + '</li>');
						$.bdt.thirdComp.put(subComponent[i].compId,subComponent[i].compPath);
	    			}
				}
			}
      	}
      });

      self.bindComponentsEvents();
    },
    
    reload: function() {
      this.doc.$components.empty();
      this.load();
    },

    bindComponentsEvents: function() {
      var self = this;
      // Bind drag and drop events
      // TODO 冗余代码优化
      $('.components-group > ul > li[data-bdt-group="layout"]').draggable({
        handle : 'a',
        connectToSortable: '#container, ' + self.doc.colsSelector,
        helper: function(event) {
          var com = self.getComponent($(this).data("bdt-group"), $(this).data("bdt-name"));
          return $('<div class="com-container layout" data-bdt-com=\'' + self.serializeJSON(com) + '\'><div class="com-btns">' + self.doc.removeButtonHtml + self.doc.addCompHelperHtml + self.doc.layoutSettingButtonHtml + self.doc.dragHelperHtml + '</div><div class="com-wrapper">' + com.html + '</div></div>');
        },
        stop: function(event, ui) {
          var $helper = $(ui.helper);
          $helper.css({width:'', height:'', position:'', opacity:'', zIndex:''});
          /*$helper.draggable({
            connectToSortable: '#container, ' + self.doc.colsSelector,
            stop: function(event, ui) {
              $(ui.helper).css({width:'', height:'', position:'', opacity:'', zIndex:''});
            }
          });*/
          self.bindLayoutEvents($helper);
        }
      });
      $('.components-group > ul > li[data-bdt-group!="layout"]').draggable({
        handle : 'a',
        connectToSortable: self.doc.colsSelector,
        helper: function(event) {
          if($(this).data("bdt-id")){
            //自定义业务组件
          	var com = $.bdt.thirdComp.get($(this).data("bdt-id"));
          	return $('<div class="com-container component" data-bdt-com="" data-epm-field-name="' + $(this).data("bdt-name") + '"><div class="com-btns">' + self.doc.removeButtonHtml + self.doc.dragHelperHtml + self.doc.configHelperHtml + '</div><div class="com-wrapper"><label class="control-label">' + $(this).data("bdt-name") + '</label><br/>' + com + '</div></div>');
          }else{
          	var com = self.getComponent($(this).data("bdt-group"), $(this).data("bdt-name"));
            return $('<div class="com-container component" data-bdt-com=\'' + self.serializeJSON(com) + '\' data-epm-field-name="' + com.defaultName + '"><div class="com-btns">' + self.doc.removeButtonHtml + self.doc.dragHelperHtml + self.doc.configHelperHtml + '</div><div class="com-wrapper"><label class="control-label">' + com.defaultName + '</label><br/>' + com.html + '</div></div>');
          }
        },
        stop: function(event, ui) {
          var $helper = $(ui.helper);
          var $li = $(event.target);
          $helper.css({width:'', height:'', position:'', opacity:'', zIndex:''});
          /*$helper.draggable({
            connectToSortable: self.doc.colsSelector,
            stop: function(event, ui) {
              $(ui.helper).css({width:'', height:'', position:'', opacity:'', zIndex:''});
            }
          });*/
        
          // 唯一与 entity 耦合处
          if($li.data('bdt-group') == 'entity') {
            $helper.addClass('entity');
            $helper.attr('data-epm-entity-fieldcode', $li.data('bdt-name'));
          }
        
          self.bindComponentEvents($helper, true);
        }
      });

      // #container only allow drop layout components
      self.doc.$container.droppable({ accept: ".row" }).sortable({
        opacity: .5,
        placeholder: "placeholder"
      }).disableSelection();
    
      // 控件列表收展点击事件绑定
      $('.components-group .title').click(function() {
        var $element = $(this);
        if($element.hasClass('active')) {
          $element.siblings('ul').slideUp('fast');
          $element.removeClass('active');
        } else {
          $element.siblings('ul').slideDown('fast');
          $element.addClass('active');
        }
      });
    },

    loadPropertys: function($comp, com, dynamicParam) {
      var self = this;
      var $props = self.doc.$propertys.empty();
    
      $props.append($('<h3>' + com.title + '</h3>'));

      if(dynamicParam !== false) {
        // 通用属性
        var $customTitle = dynamicParam;
        if(!$customTitle) {
          // 控件级
          var $comCtner = $comp.closest('.com-container');
          // title
          var $name = $('<div class="form-group"><label class="control-label">标题</label><input type="text" class="form-control"></div>');
          $name.find(':text').val($comCtner.data('epm-field-name') ? $comCtner.data('epm-field-name') : com.defaultName).keyup(function() {
            var value = $(this).val();
            if(value) {
              $comp.filter('label').first().text(value);
              $comCtner.data('epm-field-name', value).attr('data-epm-field-name', value);
              $name.removeClass('has-error');
            } else {
              $comp.filter('label').first().text(com.defaultName);
              $comCtner.data('epm-field-name', com.defaultName).attr('data-epm-field-name', com.defaultName);
              $name.addClass('has-error');
            }
          });
          $props.append($('<div class="property">').append($name));
          // desc
          var $desc = $('<div class="form-group"><label class="control-label">描述</label><textarea class="form-control" rows="3"></textarea></div>');
          $desc.find('textarea').val($comCtner.data('epm-field-desc') ? $comCtner.data('epm-field-desc') : '').keyup(function() {
            var value = $(this).val();
            $desc[value ? 'removeClass' : 'addClass']('has-error');
           $comCtner.attr('data-epm-field-desc', value);
          });
          $props.append($('<div class="property">').append($desc));
        } else {
          // 子单位级
          var $name = $('<div class="form-group"><label class="control-label">标题</label><input type="text" class="form-control"></div>');
          $name.find(':text').val($customTitle.text()).keyup(function() {
            var value = $(this).val();
            $customTitle.filter('label').first().text(value);
            $name[value ? 'removeClass' : 'addClass']('has-error');
          });
          $props.append($('<div class="property">').append($name));
        }
      }

      // 控件属性
      $.each(com.props, function(index, prop) {
        var $lbl = $('<label>' + prop.name + '</label>');
        var $prop = $(prop.html);
        var getFunc = self.parseFunc(prop.get);
        var setFunc = self.parseFunc(prop.set);

        var $propWrapper = $('<div class="property">').append($lbl).append($('<div>').append($prop));
        $props.append($propWrapper);
        
        getFunc($comp, $prop);
        setFunc($comp, $prop);
      });
    },
    
    bindComponentEvents: function(containerSelector, isOnDrop) {
      var self = this;
      $(containerSelector).each(function() {
        var $element = $(this);
        var com = $element.data('bdt-com');
        $element.children('.com-wrapper').click(function() {
          self.loadPropertys($(this).children(), com);

          $('.com-container.active').removeClass('active');
          $element.addClass('active');
        });
        $element.children('.com-btns').children('.remove').click(function() {
          $element.remove();
          self.doc.$propertys.empty();
        });
        //组件配置选项
        $element.children('.com-btns').children('.config').click(function() {
          $.epm.modal({
				title: "配置组件",
				body: '\
					      <div class="form-inline">\
							<label>请输入内容查询</label>\
							<div class="input-group">\
						      <input type="text" class="form-control filter-content" placeholder="Search for...">\
						      <span class="input-group-btn">\
						        <button class="btn btn-default search-btn" type="button">Go!</button>\
						      </span>\
						    </div>\
						</div>\
						<div class="scroll-bar" style="overflow-y:scroll;height:414px;width:730px;">\
							<table class=\"table table-hover\" style=\"table-layout: fixed;margin-bottom: 20px;width: initial;word-break: break-all;\">\
								<thead><tr><th>资源ID</th><th>资源名称</th><th>资源路径</th><th></th></tr></thead>\
								<tbody></tbody>\
							</table>\
						</div>\
				',
				buttons: [
					{
						value: "取消",
						style: "default",
						dismiss: true
					}
				],
				show: function($modal) {
					//更改模态框样式
					$(".modal-body").css("height",450);
					$(".modal-content").width(750);
					objectJson = {
                                  filter: "",
                                  typeId: "6"
                            	}
                	//绑定查询组件事件
            		var bindCompEvent = function($param){
            		
            			var $selectComp = $param.find("a.select");
            			var $previewComp = $param.find("a.glyphicon-eye-open");
            			var defaultContextPath = $("#contextPath").val();
            			var contextPath = $("#contextPath").val();
            			if($param.find("td[name='serverHost']").html() != "" && $param.find("td[name='contextpath']").html() != ""){
            				contextPath = $param.find("td[name='serverHost']").html() + $param.find("td[name='contextpath']").html();
            			}
            			
            			//绑定选择事件
            			$selectComp.click(function() {
	                    	var currUrl = $(this).parent().siblings("td[name='url']").html();
	                    	var fullPath = "";
	                    	if(currUrl.startWith("http") || currUrl.startWith("https") || currUrl.startWith("www")){
	                    		fullPath = currUrl;
	                    	}else if(currUrl.startWith("\/")){
	                    		fullPath = contextPath + currUrl;
	                    	}else if(!currUrl.startWith("\/")){
	                    		fullPath = contextPath + "\/" + currUrl;
	                    	}
	                    	//增加epmWorkspaceFlag,为了处理源页面包含json会出现多套框架头
	                    	if(fullPath.endWith("\/")){
                    			fullPath = fullPath.substring(0,fullPath.lastIndexOf("\/"));
                    		}
                    		if(fullPath.indexOf("epmFrameLayout") < 0){
                    			fullPath += fullPath.indexOf("?") > -1 ? "&" : "?";
	                    		fullPath += "epmFrameLayout=thin";
                    		}
	                    	
	                    	//设置iframe scr属性
	                      	$element.find("iframe").attr("src",fullPath);
	                      	//设置iframe data-resources-id属性方便选择
	                      	$element.find("iframe").attr("data-resources-id", $(this).parent().siblings("td:first").html());
	                      	//当前按钮设为选中，并且为单选
	                      	$(this).toggleClass("btn-primary active");
	                      	if($(this).hasClass("btn-primary active")){
	                      		$modal.find("a.select").not($(this)).removeClass("btn-primary active");
	                      	}
	                      	$modal.modal("hide");
	                      	//对于加载时间过长的页面展示加载中loading
	                      	var $iframe = $element.find("iframe");
	                      	var $loadingDiv = $element.find(".loadingDiv");
	                      	var $addCompTip = $element.find(".add-comp-tip");
	                      	$iframe.hide();
	                      	//隐藏添加组件提示div
	                      	$addCompTip.hide()
	                      	//调整div的位置
	                      	$loadingDiv.css("height",$iframe.height());
	                      	$loadingDiv.css("width",$iframe.width());
	                      	$loadingDiv.css("padding-top",parseInt($iframe.height()/2));
	                      	$loadingDiv.show();
	                      	
	                      	$iframe.on("load",function(){
								$loadingDiv.hide();
								$iframe.show();
	                      	});
	                    });
	                    //绑定预览事件
	                    $previewComp.click(function(){
	                    	var openUrl = "";//弹出窗口的url
							var iWidth=800; //弹出窗口的宽度;
							var iHeight=600; //弹出窗口的高度;
							var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
							var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	                    	var currUrl = $(this).parent().siblings("td[name='url']").html();
	                    	if(currUrl.startWith("http") || currUrl.startWith("https") || currUrl.startWith("www")){
	                    		openUrl = currUrl;
	                    	}else if(currUrl.startWith("\/")){
	                    		openUrl = contextPath + currUrl;
	                    	}else if(!currUrl.startWith("\/")){
	                    		openUrl = contextPath + "\/" + currUrl;
	                    	}
							window.open(openUrl,"","height="+iHeight+", width="+iWidth+", top="+iTop+", left="+iLeft); 
	                    	
	                    });
            		}
                	//获取资源数据
					$.ajax({
                      type: "post",
                      url: "workspace!getData",
                      data: {
                        "objectJson": JSON.stringify(objectJson)
                      },
                      dataType: "json",
                      async: true,
                      success: function(data, status) {
                        if (data.success) {
                          var $tbody = $modal.find("tbody");
                          $(data.data).each(function(index, item) {
                            var $entityTr = $("<tr><td>" + item.resourcesId + "</td><td name='serverHost' style='display:none;'>" + item.serverHost + "</td><td name='contextpath' style='display:none;'>" + item.contextpath + "</td><td>" + item.resourcesName + "</td><td name='url'>" + item.url + "</td><td><a class='glyphicon glyphicon-eye-open' style='margin-top: 10px;' data-toggle='tooltip' data-placement='bottom' title='预览组件'></a></td><td><a class='btn btn-default select'>选择</a></td></tr>");
                            //绑定事件
                            bindCompEvent($entityTr);
                            $tbody.append($entityTr);
                          });
                          $modal.find("table").append($tbody);
                          //初始化资源选择按钮
                          $modal.find("table tr").each(function(index,value){
                          	if($(this).find("td:first").html() == $element.find("iframe").attr("data-resources-id")){
                          		$(this).find("a.select").addClass("btn-primary active");
                          	}
                          });
                          var $scrollTo = $modal.find("a.active").closest("tr");
                          var $tab = $modal.find(".scroll-bar");
                          $modal.on("shown.bs.modal", function (e) {
                          	  if($scrollTo.offset() && $tab.offset()){
                          	  	  $modal.find(".scroll-bar").animate({scrollTop:$scrollTo.offset().top - $tab.offset().top + $tab.scrollTop()},400);
                          	  }
						  })
                          
                      	  $modal.find(".search-btn").click(function(){
                      	  	    objectJson.filter = $modal.find(".filter-content").val();
                          		$.post("workspace!getData",{"objectJson": JSON.stringify(objectJson)},function(data,status){
                          			if(data.success){
                          				$tbody.empty();
                          				$(data.data).each(function(index, item) {
				                            var $entityTr = $("<tr><td>" + item.resourcesId + "</td><td name='serverHost' style='display:none;'>" + item.serverHost + "</td><td name='contextpath' style='display:none;'>" + item.contextpath + "</td><td>" + item.resourcesName + "</td><td name='url'>" + item.url + "</td><td><a class='glyphicon glyphicon-eye-open' style='margin-top: 10px;' data-toggle='tooltip' data-placement='bottom' title='预览组件'></a></td><td><a class='btn btn-default select'>选择</a></td></tr>");
				                            //查询之后新数据重新绑定操作
				                            bindCompEvent($entityTr);
				                            $tbody.append($entityTr);
			                          });
			                          //查询之后查看是否存在当前选中src，初始化资源选择按钮
			                          $modal.find("table tr").each(function(index,value){
			                          	if($(this).find("td:first").html() == $element.find("iframe").attr("data-resources-id")){
			                          		$(this).find("a.select").addClass("btn-primary active");
			                          	}
			                          });
                          			}
                          		},"json");
                          });
                        }
                      }
                    });
				}
			});
        });
        if(isOnDrop) {
          com.ondrop ? self.parseFunc(com.ondrop)($element.children('.com-wrapper').children()) : null;
        }
      });
    },
    bindLayoutEvents: function(containerSelector) {
      var self = this;
      $(containerSelector).each(function(i,v) {
        var $element = $(this);
        var $comBtns = $element.children('.com-btns');
        $element.find(self.doc.colsSelector).droppable({
          drop: function(event, ui) {
              // TODO
          }
        }).sortable({
          opacity: .5,
          placeholder: "placeholder"
        }).disableSelection();
        $comBtns.children('.remove').click(function() {
          $element.remove();
          self.doc.$propertys.empty();
        });
        $comBtns.children('.setting').click(function() {
          self.loadPropertys($element.children('.com-wrapper').children(), $element.data('bdt-com'), false);
        });
        //创建业务组件
        $element.children('.com-btns').children('.add-comp').click(function() {
        	if($element.find(".com-wrapper").children().children().html() == ""){
        		$.epm.snackbar("暂无任何内容，请编辑之后创建...");
        		return false;
        	}
        	var contentHtml = "";
        	var repeatFlag = false;
        	$.epm.modal({
				title: "创建业务组件",
				body: '\
					<div class="form-group">\
						<label class="control-label">名称</label>\
						<input type="text" class="form-control" required>\
						<div class="alert alert-danger repeat-warning" style="display:none;" role="alert"><span class="glyphicon glyphicon-remove"></span>此名称已存在，请修改后操作...</div>\
						<div class="alert alert-success comp-success" style="display:none;" role="alert"><span class="glyphicon glyphicon-ok"></span>恭喜，此用户名可用!</div>\
					</div>\
					<div class="form-group">\
						<label class="control-label">组件描述</label>\
						<textarea class="form-control" rows="3" required></textarea>\
					</div>\
				',
				buttons: [
					{
						value: "取消",
						style: "default",
						dismiss: true
					},
					{
						value: "开始创建",
						style: "primary",
						click: function($modal) {
							var $compName = $modal.find(":text");
							var $compDesc = $modal.find("textarea");
							
							var compData = {
								compName: $compName.val(),
								compDesc: $compDesc.val(),
								compHtml: contentHtml
							};
							
							if(compData.compName && compData.compDesc && !repeatFlag) {
								$.post("workspace!createSubComp", {"compJson": JSON.stringify(compData)}, function(data,status) {
									data && data.success ? $.epm.snackbar("创建业务组件成功!") : $.epm.snackbar(data.msg);
									$modal.modal("hide");
									$.bdt.reload();
								});
							} else {
								!compData.compName ? $compName.closest(".form-group").addClass("has-error") : null;
								!compData.compDesc ? $compDesc.closest(".form-group").addClass("has-error") : null;
							}
						}
					}
				],
				show: function($modal) {
					$modal.find(":input").keyup(function() {
						$(this).closest(".form-group")[$(this).val() ? "removeClass" : "addClass"]("has-error");
					});
					$modal.find(":text").blur(function(){
						if($(this).val()){
							$.post("workspace!isHasSameName",{"compName": $(this).val()},function(data){
								if(data && data.success && data.data){
									$modal.find(".repeat-warning").slideDown("fast");
									repeatFlag = true;
								}else{
									$modal.find(".repeat-warning").hide();
									$modal.find(".comp-success").slideDown("fast");
									$modal.find(".comp-success").delay(1000).slideUp("fast");
									repeatFlag = false;
								}
							},"json");
						}
					});
					//保存时去除其中配置,拖动等按钮
					var $cloneElement = $(".com-container.component:eq(" + i + ")").parent().clone();
					$cloneElement.find(".com-btns").remove();
					if($element.find("[auto-table]").length > 0){
		            	var $cloneContainer = $cloneElement.clone();
		            	$cloneContainer.find("[auto-table]").each(function(index,value){
		            		if($(this).find("table tbody tr").length > 0){
			            		var $tr = $(this).find("table tbody tr:first");
			            		var $trObj = $("<tr></tr>");
			            		if($tr.children().first().find(":checkbox").length > 0){
			            			$trObj.append($tr.children().first());
			            		}
			            		$tr.children().each(function(){
			            			var name = $(this).attr("name") ? $(this).attr("name") : "";
			            			$trObj.append("<td align=\"left\" name=" + name  + ">$[" + name + "]</td>");
			            		});
			            	}
			            	$cloneContainer.find("[auto-table]").slice(index).find("table tbody").empty().append($trObj);
		            	});
		            	contentHtml = $cloneContainer.html();
		            }else{
		            	contentHtml = $cloneElement.html();
		            }
					/*contentHtml = $('<div>').append((function($comContainerSelector) {
				        var callee = arguments.callee;
				        var $return = $('<div>');
				        $comContainerSelector.each(function() {
				          var $comContainer = $(this);
				          var $coms = $comContainer.children('.com-wrapper').children();
				          if($comContainer.hasClass('layout')) {
				            // 布局递归解包，控件直接返归
				            // row.col.each()
				            $return.append($coms.children().each(function() {
				              // inner column components unwrap
				              var $col = $(this);
				              $col.removeClass('ui-droppable').removeClass('ui-sortable');
				              $col.children().each(function() {
				                var $colComContainer = $(this);
				                $colComContainer.replaceWith(callee($colComContainer));
				              });
				            }));
				          } else {
				            var com = $comContainer.data('bdt-com');
				            var $div = $('<div class="form-group">').append($coms);
				            //删除工作台组件初始化loading和配置div
				            $div.find(".loading-img").length > 0 ? $div.find(".loading-img").remove() : "";
				            $div.find(".add-comp-tip").length > 0 ? $div.find(".add-comp-tip").remove() : "";
				            $comContainer.data('bdt-form-group-name') ? $div.attr('data-bdt-form-group-name', $comContainer.data('bdt-form-group-name')) : null;
				            $return.append($div);
				          }
				        });
				        return $return.children();
				      })($element.clone())).html();*/
				}
			});
        });
      });
    },
    
    loadPreview: function() {
      var self = this;
      $('[data-bdt-com]').each(function() {
        var $element = $(this);
        var data = $element.data('bdt-com');
        data.onload ? self.parseFunc(data.onload)($element.children('.com-wrapper').children()) : null;
      });
    },

    getPublish: function() {
      this.allocateNames();
      return $('<div>').append((function($comContainerSelector) {
        var callee = arguments.callee;
        var $return = $('<div>');
        $comContainerSelector.each(function() {
          var $comContainer = $(this);
          var $coms = $comContainer.children('.com-wrapper').children();
          if($comContainer.hasClass('layout')) {
            // 布局递归解包，控件直接返归
            // row.col.each()
            $return.append($coms.children().each(function() {
              // inner column components unwrap
              var $col = $(this);
              $col.removeClass('ui-droppable').removeClass('ui-sortable');
              $col.children().each(function() {
                var $colComContainer = $(this);
                $colComContainer.replaceWith(callee($colComContainer));
              });
            }));
          } else {
            var com = $comContainer.data('bdt-com');
            //表格组件，发布时清空当前数据库查询数据,以及码表等实时数据
            if($comContainer.children('.com-wrapper').find("[auto-table]").length > 0){
            	if($comContainer.children('.com-wrapper').find("[auto-table]").find("table tbody tr").length > 0){
            		var $tr = $comContainer.children('.com-wrapper').find("[auto-table]").find("table tbody tr:first");
            		var $trObj = $("<tr></tr>");
            		if($tr.children().first().find(":checkbox").length > 0){
            			$trObj.append($tr.children().first());
            		}
            		$tr.children().each(function(){
            			var name = $(this).attr("name") ? $(this).attr("name") : "";
            			$trObj.append("<td align=\"left\" name=" + name  + ">$[" + name + "]</td>");
            		});
            	}
            	var $cloneComs = $coms.clone();
            	$cloneComs.find("table tbody").empty().append($trObj);
            	var $div = $('<div class="form-group">').append($cloneComs);
            }else{
            	var $div = $('<div class="form-group">').append($coms);
            }
            com.onload ? $div.attr('data-bdt-com-onload', com.onload) : null;
            com.onsubmit ? $div.attr('data-bdt-com-onsubmit', com.onsubmit) : null;
            com.echo ? $div.attr('data-bdt-com-echo', com.echo) : null;
            $comContainer.data('bdt-form-group-name') ? $div.attr('data-bdt-form-group-name', $comContainer.data('bdt-form-group-name')) : null;
            $return.append($div);
          }
        });
        return $return.children();
      })($('#container > .com-container').clone())).html();
    },
    
    allocateNames: function() {
      var self = this;

      var originalNames = [];
      self.doc.getComponents().each(function() {
        var $comContainer = $(this);
        var com = $comContainer.data('bdt-com');
        if(com.allocate) {
          var $com = $comContainer.children('.com-wrapper').children();
          var supposeFunc = self.parseFunc(com.allocate);
          var selector = $.isFunction(supposeFunc) ? supposeFunc($com) : com.allocate;
          if($.isArray(selector)) {
            $.each(selector, function(index, object) {
              // 点分割
              var name = $com.find(object.nameSelector).first().attr('name');
              if(name) {
                $.each(name.split('.'), function(index, value) {
                  originalNames.push(value);
                });
              }
            })
          } else {
            var name = $com.find(selector).attr('name');
            if(name) {
              originalNames.push(name);
            }
          }
        }
      });
      $.unique(originalNames);
        
      var createUUID = function() {
        var uuid = newId.newId(8);
        while(!($.inArray(uuid, originalNames) === -1)) {
          uuid = newId.newId(8);
        }
        return uuid;
      }
      
      self.doc.getComponents().each(function() {
        var $comContainer = $(this);
        var com = $comContainer.data('bdt-com');
        if(com.allocate) {
          var $com = $comContainer.children('.com-wrapper').children();
          var supposeFunc = self.parseFunc(com.allocate);
          var selector = $.isFunction(supposeFunc) ? supposeFunc($com) : com.allocate;
          if($.isArray(selector)) {
            // 数组因后台模型假定为自表单，简单起见，每次发布重新生成 UUID 作为新的子表单，避免后台逻辑错误
            var prefix = createUUID();
            // 组名称保存
            $com.data('bdt-form-group-name', prefix).attr('data-bdt-form-group-name', prefix);
            $.each(selector, function(index, object) {
              $com.find(object.nameSelector).attr('name', prefix + '.' + createUUID());
            });
          } else {
            var $element = $com.find(selector);
            !$element.attr('name') ? $element.attr('name', createUUID()) : null;
          }
        }
      });
    },
    
    setInputsValue: function() {
      var $element;
      var name;
      var value;
      switch(arguments.length) {
        case 2:
            name = arguments[0];
            value = arguments[1];
            break;
        case 3:
            $scope = arguments[0];
            name = arguments[1];
            value = arguments[2];
            break;
      }

      !$element ? $element = $(':input[name="' + name + '"]') : null;
      if($element.is(':checkbox') || $element.is(':radio')) {
        $element.filter('[value="' + value + '"]').prop('checked', true);
      } else if($element.is('select')) {
        $element.children('option[value="' + value + '"]').prop('selected', true);
      } else {
        $element.val(value);
      }
    },
    
    serializeJSON: function(json) {
      return JSON.stringify(json, function(key, val) {
        return $.isFunction(val) ? val + '' : val;
      });
    },
    parseJSON: function(json) {
      var self = this;
      return JSON.parse(json, function(key, val) {
        return val.indexOf && val.indexOf('function') > -1 ? self.parseFunc(val) : val;
      });
    },
    parseFunc: function(funcStr) {
      return $.type(funcStr) == 'string' && funcStr.startsWith('function') ? eval("(function(){return " + funcStr + " })()") : funcStr;
    }
  };

  $.bdt.groups = {
    layout: {
      title: '布局',
      components: {
        lySingleColumn: {
          title: '单列布局',
          html: '<div class="row"><div class="col-md-12"></div></div>'
        },
        lyDoubleColumn: {
          title: '双列布局',
          html: '<div class="row"><div class="col-md-6"></div><div class="col-md-6"></div></div>',
          props: [
            {
              name: '布局比例',
              html: '<input type="text">',
              set: function($ly, $prop) {
                var $comContainer = $ly.closest(".com-container");
                $prop.on("slide", function(slideEvt) {
                  var $cols = $ly.children();
                  for(var i = 1; i <= 12; i++) {
                    $cols.removeClass("col-md-" + i);
                  }
                  $cols.first().addClass("col-md-" + slideEvt.value);
                  $cols.last().addClass("col-md-" + (12 - slideEvt.value));
                  $comContainer.data("bdt-layout-ratio", slideEvt.value).attr("data-bdt-layout-ratio", slideEvt.value);
                });
              },
              get: function($ly, $prop) {
                var $comContainer = $ly.closest(".com-container");
                $prop.slider({
                  min: 1,
                  max: 11,
                  value: $comContainer.data("bdt-layout-ratio") ? $comContainer.data("bdt-layout-ratio") : 6,
                  tooltip_position: "bottom"
                });
              }
            }
          ]
        },
        lyTriplexColumn: {
          title: '三列布局',
          html: '<div class="row"><div class="col-md-4"></div><div class="col-md-4"></div><div class="col-md-4"></div></div>',
          props: [
            {
              name: '布局比例',
              html: '<input type="text">',
              set: function($ly, $prop) {
                var $comContainer = $ly.closest(".com-container");
                var $cols = $ly.children();
                var $l_col = $cols.eq(0);
                var $m_col = $cols.eq(1);
                var $r_col = $cols.eq(2);
                $prop.on("slide", function(slideEvt) {
                  for(var i = 0; i <= 12; i++) {
                    $cols.removeClass("col-md-" + i);
                  }
                  $l_col.addClass("col-md-" + slideEvt.value[0]);
                  $m_col.addClass("col-md-" + (slideEvt.value[1] - slideEvt.value[0]));
                  $r_col.addClass("col-md-" + (12 - slideEvt.value[1]));
                  $comContainer.data("bdt-layout-ratio", slideEvt.value).attr("data-bdt-layout-ratio", "[" + slideEvt.value + "]");
                });
              },
              get: function($ly, $prop) {
                var $comContainer = $ly.closest(".com-container");
                $prop.slider({
                  min: 1,
                  max: 11,
                  value: $comContainer.data("bdt-layout-ratio") ? $comContainer.data("bdt-layout-ratio") : [4, 8],
                  tooltip_position: "bottom"
                });
              }
            }
          ]
        }
      }
    }
  };
  
  $(function() {
    $.bdt.bindComponentEvents('#container .com-container.component');
    $.bdt.bindLayoutEvents('#container .com-container.layout');
  });
})(jQuery);