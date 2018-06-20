/**
 * Baidu Echarts v2.2.1 版本API jQuery插件封装
 * 
 * @author wangsp
 * @date 2015-08-25
 * @version 0.1
 */
(function($) {
	 /**
     * echarts 饼图（支持多数据） , 暂时数据格式不通用,只支持景区客流量数据
     * 
     * @param options           
     *            exp.{
	 *           		url ---数据请求地址	
	 *           		param --检索参数
	 *           		defaults  ---自定义echarts  option参数集合 (可选择不同类型的图形)
   	 *       			echarts : {
   	 *       				echart  ---echarts 
   	 *      				sytle ---echarts 样式集合
   	 *       				width --- 图表宽度
   	 *       			 	height ---图表高度
   	 *       			}
     * @returns $.fn.echartsPie
     */
    $.fn.echartsPie = function(options) {
   			var myCharts = []; //echarts实例集合
        	//初始化数据
        	var defaults = $.fn.echartsPie.defaults ;
  			var opts= options.defaults //设置公共参数
        	var me = this;  //当前容器
            //--- 饼状图 ---
            $.ajax({url:options.url,async: false,data : {},
 			type: "POST",dataType:'json',error:function(){top.jAlert("服务器异常");},
 			success:function(result){
 				if(typeof (result) != 'undefined' && result != null){	
 	   	  			if (typeof (result) != 'undefined' && result.length > 0) {
 	   	  				//设置数据	
 	   	  				for(var i = 0 ; i < result.length ; i++){
	 	   	  				var index = (i+1);
	 	   	  				var option = $.extend({},defaults, opts); //追加自定义参数
	 	   	  				//清理已有数据
	 	   	  				option.legend.data = [];
	 	   	  				option.series[0].data = [];
	 	   	  				//设置数据
 	   	  					option.title.text = "景区游客来源分析" 
 	   	  					option.title.subtext =  result[i].value[0].CODETYPE;
   	  						option.series[0].name = result[i].value[0].CODETYPE;
   	  						//添加数据	 
 	   	  				    for(var j = 0 ; j < result[i].value.length ; j++){
 	   	  						option.legend.data.push(result[i].value[j].CODENAME);
 	   	  				  		option.series[0].data.push({value : result[i].value[j].USERS,name : result[i].value[j].CODENAME });  
 	   	  				    }
 	   	  				    //创建容器
 	   	  				    //var $mainDiv = $('<div id="main'+index+'" class="graph"></div>');
 	   	  				    var $mainDiv = $('<div/>');
 	   	  				    $mainDiv.attr("id","main"+index);
 	   	  				    $mainDiv.css("width",options.echarts.width);
 	   	  				    $mainDiv.css("height",options.echarts.height);
 	   	  				    $mainDiv.css("float","left");
 	   	  				    $mainDiv.css("border","1px dashed gainsboro");
 	   	  				    //添加节点
 	   	  				    me.append($mainDiv);
 	   	  				    var itemStyle = (i%options.echarts.sytle.length);
   	  				 		var myChart = options.echarts.echart.init(document.getElementById('main'+index),options.echarts.sytle[itemStyle]);	   	  				 		
   	  				 		myChart.setOption(option,true);
   	  				 		myCharts.push(myChart);
 	   
 	   	  				}
 					}   	  						   	  			
 		  		}
 			}
 		});
   	    $.fn.echartsPie.myCharts = myCharts;
        return $.fn.echartsPie;
    };
    /**
     * pie默认参数设置(实心饼图)
     */
    $.fn.echartsPie.defaults = {
		title : {
			text : '',
 			subtext: '',
 			x:'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	    legend: {
	        orient : 'vertical',
	        x : 'left',
	        data:[]
	    },
	    calculable : true,
	    series : [
	        {
	            name:'',
	            type:'pie',
	            radius : '55%',
	            center: ['50%', '60%'],
	            data:[] 
	        }
	    ]
    };
    //------------------------------------------------------------------
})(jQuery);
