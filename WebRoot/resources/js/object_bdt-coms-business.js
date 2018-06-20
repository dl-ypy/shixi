(function($) {
    $(function() {
        $.bdt.extend({
			business: {
				title: "业务组件",
				components: {
                /* Components start */
                
                    //组件
                    com_generic: {
                        title: '实体管理',
                        html: '<div class="loadingDiv loading-img">' +
                        		'<img src="../images/throbber.gif"/>&nbsp;加载中，请稍候...' +
                    		  '</div>' +
                    		  '<div class="add-comp-tip">' +
                        		'请配置组件...' +
                    		  '</div>' +
                    		  '<iframe src="" width="100%" height="200" style="display:none;" data-resources-id="" frameborder="1" data-width-type="percent"></iframe>',
                        defaultName: '业务组件',
                        allocate: 'input',
                        props: [
                            {
                                name: '高度',
                                html: '<input type="text" class="form-control comp-height" placeholder="单位px.." data-toggle="tooltip" data-placement="top" title="支持滚轮操作...">',
                                set: function($comp, $prop) {
                                	var currVal = $prop.val();
                                	var num = 0;
                                	currVal.endWith("px") ? num = currVal.substring(0,currVal.indexOf("p")) : num = currVal;
                                	var scrollFunc = function (e) {
								        e = e || window.event;
								        if (e.wheelDelta) {  //判断浏览器IE，谷歌滑轮事件             
								            if (e.wheelDelta > 0) { //当滑轮向上滚动时
								            	num++;
								            	currVal.endWith("px") ? $prop.val((num) + "px") : $prop.val(num);
								            }
								            if (e.wheelDelta < 0) { //当滑轮向下滚动时
								            	num--;
							            		currVal.endWith("px") ? $prop.val((num) + "px") : $prop.val(num);
								            }
								        } else if (e.detail) {  //Firefox滑轮事件
								            if (e.detail> 0) { //当滑轮向上滚动时
								            	num++;
								                currVal.endWith("px") ? $prop.val((num) + "px") : $prop.val(num);
								            }
								            if (e.detail< 0) { //当滑轮向下滚动时
								            	num--;
								                currVal.endWith("px") ? $prop.val((num) + "px") : $prop.val(num);
								            }
								        }
								        $comp.last().css("height",num);
								        //调整提示div高度
								        $comp.eq(3).css("height",num);
								    }
								    //给页面绑定滑轮滚动事件
								    var inputClass = $prop.get(0);
								    if (inputClass.addEventListener) {
								        inputClass.addEventListener("DOMMouseScroll", scrollFunc, false);
								    }
								    //滚动滑轮触发scrollFunc方法
								    inputClass.onmousewheel = inputClass.onmousewheel = scrollFunc;  
									$prop.keyup(function(){
                                		var thisVal = $(this).val();
	                                    $comp.last().css("height",thisVal);
	                                    //调整提示div高度
								        $comp.eq(3).css("height",thisVal);
                                	});
                                },
                                get: function($comp, $prop) {
                                	//触发tooltip编辑器会闪..待解决
                                	$("[data-toggle=\"tooltip\"]").tooltip();
                            		$prop.val($comp.last().css("height"));
                                }
                            },
                            {
                                name: '宽度',
                                html: '<input type="text" class="form-control comp-width" placeholder="单位px或%.." data-toggle="tooltip" data-placement="top" title="支持滚轮操作...">',
                                set: function($comp, $prop) {
                                	var currVal = $prop.val();
                                	var num = 0;
                                	var inputVal = 0;
                                	if(currVal.endWith("px")){
                                		num = currVal.substring(0,currVal.indexOf("px"));
                                		$comp.last().data("width-type","certain");
                                	}else if(currVal.endWith("%")){
                                		num = currVal.substring(0,currVal.indexOf("%"));
                                		$comp.last().data("width-type","percent");
                                	}else{
                                		num = currVal;
                                		$comp.last().data("width-type","certain");
                                	}
                                	var scrollFunc = function (e) {
								        e = e || window.event;
								        if (e.wheelDelta) {  //判断浏览器IE，谷歌滑轮事件             
								            if (e.wheelDelta > 0) { //当滑轮向上滚动时
								            	num++;
								            	if(currVal.endWith("px")){
										        	$prop.val((num) + "px")
										        }else if(currVal.endWith("%")){
										        	$prop.val((num) + "%")
										        }else{
										        	$prop.val(num);
										        }
								            }
								            if (e.wheelDelta < 0) { //当滑轮向下滚动时
								            	num--;
							            		if(currVal.endWith("px")){
										        	$prop.val((num) + "px")
										        }else if(currVal.endWith("%")){
										        	$prop.val((num) + "%")
										        }else{
										        	$prop.val(num);
										        }
								            }
								        } else if (e.detail) {  //Firefox滑轮事件
								            if (e.detail> 0) { //当滑轮向上滚动时
								            	num++;
								                if(currVal.endWith("px")){
										        	$prop.val((num) + "px")
										        }else if(currVal.endWith("%")){
										        	$prop.val((num) + "%")
										        }else{
										        	$prop.val(num);
										        }
								            }
								            if (e.detail< 0) { //当滑轮向下滚动时
								            	num--;
								                if(currVal.endWith("px")){
										        	$prop.val((num) + "px")
										        }else if(currVal.endWith("%")){
										        	$prop.val((num) + "%")
										        }else{
										        	$prop.val(num);
										        }
								            }
								        }
								        if(currVal.endWith("px")){
								        	$comp.last().css("width",num + "px");
								        	$comp.eq(3).css("width",num + "px");
								        }else if(currVal.endWith("%")){
								        	$comp.last().css("width",num + "%");
								        	$comp.eq(3).css("width",num + "%");
								        }else{
								        	$comp.last().css("width",num);
								        	$comp.eq(3).css("width",num);
								        }
								    }
								    //给页面绑定滑轮滚动事件
								    var inputClass = $prop.get(0);
								    if (inputClass.addEventListener) {
								        inputClass.addEventListener("DOMMouseScroll", scrollFunc, false);
								    }
								    //滚动滑轮触发scrollFunc方法
								    inputClass.onmousewheel = inputClass.onmousewheel = scrollFunc;  
								    
                                    $prop.keyup(function(){
                                        //判断录入宽度的单位，以方便在get时获取对应的单位,暂时支持百分比和像素为单位
                                        var thisVal = $(this).val();
                                		if(thisVal){
                                			if(thisVal.charAt(thisVal.length - 1) == "%"){
	                                    		$comp.last().data("width-type","percent");
		                                    }else{
		                                    	$comp.last().data("width-type","certain");
		                                    }
		                                    $comp.last().css("width",thisVal);
		                                    $comp.eq(3).css("width",thisVal);
                                		}
                                    });
                                },
                                get: function($comp, $prop) {
                                	//触发tooltip编辑器会闪..待解决
                                	$("[data-toggle=\"tooltip\"]").tooltip();
                                	if($comp.last().data("width-type") == "percent"){
                                		//百分比宽度，取当前组件宽度百分比四舍五入取整
                                		var widthPercent = Math.round(parseInt($comp.last().css("width"))*100/parseInt($comp.last().parent().css("width")))+"%";
										$prop.val(widthPercent);
                                	}else{
                                		$prop.val($comp.last().css("width"));
                                	}
                                }
                            },
                            {
                                name: '边框',
                                html: '\
                                <div class="form-group">\
                                    <input type="checkbox" checked\>显示</input>\
                                </div>\
                                ',
                                set: function($comp, $prop) {
                                	$prop.find(":checkbox").click(function(){
                            			$comp.last().attr("frameborder",$(this).prop("checked") == true ? 1 : 0);
                                	});
                                },
                                get: function($comp, $prop) {
                                    $prop.find(":checkbox").attr("checked",$comp.last().attr("frameborder") == 0 ? false : true);
                                }
                            },
                            {
                                name: '标题',
                                html: '\
                                <div class="form-group">\
                                    <input type="checkbox" checked\>显示</input>\
                                </div>\
                                ',
                                set: function($comp, $prop) {
                                    $prop.find(":checkbox").click(function(){
                            			$comp.first().attr("hidden",!$(this).prop("checked"));
                                	});
                                },
                                get: function($comp, $prop) {
                                    $prop.find(":checkbox").attr("checked",!$comp.first().attr("hidden"));
                                }
                            }
                        ]
                    }
                /* Components end */
                }
			}
		});
    });
})(jQuery);