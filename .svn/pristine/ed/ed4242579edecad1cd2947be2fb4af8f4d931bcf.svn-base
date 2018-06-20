(function($) {
  $.extend({ bonc_select : { select_tree :{
   
    
    /* 右键菜单样式 */
    config : function () {
      var default_contextmenu = {
      };

      var _data = arguments[0];
      var _config = arguments[1];
      var _prop = arguments[2];
      var _themes = arguments[3];
      
      var _plugins = arguments[4];
      var _enMultiple = arguments[5];
      
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
          "multiple" : true // 允许多选  
        },
        'dnd' : {
          'is_draggable' : false
        },
        'types' : {
          'default' : {
            'icon' : 'bonc-tree-icon_small default'
          }
        },
        'checkbox' : {  
                // 启用级联选中  
                'three_state' : true,       
                'cascade' : '' //有三个选项，up, down, undetermined; 使用前需要先禁用three_state  
            },  
        'contextmenu' : {
          'select_node' : false,
          'items' : _menu_items
        },
        'search' : {
        	'ajax' : true
        },
        'plugins' : [ 'contextmenu', 'dnd', "types", 'wholerow','checkbox' ]
      }, _config,_plugins);
    }

  } } });

  $.fn.bonc_select_tree = function() {
    var args = arguments;
    return this.each(function() {
      var $element = $(this);
      
      switch(args.length) {
        case 0:
        // (Null null)
          break;
        case 1:
          $element.bonc_select_tree(args[0], null, null, null,null,null);
          break;
        case 2:
          $element.bonc_select_tree(args[0], args[1], null, null,null,null);
          break;
        case 3:
          $element.bonc_select_tree(args[0], args[1], args[2], null,null,null);
          break;
        case 4:
          $element.bonc_select_tree(args[0], args[1], args[2], args[3],null,null);
          break;
        case 5:
          $element.bonc_select_tree(args[0], args[1], args[2], args[4],args[5],null);
          break;
        case 6:
          switch($.type(args[0])) {
            case 'string':
            // (String url, JSON config, Array menu, JSON themes)
              var _url = args[0];
              var _data = {
                'url' : _url,
                'data' : function (node) {return { 'id' : node.id };}
              };
              $element.bonc_select_tree(_data, args[1], args[2], args[3],args[4],args[5]);
              break;
            case 'object':
            default:
            // (JSON data, JSON config, Array menu, JSON themes)
              var _data = args[0];
              var _config = args[1];
              var _menu = args[2];
              var _themes = args[3];
              var _plugins = args[4];
              var _enMultiple = args[5];
              $element.jstree($.bonc_select.select_tree.config(_data, _config, _menu, _themes, _plugins, _enMultiple));
          }
          break;
      }
    });
  }
  
  $.fn.destroy_select_tree = function(){
  		var $selector = this;
  		if($selector.parent().hasClass("select_tree")){
  			$selector.css("width",$selector.parent().width());
  			$selector.parent().replaceWith($selector);
  			$selector.next().remove();
  			
  			$selector.attr("readonly",false);
  		}
  }
  
  $.fn.bindJstreeSelect = function(params){
  	/**
  	 * 参数列表params
     * url 请求action路径，返回json数据
     * saveObj 保存值jQuery对象
  	 * width Num
  	 * height Num
  	 * fontSize 树字体大小String支持属性(xx-small x-small small medium large x-large xx-large)
  	 * enRightClick是否允许右键 boolean
  	 * enCheckbox是否包含checkbox boolean
     * enFilter是否包含搜索 boolean
     * filterHolder 搜索输入框提示文字
     * initExpandAll 点击是否展开全部，默认是
     * leafSelected 是否只允许选中叶子节点,默认false  注:
     * 				若选择true，节点勾选状态不会改变，只是影响值是否可以显示在输入框
     * callback 单击节点的回调函数,参数event,obj
  	 */
     //初始化下拉隐藏域的弹出位置和宽高
  	 var enRightClick = params.enRightClick;
  	 var enCheckbox = params.enCheckbox;
  	 var enFilter = params.enFilter;
     var fontSize = params.fontSize ? params.fontSize : "xx-small";
     var renderId = newId.newId(8);
     var pickerId = newId.newId(8);
     var searchFieldId = newId.newId(8);
     var $selector = this;
     var $saveFieldId = params.saveObj;
     var targetId = newId.newId(8);
     var priWidth = $selector.css("width");
     var $cloneObj = $selector;
     $selector.wrap("<div id=" + targetId + " class='input-group select_tree'></div>");
     $selector.after("<span class='input-group-addon' style='display:none'><span class='glyphicon glyphicon-remove' data-toggle='tooltip' data-placement='bottom' title='清除'></span></span>");
     var pickerDivStyle = "overflow:auto;border-width:1px;border-style:ridge;border-color:gray;display:none;font-size:" + fontSize + ";";
     $("#" + targetId).after("\
                            <div id=" + pickerId + " style=" + pickerDivStyle + ">\
	                              <div class='input-group' style='width:100%'>\
	                                <input type='text' class='form-control filter' id=" + searchFieldId + " style='height:30px;' placeholder='Type to search...'>\
	                              </div>\
                            <div id=" + renderId +" bonc-select-tree data-tree-url=" + params.url + " data-tree-config='{\"dnd\":{\"is_draggable\":false}}' data-tree-menu='[\"refresh\", \"details\"]' data-tree-themes='{\"variant\":\"small\"}' data-tree-plugins='{\"plugins\" : [ \"contextmenu\", \"dnd\", \"types\", \"wholerow\",\"search\",\"checkbox\"]}' data-tree-enMultiple='{\"core\" : [{\"multiple\" : false}]}'></div>\
                            </div>");
     $selector.attr("readonly",true);
     $("#" + targetId).width(priWidth);
     $selector.css("width","100%");
     //加载树
     var $tree = $("#" + renderId);
     var url = $tree.data('tree-url');
     var config = $tree.data('tree-config');
     var menu = $tree.data('tree-menu');
     var themes = $tree.data('tree-themes');
     var plugins = $tree.data('tree-plugins');//加载插件列表
     var enMultiple = $tree.data('tree-enMultiple');//是否允许多选，对应是否包含checkbox
     var pluginJson = plugins.plugins;
     //是否支持右键菜单
     if(!enRightClick){
     	pluginJson.shift();
     }
     //是否支持checkbox
     if(!enCheckbox){
     	pluginJson.pop("checkbox");
     }
     //是否支持搜索
     if(!enFilter){
     	pluginJson.pop("search");
     	$("#" + searchFieldId).parent().hide();
     }
     plugins = {"plugins" : pluginJson};
     $tree.bonc_select_tree(url, config, menu, themes, plugins, enMultiple);
     //单击节点回调
     var callback = params.callback;
     if(callback){
     	$tree.on("select_node.jstree",function(event,obj){
	     	callback(event,obj);
	     });
     }
     var picker = $('#' + pickerId);
     //查询条件提示名称
     $("#" + searchFieldId).attr("placeholder",params.filterHolder ? params.filterHolder : "Type to search...");
     picker.addClass('apm-tree-picker');
     picker.css('width', params['width'] ? params['width'] : "200px");
     picker.css('height', params['height'] ? params['height'] : "250px");
     var inputDiv = $('#' + targetId);
     picker.css('position', 'absolute');
     picker.css('background-color', 'white');
     picker.css('z-index', '2015');
     
     var treeObj = $('#' + renderId);
     treeObj.css("text-align", "left");
     
     var deleteIcon = inputDiv.find("span"); //通过find查找子元素
     var inputShow = inputDiv.find("input");
     var saveInput = $saveFieldId;
     
     //默认查询框，可以外部自定义，从而覆盖该触发方式
     if (searchFieldId && $('#' + searchFieldId)) {
       var searchFieldObj = $('#' + searchFieldId);
       var to = false;
       searchFieldObj.keyup(function() { //绑定按键事件，也可以绑定特定按键
         if (to) {
           clearTimeout(to);
         }
         to = setTimeout(function() {
           var v = searchFieldObj.val();
           treeObj.jstree(true).search(v);
         }, 250);
       });
     }
     
     //将选择值显示在输入input和隐藏input
     treeObj.on("changed.jstree", function(e, data) {
       var r = [];
       //叶子节点选中
       if(params.leafSelected){
       		var array = new Array();
       		if(params.enCheckbox){
       			array = treeObj.jstree().get_checked(true);
       		}else{
       			array = treeObj.jstree().get_selected(true);
       		}
       		var idArray = new Array();
	        var textArray = new Array();
	        if(array.length > 0){
	       		var selectedLength = array.length;
	       		for(var k=0;k<selectedLength;k++){
	       			 var currObj = array[k];
	       			 if(currObj.children.length == 0){
	   					 idArray.push(currObj.original.id);
	   					 textArray.push(currObj.original.text);
	       			 }
	       		}
	       		if(idArray.length > 0){
	       			$saveFieldId.val(idArray.join(","));
	       			r = textArray;
	       		}else{
	       			$saveFieldId.val("");
	       		}
	        }else{
	        	$saveFieldId.val("");
	        }
       }else{
       		//所有节点可选中
       		if (data && data.selected.length > 0) {
       			$saveFieldId.val(data.selected.join(","));
       			var i, j;
	            for(i = 0, j = data.selected.length; i < j; i++) {
	               r.push(data.instance.get_node(data.selected[i]).text);
	            }
       		}else{
       			$saveFieldId.val("");
       		}
       }
       if($saveFieldId.val()){
           inputShow.val(r.join(","));
           inputShow.attr("title",r.join(","));
           //单选模式下选中关闭选择树
           if(!enCheckbox){
           		picker.hide();
           		deleteIcon.hide();
		        $selector.css("border-top-right-radius","4px");
		        $selector.css("border-bottom-right-radius","4px");
           }
       }else{
	         
	         inputShow.val("");
	         saveInput.val("");
       }
     });
     
     // 绑定load事件，初始化数据显示
     treeObj.on("loaded.jstree", function(e, data) {
       if(params.initExpandAll || typeof(params.initExpandAll) == "undefined"){
       	  treeObj.jstree("open_all");  //展开全部
       	  treeObj.on("open_all.jstree",function(){
       	   var saveValue = $saveFieldId.val();
	       var checkNodeIds = typeof(saveValue) != "undefined" ?  saveValue.split(",") : [];      
	       if (!saveValue || !checkNodeIds || checkNodeIds.length === 0) {
	         deleteIcon.hide();
	         $selector.css("border-top-right-radius","4px");
	         $selector.css("border-bottom-right-radius","4px");
	         return ;
	       }
	       var r = [];
	       treeObj.find("li").each(function() {
	         for (var i = 0; i < checkNodeIds.length; i++) {
	           if ($(this).attr("id") == checkNodeIds[i]) { //如果节点的ID等于checkNodeIds[i]，表示要选中
	             r.push(data.instance.get_node(checkNodeIds[i]).text);
	             treeObj.jstree("select_node", $(this)); //选中的节点，不是check_node
	             //$(this).children("a").addClass("jstree-clicked");
	             break;
	           }
	         }
	       })
	       inputShow.val(r.join(","));
       	  });
       }
   	  //for 一次加载返回所有数据,没有open_all事件
   	  var saveValue = $saveFieldId.val();
       var checkNodeIds = typeof(saveValue) != "undefined" ?  saveValue.split(",") : [];      
       if (!saveValue || !checkNodeIds || checkNodeIds.length === 0) {
         deleteIcon.hide();
         $selector.css("border-top-right-radius","4px");
         $selector.css("border-bottom-right-radius","4px");
         return ;
       }
       var r = [];
       treeObj.find("li").each(function() {
         for (var i = 0; i < checkNodeIds.length; i++) {
           if ($(this).attr("id") == checkNodeIds[i]) { //如果节点的ID等于checkNodeIds[i]，表示要选中
             r.push(data.instance.get_node(checkNodeIds[i]).text);
             treeObj.jstree("select_node", $(this)); //选中的节点，不是check_node
             //$(this).children("a").addClass("jstree-clicked");
             break;
           }
         }
       })
       inputShow.val(r.join(","));
     });
     
     //隐藏和展示绑定
     inputDiv.on('click', function() {
       //每次点击根据当前输入框的位置定位tree div top和left属性
       var top = inputDiv.offset().top + inputDiv.outerHeight(); //获取偏移位置
	   var left = inputDiv.offset().left;
	   //picker.css('top', top); //设置绝对位置
	   //picker.css('left', left);
       picker.show();
       deleteIcon.show();
       $selector.css("border-top-right-radius","0px");
       $selector.css("border-bottom-right-radius","0px");
     });
     $('body').click(function(evt) {
       if ($(evt.target).parents('#' + targetId).length == 0
           && $(evt.target).parents('#' + pickerId).length == 0 //判断鼠标点击的上层是否是#jstree_div
           && evt.target.id != targetId
           && evt.target.id != pickerId
           && evt.target.className.indexOf("jstree") == -1) { //防止点击展开节点前面值为true
         picker.hide();
         deleteIcon.hide();
         $selector.css("border-top-right-radius","4px");
         $selector.css("border-bottom-right-radius","4px");
       }
     });
     //清空按钮
     deleteIcon.on('click', function() {
	    var treeObj = $('#' + renderId);
	    var saveField = $saveFieldId;
	    var checkNodeIds = saveField.val().split(",");      
	    if (!checkNodeIds || checkNodeIds.length === 0) {
	      return ;
	    }
	    treeObj.find("li").each(function() {
	      for (var i = 0; i < checkNodeIds.length; i++) {
	        if ($(this).attr("id") == checkNodeIds[i]) {
	          treeObj.jstree("deselect_node", $(this)); //取消选中的节点
	          break;
	        }
	      }
	    })
	    saveInput.val("");
        deleteIcon.hide();
        $selector.css("border-top-right-radius","4px");
        $selector.css("border-bottom-right-radius","4px");
     });
  }
  
  $(function() {  
    $('[bonc-select-tree]').each(function(index, element) {
      var $element = $(this);
      var url = $element.data('tree-url');
      var config = $element.data('tree-config');
      var menu = $element.data('tree-menu');
      var themes = $element.data('tree-themes');
      var plugins = $element.data('tree-plugins');
      var enMultiple = $element.data('tree-enMultiple');
      $element.bonc_select_tree(url, config, menu, themes, plugins, enMultiple);
    });
  });
})(jQuery);