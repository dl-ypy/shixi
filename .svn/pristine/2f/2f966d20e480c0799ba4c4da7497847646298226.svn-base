
/**
 * 添加控件到地图
 
添加自定义控件和添加内置控件过程一样：
 
// 创建控件实例  
var myLegendControl = new LegendControl();  
// 添加到地图当中  
map.addControl(myLegendControl);
 */





/**-------
 * 地图放大等级自定义图例控件-------------------------*/
// 定义一个控件类，即function  
function ZoomControl(opts){  
    // 设置默认停靠位置和偏移量  
    this.defaultAnchor =  BMAP_ANCHOR_TOP_LEFT;  
    this.defaultOffset = new BMap.Size(10, 10);
}   

// 通过JavaScript的prototype属性继承于BMap.Control  
ZoomControl.prototype = new BMap.Control(); 

// 自定义控件必须实现initialize方法，并且将控件的DOM元素返回  
// 在本方法中创建个div元素作为控件的容器，并将其添加到地图容器中  
ZoomControl.prototype.initialize = function(map){  
    // 创建一个DOM元素  
    var div = document.createElement("div");  
    // 添加文字说明  
    div.appendChild(document.createTextNode("放大2级"));  
    // 设置样式  
    div.style.cursor = "pointer";  
    div.style.border = "1px solid gray";  
    div.style.backgroundColor = "white";  
    // 绑定事件，点击一次放大两级  
    div.onclick = function(e){  
        map.zoomTo(map.getZoom() + 2);  
    }  
    // 添加DOM元素到地图中  
    map.getContainer().appendChild(div);  
    // 将DOM元素返回  
    return div;  
} 




/**-------
 * 百度地图自定义景区游客来源图例控件-------------------------*/

//1、 定义一个控件类，即function  
function LegendControl(){  
    // 设置默认停靠位置和偏移量  
    this.defaultAnchor = BMAP_ANCHOR_BOTTOM_RIGHT;  
    this.defaultOffset = new BMap.Size(5,5); 
} 
//2、通过JavaScript的prototype属性继承于BMap.Control  
LegendControl.prototype = new BMap.Control();

//3、自定义控件必须实现initialize方法，并且将控件的DOM元素返回  
//在本方法中创建个div元素作为控件的容器，并将其添加到地图容器中  
/**
 * 初始化方法
 * @param {obj Object} map 地图对象.
 * @return 无返回值.
 */
LegendControl.prototype.initialize = function(map){  
	 // 创建一个DOM元素  
	 var div = document.createElement("div");  
	 // 添加内容
	 $(div).append('<div class="legend-text">景区客流量来源图例：</div>'+
			 '<a href="javascript:void(0);" class="legend-item legend-1">非常少：1<div class="legend-item-wrapper"><div class="legend-item-tip">非常少：少于2000人/100㎡<span class="legend-item-tip-arrow"></span></div></div></a> '+
			 '<a href="javascript:void(0);" class="legend-item legend-2">较少：2<div class="legend-item-wrapper"><div class="legend-item-tip">较少：2000-3000人/100㎡<span class="legend-item-tip-arrow"></span></div></div></a>'+
			 '<a href="javascript:void(0);" class="legend-item legend-3">一般：3<div class="legend-item-wrapper"><div class="legend-item-tip">一般：3000-5000人/100㎡<span class="legend-item-tip-arrow"></span></div></div></a> '+
			 '<a href="javascript:void(0);" class="legend-item legend-4">较多：4<div class="legend-item-wrapper"><div class="legend-item-tip">较多：5000-10000人/100㎡<span class="legend-item-tip-arrow"></span></div></div></a>'+
			 '<a href="javascript:void(0);" class="legend-item legend-5">非常多：5<div class="legend-item-wrapper"><div class="legend-item-tip">非常多：大于10000人/100㎡<span class="legend-item-tip-arrow"></span></div></div></a>');  
	 // 设置样式  
	 
	 // 绑定事件
	
	 // 添加DOM元素到地图中  
	 map.getContainer().appendChild(div);  
	 // 将DOM元素返回  
	 return div;  
} 




/**-------
 * 百度地图自定义景区旅游综合指数图例控件-------------------------*/
//1、 定义一个控件类，即function  
function LegendTourControl(){  
    // 设置默认停靠位置和偏移量  
    this.defaultAnchor = BMAP_ANCHOR_BOTTOM_RIGHT;  
    this.defaultOffset = new BMap.Size(5,5); 
} 
//2、通过JavaScript的prototype属性继承于BMap.Control  
LegendTourControl.prototype = new BMap.Control();

//3、自定义控件必须实现initialize方法，并且将控件的DOM元素返回  
//在本方法中创建个div元素作为控件的容器，并将其添加到地图容器中  
/**
 * 初始化方法
 * @param {obj Object} map 地图对象.
 * @return 无返回值.
 */
LegendTourControl.prototype.initialize = function(map){  
	 // 创建一个DOM元素  
	 var div = document.createElement("div");  
	 // 添加内容
	 $(div).append('<div class="legend-text" style = "color : #fff;">景区旅游综合指数图例：</div>'+
			 '<a href="javascript:void(0);" class="legend-item legend-1">低：30</a> '+
			 '<a href="javascript:void(0);" class="legend-item legend-3">一般：30-70</a> '+
			 '<a href="javascript:void(0);" class="legend-item legend-5">高：70</a>');  
	 // 设置样式  
	 
	 // 绑定事件
	
	 // 添加DOM元素到地图中  
	 map.getContainer().appendChild(div);  
	 // 将DOM元素返回  
	 return div;  
}  



/**-------
 * 百度地图高速公路拥堵图例自定义图例控件-------------------------*/
//1、 定义一个控件类，即function  
function LegendGControl(){  
    // 设置默认停靠位置和偏移量  
    this.defaultAnchor = BMAP_ANCHOR_BOTTOM_RIGHT;  
    this.defaultOffset = new BMap.Size(5, 5);
} 
//2、通过JavaScript的prototype属性继承于BMap.Control  
LegendGControl.prototype = new BMap.Control();

//3、自定义控件必须实现initialize方法，并且将控件的DOM元素返回  
//在本方法中创建个div元素作为控件的容器，并将其添加到地图容器中  
LegendGControl.prototype.initialize = function(map){  
	 // 创建一个DOM元素  
	 var div = document.createElement("div");  
	 // 添加内容
	 $(div).append('<div class="legend-text">高速车辆拥堵度图例：</div>'+
			 '<a href="javascript:void(0);" class="legend-item legend-1">非常舒适：1<div class="legend-item-wrapper"><div class="legend-item-tip">非常舒适：少于1辆/1km<span class="legend-item-tip-arrow"></span></div></div></a> '+
			 '<a href="javascript:void(0);" class="legend-item legend-2">舒适：2<div class="legend-item-wrapper"><div class="legend-item-tip">舒适：1-5辆/1km<span class="legend-item-tip-arrow"></span></div></div></a>'+
			 '<a href="javascript:void(0);" class="legend-item legend-3">一般：3<div class="legend-item-wrapper"><div class="legend-item-tip">一般：5-15辆/1km<span class="legend-item-tip-arrow"></span></div></div></a> '+
			 '<a href="javascript:void(0);" class="legend-item legend-4">拥挤：4<div class="legend-item-wrapper"><div class="legend-item-tip">拥挤：15-30辆/1km<span class="legend-item-tip-arrow"></span></div></div></a>'+
			 '<a href="javascript:void(0);" class="legend-item legend-5">非常拥挤：5<div class="legend-item-wrapper"><div class="legend-item-tip">非常拥挤：大于30辆/1km<span class="legend-item-tip-arrow"></span></div></div></a>');  
	 // 设置样式  
	 
	 // 绑定事件
	
	 // 添加DOM元素到地图中  
	 map.getContainer().appendChild(div);  
	 // 将DOM元素返回  
	 return div;  
}



/**-------
 * 刷新自定义图例控件-------------------------*/
//1、 定义一个控件类，即function  
function RefreshControl(){  
    // 设置默认停靠位置和偏移量  
    this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;  
    this.defaultOffset = new BMap.Size(500, 20);
} 
//2、通过JavaScript的prototype属性继承于BMap.Control  
RefreshControl.prototype = new BMap.Control();

//3、自定义控件必须实现initialize方法，并且将控件的DOM元素返回  
//在本方法中创建个div元素作为控件的容器，并将其添加到地图容器中  
RefreshControl.prototype.initialize = function(map){  
	 // 创建一个DOM元素  
	 var div = document.createElement("div");  
	 // 添加内容
	 $(div).append('<div style="z-index: 1000; position: absolute;height:25px;left:60%; top: 2px;width: 22.5%;min-width: 305px'+
			 'background: rgba(255,255,255,0.5);'+
			 'border:1px solid #39c;'+
		     'filter:alpha(opacity=50); background: #fff \9;border-radius: 5px;" >'+
			 '<a href="javascript:void(0)" class="easyui-linkbutton" title="刷新道路实时状态" iconcls="icon-berlin-refresh" onclick="bmap.onRoadReflesh()" plain="true">手动刷新</a> '+	
			 '<span >上次刷新时间：</span><span id = "txtNowTime" ></span>'+
			 '<!-- <a href="javascript:void(0)"  class="easyui-linkbutton" title="自动刷新道路实时状态" iconcls="icon-berlin-refresh" onclick="bmap.onAutoRoadReflesh()" plain="true">自动刷新</a>  -->'+
		'</div>');  
	 // 设置样式  
	 $(div).attr("id","refresh");
	 // 绑定事件
	
	 // 添加DOM元素到地图中  
	 map.getContainer().appendChild(div);  
	 // 将DOM元素返回  
	 return div;  
} 




/**-------
 * 自定义时间轴控件-------------------------*/
//1、 定义一个控件类，即function  
function TimeControl(){  
    // 设置默认停靠位置和偏移量  
    this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;  
    this.defaultOffset = new BMap.Size(250,20);
} 
//2、通过JavaScript的prototype属性继承于BMap.Control  
TimeControl.prototype = new BMap.Control();

//3、自定义控件必须实现initialize方法，并且将控件的DOM元素返回  
//在本方法中创建个div元素作为控件的容器，并将其添加到地图容器中  
TimeControl.prototype.initialize = function(map){  
	 // 创建一个DOM元素  
	 var div = document.createElement("div");  
	 // 添加内容
	 $(div).append('<div id="time-control-btns"><a data-pace="1" data-minutes="480" id="time-control-8hours" class="time-control-btn" href="javascript:void(0)">查看近8小时动态图</a>'+
			 '<a data-pace="20" data-minutes="10080" id="time-control-week" class="time-control-btn active" href="javascript:void(0)" >查看近1周动态图</a></div> '+
			 '<div style="display: block;" class="time-panel-week" id="time-panel">'+
			 '<div class="time-panel-title"><span class="time-panel-date">2015.8.3</span><span class="time-panel-time">19:18</span></div>'+
			 '<div class="time-panel-control"><div class="time-panel-progress-container"><div class="time-panel-progress-bar"><span style="left: 244px;" class="time-panel-progress"></span></div>'+
			 '<div class="time-panel-progress-text"><span class="time-panel-progress-tick">7.28</span><span class="time-panel-progress-tick">7.29</span><span class="time-panel-progress-tick">7.30</span>'+
			 '<span class="time-panel-progress-tick">7.31</span><span class="time-panel-progress-tick">8.1</span><span class="time-panel-progress-tick">8.2</span><span class="time-panel-progress-tick">8.3</span></div></div>'+
			 '<div class="time-panel-btn play"></div></div></div>');  
	 // 设置样式  
	 $(div).attr("id","time-control");
	 // 绑定事件
	 // 添加DOM元素到地图中  
	 map.getContainer().appendChild(div);  
	 // 将DOM元素返回  
	 return div;  
}  