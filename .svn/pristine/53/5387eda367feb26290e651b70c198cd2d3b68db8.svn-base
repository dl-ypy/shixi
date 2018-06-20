(function($) {
  $.extend({ bonc : { tree :{
    /* 增删改操作 */
    create : function() {
      var ref = $.jstree.reference(arguments[0]);
      if(!ref){ return false; }
      var sel = ref.get_selected();
      if(!sel.length) { return false; }

      sel = sel[0];
      sel = ref.create_node(sel, {'text':'新建的节点'});
      if(sel) {
        ref.edit(sel);
      }
    },

    rename : function() {
      var ref = $.jstree.reference(arguments[0]);
      if(!ref){ return false; }
      var sel = ref.get_selected();
      if(!sel.length) { return false; }
      
      sel = sel[0];
      ref.edit(sel);
    },

    remove : function() {
      var ref = $.jstree.reference(arguments[0]);
      if(!ref){ return false; }
      var sel = ref.get_selected();
      if(!sel.length) { return false; }
      
      ref.delete_node(sel);
    },
    
    /* 编辑 */
    cut : function() {
      var inst = $.jstree.reference(arguments[0]),
      obj = inst.get_node(arguments[0]);
      if(inst.is_selected(obj)) {
        inst.cut(inst.get_selected());
      } else {
        inst.cut(obj);
      }
    },
    
    copy : function() {
      var inst = $.jstree.reference(arguments[0]),
      obj = inst.get_node(arguments[0]);
      if(inst.is_selected(obj)) {
        inst.copy(inst.get_selected());
      }
      else {
        inst.copy(obj);
      }
    },
    
    paste : function() {
      var inst = $.jstree.reference(arguments[0]),
      obj = inst.get_node(arguments[0]);
      inst.paste(obj);
    },
    
    /* 右键菜单样式 */
    config : function () {
      var default_contextmenu = {
        'create' : {
          'separator_before' : false,
          'separator_after'  : false,
          '_disabled'        : false,
          'label'            : '新建虚拟机构',
          'action'           : function (data) {
              var inst = $.jstree.reference(data.reference),
              obj = inst.get_node(data.reference);
              $element = $(inst.element.context); // 该获取jQuery对象或许会出问题
              $element.trigger('create.tree.bonc', obj);
            }
        },
        'modify' : {
          'separator_before' : false,
          'separator_after'  : false,
          '_disabled'        : false,
          'label'            : '修改',
          'action'           : function (data) {
              var inst = $.jstree.reference(data.reference),
              obj = inst.get_node(data.reference);
              $element = $(inst.element.context); // 该获取jQuery对象或许会出问题
              $element.trigger('modify.tree.bonc', obj);
            }
        },
        'remove' : {
          'separator_before' : false,
          'icon'             : false,
          'separator_after'  : true,
          '_disabled'        : false,
          'label'            : '删除',
          'action'           : function (data) {
              var inst = $.jstree.reference(data.reference),
              obj = inst.get_node(data.reference);
              $element = $(inst.element.context); // 该获取jQuery对象或许会出问题
              $element.trigger('delete.tree.bonc', obj);
            }
        },
        'ccp' : {
          'separator_before' : true,
          'icon'             : false,
          'separator_after'  : true,
          'label'            : '编辑',
          'action'           : false,
          'submenu'          : {
            
            'cut' : {
              'separator_before' : false,
              'separator_after'  : false,
              'label'            : '剪切',
              'action'           : function (data) {$.bonc.tree.cut(data.reference);}
            },
          
            /* 'copy' : {
              'separator_before' : false,
              'icon'             : false,
              'separator_after'  : false,
              'label'            : '复制',
              'action'           : function (data) {$.bonc.tree.copy(data.reference);}
            }, */
          
            'paste' : {
              'separator_before' : false,
              'icon'             : false,
              '_disabled'        : function (data) {
                  return !$.jstree.reference(data.reference).can_paste();
                },
              'separator_after'  : false,
              'label'            : '粘贴',
              'action'           : function (data) {$.bonc.tree.paste(data.reference);}
            }
            
          }
          
        },
        
        'refresh' : {
          'separator_before' : false,
          'icon'             : false,
          'separator_after'  : false,
          '_disabled'        : false,
          'label'            : '刷新',
          'action'           : function (data) {
              var inst = $.jstree.reference(data.reference),
              obj = inst.get_node(data.reference);
              inst.refresh_node(obj);
            }
        },
        'details' : {
          'separator_before' : false,
          'icon'             : false,
          'separator_after'  : false,
          '_disabled'        : false,
          'label'            : '查看详情',
          'action'           : function (data) {
              var inst = $.jstree.reference(data.reference),
              obj = inst.get_node(data.reference);
              $element = $(inst.element.context); // 该获取jQuery对象或许会出问题
              $element.trigger('details.tree.bonc', obj);
            }
        }
      };

      var _data = arguments[0];
      var _config = arguments[1];
      var _prop = arguments[2];
      var _themes = arguments[3];
      
      var _menu_items = {};
      if(_prop) {
        $.each(_prop, function(index, value) {
          _menu_items[value] = default_contextmenu[value];
        });
      }
      
      return $.extend({
        'core' : {
          'check_callback' : true,
          'strings' : {
            'Loading ...' : '正在加载，请稍候 ...',
            'nodes' : '个节点'
          },
          'themes' : _themes?_themes:{ 'variant' : 'small' },
          'data': _data,
          "multiple" : true, // 允许多选  
        },
        'dnd' : {
          'is_draggable' : false
        },
        'types' : {
          'default' : {
            'icon' : 'bonc-tree-icon default'
          }
        }, 
        'contextmenu' : {
          'select_node' : false,
          'items' : _menu_items
        },
        'plugins' : [ 'contextmenu', 'dnd', "types", 'wholerow']
      }, _config);
    }

  } } });

  $.fn.bonc_tree = function() {
    var args = arguments;
    return this.each(function() {
      var $element = $(this);
      
      switch(args.length) {
        case 0:
        // (Null null)
          break;
        case 1:
          $element.bonc_tree(args[0], null, null, null);
          break;
        case 2:
          $element.bonc_tree(args[0], args[1], null, null);
          break;
        case 3:
          $element.bonc_tree(args[0], args[1], args[2], null);
          break;
        case 4:
          switch($.type(args[0])) {
            case 'string':
            // (String url, JSON config, Array menu, JSON themes)
              var _url = args[0];
              var _data = {
                'url' : _url,
                'data' : function (node) {return { 'id' : node.id };}
              };
              $element.bonc_tree(_data, args[1], args[2], args[3]);
              break;
            case 'object':
            default:
            // (JSON data, JSON config, Array menu, JSON themes)
              var _data = args[0];
              var _config = args[1];
              var _menu = args[2];
              var _themes = args[3];
              $element.jstree($.bonc.tree.config(_data, _config, _menu, _themes));
          }
          break;
      }
    });
  }
  
  $(function() {  
    $('[bonc-tree]').each(function(index, element) {
      var $element = $(this);
      var url = $element.data('tree-url');
      var config = $element.data('tree-config');
      var menu = $element.data('tree-menu');
      var themes = $element.data('tree-themes');
      $element.bonc_tree(url, config, menu, themes);
    });
  });
})(jQuery);