(function($) {
  $.bdt = {
    version: '0.2.0',
    
    groups: {},
    
    extend: function(addition) {
      $.extend(this.groups, addition);
    },
    
    getComponent: function(group, component) {
      return this.groups[group].components[component];
    },
    
    form: $('#container').data('epm-form'),
    
    doc: {
      $container: $('#container'),
      $components: $('#components'),
      $propertys: $('#propertys'),

      getComponentContainers: function() {
        return $('#container .com-container');
      },
      getComponents: function() {
        return $('#container .com-container.component');
      },
      getLayouts: function() {
        return $('#container .com-container.layout');
      },

      getSubDroppableAreas: function(selector) {
        var result = [];
        (function($selector) {
          var callee = arguments.callee;
          $selector.each(function() {
            var $element = $(this);
            $element.hasClass('bdt-droppable') ? result.push($element) : callee($element.children());
          });
        })(selector instanceof jQuery ? selector : $(selector));
        return result;
      },
      
      dragHelperHtml: '<a class="btn btn-default btn-xs drag"><span class="glyphicon glyphicon-move" aria-hidden="true"></span> 拖动</a>',
      removeButtonHtml: '<a class="btn btn-danger btn-xs remove"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 删除</a>',
      settingButtonHtml: '<a class="btn btn-default btn-xs setting"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 属性设置</a>',

      droppableAreaSelector: 'div.bdt-droppable'
    },
    
    load: function() {
      self = this;
      // 加载控件到列表
      $.each(self.groups, function(grpName, grpObj){
        var $group = $('<div class="components-group"><div class="title active"><span class="glyphicon arrow" aria-hidden="true"></span>' + grpObj.title + '</div></div>');
        var $ul = $('<ul></ul>');
        $.each(grpObj.components, function(comName, comObj) {
          var $li = $('<li data-bdt-group="' + grpName + '" data-bdt-name="' + comName + '">' + comObj.title + self.doc.dragHelperHtml + '</li>');
          $ul.append($li);
        });
        $group.append($ul);
    
        self.doc.$components.append($group);
      });

      self.bindComponentsEvents();
    },
    
    reload: function() {
      this.doc.$components.empty();
      this.load();
    },
    dragHtml:function(com){
    	if(com==null){
    		return com;
    	}
    	var $comContainer = $('<div class="com-container" data-bdt-com=\'' + self.serializeJSON(com) + '\'>');

        switch(com.type) {
          case 'layout':
            $comContainer.addClass('layout');
            break;
          case 'complex':
            $comContainer.addClass('component').addClass('complex');
            break;
          case 'basic':
          default:
            $comContainer.addClass('component').addClass('basic');
            $comContainer.attr('data-epm-field-name', com.defaultName).data('epm-field-name', com.defaultName);
            break;
        }
        
        var $comBtns = $('<div class="com-btns">');
        $comBtns.html(self.doc.removeButtonHtml + self.doc.dragHelperHtml + ((com.type === 'layout' || com.type === 'complex') && com.props ? self.doc.settingButtonHtml : ''));
        $comBtns.appendTo($comContainer);
        
        var $comWrapper = $('<div class="com-wrapper">');
        $comWrapper.html(((com.type != 'layout' && com.type != 'complex') ? '<label class="control-label">' + com.defaultName + '</label>' : '') + com.html);
        $comWrapper.appendTo($comContainer);
        
        return $comContainer;
    },
    dragEnd:function(com,$helper,$li){
    	if(!com.html){//去掉初始加载的div,并提取出控件div
    		var phelper = $helper.parent();
    		if(phelper.hasClass('bdt-droppable')){
        		var $helperchd = $helper.children("div");
        		$helper.after($helperchd);
        		$helper.remove();
        		$helper = $helperchd;
    		}else{
    			$helper = $helper.children("div");
    		}
    	}
        if(com.type != 'layout') {
            // 唯一与 entity 耦合处
            if($li.data('bdt-group') == 'entity') {
              $helper.addClass('entity');
              $helper.attr('data-epm-entity-fieldcode', $li.data('bdt-name'));
            }
         }   
         if(com.type === 'layout') {
        	  self.bindLayoutEvents($helper);
         } else {
        	  self.bindComponentEvents($helper, true);
         }
         
    },
    bindComponentsEvents: function() {
      self = this;
      // Bind drag and drop events
      $('.components-group > ul > li').each(function() {
        var $element = $(this);
        var com = self.getComponent($element.data("bdt-group"), $element.data("bdt-name"));
        
        $element.draggable({
          handle: "a.drag",
          connectToSortable: (com.type === 'layout' ? '#container, ' + self.doc.droppableAreaSelector : self.doc.droppableAreaSelector),
          endflag:false,
          reqflag:false,
          helper: function(event) {
        	  if(com.html){
            	  return self.dragHtml(com);
              }else{
            	  var menufield = $("<div id=\"bdt-tempcolumn\"></div>");
            	  menufield.append($(this).clone());
            	  return menufield; 
              }
          },
          start:function(event, ui){
              var _that = this;
           	  if(!com.html){
    	           	  var path = com.path+com.filename;
    	           	  requireuse.use([path],function(lod){
    	           		  var $helper = $(ui.helper);
    	           		 var $li = $(event.target);
    	           		  var cont = null;
    	           		  
    	           		  if(com.field){
    		           		  var model = lod.model(com.field);
    	           			  cont = self.dragHtml(model.component);
    	           		  }else{
    	           			  cont = self.dragHtml(lod);
    	           		  }
    	           		  if(cont!=null){
    	           			$helper.empty();
    		           		$helper.append(cont);
    	           		  }
    	           		 _that.reqflag = true;
    	           		 //如果鼠标已经松开，require加载控件文件还没完成,现在完成了
    		           	  if( _that.endflag){
    		              	  self.dragEnd(com,$helper,$li);
    		              	  _that.endflag = false;
    		              }
    	   	          });
                }else{
                	_that.reqflag = true;
                }
           },
          stop: function(event, ui) {
        	  var $helper = $(ui.helper);
              var $li = $(event.target);
              $helper.css({width:'', height:'', position:'', opacity:'', zIndex:''});
              //如果鼠标松开，require加载控件文件已经完成
              if(this.reqflag){
            	  	self.dragEnd(com,$helper,$li);
            	  	this.reqflag = false;
              }else{
              	//如果鼠标松开，require加载控件文件还没完成
            	  	this.endflag = true;
              }
          }
        });
      });

      // #container only allow drop layout components
      self.doc.$container.droppable({ accept: ".row" }).sortable({
        opacity: .5,
        handle: ".com-btns > a.drag",
        placeholder: "placeholder"
      }).disableSelection();
    
      // 控件列表收展点击事件绑定
      $('.components-group > .title').click(function() {
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
      self = this;
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
    
    bindComponentEvents: function($containerSelector, isOnDrop) {
      self = this;
      ($containerSelector instanceof jQuery ? $containerSelector : $($containerSelector)).each(function() {
        var $element = $(this);
        var $comBtns = $element.children('.com-btns');
        var $comWrapper = $element.children('.com-wrapper');
        var com = $element.data('bdt-com');
        
        if($element.hasClass('complex') && $comBtns.children('.setting').length) {
            $comBtns.children('.setting').click(function() {
              self.loadPropertys($comWrapper.children(), com, false);
            });
          } else if($element.hasClass('basic')) {
            $comWrapper.click(function() {
              self.loadPropertys($(this).children(), com);

              $('.com-container.active').removeClass('active');
              $element.addClass('active');
            });
          }
        var containerObj = $element.find(self.doc.droppableAreaSelector);
        if(containerObj.html()){
//        	self.bindDraggableEvents($element,self.doc.droppableAreaSelector);
        	self.bindDroppableAreaEvents($element.find(self.doc.droppableAreaSelector));
        }else{
        	self.bindDraggableEvents($element,self.doc.droppableAreaSelector);
        }
       

        $comBtns.children('.remove').click(function() {
          $element.remove();
          self.doc.$propertys.empty();
        });

        if(isOnDrop) {
        	//com = $.bdt.parseJSON(com);
        	alert(com.ondrop);
            com.ondrop ? self.parseFunc(com.ondrop)($element.children('.com-wrapper').children()) : null;
        }
      });
    },
    bindLayoutEvents: function($containerSelector) {
      self = this;
      ($containerSelector instanceof jQuery ? $containerSelector : $($containerSelector)).each(function() {
        var $element = $(this);
        var $comBtns = $element.children('.com-btns');
        self.bindDroppableAreaEvents($element.find(self.doc.droppableAreaSelector));
        $comBtns.children('.remove').click(function() {
          $element.remove();
          self.doc.$propertys.empty();
        });
        $comBtns.children('.setting').length ? $comBtns.children('.setting').click(function() {
          self.loadPropertys($element.children('.com-wrapper').children(), $element.data('bdt-com'), false);
        }) : null;
      });
    },
    bindDroppableAreaEvents: function($droppableArea) {
      self = this;
      ($droppableArea instanceof jQuery ? $droppableArea : $($droppableArea)).each(function() {
         var $element = $(this);
         $element.hasClass('bdt-droppable') ? $element.sortable({
          connectToSortable: "#container",
          opacity: .5,
          connectWith: $.bdt.doc.droppableAreaSelector,
          handle: ".com-btns > a.drag",
          placeholder: "placeholder"
        }).disableSelection() : null;
      });
    },
    bindDraggableEvents: function($element,connectToSortable) {
        self = this;
        $element.draggable({
            handle: "a.drag",
            connectToSortable:connectToSortable,
            height:0,
            width:0,
            helper: function(event) {
               width = $(this).width();
               height = $(this).height();
          	   return $(this);
            },
            start:function(event, ui){
            	var $helper = $(ui.helper);
            	$helper.css({width:width, height:height});
            },
            stop: function(event, ui) {
            	var $helper = $(ui.helper);
                var $li = $(event.target);
                
                if($li.data('bdt-group') == 'entity') {
                  $helper.addClass('entity');
                  $helper.attr('data-epm-entity-fieldcode', $li.data('bdt-name'));
                }
                
               // self.bindComponentEvents($helper, true);
                $helper.css({width:'', height:'', position:'', opacity:'', zIndex:'',left:'',top:''});
                
            }
          });
     },
    loadPreview: function() {
      self = this;
      $('[data-bdt-com]').each(function() {
        var $element = $(this);
        var data = $element.data('bdt-com');
        data.onload ? self.parseFunc(data.onload)($element.children('.com-wrapper').children()) : null;
      });
    },
    continueEdit: function() {
        self = this;
        $('[data-bdt-com]').each(function() {
          var $element = $(this);
          var data = $element.data('bdt-com');
          data.onEditAgain ? self.parseFunc(data.onEditAgain)($element.children('.com-wrapper').children()) : null;
        });
      },

    verifyPublish: function() {
      self = this;
      var verify = true;
      self.doc.getComponents().each(function() {
        var $comContainer = $(this);
        var com = $comContainer.data('bdt-com');
        if(com.onpublish) {
          var $comWrapper = $comContainer.children('.com-wrapper');
          var $com = $comWrapper.children();
          var supposeFunc = self.parseFunc(com.onpublish);
          var result = $.isFunction(supposeFunc) ? supposeFunc($com) : null;
          if(result === false) {
            $comWrapper.click();
            debugger;
            $comContainer.addClass('has-error').delay(3000, function() {
                $comContainer.removeClass('has-error');
            });
            return verify = false;
          }
        }
      });
      return verify;
    },

    getPublish: function() {
      this.allocateNames();
      return $('<div>').append((function($comContainers) {
        var callee = arguments.callee;
        var $return = $('<div>');
        $comContainers.each(function() {
          var $comContainer = $(this);
          var $coms = $comContainer.children('.com-wrapper').children();
          if($comContainer.hasClass('layout')) {
            // 布局递归解包，控件直接返归
            // row.col.each()
            $return.append($coms.children().each(function() {
              // inner column components unwrap
              var $col = $(this);
              $col.removeClass('ui-droppable').removeClass('ui-sortable').removeClass('bdt-droppable');
              $col.children().each(function() {
                var $colComContainer = $(this);
                $colComContainer.replaceWith(callee($colComContainer));
              });
            }));
          } else {
            var com = $comContainer.data('bdt-com');
            var $div = $('<div class="form-group">').append($coms);
            com.onload ? $div.attr('data-bdt-com-onload', com.onload) : null;
            com.onsubmit ? $div.attr('data-bdt-com-onsubmit', com.onsubmit) : null;
            com.echo ? $div.attr('data-bdt-com-echo', com.echo) : null;
            $comContainer.data('bdt-form-group-name') ? $div.attr('data-bdt-form-group-name', $comContainer.data('bdt-form-group-name')) : null;
            
            var subDroppableAreas = self.doc.getSubDroppableAreas($coms);
            if(subDroppableAreas.length) {
              $.each(subDroppableAreas, function(index, $droppableArea) {
                $droppableArea.removeClass('ui-droppable').removeClass('ui-sortable').removeClass('bdt-droppable');
                !$droppableArea.attr('class') ? $droppableArea.removeAttr('class') : null;
                $droppableArea.children().each(function() {
                  var $colComContainer = $(this);
                  $colComContainer.replaceWith(callee($colComContainer));
                });
              });
            }
            
            $return.append($div);
          }
        });
        return $return.children();
      })($('#container > .com-container').clone())).html();
    },
    
    allocateNames: function() {
      self = this;

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
            });
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
      };
      
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
            // TODO 业务分离待调整
							var $html = $(com.html);
            	var $element = $com.find(selector);
							if($html.hasClass('quote')){
								!$element.attr('name') ? $element.attr('name', 'quote_'+createUUID()) : null;
							} else {
									!$element.attr('name') ? $element.attr('name', createUUID()) : null;
							}
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
            $element = arguments[0];
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

      return $element;
    },
    
    serializeJSON: function(json) {
      return JSON.stringify(json, function(key, val) {
        return $.isFunction(val) ? val + '' : val;
      });
    },
    parseJSON: function(json) {
      self = this;
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
		          html: '<div class="row"><div class="col-md-12 bdt-droppable"></div></div>',
		          type: 'layout'
		        },
		        lyDoubleColumn: {
		          title: '双列布局',
		          html: '<div class="row"><div class="col-md-6 bdt-droppable"></div><div class="col-md-6 bdt-droppable"></div></div>',
		          type: 'layout',
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
		          html: '<div class="row"><div class="col-md-4 bdt-droppable"></div><div class="col-md-4 bdt-droppable"></div><div class="col-md-4 bdt-droppable"></div></div>',
		          type: 'layout',
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
    $.bdt.bindComponentEvents($.bdt.doc.getComponents());
    $.bdt.bindLayoutEvents($.bdt.doc.getLayouts());
  });
})(jQuery);