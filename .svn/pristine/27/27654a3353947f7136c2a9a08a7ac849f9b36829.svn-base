/**
 * 用户遍历返回的 JSON 数组按模板逐个插入 DOM 的 jQuery 插件
 * 
 * 使用此插件：
 * 一、前端：
 *     1. 在目标元素中配置如下属性：
 *       data-traversal-url     异步请求访问地址
 *       data-traversal-params  请求参数(可选)
 *       data-traversal-prompt  提示信息(可选)
 *         该属性应为一个 JSON 字符串，其中有如下属性：
 *           { "empty" : 为当数据为空的时候需要在目标元素中显示的信息 }
 *     2. 配置模板：
 *       模板为循环插入目标元素中的含有占位符的 HTML
 *       占位符格式为：$[变量]，其中变量为异步请求返回的 JSON 对象的变量名，子变量可以使用 "." 符分隔
 *       模板的存放位置可以是：
 *         (1) 目标元素节点之中
 *         (2) 作为目标元素的 data-traversal-template 属性
 *     3. 典型前端示例：
 *         <tbody data-traversal-url="地址"/>">
 *           <tr>
 *             <td>$[变量名 1]</td>
 *             <td>$[变量名 2]</td>
 *           </tr>
 *         </tbody>
 * 
 * 二、触发：
 *     触发插件有以下两种方式：
 *     1. 通过 Javascript 语句：
 *       $('符合一所述元素的选择器').traversal();
 *       其中 .traversal() jQuery 对象方法有一下几种参数组合：
 *         (1) .traversal() 根据目标元素的配置进行默认触发操作
 *         (2) .traversal([数组], [回掉函数]) 将根据传入的 JSON 数组进行触发操作，该情况下将不进行异步请求
 *         (3) .traversal([请求附加参数的 JSON 对象], [回掉函数]) 将根据目标元素的配置及附加参数一道进行默认操作
 *         (4) .traversal([url 地址], [参数对象] , [回掉函数]) 将根据传入的两个参数执行异步请求触发操作，目标元素的配置将忽略
 *     2. 在目标元素中加入 traversal 属性
 * 
 * 三、后端：
 *     后端返回数据有以下格式要求：
 *     [{"变量 1":"对象 1 数据 1","变量 2":"对象 1 数据 2"},{"变量 1":"对象 2 数据 1","变量 2":"对象 2 数据 2"}]
 * 
 * 四、事件：
 *     1. loaded.traversal    当元素数据加载完后触发一次该事件
 *       事件参数： 
 *         event 事件
 *         array 数据的 JSON 对象数组
 * 
 * 
 * @author 刘文权 2014-11-17
 *
 */
 
 /**
 * BONC Pure 框架分页 jQuery 插件
 * 此插件必需配合 traversal 插件使用
 * 
 * 使用此插件：
 * 一、前端：
 *     1. 依赖：
 *       页面中必须存在 traversal 元素，并配置了 traversal-url 属性
 *     2. 配置：
 *       在页面的合适位置加入如下固定 Div：
 *       <div pagi-for="traversal元素的选择器"></div>
 *       其中 pagi-for 属性内应存放该翻页对应的 traversal 元素
 * 
 * 二、触发：
 *     触发插件有以下两种方式：
 *     1. 默认触发：依据一中配置后不必进行任何操作
 *     2. 通过 Javascript 语句：
 *       $('符合一所述元素的选择器').pagi([请求附加参数的 JSON 对象]);
 *       将根据目标元素的配置及附加参数一道进行操作
 * 
 * 二、后端：
 *     根据 BONC Pure 框架的原有功能，需要在 Action 加上 com.bonc.commons.orm.PagiParam 类的 JavaBean
 *     返回的 JSON 需要在 traversal 原有的基础上作些变更，最顶层必须由名为 pagi 和 traversal 的属性
 *     其 JSON 格式为：
 *     {"pagi":"PagiParam对象","traversal":[原 traversal 格式要求的数组]}
 * 
 * @author 刘文权 2014-11-10
 *
 */
 
 /**
 * BONC Pure 框架排序 jQuery 插件
 * 此插件必需配合 traversal 插件使用，可选配合 pagination 插件使用
 * 
 * 使用此插件：
 * 一、前端：
 *     1. 依赖：
 *       页面中必须存在 traversal 元素，并配置了 traversal-url 属性
 *       若是配合翻页使用，则页面中需要存在 pagination 元素，详见 pagination 要求
 *     2. 典型配置：
 *       (1) 与 traversal 配合插件使用时：
 *           在 <thead> 元素中配置 sort-for 属性，该属性值为对应的 traversal 选择器
 *       (2) 与 traversal 和 pagination 配合插件使用时：
 *           在 <thead> 元素中配置 sort-for 属性，该属性值为对应的 pagination 选择器
 *           在 <thead> 元素中配置 sort-for-pagi 属性，值为 true
 *       同时，需要在 <thead> 对应的各 <th> 元素中添加 sort-col　属性，该属性值为此列所需排序的对象名
 *     3. 典型前端示例：
 *         <thead sort-for="#pagination" sort-for-pagi="true">
 *           <th sort-col="变量名 1">表头 1</th>
 *           <th sort-col="变量名 2">表头 2</th>
 *         </thead>
 * 
 * 二、触发：
 *     默认触发：依据一中配置后不必进行任何操作
 * 
 * 三、后端：
 *     根据 BONC Pure 框架的原有功能，只需要在 Action 加上 sortCol 和 sortOrder 两个 String 的 JavaBean 即可
 * 
 * @author 刘文权 2014-11-17
 *
 */
(function($) {
  // 过滤占位符的正则表达式
  var TRAVERSAL_PLACEHOLDER_REGEXP = /\$\[([^\$\[\]]*)\]/g;
  $.fn.traversal = function() {
    var args = arguments;
    return this.each(function() {
      var $element = $(this);
      
      switch(args.length) {
        case 0:
          // (Null null)
          $element.traversal($element.data('traversal-url'), $element.data('traversal-params'));
          break;
        case 1:
          switch(Object.prototype.toString.call(args[0])) {
            case '[object Array]':
              // (Array traversalArray) basic function
              var array = args[0];
              if(array.length) {
                $element.html(getHtml(array, $element.data('traversal-template')));
              } else {
                $element.html('').html($element.data('traversal-prompt').empty);
              }
              $element.trigger('loaded.traversal', [array]);
              break;
            case '[object Object]':
              // (Object additionParams)
              var params = args[0];
              $element.traversal($element.data('traversal-url'), $.extend($element.data('traversal-params'), params));
              break;
            case '[object Function]':
              var callback = args[0];
              // TODO
              callback();
          }
          break;
        case 2:
          switch(Object.prototype.toString.call(args[0])) {
            case '[object Array]':
              // (Array traversalArray, Function callBack)
              var array = args[0];
              var callback = args[1];
              $element.traversal(array);
              callback();
              break;
            case '[object Object]':
              // (Object additionParams, Function callBack)
              var params = args[0];
              var callback = args[1];
              $element.traversal(params);
              callback();
              break;
            case '[object String]':
              // (String url, Object params)
              var _url = args[0];
              var _params = args[1];
              $.getJSON(_url, _params, function(data) {
                $element.traversal(data);
              });
              break;
          }
          break;
        case 3:
          // (String url, Object params, Function callBack)
          var _url = args[0];
          var _params = args[1];
          var callback = agrs[2];
          $.getJSON(_url, _params, function(data) {
            $element.traversal(data, callback);
          });
          break;
      }
    });
  }
  
  var getHtml = function(objArray, template) {
    var html = '';
    $.each(objArray, function(index, obj) {
        html += template.replace(TRAVERSAL_PLACEHOLDER_REGEXP, function() {
      	  var result = obj;
            var key = arguments[1];
            $.each(key.split('.'),function(inx,val){
            	result = result[val];
            });
            return result;
          });
      });
    return html;
  }
  
  $.fn.pagi = function() {
    var args = arguments;
    return this.each(function() {
      var $element = $(this);
      if($element.attr('pagi-for')) {
        var $forElement = $($element.attr('pagi-for'));
        var params = args[0];
        $.getJSON($forElement.data('traversal-url'), $.extend($forElement.data('traversal-params'), params), function(data) {
          $forElement.traversal(data.traversal);
          $element.html(getPagiTools(data.pagi));
          pagiToolsBind($element);
        });
      }
    });
  }
  // 获取翻页工具栏 HTML
  var getPagiTools = function(pagi) {
    var isFirstPage = (pagi.currentPageNum == 1);
    var isLastPage = (pagi.currentPageNum == pagi.totalPageNum);
    return '\
      <nav>\
        <ul class="pager pager-theme">\
          <li class="' + (isFirstPage?'disabled':'first-page') + ' previous"><a href="javascript:;">首页</a></li>\
          <li class="' + (isFirstPage?'disabled':'prev-page') + ' previous"><a href="javascript:;">上一页</a></li>\
          <li>\
            <input class="currentPageNum form-control input-sm" type="text" value="' + pagi.currentPageNum + '" data-total-page-num="' + pagi.totalPageNum + '"/>/' + pagi.totalPageNum + '页\
          </li>\
          <li>\
            <input class="pageSize form-control input-sm" type="text" value="' + pagi.pageSize + '"/>行/页(共' + pagi.totalRowNum + '行)\
          </li>\
          <li  class="' + (isLastPage?'disabled':'last-page') + ' next"><a href="javascript:;">末页</a></li>\
          <li class="' + (isLastPage?'disabled':'next-page') + ' next"><a href="javascript:;">下一页</a></li>\
        </ul>\
      </nav>\
    ';
  }
  // 绑定翻页工具栏事件
  var pagiToolsBind = function($element) {
    var param;
    $element.find('.first-page').click(function() {
      param = {"pagiParam.pageSize":$element.find('.pageSize').val(),"pagiParam.currentPageNum":"1"};
      $element.pagi(param);
    });
    $element.find('.prev-page').click(function() {
      param = {"pagiParam.pageSize":$element.find('.pageSize').val(),"pagiParam.currentPageNum":parseInt($element.find('.currentPageNum').val())-1};
      $element.pagi(param);
    });
    $element.find('.next-page').click(function() {
      param = {"pagiParam.pageSize":$element.find('.pageSize').val(),"pagiParam.currentPageNum":parseInt($element.find('.currentPageNum').val())+1};
      $element.pagi(param);
    });
    $element.find('.last-page').click(function() {
      param = {"pagiParam.pageSize":$element.find('.pageSize').val(),"pagiParam.currentPageNum":$element.find('.currentPageNum').data('total-page-num')};
      $element.pagi(param);
    });
    $element.find('.currentPageNum, .pageSize').change(function() {
      param = {"pagiParam.pageSize":$element.find('.pageSize').val(),"pagiParam.currentPageNum":$element.find('.currentPageNum').val()};
      $element.pagi(param);
    });
  }
  
  $(function() {
    $('[data-traversal-url]').each(function() {
      var $element = $(this);
      if(!$element.data('traversal-template')) {
        $element.data('traversal-template', $element.html()).html('');
      }
    });
    $('[traversal]').each(function() {
      $(this).traversal();
    });
    $('[pagi-for]').addClass('paglink-container').each(function() {$(this).pagi();});
    $('[sort-for]').each(function() {
      var $element = $(this);
      var $forElement = $($element.attr('sort-for'));
      // 是否分页
      var forPagi = $element.attr('sort-for-pagi');
      $element.find('th[sort-col]')
        .data('sort-order', 'desc')
        .attr('title', '点击按降序排列').attr('alt', '点击按降序排列').attr('style', 'cursor:pointer')
        .append('<span class="sort"></span>')
        .click(function() {
          var $element = $(this);
          // 刷新列表
          if(forPagi){
            // 分页
            $forElement.pagi({"sortCol":$element.attr('sort-col'),"sortOrder":$element.data('sort-order')});
          } else {
            // 不分页
            $forElement
              .data('traversal-params', $.extend($forElement.data('traversal-params'), {"sortCol":$element.attr('sort-col'),"sortOrder":$element.data('sort-order')}))
              .traversal()
            ;
          }
          // 样式更改
          switch($element.data('sort-order')){
          case 'desc':
            $element.data('sort-order', 'asc')
              .attr('title', '点击按升序排列').attr('alt', '点击按升序排列')
              .find('span').removeClass('sortDesc').addClass('sortAsc')
            ;
            break;
          case 'asc':
            $element.data('sort-order', 'desc')
              .attr('title', '点击按降序排列').attr('alt', '点击按降序排列')
              .find('span').removeClass('sortAsc').addClass('sortDesc')
            ;
            break;
          }
          // 清除兄弟节点样式
          $element.siblings('[sort-col]').find('span').removeClass('sortAsc').removeClass('sortDesc');
        })
      ;
    });
  });
})(jQuery);