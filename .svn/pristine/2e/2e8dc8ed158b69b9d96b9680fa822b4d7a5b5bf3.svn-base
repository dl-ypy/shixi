/**
 * Baidu地图v2.0版本API jQuery插件封装
 * 
 * @author wangsp
 * @date 2015-08-201
 * @version 0.1
 */
(function($) {
	
    $.fn.baiduMap = function(options) {
        var me = this;
        var opts = $.extend({}, $.fn.baiduMap.defaults, options);
        $.fn.baiduMap.options = opts;
        var mapObj = new BMap.Map(me.attr("id"),{mapType: opts.mapType}); //创建地图对象
        
        if(!opts.centerCity){
        	var point = new BMap.Point(opts.x, opts.y); // 创建中心点坐标
            mapObj.centerAndZoom(point, opts.zoom); // 初始化地图，设置中心点坐标和地图级别
        }else{
        	 mapObj.centerAndZoom(opts.centerCity, opts.zoom); // 初始化地图，设置中心点坐标和地图级别
        }

		//滚动轮设置
        if (opts.enableScrollWheelZoom) {
            mapObj.enableScrollWheelZoom(); 
        }
		//拖拽设置
		if (!opts.enableDragging) {
            mapObj.disableDragging(); 
        }
		//双击放大设置
		if (!opts.enableDoubleClickZoom) {
            mapObj.disableDoubleClickZoom(); 
        }
		//键盘操作设置。键盘的上、下、左、右键可连续移动地图。
		//同时按下其中两个键可使地图进行对角移动。PgUp、PgDn、Home和End键会使地图平移其1/2的大小。+、-键会使地图放大或缩小一级。 
		if (opts.enableKeyboard) {
            mapObj.enableKeyboard(); 
        }
		//惯性拖拽设置
		if (opts.enableInertialDragging) {
            mapObj.enableInertialDragging(); 
        }
		//缩放控件
        if (opts.enableNavigationControl) {
            mapObj.addControl(new BMap.NavigationControl());
        }

        if (opts.enableOverviewMapControl) {
            mapObj.addControl(new BMap.OverviewMapControl());
        }
		//比例尺控件
        if (opts.enableScaleControl) {
            mapObj.addControl(new BMap.ScaleControl());
        }
		//地图类型控件
        if (opts.enableMapTypeControl) {
            mapObj.addControl(new BMap.MapTypeControl());
        }
		//版权控件
        if (opts.enableCopyrightControl) {
            var cr = new BMap.CopyrightControl({
                anchor : opts.copyrightAnchor,
                offset : new BMap.Size(1200, 25)
            });
            mapObj.addControl(cr);
            var bs = mapObj.getBounds();
            cr.addCopyright({
                id : 1,
                content : opts.copyrightContent,
                bounds : bs
            });
        }
		//
        $.fn.baiduMap.mapObj = mapObj;
        return $.fn.baiduMap;
    };
    /*
     * 默认参数设置
     */
    $.fn.baiduMap.defaults = {
        mapType : BMAP_NORMAL_MAP,
        x : 104.11412925348, // 中心点 x坐标
        y : 37.550339474591, // 中心点y坐标
        zoom : 8, // 缩放级别
        enableScrollWheelZoom : true, // 启用鼠标滚轮缩放
		enableDragging :true,// 启用鼠标拖拽
		enableDoubleClickZoom :true,//启用双击放大
		enableKeyboard :true,//启用键盘操作
		enableInertialDragging :true,//启用惯性拖拽
        enableNavigationControl : true, // 启用平移缩放控件
        enableOverviewMapControl : false, // 启用缩略地图控件
        enableScaleControl : true, // 比例尺控件
        enableMapTypeControl : false, // 切换地图类型的控件
        enableCopyrightControl:false,// 版权信息控件
        copyrightContent : '<a href=\'http://www.bonc.com.cn\' style=\'font-size:11px;color:red;text-decoration:none;\' target=\'_blank\'>www.bonc.com.cn</a>',// 版权信息
        copyrightAnchor : BMAP_ANCHOR_BOTTOM_RIGHT // 版权信息显示的位置
    };
    //-------------------控件-----------------------------------------------
    
   //------------------------------------------------------------------
    /**
     * 添加右键菜单
     * 
     * @param menuOptions
     *            菜单配置项，值为对象数组，每个对象有text,callback两个参数，text值为‘-’时表示菜单项的分隔符<br/>
     *            exp. [{text:'',callback:function(point){}}]
     * @returns BMap.ContextMenu
     */
    $.fn.baiduMap.addContextMenu = function(menuOptions) {
		var mapObj = $.fn.baiduMap.mapObj;
        var contextMenu = new BMap.ContextMenu(); //创建菜单项
        for ( var i = 0; i < menuOptions.length; i++) {
            if (menuOptions[i].text == "-") {
                // 添加分隔线
                contextMenu.addSeparator();
            } else {
                contextMenu.addItem(new BMap.MenuItem(menuOptions[i].text,
                        menuOptions[i].callback)); 
            }
        }
        mapObj.addContextMenu(contextMenu); //添加菜单项
        return contextMenu;
    };
    
	//------------------------------------------------------------------
    /**
     * 新建一个图标
     * 
     * @param options
     *            图标属性 exp .{url:图标路径,width:宽度,height:高度}
     * @returns BMap.Icon
     */
    $.fn.baiduMap.createIcon = function(options) {
        return new BMap.Icon(options.url, new BMap.Size(options.width,
                options.height));
    };
    /**
     * 新建一个文本标注
     * 
     * @param options
     *            标注的属性 exp. {title:标题,position:地理位置,offset:偏移量,style:css样式}
     * @returns BMap.Label
     */
    $.fn.baiduMap.createLabel = function(options) {
    	var mapObj = $.fn.baiduMap.mapObj;
    	var defaults = {
    		title : "",
		 	position : new BMap.Point(104.11412925348,37.550339474591),    // 指定文本标注所在的地理位置
		 	offset   : new BMap.Size(0, 0),    //设置文本偏移量
			style : {}  //设置文本标注样式，该样式将作用于文本标注的容器元素上。其中styles为JavaScript对象常量
    	}
    	var opts = $.extend({},defaults, options);
        var label = new BMap.Label(opts.title,opts);
        label.setOffset(opts.offset);
        label.setStyle(opts.style);
        mapObj.addOverlay(label); 
        return label;
    };
    /**
     * 新建一个信息窗口
     * 
     * @param content
     *            支持html的内容
     * @param infoWindowOptions = { width : 400,     
	 *					height: 100, 
	 *					enableAutoPan :true,
	 * 					enableCloseOnClick:true,
	 *					enableMessage:false}
     * @returns BMap.InfoWindow
     */
    $.fn.baiduMap.createInfoWindow = function(content,options) {
    	var defaults = {
    			width : 400,     
    			height : 100, 
    			enableAutoPan : true,
    			enableCloseOnClick : true,
    			enableMessage : false
    	}
    	var opts = $.extend({},defaults, options);
        return new BMap.InfoWindow(content,opts);
    };
    /**
     * 新建一个信息窗口,支持利用jsrender模板创建内容的模式。
     * 
     * @param options = {
     *          width : 300,   //宽   
	 *			height: 300,    //高
	 *			enableAutoPan :true, // 
	 *			enableCloseOnClick:true, 
	 *			enableMessage:false,
     * 			obj : {},  //对象
	 *			html : "" , //文本信息内容,支持html
	 *			templateId : "" //模板ID
	 *		}
     * @returns BMap.InfoWindow
     */
    $.fn.baiduMap.createInfoWin = function (options){
		var defaults = {
				width : 300,     
				height: 300, 
				enableAutoPan :true,
				enableCloseOnClick:true,
				enableMessage:false,
				obj : {},  //对象
				html : "" , //信息窗口内容
				templateId : "" //模板ID,如果模板Id为空，则取html的内容。				
		}
		var opts = $.extend({},defaults, options);
		
		var html = "";
		if(opts.templateId){
			html = $( "#"+opts.templateId).render(opts.obj); //调用模板
		}else{
			html = opts.html;
		}
		var infoWindow =new  BMap.InfoWindow(html,opts);
		//infoWindow.setMaxContent("最大化") ;
		//infoWindow.enableMaximize();
		return infoWindow;
	}
    /**
     * 新建一个图形标记
     * 
     * @param options
     *            标记的属性 exp.{point:位置 BMap.Point值,icon: 图标BMap.Icon值,
     *            label:图标的文本说明}
     * 
     * @returns BMap.Marker
     */
    $.fn.baiduMap.createMarker = function(options) {
        var marker = new BMap.Marker(options.point);
        if (options.icon) {
            marker.setIcon(options.icon);
        }
        if (options.label) {
            marker.setLabel(options.label);
        }
        $.fn.baiduMap.mapObj.addOverlay(marker);
        return marker;
    };
    /**
     * 多点标记标记
     * 
     * @param options
     *            标记的属性 exp.{point:位置 BMap.Point值,icon: 图标BMap.Icon值,
     *            label:图标的文本说明}
     * 
     * @returns BMap.Marker
     */
    $.fn.baiduMap.createMarkers = function(options) {
        var mapObj = $.fn.baiduMap.mapObj;
        var markers = [];
        var defaults = {
        		points : [],
        		icon : "",
        	    label : "",
    	}
        var opts = $.extend({},defaults, options);
        for(var i = 0 ; i < points.length ;i++){
        	var marker = new BMap.Marker(opts.point);
            if (opts.icon) {
                marker.setIcon(opts.icon);
            }
            if (opts.label) {
                marker.setLabel(opts.label);
            }     
            mapObj.addOverlay(marker); //添加覆盖物
            markers.push(marker);
        }    
        return markers;
    };
    
    /**
     * 创建自定义信息窗口 【<!-- 百度地图开源库自定义信息窗口 -->
	 *<script type="text/javascript" src="${ctx}/resources/spk_resource/lbs/js/InfoBox_min.js"></script>】
     * @param options
     *            标记的属性 exp.{
					obj : {},  //对象
					boxStyle:{
						background:"url('http://api.map.baidu.com/library/InfoBox/1.2/examples/tipbox.gif') no-repeat center top"
						,width: "270px"
						,height: "300px"
					},
					html : "" ,
					templateId : "" ,
					closeIconMargin: "1px 1px 0 0",
					enableAutoPan: true,
					align: INFOBOX_AT_BOTTOM,
					offset: new BMap.Size(25,25)
			}
     *            
     * @returns BMapLib.InfoBox 
     */
     $.fn.baiduMap.createInfoBox = function (options){
		var defaults = {
				obj : {},  //对象
				boxStyle:{
					background:"url('http://api.map.baidu.com/library/InfoBox/1.2/examples/tipbox.gif') no-repeat center top"
					,width: "270px"
					,height: "300px"
				},
				html : "" ,
				templateId : "" ,
				closeIconMargin: "1px 1px 0 0",
				enableAutoPan: true,
				align: INFOBOX_AT_BOTTOM,
				offset: new BMap.Size(25,25)
		}
		var opts = $.extend({},defaults, options);
		
		var html = ""
		if(opts.templateId){
			html = $( "#"+opts.templateId).render(opts.obj); //调用模板
		}else{
			html = opts.html;
		}
		var infoBox = new BMapLib.InfoBox(bmap.mapObj,html,opts);
		return infoBox;
	}
	//------------------------------------------------------------------
	  /**
     * 定位到指定坐标
     * 
     * @param x
     *            纬度
     * @param y
     *            经度
     * @param zoom
     *            缩放级别
     */
    $.fn.baiduMap.panTo = function(x, y, zoom) {
        var mapObj = $.fn.baiduMap.mapObj;
        mapObj.clearOverlays();
        if (parseInt(x) == 0) {
            return;
        }
        if (x != "") {
            var temp_point = new BMap.Point(x, y);
            mapObj.centerAndZoom(temp_point, parseInt(zoom));
        }
    };

    /**
     * 在地图上搜索地点，并且标记
     * 
     * @param city
     *            城市名称
     * @param address
     *            详细地址
     */
    $.fn.baiduMap.search = function(city, address) {
        var mapObj = $.fn.baiduMap.mapObj;
        mapObj.clearOverlays();
        // 创建地址解析器实例
        var myGeo = new BMap.Geocoder();
        // 将地址解析结果显示在地图上，并调整地图视野
        myGeo.getPoint(address, function(point) {
            if (point) {
                var resultMarker = new BMap.Marker(point);
                // 跳动的动画
                resultMarker.setAnimation(BMAP_ANIMATION_BOUNCE);
                mapObj.centerAndZoom(point, 16);
                mapObj.addOverlay(resultMarker);
            }
        }, city);
    };
    /**
     * 定位的指定行政区域(单独区域)
     * @param options
     *          {	org,	        ---行政区域名称（支持省、市、县三级）
     *          	strokeColor     ---边线颜色。
     *          	fillColor       ---填充颜色。当参数为空时，折线覆盖物将没有填充效果。 
     *              strokeWeight    ---边线的宽度，以像素为单位。 
     *              strokeOpacity   ---边线透明度，取值范围0 - 1。 
     *              fillOpacity     ---填充的透明度，取值范围0 - 1。 
     *          	strokeStyle     ---边线的样式，solid或dashed。 dashed、虚线 solid、实线
     *              enableMassClear ---是否在调用map.clearOverlays清除此覆盖物，默认为true
     *          }		  
     */
    $.fn.baiduMap.bdaryLocation = function(options) {
        var mapObj = $.fn.baiduMap.mapObj;
        var bdary = new BMap.Boundary();
        var defaults = {
        		org : "北京 ",
        		strokeColor : "#ff0000",
        	    fillColor : "",
        	    strokeWeight : 2,
        	    strokeOpacity : 0,
        	    fillOpacity : 0,
        	    strokeStyle : "solid",
        	    enableMassClear :false
    	}
        var opts = $.extend({},defaults, options);
        bdary.get(opts.org, function(rs) { // 获取行政区域
            //mapObj.clearOverlays(); // 清除地图覆盖物
            var count = rs.boundaries.length; // 行政区域的点有多少个
           // var plys = new Array(count);
            // bugfix: 在地图上不相连的某个区划，返回的数组中，默认从小范围到大范围，so, i--优先显示大范围
            for ( var i = count - 1; i >= 0; i--) {
                var ply = new BMap.Polygon(rs.boundaries[i], {               	
                	strokeColor : opts.strokeColor,
                	fillColor : opts.fillColor,
                	strokeWeight : opts.strokeWeight,
                	strokeOpacity : opts.strokeOpacity,
                	fillOpacity : opts.fillOpacity,
                	strokeStyle : opts.strokeStyle,
                	enableMassClear : opts.enableMassClear,
                }); // 建立多边形覆盖物
                //plys[i] = ply;
                mapObj.addOverlay(ply); // 添加覆盖物
                //mapObj.setViewport(ply.getPath()); // 调整视野
            }
        });
    };
    /**
     * 定位的指定行政区域（多区域）
     * @param options
     *          {	org     ---行政区域名称（支持省、市、县三级）
     *          	strokeColor     ---边线颜色。
     *          	fillColor       ---填充颜色。当参数为空时，折线覆盖物将没有填充效果。 
     *              strokeWeight    ---边线的宽度，以像素为单位。 
     *              strokeOpacity   ---边线透明度，取值范围0 - 1。 
     *              fillOpacity     ---填充的透明度，取值范围0 - 1。 
     *          	strokeStyle     ---边线的样式，solid或dashed。 dashed、虚线 solid、实线
     *              enableMassClear ---是否在调用map.clearOverlays清除此覆盖物，默认为true
     *          }		  
     */
    $.fn.baiduMap.bdaryLocations = function(options) {
        var mapObj = $.fn.baiduMap.mapObj;
        var bdary = new BMap.Boundary();
        var defaults = {
        		orgs : ["贵阳 ","遵义"],
        		strokeColor : "#ff0000",
        	    fillColor : "",
        	    strokeWeight : 2,
        	    strokeOpacity : 0,
        	    fillOpacity : 0,
        	    strokeStyle : "solid",
        	    enableMassClear :false
    	}
        var opts = $.extend({},defaults, options);
        for(var i = 0 ; i < opts.orgs.length ; i++ ){
        	bdary.get(opts.orgs[i], function(rs) { // 获取行政区域
                //mapObj.clearOverlays(); // 清除地图覆盖物
                var count = rs.boundaries.length; // 行政区域的点有多少个
                var plys = new Array(count);
                // bugfix: 在地图上不相连的某个区划，返回的数组中，默认从小范围到大范围，so, i--优先显示大范围
                for ( var j = count - 1; j >= 0; j--) {
                    var ply = new BMap.Polygon(rs.boundaries[j], {
                    	strokeColor : opts.strokeColor,
                    	fillColor : opts.fillColor,
                    	strokeWeight : opts.strokeWeight,
                    	strokeOpacity : opts.strokeOpacity,
                    	fillOpacity : opts.fillOpacity,
                    	strokeStyle : opts.strokeStyle,
                    	enableMassClear : opts.enableMassClear,
                    }); // 建立多边形覆盖物
                    plys[j] = ply;
                    mapObj.addOverlay(ply); // 添加覆盖物
                    //mapObj.setViewport(ply.getPath()); // 调整视野
                }
            });
        }
    };
    /**
     * 新建椭圆区域
     * @param options
     *          {	center          ---椭圆中心点。
     *              x               ---横向经度。
     *              y               ---纵向纬度。
     *          	polygonOptions{
     *          		strokeColor     ---边线颜色。
     *          		fillColor       ---填充颜色。当参数为空时，折线覆盖物将没有填充效果。 
     *              	strokeWeight    ---边线的宽度，以像素为单位。 
     *              	strokeOpacity   ---边线透明度，取值范围0 - 1。 
     *              	fillOpacity     ---填充的透明度，取值范围0 - 1。 
     *          		strokeStyle     ---边线的样式，solid或dashed。 dashed、虚线 solid、实线
     *              	enableMassClear ---是否在调用map.clearOverlays清除此覆盖物，默认为true
     *          	}
     *          }		  
     */
    $.fn.baiduMap.createOval = function(options) {
        var mapObj = $.fn.baiduMap.mapObj;
        var defaults = {
        		center : new BMap.Point(116.404, 39.915),
        	    x : 0.3,            
        	    y : 0.1,            
        	    polygonOptions : {
        	    	strokeColor : "#ff0000",
            	    fillColor : "",
            	    strokeWeight : 3,
            	    strokeOpacity : 0,
            	    fillOpacity : 0,
            	    strokeStyle : "dashed",
            	    enableMassClear :false
        	    }
    	}
        var opts = $.extend({},defaults, options);
        var oval = new BMap.Polygon($.fn.baiduMap.addOvals(opts.center,opts.x,opts.y), opts.polygonOptions);
        mapObj.addOverlay(oval);
        return oval;
    };
    /**
     * 新建扇形区域
     * @param options
     *          {	center          ---扇区中心点坐标。
     *              radius          ---半径。
     *              degreeStart		---起始角度。
     *              degreeEnd		---结束角度。
     *          	polygonOptions{
     *          		strokeColor     ---边线颜色。
     *          		fillColor       ---填充颜色。当参数为空时，折线覆盖物将没有填充效果。 
     *              	strokeWeight    ---边线的宽度，以像素为单位。 
     *              	strokeOpacity   ---边线透明度，取值范围0 - 1。 
     *              	fillOpacity     ---填充的透明度，取值范围0 - 1。 
     *          		strokeStyle     ---边线的样式，solid或dashed。 dashed、虚线 solid、实线。
     *              	enableMassClear ---是否在调用map.clearOverlays清除此覆盖物，默认为true。
     *          	}
     *          }		  
     */
    $.fn.baiduMap.createSector = function(options) {
        var mapObj = $.fn.baiduMap.mapObj;
        var defaults = {
        		center : new BMap.Point(116.404, 39.915),
        		radius : 0.3,            
        		degreeStart : 0.1,
        		degreeEnd : 0.1,
        	    polygonOptions : {
        	    	strokeColor : "#ff0000",
            	    fillColor : "#FFFFFF",
            	    strokeWeight : 3,
            	    strokeOpacity : 0.3,
            	    fillOpacity : 0.3,
            	    strokeStyle : "solid",
            	    enableMassClear :false
        	    }
    	}
        var opts = $.extend({},defaults, options);        
	    var points = [];  
	    var step = ((degreeEnd - degreeStart) / 10) || 10;  
	    points.push(center);  
	    for ( var i = degreeStart; i < degreeEnd + 0.001; i += step) {  
	        points.push($.fn.baiduMap.eOffsetBearing(mapObj, center, radius, i));  
	    }  
	    points.push(center);  
        var sector = new BMap.Polygon(points, opts.polygonOptions);
        mapObj.addOverlay(sector);
        return sector;
    };
    /**
     * 新建圆形区域
     * @param options
     *          {	center,         ---圆中心点坐标
     *          	radius,          ---半径,单位米
     *          	circleOptions :{
     *                  strokeColor 	String 	圆形边线颜色。
	 *					fillColor 	    String 	圆形填充颜色。当参数为空时，圆形将没有填充效果。
     *					strokeWeight 	Number 	圆形边线的宽度，以像素为单位。
     *					strokeOpacity 	Number 	圆形边线透明度，取值范围0 - 1。
     *					fillOpacity 	Number 	圆形填充的透明度，取值范围0 - 1。
	 *					strokeStyle 	String 	圆形边线的样式， dashed、虚线 solid、实线。
	 *					enableMassClear Boolean 	是否在调用map.clearOverlays清除此覆盖物，默认为true。
	 *					enableEditing 	Boolean 	是否启用线编辑，默认为false。
	 *					enableClicking  Boolean 	是否响应点击事件，默认为true。        	
     *          	}                 ---Circle类构造函数的可选参数
     *          }		  
     */
    $.fn.baiduMap.createCircle = function(options) {
        var mapObj = $.fn.baiduMap.mapObj;
        var defaults = {    
        		center : new BMap.Point(116.404, 39.915),
        		radius : 10000,
        	    circleOptions :{ 
        	    	strokeColor : "#ff0000",
            	    fillColor : "",
            	    strokeWeight : 3,
            	    strokeOpacity : 0,
            	    fillOpacity : 0,
            	    strokeStyle : "dashed",
            	    enableMassClear :false,
        	    	enableEditing  : false,
        	    }
    	}
        var opts = $.extend({},defaults, options);        
        var circle = new BMap.Circle(opts.center, opts.radius,opts.circleOptions);
        mapObj.addOverlay(circle);        
        return circle;
    };
    /**
     * 新建线路(多点坐标划线)
     * @param options
     *          {	center,         ---圆中心点坐标
     *          	radius,          ---半径,单位米
     *          	circleOptions :{
     *                  strokeColor 	String 	圆形边线颜色。
	 *					fillColor 	    String 	圆形填充颜色。当参数为空时，圆形将没有填充效果。
     *					strokeWeight 	Number 	圆形边线的宽度，以像素为单位。
     *					strokeOpacity 	Number 	圆形边线透明度，取值范围0 - 1。
     *					fillOpacity 	Number 	圆形填充的透明度，取值范围0 - 1。
	 *					strokeStyle 	String 	圆形边线的样式， dashed、虚线 solid、实线。
	 *					enableMassClear Boolean 	是否在调用map.clearOverlays清除此覆盖物，默认为true。
	 *					enableEditing 	Boolean 	是否启用线编辑，默认为false。
	 *					enableClicking  Boolean 	是否响应点击事件，默认为true。        	
     *          	}                 ---Circle类构造函数的可选参数
     *          }		  
     */
    $.fn.baiduMap.createPolyLine = function(options) {
        var mapObj = $.fn.baiduMap.mapObj;
        var defaults = {    
        		points : [],
        	    style :{ 
        	    	strokeColor : "#ff0000",
            	    fillColor : "",
            	    strokeWeight : 3,
            	    strokeOpacity : 0,
            	    fillOpacity : 0,
            	    strokeStyle : "dashed",
            	    enableMassClear :false,
        	    	enableEditing  : false,
        	    },
        	    hasView : true
    	}
        var opts = $.extend({},defaults, options);    
		var polyline = new BMap.Polyline(opts.points, opts.style);  //定义折线				
		bmap.mapObj.addOverlay(polyline);     //添加折线到地图上
		if(opts.hasView){
			mapObj.setViewport(opts.points);
		}      
        return polyline;
    };
    
   //-------------------图层-----------------------------------------------
    /**
     * 新建一个热力图层
     * 
     * @param options
     *            标记的属性 exp.{points:坐标集合 BMap.Point值,radius:  --,max:-----}
     * 
     * @returns BMapLib.HeatmapOverlay
     */
    $.fn.baiduMap.heatMap = function(options) { 	
    	var mapObj = $.fn.baiduMap.mapObj;
    	var defaults = {
			radius : 25,
 			data : [],
 			max : 5
    	}
    	var opts = $.extend({},defaults, options);
    	// 创建热力图层对象
        var heatmapOverlay = new BMapLib.HeatmapOverlay({
        	radius : opts.radius
		 });
        // 添加图层到地图上
        mapObj.addOverlay(heatmapOverlay);
        // 设置热力图层数据
		heatmapOverlay.setDataSet({
			data : opts.data,
			 max : opts.max
		});
		// 显示热力区
		//heatmapOverlay.show();
        return heatmapOverlay;
    };
    /**
     * 新建一个云麻点图层
     * 
     * @param options
     *            标记的属性 exp.{geotableId:图层表ID string ,q:  --,tags:-----,filter :过滤条件 }
     * 
     * @returns BMapLib.HeatmapOverlay
     */
    $.fn.baiduMap.createCustomLayer = function(options) { 	
    	var mapObj = $.fn.baiduMap.mapObj;
    	var defaults = {  
			geotableId: '',   
			q: '', 
			tags: '',
			filter: ''
		}
    	var opts = $.extend({},defaults, options);
    	// 创建云麻点图层对象
    	var customLayer = new BMap.CustomLayer({  
			geotableId: opts.geotableId,   
			    q: opts.q, 
			 tags: opts.tags,
		   filter: opts.filter 
		}); 
		return customLayer;
    };
    /**
     * 地图地位，根据PC端的IP地址
     * 
     * @param options
     *            标记的属性 exp.{}
     * 
     * @returns String 
     */
    $.fn.baiduMap.localCity = function(options) { 	
    	var mapObj = $.fn.baiduMap.mapObj;
		var cityName = "";
    	var defaults = {  
    			
		}
    	var opts = $.extend({},defaults, options);
    	// 创建当前城市对象
    	var myCity = new BMap.LocalCity();
    	myCity.get(function(result){
    		cityName = result.name;
    		mapObj.setCenter(cityName);
    		//alert("当前定位城市:"+cityName);
    	});   	
    	return cityName;
    };
    //------------------------公共函数-------------------------------------
    /**
     * 椭圆多边形算法
     * 
     * @param center:椭圆中心点,
     * @param X:横向经度,
     * @param Y:纵向纬度           
     * @returns Array 
     */
    $.fn.baiduMap.addOvals = function(center,x,y){
		var assembles=new Array();
		var angle,dot;
		var tangent=x/y;
		for(i=0;i<36;i++){
			angle = (2* Math.PI / 36) * i;
			dot = new BMap.Point(center.lng+Math.sin(angle)*y*tangent,center.lat+Math.cos(angle)*y);
			assembles.push(dot);
		}
		return assembles;
    };
    /**
     * 扇区多边形算法
     * 
     * @param mapObj:地图对象,
     * @param point:中心点坐标,
     * @param radius : 半径,
     * @param bearing : 轴          
     * @returns BMap.Point 
     */
	 $.fn.baiduMap.eOffsetBearing =  function(mapObj, point, radius, bearing) {  
	    var latConv = mapObj.getDistance(point, new BMap.Point(point.lng + 0.1, point.lat)) * 10;  
	    var lngConv = mapObj.getDistance(point, new BMap.Point(point.lng, point.lat + 0.1)) * 10;  
	    var lat = radius * Math.cos(bearing * Math.PI / 180) / latConv;  
	    var lng = radius * Math.sin(bearing * Math.PI / 180) / lngConv;  
	    return new BMap.Point(point.lng + lng, point.lat + lat);  
	}
})(jQuery);
