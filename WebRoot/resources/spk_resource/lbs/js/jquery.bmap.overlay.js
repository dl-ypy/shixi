
/**
 * 添加覆盖物到地图
 
添加自定义覆盖物和添加内置覆盖物过程一样：

//添加自定义覆盖物
    var mySquare = new SquareOverlay(map.getCenter(), 100, "red");
    map.addOverlay(mySquare);

//为自定义覆盖物添加点击事件
    mySquare.addEventListener('click', function () {
        alert('haveTest');
    }); 
 */
/**-------
 * 地图自定义示例覆盖物-------------------------*/
	//1、定义构造函数并继承Overlay
    //定义自定义覆盖物的构造函数  
    function SquareOverlay(point, length, color) {
        this._point = point;
        this._length = length;
        this._color = color;
    }
    // 继承API的BMap.Overlay  
    SquareOverlay.prototype = new BMap.Overlay();
   //2、初始化自定义覆盖物
    // 实现初始化方法  
    SquareOverlay.prototype.initialize = function (map) {
        // 保存map对象实例  
        this._map = map;
        // 创建div元素，作为自定义覆盖物的容器  
        var div = document.createElement("div");
        div.style.position = "absolute";
        // 可以根据参数设置元素外观  
        div.style.width = this._length + "px";
        div.style.height = this._length + "px";
        div.style.background = this._color;
        div.appendChild(document.createTextNode("覆盖"));
        // 将div添加到覆盖物容器中  
        map.getPanes().markerPane.appendChild(div);
        // 保存div实例  
        this._div = div;
        // 需要将div元素作为方法的返回值，当调用该覆盖物的show、  
        // hide方法，或者对覆盖物进行移除时，API都将操作此元素。  
        return div;
    }

    //3、绘制覆盖物
    // 实现绘制方法  
    SquareOverlay.prototype.draw = function () {
        // 根据地理坐标转换为像素坐标，并设置给容器 
          var position = this._map.pointToOverlayPixel(this._point);
          this._div.style.left = 30+position.x - this._length / 2 + "px";
          this._div.style.top = position.y - this._length / 2 + "px";       
    }

    //4、显示和隐藏覆盖物
    // 实现显示方法  
    SquareOverlay.prototype.show = function () {
        if (this._div) {
            this._div.style.display = "";
        }
    }
    // 实现隐藏方法  
    SquareOverlay.prototype.hide = function () {
        if (this._div) {
            this._div.style.display = "none";
        }
    }

    //5、添加其他覆盖物方法
    //比如，改变颜色 
    SquareOverlay.prototype.yellow = function () {
        if (this._div) {
            this._div.style.background = "yellow";
        }
    }

    //6、自定义覆盖物添加事件方法
    SquareOverlay.prototype.addEventListener = function (event, fun) {
        this._div['on' + event] = fun;
    }
    /**-------
     * 地图自定义景区综合指数指标覆盖物-------------------------*/
    //1、定义构造函数并继承Overlay
    //定义自定义覆盖物的构造函数  
    /**
     * options = {
     * 		point : new BMap.Point(x,y), -----坐标位置
     * 		offset : BMap.Size(10, 20),  -----容器位置偏移量
     * 		style :{                     -----容器样式
     * 			width : "100px",
     * 			height : "100px"
     * 		},
     *    	width:"8px",                 ----柱状图宽度
   	 *	    height : "30px",             ----柱状图高度
     * 		percent:                      -----柱状图占比，范围： 1----100
     * }
     */
    function BarOverlay(options) {
    	this._opts = options;
    }
    // 继承API的BMap.Overlay  
    BarOverlay.prototype = new BMap.Overlay();
    //2、初始化自定义覆盖物
    // 实现初始化方法  
    BarOverlay.prototype.initialize = function (map) {
    	// 保存map对象实例  
    	this._map = map;
    	// 创建div元素，作为自定义覆盖物的容器  
    	var div = document.createElement("div");
    	var barWidth = this._opts.width ? this._opts.width : "10px";
    	var barHeight = this._opts.height ? this._opts.height : "40px";
    	var title = this._opts.content ;
    	//添加子元素，支持jquery方式
    	$(div).append('	<div style = "border-radius:1px;'+
    						'border:0.5px solid #ccc;'+
    						'width:'  +barWidth+';'+
    						'height:' +barHeight+';'+
    						'background-color:#222;'+
    						'border:1px solid #111;'+
    						'position:absolute;'+ 
    						'bottom:0px;'+
    						'filter:alpha(opacity=10); -moz-opacity:1; opacity:1;" >'+
    							'<div style = "border-radius:1px 1px 0 0;'+
    								'width:100%;'+
    								'height:'+this._opts.percent+'%;'+
    								'background-color:#ffc600;'+
    								'position:absolute;'+
    								'bottom:0px;">'+
    							'</div>'+
    							'<span style="white-space:nowrap; padding-left:10px; line-height:30px;">['+Number(this._opts.percent).toFixed(0)+']'+title+'<span>'+
    					'</div>'); 
    	//设置容器样式
    	div.style.position = "absolute";
    	// 可以根据参数设置元素外观  
//    	div.style.width = this._opts.style.width;
    	div.style.height = this._opts.style.height;
//    	div.style.background = this._opts.style.backgroundColor ? this._opts.style.backgroundColor : "";
    	div.style.background ='rgba(0,0,0,.4)';
    	div.style.color ='#fff';
    	div.style.borderRadius ='4px';
    	div.style.minWidth ='120px';
    	// 将div添加到覆盖物容器中  
    	map.getPanes().markerPane.appendChild(div);
    	// 保存div实例  
    	this._div = div;
    	// 需要将div元素作为方法的返回值，当调用该覆盖物的show、  
    	// hide方法，或者对覆盖物进行移除时，API都将操作此元素。  
    	return div;
    }
    
    //3、绘制覆盖物
    // 实现绘制方法  
    BarOverlay.prototype.draw = function () {
    	// 根据地理坐标转换为像素坐标，并设置给容器 
    	var position = this._map.pointToOverlayPixel(this._opts.point);
    	this._div.style.left = position.x +this._opts.offset.width+"px";
    	this._div.style.top = position.y- this._opts.offset.height+ "px"; 
    }
    
    //4、显示和隐藏覆盖物
    // 实现显示方法  
    BarOverlay.prototype.show = function () {
    	if (this._div) {
    		this._div.style.display = "";
    	}
    }
    // 实现隐藏方法  
    BarOverlay.prototype.hide = function () {
    	if (this._div) {
    		this._div.style.display = "none";
    	}
    }
    
    //5、添加其他覆盖物方法
    //比如，改变颜色 
    BarOverlay.prototype.color = function (color) {
    	if (this._div) {
    		this._div.style.background = color;
    	}
    }
    
    //6、自定义覆盖物添加事件方法
    BarOverlay.prototype.addEventListener = function (event, fun) {
    	this._div['on' + event] = fun;
    }