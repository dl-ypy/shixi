(function($) {
    $(function() {
        $.bdt.extend({
			techBase: {
				title: "技术组件",
				components: {
                /* Components start */
                
                    //组件
                    com_generic: {
                        title: '工作台',
                        html: '<div class="loadingDiv loading-img">' +
                        		'<img src="../images/throbber.gif"/>&nbsp;加载中，请稍候...' +
                    		  '</div>' +
                    		  '<div class="add-comp-tip">' +
                        		'请配置组件...' +
                    		  '</div>' +
                    		  '<iframe src="http://www.baidu.com" width="100%" height="400" name style="display:none;border-style: groove;" data-resources-id="" frameborder="1" data-border-color="" data-width-type="percent"></iframe>',
                        defaultName: '技术组件',
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
                                    <input type="checkbox" checked\>显示</input><br>\
									<div class="form-group" style="margin-top: 10px;">\
										<div class="form-inline" style="margin-bottom: 7px;">\
											<label>宽度</label>&nbsp;\
											<input type="number" class="form-control" style="width: 76%;">\
										</div>\
										<div class="form-inline" style="margin-bottom: 7px;">\
											<label>样式</label>&nbsp;\
											<select class="form-control" style="width: 76%;">\
												<option value="">请选择...</option>\
												<option value="dashed">dashed</option>\
												<option value="dotted">dotted</option>\
												<option value="double">double</option>\
												<option value="groove">groove</option>\
												<option value="hidden">hidden</option>\
												<option value="inherit">inherit</option>\
												<option value="initial">initial</option>\
												<option value="inset">inset</option>\
												<option value="none">none</option>\
												<option value="outset">outset</option>\
												<option value="ridge">ridge</option>\
												<option value="solid">solid</option>\
											</select>\
										</div>\
										<div class="form-inline" style="margin-bottom: 7px;">\
											<label>颜色</label>&nbsp;\
											<input type="text" class="form-control" style="width: 76%;">\
										</div>\
									</div>\
                                </div>\
                                ',
                                set: function($comp, $prop) {
                                	var $iframe = $comp.last();
                                	var $borderWidth = $prop.find(".form-inline:eq(0)").find("input");
                                	var $borderStyle = $prop.find(".form-inline:eq(1)").find("select");
                                	var $borderColor = $prop.find(".form-inline:eq(2)").find("input");
                                	$prop.find(":checkbox").click(function(){
                            			$comp.last().attr("frameborder",$(this).prop("checked") == true ? 1 : 0);
                            			if($comp.last().attr("frameborder") == 0){
                            				$iframe.css("border-style","hidden");
                            			}else{
                            				$iframe.css("border-style","groove");
                            				$borderStyle.find("option[value=\"groove\"]").attr("selected",true);
                            			}
                            			$prop.find(".form-group").slideToggle();
                                	});
                                	$prop.find(".form-group").change(function(){
                                		$iframe.css("border-width",$borderWidth.val());
                                		$iframe.css("border-style",$borderStyle.find("option:selected").text());
                                		$iframe.css("border-color",$borderColor.val());
                                		$iframe.attr("data-border-color",$borderColor.val());
                                	});
                                	$borderWidth.val(parseInt($iframe.css("border-width")));
                                	$borderStyle.find("option[value=" + $iframe.css("border-style") + "]").attr("selected",true);
                                	$borderColor.val($iframe.attr("data-border-color"));
                                	$comp.last().attr("frameborder") == 0 ? $prop.find(".form-group").hide() : $prop.find(".form-group").show();
                                },
                                get: function($comp, $prop) {
                                    $prop.find(":checkbox").attr("checked",$comp.last().attr("frameborder") == 0 ? false : true);
                                }
                            },
                            {
                                name: '调整Iframe边距',
                                html: '\
                                <div class="form-group">\
									<button class="btn btn-sm" style="background-color:darkolivegreen;color:white;margin: 5px 5px 5px 0;">调整边距</button>\
									<div class="padding-justify" style="display:none;">\
                                    	<div class="form-inline" style="margin-bottom: 7px;">\
											<label>上边距</label>&nbsp;\
											<input type="number" class="form-control" style="width: 66%;">\
										</div>\
										<div class="form-inline" style="margin-bottom: 7px;">\
											<label>右边距</label>&nbsp;\
											<input type="number" class="form-control" style="width: 66%;">\
										</div>\
										<div class="form-inline" style="margin-bottom: 7px;">\
											<label>下边距</label>&nbsp;\
											<input type="number" class="form-control" style="width: 66%;">\
										</div>\
										<div class="form-inline" style="margin-bottom: 7px;">\
											<label>左边距</label>&nbsp;\
											<input type="number" class="form-control" style="width: 66%;">\
										</div>\
									</div>\
                                </div>\
                                ',
                                set: function($comp, $prop) {
                                	var $iframe = $comp.last();
                                	var $topPadding = $prop.find(".padding-justify").find(".form-inline:eq(0)").find("input");
                                	var $rightPadding = $prop.find(".padding-justify").find(".form-inline:eq(1)").find("input");
                                	var $bottomPadding = $prop.find(".padding-justify").find(".form-inline:eq(2)").find("input");
                                	var $leftPadding = $prop.find(".padding-justify").find(".form-inline:eq(3)").find("input");
                                	var $innerFrameBody = $($iframe.contents().get(0)).find("body");
                                	$prop.find(".padding-justify").change(function(){
                                		var topValue = parseInt($topPadding.val());
                                		var rightValue = parseInt($rightPadding.val());
                                		var bottomValue = parseInt($bottomPadding.val());
                                		var leftValue = parseInt($leftPadding.val());
                                		$innerFrameBody.css("padding-top",topValue);
                                		$innerFrameBody.css("padding-right",rightValue);
                                		$innerFrameBody.css("padding-bottom",bottomValue);
                                		$innerFrameBody.css("padding-left",leftValue);
                                	});
                                	$topPadding.val(parseInt($innerFrameBody.css("padding-top")));
                                	$rightPadding.val(parseInt($innerFrameBody.css("padding-right")));
                                	$bottomPadding.val(parseInt($innerFrameBody.css("padding-bottom")));
                                	$leftPadding.val(parseInt($innerFrameBody.css("padding-left")));
                                	
                                	$prop.find("button").click(function(){
                                		$prop.find(".padding-justify").slideToggle();
                                	});
                                },
                                get: function($comp, $prop) {
                                	
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
                    },
                    //表格组件
                    com_tables: {
                        title: '表格组件',
                        html: '<div auto-table data-url data-username data-password data-driver>' +
                        		'<div class="query-condition">' +
                        			'<div class="inner-condition"><div class="form-inline"><label class="inner-label">示例名称</label><input type="text" class="form-control inner-single-text"></div></div>' +
                        			'<div class="inner-condition"><div class="form-inline"><label class="inner-label">创建时间</label><input type="text" class="form-control inner-single-text"></div></div>' +
                        		'</div>' + 
                        		'<div class="query-button">' +
                        			'<button class="btn btn-sm query" style="text-align:center;background-color:#1AB394;color:white;">查询</button>' +
                        		'</div>' + 
                        		'<div>' +
                        			'<div class="col-md-12">' +
                        				'<table class="table table-hover entire-row table-content" sort-for=".table-content" data-epm="selectable-table" data-query-sql data-multi-select="true">' +
                        					'<thead><tr><th style="width:30px;"><input type="checkbox"></th><th sort-col data-sort-order data-per-width="23%">示例名称<i class="fa"></i></th><th sort-col data-sort-order data-per-width="23%">创建时间<i class="fa"></i></th><th sort-col data-sort-order data-per-width="24%">描述<i class="fa"></i></th><th sort-col data-sort-order data-per-width="24%">备注<i class="fa"></i></th></tr>' +
			                        		'</thead>' +
			                        		'<tbody class="hidden" traversal data-pagi data-traversal-url="comp-table!getCommonTableData.action" data-traversal-params>' +
			                        		'</tbody>' +
			                        		'<tfoot>' +
			                        		'</tfoot>' +
                        				'</table>' +
                        				'<div pagi-for="[traversal]"></div>' + 
                        			'</div>' +
                    			'</div>' +
                    		'</div>',
                        defaultName: '表格组件',
                        allocate: 'input',
                        props: [
                            {
                                name: '配置',
                                html: '\
                                <div class="form-group" style="text-align:center;">\
                                    <button class="btn btn-primary">配置数据源</button>\
                                </div>\
                                ',
                                set: function($comp, $prop) {
                                	$comp.first().hide();
                                	$prop.find("button").click(function(){
									    $.epm.modal({
									      title: "配置表单数据源",
									      size: "",
									      body: "<div><label>配置JSON数据源</label><textarea class=\"form-control\" rows=\"17\"></textarea></div>",
									      autoDismiss: false,
								          showCloseBotton: false,
									      buttons: [
									      	{
									      	  value: "关闭",
									      	  dismiss: true
									      	},
									      	{
									      	  value: "开始配置",
									      	  style: "primary",
									      	  click: function($modal) {
									      	  	var sourceValue = $modal.find("textarea").val();
									      	  	var $queryCondition = $comp.find(".query-condition");
									      	  	var $table = $comp.find(".table-content");
									      	  	try{
									      	  		var sourceJson = $.parseJSON(sourceValue);
									      	  	}catch(e){
									      	  		$.epm.snackbar("解析json对象失败,请检查格式后重试...");
									      	  		return false;
									      	  	}
									      	  	try{
									      	  		//为div添加数据库配置属性
									      	  		var $component = $comp.last();
									      	  		var databaseJson = sourceJson.sourceDBInfo;
									      	  		if(databaseJson){
									      	  			$component.attr("data-url",databaseJson.url);
									      	  			$component.attr("data-username",databaseJson.username);
									      	  			$component.attr("data-password",databaseJson.password);
									      	  			$component.attr("data-driver",databaseJson.driver);
									      	  		}
									      	  		//查询sql属性
									      	  		$component.find("table").attr("data-query-sql",sourceJson.baseQuerySQL ? sourceJson.baseQuerySQL : "");
									      	  		//拼接表格查询字段
									      	  		var queryConditionJson = sourceJson.queryCondition;
									      	  		if(queryConditionJson){
									      	  			var conditionLength = queryConditionJson.length;
									      	  			$queryCondition.empty();
									      	  			for(var i=0;i<conditionLength;i++){
									      	  				var thisCondition = queryConditionJson[i];
									      	  				var clearStr = "$(this).prev().val(\"\")";
									      	  				switch(thisCondition.conditionType){
									      	  					/**
									      	  					 * 查询条件类型：1.下拉框(码表);2.文本模糊搜索;3.范围搜索;4.日期;5.日期范围
									      	  					 */
									      	  					case "1" :
									      	  						var $temp = $("<div class=\"inner-condition\" data-type=" + thisCondition.conditionType + " data-sql data-key-column=" + thisCondition.codeTableInfo.codeTableKeyColumn + " data-value-column=" + thisCondition.codeTableInfo.codeTableValueColumn + "><div class=\"form-inline\"><label class=\"inner-label\" title=" + thisCondition.conditionName + ">" + thisCondition.conditionName + "</label><select class=\"form-control inner-single-text\" name=" + thisCondition.columnName + "><option value=\"\">请选择...</option></select></div></div>");
								      	  							$temp.attr("data-type",thisCondition.conditionType);
								      	  							$temp.attr("data-sql",thisCondition.codeTableInfo.codeTableSQL);
								      	  							$temp.attr("data-key-column",thisCondition.codeTableInfo.codeTableKeyColumn);
								      	  							$temp.attr("data-value-column",thisCondition.codeTableInfo.codeTableValueColumn);
								      	  							$queryCondition.append($temp);
									      	  						break;
								      	  						case "2" :
								      	  							var $temp = $("<div class=\"inner-condition\" data-type=" + thisCondition.conditionType + "><div class=\"form-inline\"><label class=\"inner-label\" title=" + thisCondition.conditionName + ">" + thisCondition.conditionName + "</label><div class=\"input-with-clear single-condition-text\"><input type=\"text\" class=\"form-control inner-single-text input\" name=" + thisCondition.columnName + " required><a class=\"clear\" title=\"清空\" onclick=" + clearStr + "></a></div></div></div>");
								      	  							$temp.attr("data-type",thisCondition.conditionType);
								      	  							$queryCondition.append($temp);
									      	  						break;
								      	  						case "3" :
								      	  							var $temp = $("<div class=\"inner-condition\" data-type=" + thisCondition.conditionType + "><div class=\"form-inline\"><label class=\"inner-label\" title=" + thisCondition.conditionName + ">" + thisCondition.conditionName + "</label><div class=\"inner-combo-text\"><div class=\"input-with-clear\"><input type=\"text\" class=\"form-control inner-text input\" name=" + thisCondition.columnName + " required><a class=\"clear\" title=\"清空\" onclick=" + clearStr + "></a></div>" + " -- " + "<div class=\"input-with-clear\"><input type=\"text\" class=\"form-control inner-text input\" name=" + thisCondition.columnName + " required><a class=\"clear\" title=\"清空\" onclick=" + clearStr + "></a></div></div></div></div>");
									      	  						$temp.attr("data-type",thisCondition.conditionType);
								      	  							$queryCondition.append($temp);
									      	  						break;
								      	  						case "4" :
								      	  							var $temp = $("<div class=\"inner-condition\" data-type=" + thisCondition.conditionType + "><div class=\"form-inline\"><label class=\"inner-label\" title=" + thisCondition.conditionName + ">" + thisCondition.conditionName + "</label><div class=\"input-with-clear single-condition-text\"><input type=\"text\" class=\"form-control inner-single-text form_datetime input\" name=" + thisCondition.columnName + " required><a class=\"clear\" title=\"清空\" onclick=" + clearStr + "></a></div></div></div>");
									      	  						$temp.attr("data-type",thisCondition.conditionType);
								      	  							$queryCondition.append($temp);
									      	  						break;
								      	  						case "5" :
								      	  							var $temp = $("<div class=\"inner-condition\" data-type=" + thisCondition.conditionType + "><div class=\"form-inline\"><label class=\"inner-label\" title=" + thisCondition.conditionName + ">" + thisCondition.conditionName + "</label><div class=\"inner-combo-text\"><div class=\"input-with-clear\"><input type=\"text\" class=\"form-control inner-date form_datetime input\" name=" + thisCondition.columnName + " required><a class=\"clear\" title=\"清空\" onclick=" + clearStr + "></a></div>" + " -- " + "<div class=\"input-with-clear\"><input type=\"text\" class=\"form-control datepicker inner-date form_datetime input\" name=" + thisCondition.columnName + " required><a class=\"clear\" title=\"清空\" onclick=" + clearStr + "></a></div></div></div></div>");
									      	  						$temp.attr("data-type",thisCondition.conditionType);
								      	  							$queryCondition.append($temp);
									      	  						break;
								      	  						default:
									      	  				}
									      	  			}
									      	  			if($comp.find(".form_datetime").length > 0){
									      	  				$comp.find(".form_datetime").datetimepicker({
									      	  					language:  "zh-CN",
															    format: "yyyy-mm-dd",
															    startView: 2,
																minView: 2,
																todayBtn: 1,
															    autoclose: 1
															});
									      	  			}
									      	  		}
									      	  		var tableColumn = sourceJson.sourceDBMetaData.column;
									      	  		if(tableColumn){
									      	  			$table.find("thead").empty();
									      	  			$table.find("tbody").empty();
									      	  			var theadHtml = "";
									      	  			var tbodyHtml = "";
									      	  			if($table.attr("data-multi-select") == "true"){
									      	  				theadHtml += "<tr><th style=\"width:30px;\"><input type=\"checkbox\"></th>";
									      	  				tbodyHtml += "<tr><th><input type=\"checkbox\"></th>";
									      	  			}else{
									      	  				theadHtml += "<tr><th style=\"width:30px;display:none;\"><input type=\"checkbox\"></th>";
									      	  				tbodyHtml += "<tr><th style=\"display:none;\"><input type=\"checkbox\"></th>";
									      	  			}
									      	  			var columnLength = tableColumn.length;
									      	  			for(var j=0;j<columnLength;j++){
									      	  				var thisColumn = tableColumn[j];
									      	  				//取json中有效宽度拼接
									      	  				var widthStyleHtml = "";
									      	  				if(thisColumn.width){
									      	  					widthStyleHtml = " style=\"width:" + thisColumn.width + "\"";
									      	  				}
									      	  				//拼接表格表头字段
									      	  				if(thisColumn.sortable){
									      	  					theadHtml += "<th sort-col=" + thisColumn.columnName + " data-sort-order name=" + thisColumn.columnName + " title=" + thisColumn.showName + widthStyleHtml + ">" + thisColumn.showName + "&nbsp;<i class=\"fa\"></i></th>";
									      	  				}else{
									      	  					theadHtml += "<th name=" + thisColumn.columnName + " title=" + thisColumn.showName + widthStyleHtml + ">" + thisColumn.showName + "</th>";
									      	  				}
									      	  				//拼接表格展示模板字段
									      	  				tbodyHtml += "<td align=\"left\" name=" + thisColumn.columnName + " title=\"$[" + thisColumn.columnName.toUpperCase() + "]\">$[" + thisColumn.columnName.toUpperCase() + "]</td>";
									      	  			}
									      	  			theadHtml += "</tr>";
									      	  			tbodyHtml += "</tr>";
									      	  			$table.find("thead").append(theadHtml);
									      	  			$table.find("tbody").append(tbodyHtml);
									      	  		}
									      	  	}catch(e){
									      	  		$.epm.snackbar("json对象转化表格失败,请检查数据完整性后重试...");
									      	  		return false;
									      	  	}
									      	    $modal.modal("hide");
									      	    $comp.click();
									      	  }
									      	}
									      ],
									      show: function($modal) {
									      	//根据当前$comp中表格对象初始化json
				                        	var $component = $comp.last();
				                        	if($component.attr("data-url")){
					                        	var $queryCondition = $component.find(".query-condition");
					                        	var $table = $component.find(".table-content");
					                        	var conditionJson = {
					                        		"queryCondition": ""
					                        	}
					                        	var tableColumnJson = {
					                        		"databaseInfo": "",
					                        		"baseQuerySQL": "",
					                        		"databaseMetaData": ""
					                        	}
					                        	//查询条件json
					                        	if($queryCondition.find(".inner-condition").length > 0){
					                        		var conditionArray = new Array();
					                        		$queryCondition.find(".inner-condition").each(function(){
					                        			//范围查询
					                    			    if($(this).attr("data-type") == "3" || $(this).attr("data-type") == "5"){
					                    			    	var json = {
						                        				"columnName": "",
													            "conditionType": "",
													            "conditionName": "",
													            "conditionValue1": "",
													            "conditionValue2": "",
													            "codeTableInfo": {
													                "codeTableSQL": "",
													                "codeTableKeyColumn": "",
													                "codeTableValueColumn": ""
													            }
						                        			}
						                        			json.conditionValue1 = $(this).find(":text:first").val();
						                        			json.conditionValue2 = $(this).find(":text:last").val();
					                    			    }else{
					                    			    	var json = {
						                        				"columnName": "",
													            "conditionType": "",
													            "conditionName": "",
													            "conditionValue": "",
													            "codeTableInfo": {
													                "codeTableSQL": "",
													                "codeTableKeyColumn": "",
													                "codeTableValueColumn": ""
													            }
						                        			}
						                        			if($(this).attr("data-type") == "1"){
						                        				json.conditionValue = $(this).find("select option:selected").val();
						                        			}else{
						                        				json.conditionValue = $(this).find(":text").val();
						                        			}
					                    			    }
					                        			if($(this).attr("data-type") == "1"){
					                    					json.columnName = $(this).find("select").attr("name") ? $(this).find("select").attr("name") : "";
					                        			}else{
					                        				json.columnName = $(this).find(":text").attr("name") ? $(this).find(":text").attr("name") : "";
					                        			}
					                        			json.conditionType = $(this).attr("data-type");
					                					json.conditionName = $(this).find("label").text() ? $(this).find("label").text() : "";
					                					json.codeTableInfo.codeTableSQL = $(this).attr("data-sql") ? $(this).attr("data-sql") : "";
					                					json.codeTableInfo.codeTableKeyColumn = $(this).attr("data-key-column") ? $(this).attr("data-key-column") : "";
					                					json.codeTableInfo.codeTableValueColumn = $(this).attr("data-value-column") ? $(this).attr("data-value-column") : "";
					                					
					                					conditionArray.push(json);
					                        		});
					                        		conditionJson.queryCondition = conditionArray;
					                        	}
					                        	//数据库信息json
					                        	var databaseJson = {
					                        		"url": "",
					                        		"username": "",
					                        		"password": "",
					                        		"driver": ""
					                        	}
					                        	databaseJson.url = $component.attr("data-url") ? $component.attr("data-url") : "";
					                        	databaseJson.username = $component.attr("data-username") ? $component.attr("data-username") : "";
					                        	databaseJson.password = $component.attr("data-password") ? $component.attr("data-password") : "";
					                        	databaseJson.driver = $component.attr("data-driver") ? $component.attr("data-driver") : "";
					                        	tableColumnJson.databaseInfo = databaseJson;
					                        	//查询sql 
					                        	tableColumnJson.baseQuerySQL = $component.find("table").attr("data-query-sql") ? $component.find("table").attr("data-query-sql") : "";
					                        	//显示结果json
					                        	if($table.find("thead th").length > 0){
					                        		var columnArray = new Array();
					                        		$table.find("thead th").each(function(){
					                        			if($(this).find(":checkbox").length < 1){
					                        				var columnJson = {
							                    				"columnName": "",
												                "columnAlias": "",
												                "showName": "",
												                "sortable": false,
												                "width": ""
							                    			}
							                    			columnJson.columnName = $(this).attr("name") ? $(this).attr("name") : "";
							                    			columnJson.columnAlias = $(this).attr("name") ? $(this).attr("name") : "";
							                    			columnJson.showName = $(this).text() ? $(this).text() : "";
							                    			columnJson.sortable = $(this).find("i").length > 0 ? true : false;
							                    			columnJson.width = $(this).attr("data-per-width") ? $(this).attr("data-per-width") : Math.round(parseInt($(this).css("width"))*100/parseInt($(this).parent().css("width"))) + "%";
							                    			
							                    			columnArray.push(columnJson);
					                        			}
					                        		});
					                        		tableColumnJson.databaseMetaData = columnArray;
					                        	}
					                        	var json = {
					                        		"sourceDBInfo": "",
					                        		"baseQuerySQL": "",
					                        		"sourceDBMetaData": "",
					                        		"queryCondition": ""
					                        	}
					                        	var columnJson = {
					                        		"column": "" 
					                        	}
					                        	json.sourceDBInfo = tableColumnJson.databaseInfo;
					                        	json.baseQuerySQL = tableColumnJson.baseQuerySQL;
					                        	columnJson.column = tableColumnJson.databaseMetaData;
					                        	json.sourceDBMetaData = columnJson;
					                        	json.queryCondition = conditionJson.queryCondition;
				                        	}else{
				                        		//初次初始化表格
				                        		var json = {
												    "sourceDBInfo": {
												        "url": "jdbc:oracle:thin:@10.0.93.169:1521:orcl",
												        "username": "cljy",
												        "password": "cljy",
												        "driver": "oracle.jdbc.driver.OracleDriver"
												    },
												    "baseQuerySQL": "SELECT T.ACTIVITY_ID,T.ACTIVITY_NAME,T.START_TIME,T.END_TIME,T.PERCENT FROM CLJY.CLYX_ACTIVITY T",
												    "sourceDBMetaData": {
												        "column": [
												            {
												                "columnName": "ACTIVITY_ID",
												                "columnAlias": "ACTIVITY_ID",
												                "showName": "活动id",
												                "sortable": true,
												                "width": "19%"
												            },
												            {
												                "columnName": "ACTIVITY_NAME",
												                "columnAlias": "",
												                "showName": "活动名",
												                "sortable": true,
												                "width": "19%"
												            },
												            {
												                "columnName": "START_TIME",
												                "columnAlias": "",
												                "showName": "开始时间",
												                "sortable": true,
												                "width": "19%"
												            },
												            {
												                "columnName": "END_TIME",
												                "columnAlias": "",
												                "showName": "结束时间",
												                "sortable": true,
												                "width": "19%"
												            },
												            {
												                "columnName": "PERCENT",
												                "columnAlias": "",
												                "showName": "完成百分比",
												                "sortable": true,
												                "width": "19%"
												            }
												        ]
												    },
												    "queryCondition": [
												        {
												            "columnName": "ACTIVITY_NAME",
												            "conditionType": "2",
												            "conditionName": "活动名称",
												            "codeTableInfo": {
												                "codeTableSQL": "",
												                "codeTableKeyColumn": "",
												                "codeTableValueColumn": ""
												            }
												        },
												        {
												            "columnName": "START_TIME",
												            "conditionType": "5",
												            "conditionName": "开始时间",
												            "codeTableInfo": {
												                "codeTableSQL": "",
												                "codeTableKeyColumn": "",
												                "codeTableValueColumn": ""
												            }
												        },
												        {
												            "columnName": "END_TIME",
												            "conditionType": "5",
												            "conditionName": "结束时间",
												            "codeTableInfo": {
												                "codeTableSQL": "",
												                "codeTableKeyColumn": "",
												                "codeTableValueColumn": ""
												            }
												        },
												        {
												            "columnName": "PERCENT",
												            "conditionType": "3",
												            "conditionName": "完成百分比",
												            "codeTableInfo": {
												                "codeTableSQL": "",
												                "codeTableKeyColumn": "",
												                "codeTableValueColumn": ""
												            }
												        }
												    ]
												}
				                        	}
									      	
									      	$modal.find("textarea").val(JSON.stringify(json, null, 4));
								          },
								          close: function($modal) {
								          	
								          }
									    });
                                	});
                                },
                                get: function($comp, $prop) {
                                	
                                }
                            },
                            {
								name: '属性',
								html: '<label class="checkbox-inline"><input type="checkbox" checked/>表格复选</label>',
								set: function($comp, $prop) {
									$prop.click(function(){
										$comp.find("table").attr("data-multi-select",$prop.find(":checkbox").prop("checked"));
										if($comp.find("table").attr("data-multi-select") == "true"){
											if($comp.find(":checkbox").length > 0){
												$comp.find(":checkbox").each(function(){
													$(this).parent().show();
												});
											}
											$comp.find("table").attr("data-multi-select") == "false";
										}else{
											if($comp.find(":checkbox").length > 0){
												$comp.find(":checkbox").each(function(){
													$(this).parent().hide();
												});
											}
											$comp.find("table").attr("data-multi-select") == "true";
										}
									});
								},
								get: function($comp, $prop) {
									$prop.find(":checkbox").attr("checked",$comp.find("table").attr("data-multi-select") == "true" ? true : false);
								}
							},
							{
								name: '操作按钮置顶',
								html: '<label class="checkbox-inline"><input type="checkbox" checked/>置顶</label>',
								set: function($comp, $prop) {
									$prop.click(function(){
										$comp.find("table").attr("data-button-stick",$prop.find(":checkbox").prop("checked"));
										if($comp.find("table").attr("data-button-stick") == "true"){
											$comp.find(".query").hide();
										}else{
											$comp.find(".query").show();
										}
									});
								},
								get: function($comp, $prop) {
									$prop.find(":checkbox").attr("checked",$comp.find("table").attr("data-button-stick") == "true" ? true : false);
								}
							},{
								name: '分页类型',
								html: '<div class="form-group">' +
										'<label class="radio-inline"><input type="radio" checked/>后台</label>' +
										'<img src="../images/recommend.gif"><br>' +
										'<label class="radio-inline"><input type="radio"/>前台</label>' +
									  '</div>',
								set: function($comp, $prop) {
									var $pagi = $comp.last().find("[pagi-for]");
									var $traversal = $comp.last().find("[traversal]");
									$prop.find(":radio:eq(0)").click(function(){
										typeof($pagi.attr("fore-pagi")) != "undefined" ? $pagi.removeAttr("fore-pagi") : "";
										$traversal.attr("data-traversal-url","comp-table!getCommonTableData.action");
										$(this).parent().siblings().find(":radio").prop("checked",false);
									});
									$prop.find(":radio:eq(1)").click(function(){
										typeof($pagi.attr("fore-pagi")) == "undefined" ? $pagi.attr("fore-pagi","") : "";
										$traversal.attr("data-traversal-url","comp-table!getAllCommonTableData.action");
										$(this).parent().siblings().find(":radio").prop("checked",false);
									});
									typeof($pagi.attr("fore-pagi")) == "undefined" ? ($prop.find(":radio:eq(0)").attr("checked",true),$prop.find(":radio:eq(1)").attr("checked",false)) : ($prop.find(":radio:eq(0)").attr("checked",false),$prop.find(":radio:eq(1)").attr("checked",true));
								},
								get: function($comp, $prop) {
									
								}
							},
                            {
								name: '配置属性',
								html: '<div><button class="btn btn-info" style="margin-left:45px;">调整列宽</button></div><div style="display:none;"></div>',
								set: function($comp, $prop) {
									var sliderHtml = "";
									var warningSpan = "<div style=\"margin: 9px 0 30px 18px;\"><span class=\"label label-warning\">建议F11进入全屏模式</span></div>";
									$comp.find("table thead th").each(function(){
										if($(this).text()){
											sliderHtml += "<div class=\"form-inline table-col\"><label>" + $(this).text().trim() + "</label><input type=\"text\" data-slider-min=\"0\" data-slider-max=\"100\" data-slider-step=\"1\" data-slider-value=\"20\"/></div>";
										}
									});
									$prop.last().html("").html(warningSpan + sliderHtml);
									$prop.last().find("input").each(function(index,value){
										var colIndex = index;
										if($comp.find(":checkbox").length > 0){
											colIndex = index + 1;
										}
										var $temp = $comp.find("table thead th:eq(" + colIndex + ")");
										$(this).slider({
											formatter: function(value) {
												return value + "%";
											},
											value: $temp.attr("data-per-width") ? parseInt($temp.attr("data-per-width").substring(0,$temp.attr("data-per-width").indexOf("%"))) : Math.round(parseInt($temp.css("width"))*100/parseInt($temp.parent().css("width"))),
											tooltip: "always"
										});
										$(this).on("slide", function(slideEvt){
											$comp.find("table thead th:eq(" + colIndex + ")").css("width",slideEvt.value + "%");
											$comp.find("table thead th:eq(" + colIndex + ")").attr("data-per-width",slideEvt.value + "%");
										})
									});
									$prop.find("button").off().click(function(){
										$prop.last().slideToggle(function(){
											if(!$(this).is(":hidden")){
												$prop.find(".label-warning").delay(2000).slideUp();
											}
										});
									});
								},
								get: function($comp, $prop) {
									
								}
							}
                        ],
                        onload: function($comp) {
                        	//根据表格结构,以及属性展示数据、码表类型等内容
                        	var $component = $comp.last();
                        	var $queryCondition = $component.find(".query-condition");
                        	var $table = $component.find(".table-content");
                        	var conditionJson = {
                        		"queryCondition": ""
                        	}
                        	var tableColumnJson = {
                        		"databaseInfo": "",
                        		"baseQuerySQL": "",
                        		"databaseMetaData": ""
                        	}
                        	//数据库信息json
                        	var databaseJson = {
                        		"url": "",
                        		"username": "",
                        		"password": "",
                        		"driver": ""
                        	}
                        	databaseJson.url = $component.attr("data-url") ? $component.attr("data-url") : "";
                        	databaseJson.username = $component.attr("data-username") ? $component.attr("data-username") : "";
                        	databaseJson.password = $component.attr("data-password") ? $component.attr("data-password") : "";
                        	databaseJson.driver = $component.attr("data-driver") ? $component.attr("data-driver") : "";
                        	tableColumnJson.databaseInfo = databaseJson;
                        	//查询sql 
                        	tableColumnJson.baseQuerySQL = $component.find("table").attr("data-query-sql") ? $component.find("table").attr("data-query-sql") : "";
                        	//查询条件json
                        	var dataJsonArray = new Array();
                        	if($queryCondition.find(".inner-condition").length > 0){
                        		var conditionArray = new Array();
                        		$queryCondition.find(".inner-condition").each(function(index,value){
                        			//范围查询
                    			    if($(this).attr("data-type") == "3" || $(this).attr("data-type") == "5"){
                    			    	var json = {
	                        				"columnName": "",
								            "conditionType": "",
								            "conditionName": "",
								            "conditionValue1": "",
								            "conditionValue2": "",
								            "codeTableInfo": {
								                "codeTableSQL": "",
								                "codeTableKeyColumn": "",
								                "codeTableValueColumn": ""
								            }
	                        			}
	                        			json.conditionValue1 = $(this).find(":text:first").val();
	                        			json.conditionValue2 = $(this).find(":text:last").val();
                    			    }else{
                    			    	var json = {
	                        				"columnName": "",
								            "conditionType": "",
								            "conditionName": "",
								            "conditionValue": "",
								            "codeTableInfo": {
								                "codeTableSQL": "",
								                "codeTableKeyColumn": "",
								                "codeTableValueColumn": ""
								            }
	                        			}
	                        			if($(this).attr("data-type") == "1"){
	                        				json.conditionValue = $(this).find("select option:selected").val();
	                        			}else{
	                        				json.conditionValue = $(this).find(":text").val();
	                        			}
                    			    }
                        			if($(this).attr("data-type") == "1"){
                        				//请求码表数据
                        				var dicSql = $(this).attr("data-sql") ? $(this).attr("data-sql") : "";
                        				var dicKey = $(this).attr("data-key-column") ? $(this).attr("data-key-column").toUpperCase() : "";
                        				var dicValue = $(this).attr("data-value-column") ? $(this).attr("data-value-column").toUpperCase() : "";
                        				var dataJson = {
                        					"sql": dicSql,
                        					"key": dicKey,
                        					"value": dicValue
                        				}
                        				dataJsonArray.push(dataJson);
                    					json.columnName = $(this).find("select").attr("name") ? $(this).find("select").attr("name") : "";
                        			}else{
                        				json.columnName = $(this).find(":text").attr("name") ? $(this).find(":text").attr("name") : "";
                        			}
                        			json.conditionType = $(this).attr("data-type");
                					json.conditionName = $(this).find("label").text() ? $(this).find("label").text() : "";
                					json.codeTableInfo.codeTableSQL = $(this).attr("data-sql") ? $(this).attr("data-sql") : "";
                					json.codeTableInfo.codeTableKeyColumn = $(this).attr("data-key-column") ? $(this).attr("data-key-column") : "";
                					json.codeTableInfo.codeTableValueColumn = $(this).attr("data-value-column") ? $(this).attr("data-value-column") : "";
                					
                					conditionArray.push(json);
                        		});
                        		conditionJson.queryCondition = conditionArray;
                        	}
                        	//请求码表数据
                        	if(dataJsonArray){
                        		var dictionaryJson = {
	            					"databaseInfo": databaseJson,
	            					"dicJson": dataJsonArray
	            				}
	            				$.post("comp-table!getDictionaryData",{"dictionaryJson": JSON.stringify(dictionaryJson)},function(data){
	            					if(data && data.success){
	            						var dicResult = data.data;
	            						var dataLength = data.data.length;
	            						for(i=0;i<dataLength;i++){
	            							var singleDicResult = dicResult[i];
	            							var dicLength = singleDicResult.length;
	            							if(singleDicResult){
	            								var optionHtml = "";
	            								for(var j=0;j<dicLength;j++){
	            									var $targetDiv = $queryCondition.find("select:eq(" + i +  ")").closest(".inner-condition");
	            									if($targetDiv.data("key-column") && $targetDiv.data("value-column")){
	            										var keyColumn = $targetDiv.data("key-column").toUpperCase();
	            										var valueColumn = $targetDiv.data("value-column").toUpperCase();
	            										optionHtml += "<option value=" + singleDicResult[j][keyColumn] + ">" + singleDicResult[j][valueColumn] + "</option>";
	            									}
	            								}
	                							if(optionHtml){
	                								$queryCondition.find("select:eq(" + i + ")").empty().append("<option value=\"\">请选择...</option>").append(optionHtml);
	                							}
	            							}
	            						}
	            					}else{
	            						$.epm.snackbar(data.msg);
	            					}
	            				},"json");
                        	}
                        	//显示结果json
                        	if($table.find("thead th").length > 0){
                        		var columnArray = new Array();
                        		$table.find("thead th").each(function(){
                        			if($(this).find(":checkbox").length < 1){
                        				var columnJson = {
		                    				"columnName": "",
							                "columnAlias": "",
							                "showName": ""
		                    			}
		                    			columnJson.columnName = $(this).attr("name") ? $(this).attr("name") : "";
		                    			columnJson.showName = $(this).text() ? $(this).text() : "";
		                    			
		                    			columnArray.push(columnJson);
                        			}
                        		});
                        		tableColumnJson.databaseMetaData = columnArray;
                        	}
                        	//初始化事件控件
                        	if($comp.find(".form_datetime").length > 0){
		      	  				$comp.find(".form_datetime").datetimepicker({
		      	  					language:  "zh-CN",
								    format: "yyyy-mm-dd",
								    startView: 2,
									minView: 2,
									todayBtn: 1,
								    autoclose: 1
								});
		      	  			}
		      	  			//为分页pagi-for属性添加控件唯一标识,便于分页
		      	  			if(!$table.find("tbody").attr("data-pagi")){
		      	  				var newPagiId = newId.newId(8);
		      	  				$table.find("tbody").attr("data-pagi", newPagiId);
		      	  				$component.find("[pagi-for]").attr("pagi-for", "[data-pagi=\"" + newPagiId + "\"]");
		      	  			}
		      	  			
                        	$component.find("[traversal]").data("traversal-params",{"metaDataJSON": JSON.stringify(tableColumnJson),"queryConditionJSON": JSON.stringify(conditionJson)});
                        	//请求表单数据
                        	$component.find("[data-traversal-url]").each(function() {
						      var $element = $(this);
						      if(!$element.attr("data-traversal-template")) {
						        $element.attr("data-traversal-template", $element.html()).html("");
						      }
						    });
						    var emptyJson = {
						    	"empty": ""
						    }
						    emptyJson.empty = "<td colspan=10 class=\"alert alert-warning\" role=\"alert\"><strong>Warning!</strong> 暂无相关数据展示...</td>";
						    $component.find("[traversal]").attr("data-traversal-prompt",JSON.stringify(emptyJson));
                        	$component.find("[pagi-for]").addClass("paglink-container").each(function() {
						    	var $loadingDiv = "<div class=\"loadingDiv\" align=\"center\">加载中,请稍候...</div>";
						    	if($component.find(".loadingDiv").length < 1){
						    		$(this).before($loadingDiv);
						    	}
						    	$(this).pagi();
							});
							
							//查询操作
							$comp.find(".query-button .query").click(function(event){
								//查询条件json
								event.stopPropagation();
	                        	if($queryCondition.find(".inner-condition").length > 0){
	                        		var conditionArray = new Array();
	                        		$queryCondition.find(".inner-condition").each(function(){
	                        			//范围查询
	                    			    if($(this).attr("data-type") == "3" || $(this).attr("data-type") == "5"){
	                    			    	var json = {
		                        				"columnName": "",
									            "conditionType": "",
									            "conditionName": "",
									            "conditionValue1": "",
									            "conditionValue2": "",
									            "codeTableInfo": {
									                "codeTableSQL": "",
									                "codeTableKeyColumn": "",
									                "codeTableValueColumn": ""
									            }
		                        			}
		                        			json.conditionValue1 = $(this).find(":text:first").val() ? $(this).find(":text:first").val().trim() : "";
		                        			json.conditionValue2 = $(this).find(":text:last").val() ? $(this).find(":text:last").val().trim() : "";
	                    			    }else{
	                    			    	var json = {
		                        				"columnName": "",
									            "conditionType": "",
									            "conditionName": "",
									            "conditionValue": "",
									            "codeTableInfo": {
									                "codeTableSQL": "",
									                "codeTableKeyColumn": "",
									                "codeTableValueColumn": ""
									            }
		                        			}
		                        			if($(this).attr("data-type") == "1"){
		                        				json.conditionValue = $(this).find("select option:selected").val() ? $(this).find("select option:selected").val().trim() : "";
		                        			}else{
		                        				json.conditionValue = $(this).find(":text").val() ? $(this).find(":text").val().trim() : "";
		                        			}
	                    			    }
	                        			if($(this).attr("data-type") == "1"){
	                    					json.columnName = $(this).find("select").attr("name") ? $(this).find("select").attr("name") : "";
	                        			}else{
	                        				json.columnName = $(this).find(":text").attr("name") ? $(this).find(":text").attr("name") : "";
	                        			}
	                        			json.conditionType = $(this).attr("data-type");
	                					json.conditionName = $(this).find("label").text() ? $(this).find("label").text() : "";
	                					json.codeTableInfo.codeTableSQL = $(this).attr("data-sql") ? $(this).attr("data-sql") : "";
	                					json.codeTableInfo.codeTableKeyColumn = $(this).attr("data-key-column") ? $(this).attr("data-key-column") : "";
	                					json.codeTableInfo.codeTableValueColumn = $(this).attr("data-value-column") ? $(this).attr("data-value-column") : "";
	                					
	                					conditionArray.push(json);
	                        		});
	                        		conditionJson.queryCondition = conditionArray;
	                        		$component.find("[traversal]").data("traversal-params",{"metaDataJSON": JSON.stringify(tableColumnJson),"queryConditionJSON": JSON.stringify(conditionJson)});
	                        	}
								$component.find("[pagi-for]").pagi();
							});
							//绑定表格复选功能
                        	$component.find("[traversal]").on("loaded.traversal",function(){
                        		$table.each(function() {
							        var $element = $(this);
							        
							        $element.find("thead th :checkbox,td :checkbox").off("click").click(function() {
							          var checked = $(this).prop("checked");
							          $element.find("tbody th :checkbox:enabled,td :checkbox:enabled").prop("checked", checked).closest("tr")[checked ? "addClass" : "removeClass"]("active");
							
							          var $checked = $element.find("tbody th :checked,td :checked");
							          $element.trigger("epm.table.select", [$checked, $checked.length]);
							
							          $.epm.frame.toolbar.adjust();
							        });
							        $element.find($element.hasClass("entire-row") ? "tbody tr" : "tbody th :checkbox,td :checkbox").off("click").click(function() {
							          var $tr = $(this).closest("tr");
							          var $checkbox = $tr.find("th :checkbox,td :checkbox");
							
							          if($checkbox.is(":enabled")) {
							            $tr.toggleClass("active");
							            $checkbox.prop("checked", $tr.hasClass("active"))
							            $element.find("thead th :checkbox,td :checkbox").prop("checked", $element.find("tbody th :checkbox:enabled,td :checkbox:enabled").length  == $element.find("tbody th :checked:enabled,td :checked:enabled").length);
							          
							            $element.trigger("epm.table.select", [$tr, $element.find("tbody th :checked,td :checked").length]);
							
							            $.epm.frame.toolbar.adjust();
							          }
							        });
							      });
							      //单选/复选
	                        	  if($table.attr("data-multi-select") == "true"){
	                        		  if($comp.find(":checkbox").length > 0){
										  $comp.find(":checkbox").each(function(){
											  $(this).parent().show();
										  });
									  }
	                        	  }else{
	                        		  if($comp.find(":checkbox").length > 0){
										  $comp.find(":checkbox").each(function(){
											  $(this).parent().hide();
										  });
									  }
	                        	  }
							});
							//根据列排序
							$component.find("[sort-for]").each(function() {
						      var $element = $(this);
						      var $forElement = $($element.attr("sort-for"));
						      // 是否分页
						      var forPagi = $element.attr("sort-for-pagi");
						      $element.find("th[sort-col]")
						        .attr("data-sort-order", "desc")
						        .css("cursor", "pointer")
						        .find("i").attr("title", "点击按降序排列").attr("alt", "点击按降序排列").addClass("fa-sort")
						        .parent().click(function() {
						          var $element = $(this);
						          
						          //根据列排序时获取当前查询条件，并排序
						          if($queryCondition.find(".inner-condition").length > 0){
	                        		var conditionArray = new Array();
	                        		$queryCondition.find(".inner-condition").each(function(){
	                        			//范围查询
	                    			    if($(this).attr("data-type") == "3" || $(this).attr("data-type") == "5"){
	                    			    	var json = {
		                        				"columnName": "",
									            "conditionType": "",
									            "conditionName": "",
									            "conditionValue1": "",
									            "conditionValue2": "",
									            "codeTableInfo": {
									                "codeTableSQL": "",
									                "codeTableKeyColumn": "",
									                "codeTableValueColumn": ""
									            }
		                        			}
		                        			json.conditionValue1 = $(this).find(":text:first").val() ? $(this).find(":text:first").val().trim() : "";
		                        			json.conditionValue2 = $(this).find(":text:last").val() ? $(this).find(":text:last").val().trim() : "";
	                    			    }else{
	                    			    	var json = {
		                        				"columnName": "",
									            "conditionType": "",
									            "conditionName": "",
									            "conditionValue": "",
									            "codeTableInfo": {
									                "codeTableSQL": "",
									                "codeTableKeyColumn": "",
									                "codeTableValueColumn": ""
									            }
		                        			}
		                        			if($(this).attr("data-type") == "1"){
		                        				json.conditionValue = $(this).find("select option:selected").val() ? $(this).find("select option:selected").val().trim() : "";
		                        			}else{
		                        				json.conditionValue = $(this).find(":text").val() ? $(this).find(":text").val().trim() : "";
		                        			}
	                    			    }
	                        			if($(this).attr("data-type") == "1"){
	                    					json.columnName = $(this).find("select").attr("name") ? $(this).find("select").attr("name") : "";
	                        			}else{
	                        				json.columnName = $(this).find(":text").attr("name") ? $(this).find(":text").attr("name") : "";
	                        			}
	                        			json.conditionType = $(this).attr("data-type");
	                					json.conditionName = $(this).find("label").text() ? $(this).find("label").text() : "";
	                					json.codeTableInfo.codeTableSQL = $(this).attr("data-sql") ? $(this).attr("data-sql") : "";
	                					json.codeTableInfo.codeTableKeyColumn = $(this).attr("data-key-column") ? $(this).attr("data-key-column") : "";
	                					json.codeTableInfo.codeTableValueColumn = $(this).attr("data-value-column") ? $(this).attr("data-value-column") : "";
	                					
	                					conditionArray.push(json);
	                        		});
	                        		conditionJson.queryCondition = conditionArray;
	                        		$component.find("[traversal]").data("traversal-params",{"metaDataJSON": JSON.stringify(tableColumnJson),"queryConditionJSON": JSON.stringify(conditionJson)});
	                        	}
						          
	                        	$component.find("[pagi-for]").pagi({"sortCol":$element.attr("sort-col"),"sortOrder":$element.attr("data-sort-order")});
						          // 刷新列表
						          /*if(forPagi){
						            // 分页
						            $forElement.pagi({"sortCol":$element.attr("sort-col"),"sortOrder":$element.attr("data-sort-order")});
						          } else {
						            // 不分页
						            $forElement
						              .attr("data-traversal-params", $.extend($forElement.attr("data-traversal-params"), {"sortCol":$element.attr("sort-col"),"sortOrder":$element.attr("data-sort-order")}))
						              .traversal()
						            ;
						          }*/
						          // 样式更改
						          switch($element.attr("data-sort-order")){
						          case "desc":
						            $element.attr("data-sort-order", "asc")
						              .find("i").attr("title", "点击按升序排列").attr("alt", "点击按升序排列")
						              .removeClass("fa-sort").removeClass("fa-sort-up").addClass("fa-sort-down")
						            ;
						            break;
						          case "asc":
						            $element.attr("data-sort-order", "desc")
						              .find("i").attr("title", "点击按降序排列").attr("alt", "点击按降序排列")
						              .removeClass("fa-sort-down").addClass("fa-sort-up")
						            ;
						            break;
						          }
						          // 清除兄弟节点样式
						          $element.siblings("[sort-col]").find("i").removeClass("fa-sort-down").removeClass("fa-sort-up").addClass("fa-sort");
						        })
						      ;
						    });
                        }
                    }
                /* Components end */
                }
			}
		});
    });
})(jQuery);