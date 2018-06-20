(function($) {
    $(function() {
        $.extend($.epm.data, { entityComponentsCallbacks : {
        	 "00015": function(field) {
                 return {
                	 name: field.fieldCode,
                     component: {
                    	 title: field.fieldName,
                    	 html: '<div class=\"form-inline\">\
                    		 <input type=\"hidden\" class="input-val">\
                    		    <input type=\"text\"  class=\"form-control select-obj\" >\
			                 </div>',
                         defaultName: field.fieldName,
                         allocate: ':hidden',
                         props: [
                                 {
									name: '默认值',
									html: '<label class=\"radio-inline\"><input type=\"radio\" checked=\"true\"  value=\"option1\"><span>单选树</span></label> \
									<label class=\"radio-inline\"><input type=\"radio\" value=\"option2\"><span>复选树</span></label>' ,
									set: function($comp, $prop) {
									},
									get: function($comp, $prop) {
										if($comp.eq(0).attr("enCheckbox")!=undefined){
											if($comp.eq(0).attr("enCheckbox")=="true"){
												$prop.find(":radio").eq(1).attr("checked", true);
												$prop.find(":radio").eq(0).attr("checked", false);
											}else{
												$prop.find(":radio").eq(0).attr("checked", true);
												$prop.find(":radio").eq(1).attr("checked", false);
											}
		                            	}else{
		                            		$comp.eq(0).attr("enCheckbox",false);
		                            	}
										$prop.find(":radio").click(function() {
											$prop.find(":radio").not($(this)).attr("checked", false);
											$comp.eq(0).attr("enCheckbox",$(this).val()=="option2");
											if($comp.eq(0).attr("url")!=-1){
												$comp.find(".select-obj").destroy_select_tree();
											}
										});
									}
                                 },
     							{
     								name: '下拉数据源',
     								html: '<textarea  class="form-control"/>\
     									<button class="form-control" type="button">校验数据源</button>\
     									<label></label>',	
     								set: function($comp, $prop) {
     									$prop.eq(2).click(function(){
     										$.post($prop.eq(0).val(),
     											   function(data){
		     											if($.type(data)=="array"){
		     												if(data.length==1&&data[0].id!=""){
		     													$prop.eq(4).text("合法");
		     													$comp.eq(0).attr("url",$prop.eq(0).val());
		     													$comp.find(".select-obj").destroy_select_tree();
		     													return;
		     												}
		     											}
		     											if($.type(data)=="object"){
		     												if(data.id!=""){
		     													$prop.eq(4).text("合法");
		     													$comp.eq(0).attr("url",$prop.eq(0).val());
		     													$comp.find(".select-obj").destroy_select_tree();
		     													return;
		     												}
		     											}
	     												$prop.eq(4).text("非法");
	     												$comp.eq(0).attr("url",-1);
     											   })
     									});
     									
     									
			                        },
			                        get: function($comp, $prop) {
			                        	if($comp.eq(0).attr("url")!=undefined){
			                        		$prop.eq(0).val($comp.eq(0).attr("url"));
		                            	}
			                        }
     							}
                             ],
     						onpublish:function($comp){
     							if($comp.eq(0).attr("url")==undefined){
                            		$.epm.snackbar("你没有校验数据源的合法性，请校验，否则无法使用！");
                            		return false;
                            	}
                            	$comp.find(".select-obj").destroy_select_tree();
                            	if($comp.eq(0).attr("url")==-1){
                            		$.epm.snackbar("你的数据源结构不合法，请查看后在使用下拉树！");
                            		return false;
                            	}
     						},
                           
                            onload: function($comp) {
                            	var dtd = $.Deferred();
                            	$comp.find(".select-obj").bindJstreeSelect({
                            		  enCheckbox:$comp.eq(0).attr("enCheckbox")=="true",
									  url: $comp.eq(0).attr("url"),
									  saveObj: $comp.find(".input-val"), //隐藏域来保存id
								  	  width: 200,
								  	  height: 250,
								  	  leafSelected:true,
								  	  fontSize: "x-small", //树字体大小String支持属性(xx-small x-small small medium large x-large xx-large)
								  	  enRightClick: false,   //是否允许右键 boolean
								      enFilter: true      //是否包含搜索 boolean
								      
									});
                            	$comp.find("[bonc-tree]").on("select_node.jstree",function(e,obj){
                             		var ids="";
                             		for(var i=0;i<obj.selected.length;i++){
                             			ids+=obj.selected[i]+",";
                             		}
                             		ids = ids.substr(0,ids.length-1);
                             		$comp.find(":hidden").val(ids);
                        	 	});
                            	
                            	$comp.find("[bonc-tree]").on("ready.jstree", function() {
                            		dtd.resolve();
                            		console.log(">>>>> ready.jstree");
                            	});
                            	
                            	return dtd;
	                    	},
	                    	  echo:function($comp,values){
	                    		  console.log(">>>>> echo");
	                    		  $comp.find(".select-obj").destroy_select_tree();
	                    		  if($comp.eq(0).attr("url")==null)return;
	                            	$comp.find(".select-obj").bindJstreeSelect({
	                            		enCheckbox:$comp.eq(0).attr("enCheckbox")=="true",
										  url: $comp.eq(0).attr("url"),
										  saveObj: $comp.find(".input-val"), //隐藏域来保存id
									  	  width: 200,
									  	  height: 250,
									  	  leafSelected:true,
									  	  fontSize: "x-small", //树字体大小String支持属性(xx-small x-small small medium large x-large xx-large)
									  	  enRightClick: false,   //是否允许右键 boolean
									      enFilter: true      //是否包含搜索 boolean
									      
										});
	                    		  $comp.find(".input-val").val($comp.find(":hidden").val());
	                    	  },
		                    ondrop: function($comp) {
		                    }
                     }
                 }},
        	 "00014": function(field) {
                 return {
                	 name: field.fieldCode,
                     component: {
                    	 title: field.fieldName,
                    	 html: '<div class="form-group">\
                    		    <input type="text" hidden>\
			                	<label>开始日期</label>\
			                	<div class="input-group date form_datetime "  >\
	                        	<span hidden style="color:#F00;font-weight:bold">*</span>\
	                            <input class="form-control" size="16" type="text" value=""  readonly>\
	    					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
	                    </div><div style=""><label >结束日期</label>\
			                	<div class="input-group date form_datetime "  >\
			                  	<span hidden style="color:#F00;font-weight:bold">*</span>\
			                    <input class="form-control" size="16" type="text" value=""  readonly>\
			  				<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
			            </div>\
			                	</div>\
			            </div>',
                         defaultName: field.fieldName,
                         allocate: ':hidden',
                         props: [
     							{
     								name: '日期',
     								 html: '<div><label>开始日期</label><div class="input-group date form_datetime "  >\
     					              	<span hidden style="color:#F00;font-weight:bold">*</span>\
     					                  <input class="form-control" size="16" type="text" value="" >\
     									<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
     					          </div><label>结束日期</label><div class="input-group date form_datetime "  >\
     								                          	<span hidden style="color:#F00;font-weight:bold">*</span>\
     								                            <input class="form-control" size="16" type="text" value="" >\
     								          				<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
     								                    </div></div>',	
     								                   set: function($comp, $prop) {
     							 							$prop.find("input").change(function() {
     							 							  if($prop.find("input").index($(this))==0){
     							 								 $comp.find("input").first().val($prop.find("input").first().val());
     							 								$prop.find(".form_datetime").last().datetimepicker("setStartDate",$prop.find("input").first().val());
     							 							  }else{
     							 								 $comp.find("input").last().val($prop.find("input").last().val());
     							 								$prop.find(".form_datetime").first().datetimepicker("setEndDate",$prop.find("input").last().val());
     							 							  }
     							 							});
     							                        },
     							                        get: function($comp, $prop) {
     														$prop.find(".form_datetime").datetimepicker({
															  language:  "zh-CN",
														        weekStart: 1,
														        format: "yyyy-mm-dd",
														        todayBtn:  1,
																autoclose: 1,
																todayHighlight: 1,
																startView: 2,
																minView: 2,
																forceParse: 0
																					});
     							                        }
     							}
                             ],
                             onload: function($comp) {
			                    	var dataFormater = {
											  language:  "zh-CN",
										        weekStart: 1,
										        format: "yyyy-mm-dd",
										        todayBtn:  1,
												autoclose: 1,
												todayHighlight: 1,
												startView: 2,
												minView: 2,
												forceParse: 0
																	};
			                    	$comp.find(".form_datetime").datetimepicker(dataFormater);
			                    	$comp.find(".form_datetime").last().datetimepicker("setStartDate",$comp.find("input").first().val());
			                    	$comp.find(".form_datetime").first().datetimepicker("setEndDate",$comp.find("input").last().val());
			                    	$comp.find("input").change(function() {
			                    		 if($comp.find("input").index($(this))==1){
			                    			$comp.find(".form_datetime").last().datetimepicker("setStartDate",$comp.find("input").eq(1).val());
			 							  }else{
			 								$comp.find(".form_datetime").first().datetimepicker("setEndDate",$comp.find("input").last().val());
			 							  }
			                    	});
			                    	
			                    	
			                    	
			                    	$comp.find("input").change(function() {
			                    		var temp = $comp.find(".form_datetime:eq(0) :input").val()+","+$comp.find(".form_datetime:eq(1) :input").val()
			                    		$comp.find(":hidden").val(temp);;
			                    	});
			                    	
			                    },
			                    echo:function($comp){
			                    	var dataFormater = {
											  language:  "zh-CN",
										        weekStart: 1,
										        format: "yyyy-mm-dd",
										        todayBtn:  1,
												autoclose: 1,
												todayHighlight: 1,
												startView: 2,
												minView: 2,
												forceParse: 0
																	};
			                    	$comp.find(".form_datetime").datetimepicker(dataFormater);
			                    	if($comp.find(":hidden").val()!=""){
			                    		var tmpArr = $comp.find(":hidden").val().split(",");
			                    		$comp.find(".form_datetime:eq(0) :input").val(tmpArr[0]);
			                    		$comp.find(".form_datetime:eq(1) :input").val(tmpArr[1]);
			                    		$comp.find(".form_datetime").last().datetimepicker("setStartDate",tmpArr[0]);
				                    	$comp.find(".form_datetime").first().datetimepicker("setEndDate",tmpArr[1]);
			                    	}
			                    },
			                    ondrop: function($comp) {
			                    }
                     }
                 }},
        	
        	 "00012": function(field) {
                 return {
                	 name: field.fieldCode,
                     component: {
                    	 title: field.fieldName,
                    	 html: '\
 							<div class="form-inline">\
 								<span hidden style="color:#F00;font-weight:bold">*</span>\
 								<input type="text" class="form-control"/>\
                    		    <input type="hidden" class="form-control"/>\
 								<input type="button" value="打开" />\
 							</div>\
 						',
                         defaultName: field.fieldName,
                         allocate: 'input:eq(1)',
                         props: [
     							{
     								name: '新窗口链接',
     								html: '<textarea  class="form-control"/>',
     								set: function($comp, $prop) {
     									$prop.keyup(function(){
     										$comp.find(":button").attr("actionUrl",$prop.val());
     									});
     								},
     								get: function($comp, $prop) {
     									$prop.val($comp.find(":button").attr("actionUrl"));
     								}
     							},
     							{
     								name: '回显时服务链接',
     								html: '<textarea  class="form-control"/>',
     								set: function($comp, $prop) {
     									$prop.keyup(function(){
     										$comp.find(":button").attr("serviceUrl",$prop.val());
     									});
     								},
     								get: function($comp, $prop) {
     									$prop.val($comp.find(":button").attr("serviceUrl"));
     								}
     							}
                             ],
                             onload: function($comp) {
                             	$comp.find(":button").click(function(){
                             		//var actionUrl = "http://132.35.224.151:8694/usertool/extractmsg.action";
                             		debugger;
             						$.epm.modal({
                         				title: "选择客户群",
                         				body: "<iframe id=\"myFrame\" src="+$comp.find(":button").attr("actionUrl")+" width=\"100%\" height=\"200\"   frameborder=\"1\"></iframe>",
                         				buttons: [
         									{
         										value: "确定",
         										style: "default",
         										click: function($modal) {
         											//传递请求到myFrame的iframe中，等待返回数据
         											myFrame.contentWindow.postMessage("", "*");
         											function messageFunc(event) {
							  							alert();
         												//debugger;
         												var json = "";
         												try{
         													json = event.data;
         												}catch(e){
         													
         												}
         												$comp.find(":text:eq(0)").val(json.name);
         												$comp.find(":text:eq(0)").next().val(json.id);
         												$modal.modal("hide");
         											}
         											
         											window.addEventListener("message", messageFunc);
         										}
         									},      
                         					{
                         						value: "取消",
                         						style: "default",
                         						dismiss: true
                         					}
                         				],
                         				show: function($modal) {
                         				}
                                 	});
                             		
                             	});
                             },
                             onpublish:function($comp){
      							if($comp.find(":button").attr("actionUrl")==undefined){
                             		$.epm.snackbar("弹出窗体还未设置链接！");
                             		return false;
                             	}
                             	
      						},
                             echo:function($comp){
                        	 //	 url: "http://132.35.224.151:8694/usertool/extractmsg!getConditionsById.action?ciWaIds="+$comp.find(":text:eq(0)").next().val(),
                            	 $.ajax({
                        	 	 url: $comp.find(":button").attr("serviceUrl")+$comp.find(":text:eq(0)").next().val(),
                            	 dataType:"jsonp",
                            	 type:"post",
                            	 processData: false, 
                            	 jsonpCallback: "jsonp",
                            	 success: function(data){
                            		 $comp.find(":text:eq(0)").val(data[0].name);
                            	 },
                            	 error: function(XMLHttpRequest, textStatus, errorThrown) {
								       console.log(XMLHttpRequest.status + "," + XMLHttpRequest.readyState + "," + textStatus);
							     }
						     });
                             }
                     }
                 }},

            //实体单行文本字段控件
            "00001": function(field) {
                return {
                    name: field.fieldCode,
                    component: {
                        title: field.fieldName,
                        html: '<div class="form-group"><span hidden style="color:#F00;font-weight:bold">*</span><input  type="text" class="form-control"/></div>',
                        defaultName: field.fieldName,
                        allocate: 'input',
                        props: [
                            {
                                name: '默认值',
                                html: '<input type="text" class="form-control"></input>',
                                set: function($comp, $prop) {
                                    $prop.keyup(function(){
                                        $comp.find("input").val($prop.val());
                                    });
                                },
                                get: function($comp, $prop) {
                                    $prop.val($comp.find("input").val());
                                }
                            },
                            {
                                name: '校验',
                                html: '\
                                <div class="form-group">\
                                    <input type="checkbox" name="" value="readonly"\>只读</input>\
                                    <input type="checkbox" value="required"\>必填</input>\
                                </div>\
                                ',
                                set: function($comp, $prop) {
                                    $prop.click(function() {
                                        $prop.find(":checkbox").each(function(index, item) {
                                            $comp.find("input").prop($(item).val(),$(item).prop("checked"));
                                            if(index == 1)
                                                $comp.find("span").attr("hidden",!$(item).prop("checked"));
                                        });
                                    });
                                },
                                get: function($comp, $prop) {
                                    $prop.find(":checkbox").each(function(index, item) {
                                        $(item).prop("checked",$comp.find("input").prop($(item).val()));
                                        if(index == 1)
                                            $comp.find("span").prop("hidden",!$(item).prop("checked"));
                                    });
                                }
                            }
                        ]
                    }
                };
            },
            //实体下拉框字段控件
            "00005": function(field) {
                return {
                    //name: field.dataColumnName, dataColumnName导致数据获取不到 jiasong Update 2015-10-28 14:30
                    name: field.fieldCode,
                    component: {
                        title: field.fieldName,
                        html: '\
							<div class="form-group">\
								<select class="form-control" data-info='+ field.fieldValues +'>\
									<option value="1">选项1</option>\
									<option value="2">选项2</option>\
								</select>\
							</div>\
						',
                        defaultName: field.fieldName,
                        allocate: 'select',
                        props: [
                            {
                                name: '添加选项',
                                html: '\
									<a class="btn btn-default btn-sm btn-block manual">手动添加</a>\
									<div class="form-group manual">\
                                    	<table>\
                                        	<thead>\
                                            	<tr>\
													<td>\
														<label class="control-label">VALUE</label>\
													</td>\
													<td>\
														<label class="control-label">KEY</label>\
													</td>\
													<td>\
													</td>\
												</tr>\
											</thead>\
											<tbody>\
											</tbody>\
											<tfoot>\
												<tr>\
													<td colspan="2">\
														<a class="btn btn-default btn-sm btn-block">添加选项</a>\
													</td>\
												<tr>\
											<tfoot>\
										</table>\
									</div>\
									<a class="btn btn-default btn-sm btn-block automatic">自动绑定</a>\
									<div class="form-group automatic">\
										<label class="control-label">选择码表</label>\
										<select class="form-control codeTable"></select>\
										<label class="control-label">选择KEY</label>\
										<select class="form-control key"></select>\
										<label class="control-label">选择VALUE</label>\
										<select class="form-control value"></select>\
										<label class="control-label">选择ORD</label>\
										<select class="form-control ord"></select>\
										<br><a class="btn btn-default btn-sm save">保存</a>\
										<a class="btn btn-default btn-sm clean">清除</a>\
                                	</div>\
								',
                                set: function($comp, $prop) {
                                    var dataexist = $comp.find("select").attr("data-info"); //用来判断是否存在data数据
                                    $("a.automatic").click(function() {
                                        $("div.manual").slideToggle();
                                        $("div.automatic").slideToggle();
                                    });
                                    $("a.manual").click(function() {
                                        $("div.manual").slideToggle();
                                        $("div.automatic").slideToggle();
                                    });
                                    var $addBtn = $prop.find("table > tfoot > tr > td > a");
                                    var $optionWrapper = $prop.find("table > tbody"); 
                                    $addBtn.click(function() {
										var newOptionDataHtml = "\
											<tr>\
												<td>\
													<input type=\"text\ class=\"form-control key\"/>\
												</td>\
												<td>\
											 		<input type=\"text\" class=\"form-control value\"/>\
												</td>\
												<td>\
													<a class=\"btn btn-link btn-xs\">\
														<span class=\"glyphicon glyphicon-remove text-danger\" aria-hidden=\"true\"></span>\
													</a>\
											  	</td>\
											</tr>\
										";
                                        var $newOptionData = $(newOptionDataHtml);
                                        var $newOption = $("<option></option>");
                                        $newOptionData.find("td:eq(0) > input").keyup(function() {
                                            $newOption.text($newOptionData.find("td:eq(0) > input").val());
                                        });
                                        $newOptionData.find("td:eq(1) > input").keyup(function() {
                                            $newOption.val($newOptionData.find("td:eq(1) > input").val());
                                        });

                                        $newOptionData.find("td > a").click(function() {
                                            var indexNum = $newOptionData.index();
                                            $(this).parent().parent().remove();
                                            $comp.find("option:eq(" + indexNum + ")").remove();
                                        });

                                        $optionWrapper.append($newOptionData);
                                        $comp.find("select").append($newOption);
                                    })

                                    var fieldop = "<option></option>";

                                    $prop.find("select.codeTable").change(function() {
                                        var selectedKey = "";
                                        var selectedVal = "";
										var selectedOrd = "";
                                        if(dataexist && dataexist != "null"){
											console.log(1 + dataexist);
											console.log("进入");
											dataexist = $.parseJSON(dataexist);
                                            selectedKey = dataexist.key;
                                            selectedVal = dataexist.value;
											selectedOrd = dataexist.order;
											dataexist = JSON.stringify(dataexist);
                                        }
                                        var op = $(this).find("option:selected");
                                        $prop.find("select.key").html("");
                                        $prop.find("select.value").html("");
										$prop.find("select.ord").html("");
                                        $.post("entity!getfield.action",{"entityVersionID":op.val()},function(data,status){
                                            $(data.data).each(function(index,item){
                                                $keyop = $(fieldop);
                                                $valueop = $(fieldop);
												$ordop = $(fieldop);
                                                $keyop.val(item.fieldCode);
                                                $keyop.text(item.fieldName);
                                                $valueop.val(item.fieldCode);
                                                $valueop.text(item.fieldName);
												$ordop.val(item.fieldCode);
                                                $ordop.text(item.fieldName);
                                                if(index == 0){
                                                    $keyop.prop("selected",true);
                                                    $valueop.prop("selected",true);
													$ordop.prop("selected",true);
                                                }
                                                if(selectedKey == item.fieldCode)
                                                    $keyop.prop("selected",true);
                                                if(selectedVal == item.fieldCode)
                                                    $valueop.prop("selected",true);
												if(selectedOrd == item.fieldCode)
                                                    $ordop.prop("selected",true);
                                                $prop.find("select.key").append($keyop);
                                                $prop.find("select.value").append($valueop);
												$prop.find("select.ord").append($ordop);
                                            });
                                        },"json");
                                    });
                                    var dictionaryTable = {
                                        entity:"",
                                        key:"",
                                        value:"",
										order:""
                                    };
									//清除已经拥有的配置信息(下拉框选项,配置数据data-info,配置存在标识)
                                    $prop.find("a.clean").click(function(){
                                        $comp.find("select").attr("data-info","");
										dataexist = "";
                                        $comp.find("select").html("");
                                    });
                                    $prop.find("a.save").click(function() {
                                        dictionaryTable.entity = $prop.find("select.codeTable").find("option:selected").val();
                                        dictionaryTable.key = $prop.find("select.key").find("option:selected").val();
                                        dictionaryTable.value = $prop.find("select.value").find("option:selected").val();
										dictionaryTable.order = $prop.find("select.ord").find("option:selected").val();
										dataexist = JSON.stringify(dictionaryTable);
                                        $comp.find("select").attr("data-info",dataexist);
                                    });
                                },
                                get: function($comp, $prop) {
                                    var selectedEntity = "";
                                    var dataexist = $comp.find("select").attr("data-info");  //用来判断是否存在data数据
									
                                    if(dataexist && dataexist != "null"){
										dataexist = $.parseJSON(dataexist);
                                        selectedEntity = dataexist.entity;
                                        $("div.manual").slideUp();
                                        $("div.automatic").slideDown();
                                    }
                                    else {
                                        $("div.manual").slideDown();
                                        $("div.automatic").slideUp();

                                        $comp.find("option").each(function(index,value) {
                                            var $optionVal = $(value);
                                            var $optionWrapper = $prop.find("table > tbody");
											var newOptionDataHtml = "\
												<tr>\
													<td>\
														<input type=\"text\ class=\"form-control key\"/>\
													</td>\
													<td>\
														<input type=\"text\" class=\"form-control value\"/>\
													</td>\
													<td>\
														<a class=\"btn btn-link btn-xs\">\
															<span class=\"glyphicon glyphicon-remove text-danger\" aria-hidden=\"true\"></span>\
														</a>\
													</td>\
												</tr>\
											";
                                            var $newOptionData = $(newOptionDataHtml);
                                            $newOptionData.find("td:eq(0) > input").val($optionVal.text());
                                            $newOptionData.find("td:eq(1) > input").val($optionVal.val());
                                            $newOptionData.find("td > a").click(function() {
                                                var indexNum = $newOptionData.index();
                                                $(this).parent().parent().remove();
                                                $comp.find("option:eq(" + indexNum + ")").remove();
                                            });
                                            $optionWrapper.append($newOptionData);
                                        });
                                    }
                                    var op = "<option></option>";
                                    entityJson = {
                                        EntityVersionID:"",
                                        ExtendFlag:"",
                                        IsDictionaryTable:"1",
                                        limit:"-1",
                                            offset:"-1"
                                        }
                                    $.post("entity!get.action",{"entityJson":JSON.stringify(entityJson)},function(data,status){
                                        $(data.data).each(function(index,item){
                                            $op = $(op);
                                            $op.val(item.entityVersionID);
                                            $op.text(item.entityName);
                                            $prop.find("select.codeTable").append($op);
                                            if(selectedEntity == item.entityVersionID){
                                                $op.prop("selected",true);
                                            }
                                        });
                                        $prop.find("select.codeTable").change();
                                    },"json");
                                }
                            }
                        ],
                        onload: function($comp) {
					  		var dataexist = $comp.find("select").attr("data-info"); //用来判断是否存在data数据
							if(dataexist && dataexist != "null"){
								$comp.find("select").html("");
								var optiondata = $.parseJSON($comp.find("select").attr("data-info"));
								var op = "<option></option>";
								$.post("entity!getDictionaryTable.action",{"entityJson":dataexist},function(data,status){
									if(data.success && data.data != null) {
										$(data.data).each(function(index,item) {
											var $op = $(op);
											$op.val(item.KEY == null ? "":item.KEY);//key
											$op.text(item.VALUE == null ? "":item.VALUE);//value
											$comp.find("select").append($op);
										})
									}
								},"json");
							}
						}
                    }
                };
            },
            //实体数字字段控件
            "00007": function(field) {
                return {
                    //name: field.dataColumnName, dataColumnName导致数据获取不到 jiasong Update 2015-10-28 14:30
                    name: field.fieldCode,
                    component: {
                        title: field.fieldName,
                        html: '\
							<div class="form-group">\
								<span hidden style="color:#F00;font-weight:bold">*</span>\
								<input type="text" class="form-control" style="ime-mode: disabled;">\
							</div>\
						',
                        defaultName: field.fieldName,
                        allocate: 'input',
                        props: [
                            {
                                name: '默认值(请输入数字0~9)',
                                html: '\
									div class="from-group">\
										<input type="text" class="form-control" style="ime-mode: disabled;"/>\
									</div>\
								',
                                set: function($comp, $prop) {
                                    $prop.keypress(function(event){
                                        var evt = event || window.event;
                                        var keyCode = evt.keyCode || evt.which;
                                        //对应ASCII码表，只能包含输入和.小数
                                        if((keyCode >= 48 && keyCode <= 57) || keyCode == 46 && $prop.find("input").val().split(".").length-1 < 1 || keyCode == 8){
                                            return true;
                                        }else{
                                            return false;
                                        }
                                        //绑定数字框粘贴事件
                                    }).bind("paste",function(e){
                                        var el = $(this);
                                        var pri_value = $(this).val();
                                        setTimeout(function(){
                                            //获取粘贴板的值
                                            var clipboard = $(el).val();
                                            var r = /^\d+(\.\d+)?$/;
                                            if (r.test(clipboard)){
                                                return true;
                                            }
                                            else {
                                                //不匹配则还原输入框的值
                                                $(el).val(pri_value);
                                                return false;
                                            }
                                        },100);
                                    }).keyup(function() {
                                        $comp.find("input").val($prop.find("input").val());
                                    });
                                },
                                get: function($comp, $prop) {
                                    $prop.find("input").val($comp.find("input").val());
                                }
                            },
                            {
                                name: '校验',
                                html: '\
                                    <div class="form-group">\
                                    	<input type="checkbox" name="" value="readonly"/>只读\
                                    	<input type="checkbox" value="required"/>必填\
                                    </div>\
                                ',
                                set: function($comp, $prop) {
                                    $prop.click(function() {
                                        $prop.find(":checkbox").each(function(index, item) {
                                            $comp.find("input").prop($(item).val(),$(item).prop("checked"));
                                            if(index == 1)
                                                $comp.find("span").attr("hidden",!$(item).prop("checked"));
                                        });
                                    });
                                },
                                get: function($comp, $prop) {
                                    $prop.find(":checkbox").each(function(index, item) {
                                        $(item).prop("checked",$comp.find("input").prop($(item).val()));
                                        if(index == 1)
                                            $comp.find("span").attr("hidden",!$(item).prop("checked"));
                                    });
                                }
                            }
                        ],
                        onload: function($comp) {
                            $comp.keypress(function(event){
                                var evt = event || window.event;
                                var keyCode = evt.keyCode || evt.which;
                                //对应ASCII码表，只能包含输入和.小数
                                if((keyCode >= 48 && keyCode <= 57) || keyCode == 46 && $prop.find("input").val().split(".").length-1 < 1 || keyCode == 8){
                                    return true;
                                }else{
                                    return false;
                                }
                                //绑定数字框粘贴事件
                            }).bind("paste",function(e){
                                var el = $(this);
                                var pri_value = $(this).val();
                                setTimeout(function(){
                                    //获取粘贴板的值
                                    var clipboard = $(el).val();
                                    var r = /^\d+(\.\d+)?$/;
                                    if (r.test(clipboard))
                                        return true;
                                    else
                                        //不匹配则还原输入框的值
                                        $(el).val(pri_value);
                                        return false;
                                    },100);
                            });
                        }
                    }
                };
            },
            //实体上传文件字段控件
            "00009": function(field) {
                return {
                    //name: field.dataColumnName, dataColumnName导致数据获取不到 jiasong Update 2015-10-28 14:30
                    name: field.fieldCode,
                    component: {
                        title: field.fieldName,
                        html: '\
                             <div class="form-group">\
								<span hidden style="color:#F00;font-weight:bold">*</span>\
 								<input type="text" hidden  value="">\
	                            <input type="file" uploadify name="fileName" multiple="true"/>\
								<div fileQueue></div>\
								<a class="btn btn-primary btn-sm confirm" style="display:none;">确定上传</a>\
  								<a class="btn btn-default btn-sm cancel" style="display:none;">取消上传</a>\
	                        </div>',
                        defaultName: field.fieldName,
                        allocate: 'input:first',
                        props: [
                        	{
                                name: '上传数量',
                                html: '\
                                    <div class="form-group">\
                                        <label class="radio-inline"><input type="radio"><span>单文件</span></label>\
                                        <label class="radio-inline"><input type="radio" checked><span>多文件</span></label>\
										<div class="form-inline">\
											<label style="font-size: 12px;">请输入数量限制,为空则无上限</label>\
											<input type="number" class="form-control" style="max-width:100%">\
										</div>\
                                    </div>\
                                ',
                                set : function($comp, $prop) {
									$prop.find(":radio").click(function() {
										//控制单选
										$(this).parent().siblings(".radio-inline").find(":radio").attr("checked",false);
										if($prop.find(":radio:eq(0)").prop("checked")){
											$comp.last().attr("file-upload-numbers",1);
										}else{
											$comp.last().attr("file-upload-numbers","");
											$prop.find("input").val("");
										}
										$prop.find(".form-inline").slideToggle();
									});
									$prop.find("input").on("keyup",function(){
										$comp.last().attr("file-upload-numbers",$(this).val()>0 ? $(this).val() : "");
									});
								},
								get : function($comp, $prop) {
									$prop.find("input").val($comp.last().attr("file-upload-numbers"));
									if($comp.last().attr("file-upload-numbers") == 1){
										$prop.find(".form-inline").css("display","none");
										$prop.find(":radio:eq(0)").attr("checked",true);
										$prop.find(":radio:eq(1)").attr("checked",false);
									}else{
										$prop.find(".form-inline").css("display","block");
										$prop.find(":radio:eq(1)").attr("checked",true);
										$prop.find(":radio:eq(0)").attr("checked",false);
									}
								}
                            },
                            {
                                name: '单个文件大小',
                                html: '\
                                    <div class="form-group">\
										<label style="font-size: 12px;">请输入大小,为空则默认200MB</label>\
										<div class="form-inline">\
											<input type="number" class="form-control" style="max-width:52%">\
											<select class="form-control" style="max-width:45%"><option>KB</option><option selected>MB</option><option>GB</option></select>\
										</div>\
                                    </div>\
                                ',
                                set : function($comp, $prop) {
                                	$prop.change(function(){
                                		var thisVal = $prop.find("input").val();
                                		if(thisVal > 0){
                            				$comp.last().attr("data-upload-size",thisVal + $prop.find("option:selected").text());
                                		}else{
                                			$comp.last().attr("data-upload-size","200MB");
                                		}
                                	});
								},
								get : function($comp, $prop) {
									var fileSize = $comp.last().attr("data-upload-size");
									if(fileSize){
										if(fileSize.indexOf("KB") > 0){
											$prop.find("input").val(fileSize.substring(0,fileSize.indexOf("KB")));
											$prop.find("option:eq(0)").attr("selected",true);
										}else if(fileSize.indexOf("MB") > 0){
											$prop.find("input").val(fileSize.substring(0,fileSize.indexOf("MB")));
											$prop.find("option:eq(1)").attr("selected",true);
										}else{
											$prop.find("input").val(fileSize.substring(0,fileSize.indexOf("GB")));
											$prop.find("option:eq(2)").attr("selected",true);
										}
									}
								}
                            },
                            {
                                name: '校验',
                                html: '\
                                    <div class="form-group">\
                                        <input type="checkbox" value="readonly"\>只读</input>\
                                        <input type="checkbox" value="required"\>必填</input>\
                                    </div>\
                                ',
                                set : function($comp, $prop) {
									$prop.click(function() {
										$comp.find(":file").attr("disabled",$prop.find(":checkbox:first").prop("checked"));
										$comp.find("span").attr("hidden",!$prop.find(":checkbox:last").prop("checked"));
									});
								},
								get : function($comp, $prop) {
									$prop.find(":checkbox:first").attr("checked",$comp.find(":file:first").prop("disabled"));
									$prop.find(":checkbox:last").attr("checked",!$comp.find("span").attr("hidden"));
								}
                            }        
                        ],
                        //此处ondrop初始化只做展示用，最终会执行onload中的初始化插件
                        ondrop: function($comp){
                        	// 上传文件列表
							var $fileInput = $comp.find("input").first();
							$comp.find("[uploadify]").uploadifive({
								"fileObjName" : "fileName",
								"auto" : false,
								"buttonText" : "选择文件",
								"buttonClass" : "btn btn-primary",
								"height" : "25",
								"width" : "85",
								"removeCompleted" : false,
								"uploadScript" : "file!fileUpload", // 这里是通过MVC里的FileUpload控制器里的Upload
																	// 方法
								"multi" : true,
								"queueSizeLimit" : 5,
								"fileSizeLimit" : "200MB",
								"method" : "post",
								onFallback : function() {
									$.epm
											.snackbar("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
								},
								onUploadComplete : function(file, data,
										response) { // 单个文件上传完成触发

									if(data != null && data != ""){
										var json = $.parseJSON(data);
										data_id = json.data_id;
										$fileInput.val(data_id);
									}
									$.epm.snackbar("文件上传成功!"); // data就是action中返回来的数据
								},
								onCancel : function(file) { // 取消时触发

									// 此方法只针对提交之前取消，提交完成取消待补充
									// fileNameArray.pop(file.name);
								},
								onSelect : function(file) { // 当有文件进入队列展示操作按钮
									$comp.find("a.confirm").show();
									$comp.find("a.cancel").show();
								},
								onQueueComplete : function(queueData) { // 所有文件上传完成
									//$.epm.snackbar("所有文件上传成功!");
								}
							});
                        },
                        onload: function($comp) {
                        	//还原为初始状态
							$comp.find(".uploadifive-button").after($comp.find(":file:first"));
							$comp.find(".uploadifive-button").remove();
							$comp.find(":file").show();
							
							if($comp.find("div[fileQueue]") && $comp.find("div[fileQueue]") != ""){
								$comp.find("div[fileQueue]").attr("id",newId.newId(8));
							}
							var fileQueueId = $comp.find("div[fileQueue]").attr("id");
							
							var status = $comp.find(":file:first").prop("disabled");
							var uuid = newId.newId(16);
							var $fileInput = $comp.find("input").first();
							//此处实现为点击隐藏，提交删除关联关系
							var prepareToDelList = [];
							
							//map对象，key为file的唯一标识id，value为file_id
							var map = new Map();
							//获取上传文件限制queueSizeLimit
							var uploadSizeLimit = 1;
							if($comp.last().attr("file-upload-numbers")){
								uploadSizeLimit = $comp.last().attr("file-upload-numbers");
							}else{
								uploadSizeLimit = 9999;
							}
							//获取单个文件大小限制
							var uploadfileLimit = "200MB";
							if($comp.last().attr("data-upload-size")){
								uploadfileLimit = $comp.last().attr("data-upload-size");
							}
							$comp.find("[uploadify]").uploadifive({
								"fileObjName" : "fileName",
								"auto" : true,
								"buttonText" : "选择文件",
								"buttonClass" : "btn btn-primary",
								"height" : "25",
								"width" : "85",
								"removeCompleted" : false,
								"uploadScript" : "file!fileUpload", // 这里是通过MVC里的FileUpload控制器里的Upload
																	// 方法
								"queueID" : fileQueueId,
								"multi" : true,
								"queueSizeLimit" : uploadSizeLimit,
								"fileSizeLimit" : uploadfileLimit,
								"method" : "post",
								onFallback : function() {
									$.epm.snackbar("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
								},
								onAddQueueItem : function(){
									var $fileInput = $comp.find("input").first();
									if($fileInput.val()){
										var value = $fileInput.val();
										if(value.indexOf("文件下载") > -1){
											value = value.substring(value.lastIndexOf("文件下载") + 4);
											$fileInput.val(value);
											uuid = value;
										}
									}else{
										$fileInput.val(uuid);
									}
									$comp.find("[uploadify]").data("uploadifive").settings.formData = { "data_id": uuid}; 
								},
								onUploadComplete : function(file, data,
										response) { // 单个文件上传完成触发
									map.put(file.lastModified,$.parseJSON(data).file_id);
									$.epm.snackbar("文件上传成功!"); // data就是action中返回来的数据
								},
								onCancel : function(file) { // 取消时触发
									prepareToDelList.push(map.get(file.lastModified));
								},
								onSelect : function(file) { // 当有文件进入队列展示操作按钮
									
								},
								onQueueComplete : function(queueData) { // 所有文件上传完成
									$.epm.snackbar("所有文件上传成功!");
								}
							});
							//设为启用和禁用状态
							$comp.find(":file:last").attr("disabled",status);
				
							// 开始上传
							/*var uuid = "";
							$comp.find("a.confirm").click(function() {
								uuid = newId.newId(16);
								$comp.find("[uploadify]").data("uploadifive").settings.formData = {"data_id": uuid};
								$comp.find("[uploadify]").uploadifive("upload");
								$fileInput.val(uuid);
							});*/
							// 取消上传
							/*$comp.find("a.cancel").click(function() {
								$comp.find("[uploadify]")
										.uploadifive("clearQueue");
								$comp.find("a.confirm").hide();
								$comp.find("a.cancel").hide();
							});*/
                        },
                        echo: function($comp){
                        	var data_id = $comp.last().find("input:first").val();
                        	if(data_id){
                        		if(data_id.lastIndexOf("文件下载") > -1){
	                        		data_id = data_id.substring(data_id.lastIndexOf("文件下载") + 4);
	                        	}
	                        	//1、获取dom元素
								var $dom = $comp.find(".uploadifive-button");
								//此处实现为点击隐藏，提交删除关联关系
								var prepareToDelList = [];
								
								//2、异步请求数据 添加数据到dom元素中
								$.ajax( {
									url : "file!getFileList",
									data : {
										"data_id" : data_id
									},
									dataType : "json",
									success : function(data) {
										if(data.data){
											var fileList = data.data;
											for(var i=0;i<fileList.length;i++){
												var file_id = fileList[i].fileId;
												var $html = $("<span style=\"padding-left:5px;\"><a target=\"_self\" href=" + "file!downloadFile.action?file_id=" + file_id + " data-file=" + file_id + ">" + fileList[i].preName + "</a><a class=\"glyphicon glyphicon-remove text-danger\" style=\"cursor: pointer;padding-left: 2px;\" title=\"删除\"></a></span>");
												$dom.after($html);
												$dom.next().html($dom.next().html() + "&nbsp");
												$html.find("a:last").click(function(){
													prepareToDelList.push($(this).prev().data("file"));
													$(this).parent().fadeOut("fast");
												});
											}
											//提交保存删除关联关系
											$("#submit-btn").click(function(){
												console.log(prepareToDelList);
												if(prepareToDelList != null && prepareToDelList.length > 0){
													$.post("file!delRelByFileId",{"file_ids": prepareToDelList.join(),"data_id": data_id},function(data){
														if(data.data){
															//$.epm.snackbar("删除成功");
														}else{
															//$.epm.snackbar("删除失败");
														}
													},"json");	
												}
											});
										}
									}
								});
                        	}
                        }
                    }
                };
            },

            /*
             * 00002多行文本
             * 00008日期时间
             * 00003复选框组
             * 00004单选按钮组
             * 00006下拉复选框
             * 00010子表单
             */
            //实体多行文本控件
            "00002": function(field) {
                return {
                    //name: field.dataColumnName, dataColumnName导致数据获取不到 jiasong Update 2015-10-28 14:30
                    name: field.fieldCode,
                    component: {
                        title: field.fieldName,
                        html: '<div><span hidden style="color:#F00;font-weight:bold">*</span><textarea rows="3" value="" class="form-control"></textarea></div>',
                        allocate: "textarea",
                        defaultName: field.fieldName,
                        props: [{
                            name: '默认值',
                            html: '<textarea class="form-control" rows="3" value=""></textarea>',
                            set: function($comp, $prop) {
                                $prop.change(function() {
                                    $comp.find("textarea").val($prop.val());
                                });
                            },
                            get: function($comp, $prop) {
                                $prop.val($comp.find("textarea").val());
                            }
                        }, {
                            name: '校验',
                            html: '<div><input type="checkbox" value="readonly">&nbsp;<label>只读</label>&nbsp;&nbsp;<input type="checkbox" value="required">&nbsp;<label>必填</label></div>',
                            set: function($comp, $prop) {
                                $prop.change(function() {
                                    $prop.find(":checkbox").each(function() {
                                        $comp.find("textarea").attr($(this).val(), $(this).prop("checked"));
                                        $comp.find("span").attr("hidden", !($(this).prop("checked")));
                                    });
                                });
                            },
                            get: function($comp, $prop) {
                                $prop.find(":checkbox").each(function() {
                                    $(this).prop("checked", $comp.find("textarea").prop($(this).val()));
                                    $comp.find("span").attr("hidden", !($(this).prop("checked")));
                                });
                            }
                        }],
												onsubmit: function($comp) {
													var mobiles = $comp.find("textarea").val();
													var i;
														var result = "";
														var c;
														for (i = 0; i < mobiles.length; i++) {
																c = mobiles.substr(i, 1);
																if (c == "\n")
																		result = result + "\\n";
																else if (c != "\r")
																		result = result + c;
														}
														$comp.find("textarea").val(result);
														return true;
												}
                    }
                };
            },
            //实体日期时间控件
            "00008": function(field) {
                return {
                    //name: field.dataColumnName, dataColumnName导致数据获取不到 jiasong Update 2015-10-28 14:30
                    name: field.fieldCode,
                    component: {
                        title: field.fieldName,
                        html: '<div><span hidden style="color:#F00;font-weight:bold">*</span>\
							<div class="input-group date form_datetime "  >\
                            <input class="form-control" size="16" type="text" value="" >\
    					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
                    </div></div>',
                        allocate: 'input',
                        defaultName: field.fieldName,
                        props: [{
                            name: '默认值',
                            html: '<div class="input-group date form_datetime "  >\
                            	<span hidden style="color:#F00;font-weight:bold">*</span>\
                                <input class="form-control" size="16" type="text" value="" >\
        					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
                        </div>',
                            set: function($comp, $prop) {
                                $prop.change(function() {
                                    $comp.find("input").val($prop.find("input").val());
                                });
                            },
                            get: function($comp, $prop) {
                            	 $prop.datetimepicker({
       							  language:  "zh-CN",
       						        weekStart: 1,
       						        format: "yyyy-mm-dd",
       						        todayBtn:  1,
       								autoclose: 1,
       								todayHighlight: 1,
       								startView: 2,
       								minView: 2,
       								forceParse: 0

       													});
                                $prop.find("input").prop("value", $comp.find("input").val());
                            }
                        }, {
                            name: '校验',
                            html: '<div><input type="checkbox" value="disabled">&nbsp;<label>只读</label>&nbsp;&nbsp;<input type="checkbox" value="required">&nbsp;<label>必填</label></div>',
                            set: function($comp, $prop) {
                                $prop.change(function() {
                                    $prop.find(":checkbox").each(function() {
                                        $comp.find("input").attr($(this).val(), $(this).prop("checked"));
                                        $comp.find("span").attr("hidden", !($(this).prop("checked")));
                                    });
                                });
                            },
                            get: function($comp, $prop) {
                                $prop.find(":checkbox").each(function() {
                                    $(this).prop("checked", $comp.find("input").prop($(this).val()));
                                    $comp.find("span").attr("hidden", !($(this).prop("checked")));
                                });
                            }
                        }],
                        ondrop: function($comp){
                        },
                        onload: function($comp){
                          //加载datatimepicker控件
                        	$comp.find(".form_datetime").datetimepicker({
   							  language:  "zh-CN",
   						        weekStart: 1,
   						        format: "yyyy-mm-dd",
   						        todayBtn:  1,
   								autoclose: 1,
   								todayHighlight: 1,
   								startView: 2,
   								minView: 2,
   								forceParse: 0

   													});
                        }
                    }
                };
            },
            //实体复选框组控件
            "00003": function(field) {
                return {
                    //name: field.dataColumnName, dataColumnName导致数据获取不到 jiasong Update 2015-10-28 14:30
                    name: field.fieldCode,
                    component: {
                        title: field.fieldName,
                        html: '<div data-info="">' +
								'<span hidden style="color:#F00;font-weight:bold">*</span>' +
								'<label class="checkbox-inline"><input type="checkbox" value="option1"><span>选项1</span></label>' +
								'<label class="checkbox-inline"><input type="checkbox" value="option2"><span>选项2</span></label>' +
							'</div>',
                        allocate: ':checkbox',
                        defaultName: field.fieldName,
                        props: [{
						  name: '选项',
						  html: '<div class="draggable-div"></div>' +
						  		'<div>' +
						  			'<br>' +
						  			'<a class="btn btn-default btn-sm add-item">添加选项</a>' +
						  			'&amp;nbsp;&amp;nbsp;' +
						  			'<a class="btn btn-default btn-sm batch-edit">批量编辑</a>' +
						  			'<a class="btn btn-default add-data-rel" style="margin-top:10px;width:148px;">自动绑定</a>' +
					  			'</div>' + 
					  			'<div style="display:none;" class="auto-bind">' +
						  			'<label>选择码表</label><select class="form-control"></select>' +
						  			'<label>选择KEY</label><select class="form-control"></select>' +
						  			'<label>选择VALUE</label><select class="form-control"></select>' +
						  			'<label>选择排序</label><select class="form-control"></select>' +
						  			'<br>' +
						  			'<a class="btn btn-small btn-default save" style="">保存</a>&amp;nbsp;' +
						  			'<a class="btn btn-small btn-default clean" style="">清除</a>' +
						  			'<a class="btn btn-default add-data-self" style="margin-top:10px;width:148px;">手动添加</a>' +
					  			'</div>',
						  set: function($comp, $prop) {
							var $checkboxWrapper = $prop.first();
							var $addBtn = $prop.find("a.add-item").first();
							var $batchEditBtn = $prop.find("a.batch-edit").last();
							var $entityRelBtn = $prop.find("a.add-data-rel");
							var $addDataSelf = $prop.find("a.add-data-self");
							
							//自动绑定数据
							var $dirSelect = $prop.slice(2).find("select:eq(0)");
							var $keySelect = $prop.slice(2).find("select:eq(1)");
							var $valSelect = $prop.slice(2).find("select:eq(2)");
							var $ordSelect = $prop.slice(2).find("select:eq(3)");
							
							var fieldop = "<option></option>";
							var dataexist = $comp.last().attr("data-info");

							$dirSelect.change(function() {  //配置自动绑定码表

									var selectedKey = "";
									var selectedVal = "";
									var selectedOrder = "";
									if(dataexist && dataexist != null){  
											var currObj = $.parseJSON(dataexist);
											selectedKey = currObj.key;     //获取实体中绑定的key字段FieldCode
											selectedVal = currObj.value;   //获取实体中绑定的value字段FieldCode
											selectedOrder = currObj.order;
									}

									var op = $(this).find("option:selected");						//获得被选中的option(选中作为码表的实体)
									$keySelect.html("");
									$valSelect.html("");
									$ordSelect.html("");
									$.post("entity!getfield.action",{"entityVersionID":op.val()},function(data,status){			//获得选中码表的字段信息
											$(data.data).each(function(index,item){
													$keyop = $(fieldop);
													$valueop = $(fieldop);
													$ordop = $(fieldop);
													$keyop.val(item.fieldCode);
													$keyop.text(item.fieldName);
													$valueop.val(item.fieldCode);
													$valueop.text(item.fieldName);
													$ordop.val(item.fieldCode);
													$ordop.text(item.fieldName);
													if(index == 0){														//选中第一条数据，当实体没有绑定码表实体时默认选中第一条
															$keyop.prop("selected",true);
															$valueop.prop("selected",true);
													}
													selectedKey == item.fieldCode ? $keyop.prop("selected",true) : "";
													selectedVal == item.fieldCode ? $valueop.prop("selected",true) : "";
													selectedOrder == item.fieldCode ? $ordop.prop("selected",true) : "";
													$keySelect.append($keyop);				//将option插入
													$valSelect.append($valueop);
													$ordSelect.append($ordop);
											});
											//不存在实体绑定时,默认依次取值
											data.data.length > 1 && !dataexist ? $valSelect.find("option:eq(1)").prop("selected",true) : "";
											data.data.length > 2 && !dataexist ? $ordSelect.find("option:eq(2)").prop("selected",true) : "";
									},"json");
							});
							var dictionaryTable = {								//绑定码表json
									entity:"",
									key:"",
									value:"",
									order:""
							};
							$prop.find("a.clean").click(function(){
									$comp.last().attr("data-info","");
									$comp.last().children().not("span").remove();
									$comp.last().append("<label class=\"checkbox-inline\"><input type=\"checkbox\" value=\"default\"><span>默认项</span></label>");
									dataexist = "";
							});
							$prop.find("a.save").click(function() {						//将绑定码表json插入到comp的data-info中
									dictionaryTable.entity = $dirSelect.find("option:selected").val();
									dictionaryTable.key = $keySelect.find("option:selected").val();
									dictionaryTable.value = $valSelect.find("option:selected").val();
									dictionaryTable.order = $ordSelect.find("option:selected").val();
									
									//判断是横向纵向展示
									var showFlag = true;
									var emptyDataNum = 0;
									$(this).closest(".property").next().find(":radio:checked").val() == 1 ? showFlag = false : "";
									var op = "<label class=\"checkbox-inline\"><input type=\"checkbox\" value=\"option\"><span>选项</span></label>";
									$.post("entity!getDictionaryTable.action",{"entityJson":JSON.stringify(dictionaryTable)},function(data,status){
											if(data.success && data.data != null) {
													var $prepareToAppend = $("<div></div>");
													$(data.data).each(function(index,item) {
														if(item.VALUE && item.VALUE != ""){
															var $op = $(op);
															$op.find("input").val(item.KEY == null ? "":item.KEY);//key
															$op.find("span").text(item.VALUE == null ? "":item.VALUE);//value
															$prepareToAppend.append($op);
														}else{
															emptyDataNum++;
														}
													})
													if(emptyDataNum == data.data.length){
														$.epm.snackbar("该码表内无任何数据,请编辑后重新添加...");
													}else{
														$comp.last().children().not("span").remove();
														//判断是横向纵向添加
														if(showFlag){
															$comp.last().append($prepareToAppend.html());
														}else{
															$prepareToAppend.find("label").each(function(i,v){
																if(i != $prepareToAppend.find("label").length - 1){
																	$(this).after("<br>");
																}
															});
															$comp.last().append($prepareToAppend.html());
														}
														dataexist = JSON.stringify(dictionaryTable);
														$comp.last().attr("data-info",dataexist);
													}
											}
									},"json");
							});
							//自动绑定实体数据
							$entityRelBtn.click(function(){
								$.epm.snackbar("是否确定清空当前数据,并自动绑定码表?", 2350, "撤销",
									function() {
										$comp.last().children().not("span").remove();
										$comp.last().append("<label class=\"checkbox-inline\"><input type=\"checkbox\" value=\"default\"><span>默认项</span></label>");
										$prop.slice(0,2).slideUp();
										$prop.slice(2).slideDown();
									},
									function() {
										//do nothing
									}
								);
							});
							//手动添加数据
							$addDataSelf.click(function(){
								if(dataexist != "" && dataexist != null){
									$.epm.snackbar("是否确定清空当前数据,并手动添加?", 2350, "撤销",
										function() {
											$comp.attr("data-info","");
											dataexist = "";
											$comp.last().children().not("span").remove();
											$comp.last().append("<label class=\"checkbox-inline\"><input type=\"checkbox\" value=\"default\"><span>默认项</span></label>");
											$prop.slice(2).slideUp();
											$prop.slice(0,2).slideDown();
											$comp.click();
										},
										function() {
											//do nothing
										}
									);
								}else{
									$prop.slice(2).slideUp();
									$prop.slice(0,2).slideDown();
									$comp.click();
								}
							});
							
							//手动添加数据
							$prop.first().change(function() {
							  $prop.first().find("input:checkbox").each(function(index, value) {
							  	$comp.find(":checkbox:eq(" + index + ")").prop("checked", $(this).prop("checked"));
							  	if($(this).next().val() == "" || $(this).next().val() == null){
							  		$(this).closest(".form-inline").addClass("has-error");
							  		return false;
							  	}else{
							  		$(this).closest(".form-inline").removeClass("has-error");
							  	}
								$comp.find("label:eq(" + index + ")").children("span").html($(this).next().val());
							  });
							});
							//增加下拉选项
							$addBtn.click(function() {
							  var $checkboxDiv = $("<div class=\"form-inline\">" +
											  		"<input type=\"checkbox\">&nbsp;" +
											  		"<input type=\"text\" class=\"form-control\" value=" + "选项" + ($comp.find(":checkbox").length + 1) + " style=\"width:56%\">" +
									  				"<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">" +
										  				"<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\">" +
										  				"</span>" +
									  				"</a>" +
									  				"<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">" +
										  				"<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\">" +
										  				"</span>" +
									  				"</a>" +
								  				"</div>");
							  //增加选项时绑定移除click事件
							  $checkboxDiv.children("a.remove-item").click(function() {
								var indexNum = $checkboxDiv.index();
								if ($comp.find(":checkbox").length > 1) {
								  $checkboxDiv.fadeOut("fast", function() {
									$(this).remove();
								  });
								  $comp.find(":checkbox:eq(" + indexNum + ")").parent().remove();
								} else {
								  $.epm.snackbar("至少保留一个选项",1000);
								}
							  });
							  $checkboxWrapper.append($checkboxDiv);
							  var checkboxHtml = "<label class=\"checkbox-inline\"><input type=\"checkbox\" value=" + "option" + ($comp.find(":checkbox").length + 1) + "><span>选项" + ($comp.find(":checkbox").length + 1) + "</span></label>";
							  //判断横向纵向
							  if($comp.find("br").length > 0){
							  	checkboxHtml = "<br>" + checkboxHtml;
							  }
							  $comp.find(".checkbox-inline:last").after(checkboxHtml);
							});
							//模态窗批量编辑选项值
							$batchEditBtn.click(function() {
							  var modInitText = "";
							  var modInitValue = "";
							  $comp.find("label").each(function(){
							  	modInitText = modInitText + $(this).text() + "\r\n";
							  	modInitValue = modInitValue + $(this).children().val() + "\r\n";
							  });
							  var $modal = $.epm.modal({
								title: "批量编辑",
								size: "",
								body: "<div style=\"height:474px;\"><ul><li>每一行对应一个选项值,可通过多行数据增加选项</li><li>左栏对应显示值,右栏对应value</li><li>请确保显示值和value对应同一行</li></ul><textarea style=\"width:235px;float:left;\" rows=\"20\" cols=\"60\">" + modInitText + "</textarea><textarea style=\"width:235px;float:left;margin-left:10px;\" rows=\"20\" cols=\"60\">" + modInitValue + "</textarea></div>",
								autoDismiss: false,
								showCloseBotton: true,
								buttons: [{
								  value: "保存",
								  style: "primary",
								  click: function($modal) {
									var textArray = $modal.find("textarea:first").val().trim().split("\n");
									var valueArray = $modal.find("textarea:last").val().trim().split("\n");
									if(textArray.length != valueArray.length){
										$.epm.snackbar("请确认显示值和value数量对应");
										return false;
									}
									for (var i in textArray) {
									  if (textArray[i] != "" && typeof(textArray[i]) != "undefined") {
									  	$prop.find(":text:eq(" + i + ")").val(textArray[i].trim());
									  	$comp.find("label:eq(" + i + ")").children("span").html(textArray[i].trim());
										//处理如有多余行数据，对应Prop新增选项
										if ("undefined" == typeof($prop.find(":text").get(i))) {
										  var $checkboxDiv = $("<div class=\"form-inline\">" +
														  		"<input type=\"checkbox\">&nbsp;" +
														  		"<input type=\"text\" class=\"form-control\" style=\"width:56%\">" +
														  		"<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">" +
														  			"<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span>" +
													  			"</a>" +
													  			"<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">" +
													  				"<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\">" +
													  				"</span>" +
												  				"</a>" +
												  			"</div>");
										  $checkboxDiv.children(":text").attr("value", textArray[i].trim());
										  $prop.first().append($checkboxDiv);
										  var checkboxHtml = "<label class=\"checkbox-inline\"><input type=\"checkbox\" value=" + valueArray[i].trim() + "><span>" + textArray[i].trim() + "</span></label>";
										  //判断横向纵向
										  if($comp.find("br").length > 0){
										  	checkboxHtml = "<br>" + checkboxHtml;
										  }
										  $comp.find(".checkbox-inline:last").after(checkboxHtml);
										}
									  }
									}
									//重新绑定click移除事件
									$prop.find("a.remove-item").off();
									$prop.find("a.remove-item").click(function() {
										var indexNum = $prop.find("a.remove-item").index($(this)[0]);
										if ($comp.find(":checkbox").length > 1) {
										  //移除组件中对应的行
										  $comp.find(":checkbox:eq(" + indexNum + ")").parent().remove();
										  //移除属性栏中的行
										  $(this).parent().fadeOut("fast", function() {
											$(this).remove();
										  });
										} else {
										  $.epm.snackbar("至少保留一个选项",1000);
										}
									  })
									$modal.modal("hide");
								  }
								}, {
								  value: "关闭",
								  dismiss: true
								}]
							  });
							});
							//绑定拖拽事件
							$checkboxWrapper.droppable({
								accept: "a.drag-item"
							}).sortable({
								opacity: .5,
								start: function(event, ui) {
									//拖动元素起始位置
									beginIndex = ui.item.index();
									beginIndex = parseInt(beginIndex);
								},
								stop: function(event, ui) {
									//拖动结束的位置
									var endIndex = ui.item.index();
									endIndex = parseInt(endIndex);
									$(this).exchange($comp.last().find("label:eq(" + beginIndex + ")"),$comp.last().find("label:eq(" + endIndex + ")"));
								}
							}).disableSelection();
						  },
						  get: function($comp, $prop) {
						  	//判断是否是绑定数据
						  	var dataInfo = $comp.last().attr("data-info");
						  	var selectedEntity = "";
						  	if(dataInfo){
						  		selectedEntity = $.parseJSON($comp.last().attr("data-info")).entity;//如果存在data数据显示自动绑定面板
								$prop.slice(0,2).hide();
								$prop.slice(2).show();
						  	}else{
						  		  $comp.find("input:checkbox").each(function(index, value) {
								  //动态从comp到prop映射
								  var $checkboxDiv = $("<div class=\"form-inline\">" +
								  						"<input type=\"checkbox\">&nbsp;" +
								  						"<input type=\"text\" class=\"form-control\" style=\"width:56%\">" +
								  						"<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">" +
								  							"<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span>" +
							  							"</a>" +
							  							"<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">" +
											  				"<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\">" +
											  				"</span>" +
										  				"</a>" +
						  							"</div>");
								  $checkboxDiv.children(":checkbox").prop("checked", $(this).prop("checked"));
								  $checkboxDiv.children(":text").attr("value", $(this).parent().text());
								  //绑定移除点击事件
								  $checkboxDiv.children("a.remove-item").click(function() {
									var indexNum = $checkboxDiv.index();
									if ($comp.find(":checkbox").length > 1) {
									  //移除prop对应行
									  $checkboxDiv.fadeOut("fast", function() {
										$(this).remove();
									  });
									  //移除comp对应行
									  $comp.find(":checkbox:eq(" + indexNum + ")").parent().remove();
									} else {
									  $.epm.snackbar("至少保留一个选项",1000);
									}
								  });
								  $prop.first().append($checkboxDiv);
								});
						  	}
						  	var op = "<option></option>";
							entityJson = {
									EntityVersionID:"",
									ExtendFlag:"",
									IsDictionaryTable:"1",
									limit:"-1",
									offset:"-1"
							}
							$.post("entity!get.action",{"entityJson":JSON.stringify(entityJson)},function(data,status){				//获得绑定的码表实体
									$(data.data).each(function(index,item){
											$op = $(op);
											$op.val(item.entityVersionID);
											$op.text(item.entityName);
											$prop.find("select").eq(0).append($op);
											if(selectedEntity == item.entityVersionID){
													$op.prop("selected",true);
											}
									});
									$prop.find("select").eq(0).change();//获得后出发change事件，选中被绑定的KYE和VALUE
							},"json");
						  }
						},{
						  name: '显示',
						  html: '<div><label class="radio-inline"><input type="radio" value="0" checked><span>横向</span></label><label class="radio-inline"><input type="radio" value="1"><span>纵向</span></label></div>',
						  set: function($comp, $prop) {
			                $prop.find(":radio").click(function() {
									$prop.find(":radio").not($(this)).attr("checked", false);
									if ($(this).attr("value") == "0") {
										$comp.find("br").each(function() {
													$(this).remove();
												});
									} else {
										$comp.last().find("label").each(
												function(index, value) {
													if (index != $comp.find("label").length - 1 && $(this).next("br").length < 1) {
														$(this).after("<br>");
													}
												});
									}
								});
			              },
						  get: function($comp, $prop) {
						  	if($comp.find("br").length > 0){
						  		$prop.find(":radio:first").prop("checked", false);
						  		$prop.find(":radio:last").prop("checked", true);
						  	}else{
						  		$prop.find(":radio:first").prop("checked", true);
						  		$prop.find(":radio:last").prop("checked", false);
						  	}
						  }
						},{
						  name: '校验',
						  html: '<div><input type="checkbox">&nbsp;<label>只读</label>&nbsp;&nbsp;<input type="checkbox">&nbsp;<label>必填</label></div>',
						  set: function($comp, $prop) {
							$prop.change(function() {
							  if($prop.find(":checkbox").first().prop("checked")){
						  		$comp.find(":checkbox").attr("disabled","disabled");
						  		$comp.find(".checkbox-inline").addClass("disabled");
							  }else{
							  	$comp.find(":checkbox").attr("disabled",false);
							  	$comp.find(".checkbox-inline").removeClass("disabled");
							  }
							  $comp.find("span:first").attr("hidden", !$prop.find(":checkbox").last().prop("checked"));
							});
						  },
						  get: function($comp, $prop) {
							$prop.find(":checkbox").first().prop("checked", $comp.find(".checkbox-inline").hasClass("disabled"));
							$prop.find(":checkbox").last().prop("checked", !$comp.find("span:first").attr("hidden"));
						  }
						}],
						onload: function($comp) {
							
						},
						onsubmit: function($comp) {
						  //校验至少有一项被选中
						  if (!$comp.find("span").prop("hidden")) {
							var isChecked = false;
							$comp.find(":checkbox").each(function() {
							  if ($(this).prop("checked")) {
								isChecked = true;
							  }
							});
							if (!isChecked) {
							  $comp.popover({
								content: "单选框至少有一项被选中",
								placement: "top"
							  }).popover("show").closest(".form-group").addClass("has-error");
							  setTimeout(function(){
								$comp.popover("hide").popover("destroy").closest(".form-group").removeClass("has-error");
							  },2000);
							  return false;
							}
							return true;
						  }
						}
					 }
                };
            },
            //实体单选按钮组控件
            "00004": function(field) {
                return {
                    //name: field.dataColumnName, dataColumnName导致数据获取不到 jiasong Update 2015-10-28 14:30
                    name: field.fieldCode,
                    component: {
                        title: field.fieldName,
                        html: '<div data-info="">' +
								'<span hidden style="color:#F00;font-weight:bold">*</span>' +
								'<label class="radio-inline"><input type="radio" value="option1"><span>选项1</span></label>' +
								'<label class="radio-inline"><input type="radio" value="option2"><span>选项2</span></label>' +
							'</div>',
                        allocate: ':radio',
                        defaultName: field.fieldName,
                        props: [{
						  name: '选项',
						  html: '<div class="draggable-div"></div>' +
						  		'<div>' +
						  			'<br>' +
						  			'<a class="btn btn-default btn-sm add-item">添加选项</a>' +
						  			'&amp;nbsp;&amp;nbsp;' +
						  			'<a class="btn btn-default btn-sm batch-edit">批量编辑</a>' +
						  			'<a class="btn btn-default add-data-rel" style="margin-top:10px;width:148px;">自动绑定</a>' +
					  			'</div>' + 
					  			'<div style="display:none;" class="auto-bind">' +
						  			'<label>选择码表</label><select class="form-control"></select>' +
						  			'<label>选择KEY</label><select class="form-control"></select>' +
						  			'<label>选择VALUE</label><select class="form-control"></select>' +
						  			'<label>选择排序</label><select class="form-control"></select>' +
						  			'<br>' +
						  			'<a class="btn btn-small btn-default save" style="">保存</a>&amp;nbsp;' +
						  			'<a class="btn btn-small btn-default clean" style="">清除</a>' +
						  			'<a class="btn btn-default add-data-self" style="margin-top:10px;width:148px;">手动添加</a>' +
					  			'</div>',
						  set: function($comp, $prop) {
							var $radioWrapper = $prop.first();
							var $addBtn = $prop.find("a.add-item").first();
							var $batchEditBtn = $prop.find("a.batch-edit").last();
							var $entityRelBtn = $prop.find("a.add-data-rel");
							var $addDataSelf = $prop.find("a.add-data-self");
							
							//自动绑定数据
							var $dirSelect = $prop.slice(2).find("select:eq(0)");
							var $keySelect = $prop.slice(2).find("select:eq(1)");
							var $valSelect = $prop.slice(2).find("select:eq(2)");
							var $ordSelect = $prop.slice(2).find("select:eq(3)");
							
							var fieldop = "<option></option>";
							var dataexist = $comp.last().attr("data-info");

							$dirSelect.change(function() {  //配置自动绑定码表

									var selectedKey = "";
									var selectedVal = "";
									var selectedOrder = "";
									if(dataexist && dataexist != null){  
											var currObj = $.parseJSON(dataexist);
											selectedKey = currObj.key;     //获取实体中绑定的key字段FieldCode
											selectedVal = currObj.value;   //获取实体中绑定的value字段FieldCode
											selectedOrder = currObj.order;
									}

									var op = $(this).find("option:selected");						//获得被选中的option(选中作为码表的实体)
									$keySelect.html("");
									$valSelect.html("");
									$ordSelect.html("");
									$.post("entity!getfield.action",{"entityVersionID":op.val()},function(data,status){			//获得选中码表的字段信息
											$(data.data).each(function(index,item){
													$keyop = $(fieldop);
													$valueop = $(fieldop);
													$ordop = $(fieldop);
													$keyop.val(item.fieldCode);
													$keyop.text(item.fieldName);
													$valueop.val(item.fieldCode);
													$valueop.text(item.fieldName);
													$ordop.val(item.fieldCode);
													$ordop.text(item.fieldName);
													if(index == 0){														//选中第一条数据，当实体没有绑定码表实体时默认选中第一条
															$keyop.prop("selected",true);
															$valueop.prop("selected",true);
													}
													selectedKey == item.fieldCode ? $keyop.prop("selected",true) : "";
													selectedVal == item.fieldCode ? $valueop.prop("selected",true) : "";
													selectedOrder == item.fieldCode ? $ordop.prop("selected",true) : "";
													$keySelect.append($keyop);				//将option插入
													$valSelect.append($valueop);
													$ordSelect.append($ordop);
											});
											//不存在实体绑定时,默认依次取值
											data.data.length > 1 && !dataexist ? $valSelect.find("option:eq(1)").prop("selected",true) : "";
											data.data.length > 2 && !dataexist ? $ordSelect.find("option:eq(2)").prop("selected",true) : "";
									},"json");
							});
							var dictionaryTable = {								//绑定码表json
									entity:"",
									key:"",
									value:"",
									order:""
							};
							$prop.find("a.clean").click(function(){
									$comp.last().attr("data-info","");
									$comp.last().children().not("span").remove();
									$comp.last().append("<label class=\"radio-inline\"><input type=\"radio\" value=\"default\"><span>默认项</span></label>");
									dataexist = "";
							});
							$prop.find("a.save").click(function() {						//将绑定码表json插入到comp的data-info中
									dictionaryTable.entity = $dirSelect.find("option:selected").val();
									dictionaryTable.key = $keySelect.find("option:selected").val();
									dictionaryTable.value = $valSelect.find("option:selected").val();
									dictionaryTable.order = $ordSelect.find("option:selected").val();
									
									//判断是横向纵向展示
									var showFlag = true;
									var emptyDataNum = 0;
									$(this).closest(".property").next().find(":radio:checked").val() == 1 ? showFlag = false : "";
									var op = "<label class=\"radio-inline\"><input type=\"radio\" value=\"option\"><span>选项</span></label>";
									$.post("entity!getDictionaryTable.action",{"entityJson":JSON.stringify(dictionaryTable)},function(data,status){
											if(data.success && data.data != null) {
													var $prepareToAppend = $("<div></div>");
													$(data.data).each(function(index,item) {
														if(item.VALUE && item.VALUE != ""){
															var $op = $(op);
															$op.find("input").val(item.KEY == null ? "":item.KEY);//key
															$op.find("span").text(item.VALUE == null ? "":item.VALUE);//value
															$prepareToAppend.append($op);
														}else{
															emptyDataNum++;
														}
													})
													if(emptyDataNum == data.data.length){
														$.epm.snackbar("该码表内无任何数据,请编辑后重新添加...");
													}else{
														$comp.last().children().not("span").remove();
														//判断是横向纵向添加
														if(showFlag){
															$comp.last().append($prepareToAppend.html());
														}else{
															$prepareToAppend.find("label").each(function(i,v){
																if(i != $prepareToAppend.find("label").length - 1){
																	$(this).after("<br>");
																}
															});
															$comp.last().append($prepareToAppend.html());
														}
														dataexist = JSON.stringify(dictionaryTable);
														$comp.last().attr("data-info",dataexist);
													}
											}
									},"json");
							});
							//自动绑定实体数据
							$entityRelBtn.click(function(){
								$.epm.snackbar("是否确定清空当前数据,并自动绑定码表?", 2350, "撤销",
									function() {
										$comp.last().children().not("span").remove();
										$comp.last().append("<label class=\"radio-inline\"><input type=\"radio\" value=\"default\"><span>默认项</span></label>");
										$prop.slice(0,2).slideUp();
										$prop.slice(2).slideDown();
									},
									function() {
										//do nothing
									}
								);
							});
							//手动添加数据
							$addDataSelf.click(function(){
								if(dataexist != "" && dataexist != null){
									$.epm.snackbar("是否确定清空当前数据,并手动添加?", 2350, "撤销",
										function() {
											$comp.attr("data-info","");
											dataexist = "";
											$comp.last().children().not("span").remove();
											$comp.last().append("<label class=\"radio-inline\"><input type=\"radio\" value=\"default\"><span>默认项</span></label>");
											$prop.slice(2).slideUp();
											$prop.slice(0,2).slideDown();
											$comp.click();
										},
										function() {
											//do nothing
										}
									);
								}else{
									$prop.slice(2).slideUp();
									$prop.slice(0,2).slideDown();
									$comp.click();
								}
							});
							
							//手动添加数据
							$prop.first().change(function() {
							  $prop.first().find("input:radio").each(function(index, value) {
							  	$comp.find("label:eq(" + index + ")").attr("checked", $(this).prop("checked"));
							  	if($(this).next().val() == "" || $(this).next().val() == null){
							  		$(this).closest(".form-inline").addClass("has-error");
							  		return false;
							  	}else{
							  		$(this).closest(".form-inline").removeClass("has-error");
							  	}
								$comp.find("label:eq(" + index + ")").children("span").html($(this).next().val());
							  });
							});
							//增加下拉选项
							$addBtn.click(function() {
							  var $radioDiv = $("<div class=\"form-inline\">" +
											  		"<input type=\"radio\">&nbsp;" +
											  		"<input type=\"text\" class=\"form-control\" value=" + "选项" + ($comp.find(":radio").length + 1) + " style=\"width:56%\">" +
									  				"<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">" +
										  				"<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\">" +
										  				"</span>" +
									  				"</a>" +
									  				"<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">" +
										  				"<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\">" +
										  				"</span>" +
									  				"</a>" +
								  				"</div>");
							  //增加选项时绑定移除click事件
							  $radioDiv.children("a.remove-item").click(function() {
								var indexNum = $radioDiv.index();
								if ($comp.find(":radio").length > 1) {
								  $radioDiv.fadeOut("fast", function() {
									$(this).remove();
								  });
								  $comp.find(":radio:eq(" + indexNum + ")").parent().remove();
								} else {
								  $.epm.snackbar("至少保留一个选项",1000);
								}
							  });
							  //绑定radio只能选择一项事件
							  $radioDiv.children(":radio").click(function() {
								var radioSelectedNum = $radioDiv.index();
								$prop.find(":radio").not($(this)).attr("checked", false);
								//这里.attr为了使radio属性为指定值，.prop为了使attr的值展示在当前页面
								$comp.find(":radio:eq(" + radioSelectedNum + ")").attr("checked", true);
								$comp.find(":radio:eq(" + radioSelectedNum + ")").prop("checked", true);
								$comp.find(":radio").not(":radio:eq(" + radioSelectedNum + ")").attr("checked", false);
								$comp.find(":radio").not(":radio:eq(" + radioSelectedNum + ")").prop("checked", false);
							  });
							  $radioWrapper.append($radioDiv);
							  var radioHtml = "<label class=\"radio-inline\"><input type=\"radio\" value=" + "option" + ($comp.find(":radio").length + 1) + "><span>选项" + ($comp.find(":radio").length + 1) + "</span></label>";
							  //判断横向纵向
							  if($comp.find("br").length > 0){
							  	radioHtml = "<br>" + radioHtml;
							  }
							  $comp.find(".radio-inline:last").after(radioHtml);
							});
							//模态窗批量编辑选项值
							$batchEditBtn.click(function() {
							  var modInitText = "";
							  var modInitValue = "";
							  $comp.find("label").each(function(){
							  	modInitText = modInitText + $(this).text() + "\r\n";
							  	modInitValue = modInitValue + $(this).children().val() + "\r\n";
							  });
							  var $modal = $.epm.modal({
								title: "批量编辑",
								size: "",
								body: "<div style=\"height:474px;\"><ul><li>每一行对应一个选项值,可通过多行数据增加选项</li><li>左栏对应显示值,右栏对应value</li><li>请确保显示值和value对应同一行</li></ul><textarea style=\"width:235px;float:left;\" rows=\"20\" cols=\"60\">" + modInitText + "</textarea><textarea style=\"width:235px;float:left;margin-left:10px;\" rows=\"20\" cols=\"60\">" + modInitValue + "</textarea></div>",
								autoDismiss: false,
								showCloseBotton: true,
								buttons: [{
								  value: "保存",
								  style: "primary",
								  click: function($modal) {
									var textArray = $modal.find("textarea:first").val().trim().split("\n");
									var valueArray = $modal.find("textarea:last").val().trim().split("\n");
									if(textArray.length != valueArray.length){
										$.epm.snackbar("请确认显示值和value数量对应");
										return false;
									}
									for (var i in textArray) {
									  if (textArray[i] != "" && typeof(textArray[i]) != "undefined") {
									  	$prop.find(":text:eq(" + i + ")").val(textArray[i].trim());
									  	$comp.find("label:eq(" + i + ")").children("span").html(textArray[i].trim());
										//处理如有多余行数据，对应Prop新增选项
										if ("undefined" == typeof($prop.find(":text").get(i))) {
										  var $radioDiv = $("<div class=\"form-inline\">" +
														  		"<input type=\"radio\">&nbsp;" +
														  		"<input type=\"text\" class=\"form-control\" style=\"width:56%\">" +
														  		"<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">" +
														  			"<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span>" +
													  			"</a>" +
													  			"<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">" +
													  				"<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\">" +
													  				"</span>" +
												  				"</a>" +
												  			"</div>");
										  $radioDiv.children(":text").attr("value", textArray[i].trim());
										  $prop.first().append($radioDiv);
										  var radioHtml = "<label class=\"radio-inline\"><input type=\"radio\" value=" + valueArray[i].trim() + "><span>" + textArray[i].trim() + "</span></label>";
										  //判断横向纵向
										  if($comp.find("br").length > 0){
										  	radioHtml = "<br>" + radioHtml;
										  }
										  $comp.find(".radio-inline:last").after(radioHtml);
										}
									  }
									}
									//重新绑定click移除事件
									$prop.find("a.remove-item").off();
									$prop.find("a.remove-item").click(function() {
										var indexNum = $prop.find("a.remove-item").index($(this)[0]);
										if ($comp.find(":radio").length > 1) {
										  //移除组件中对应的行
										  $comp.find(":radio:eq(" + indexNum + ")").parent().remove();
										  //移除属性栏中的行
										  $(this).parent().fadeOut("fast", function() {
											$(this).remove();
										  });
										} else {
										  $.epm.snackbar("至少保留一个选项",1000);
										}
									  })
									  //重新绑定radio只能选择一项事件
									$prop.find(":radio").off();
									$prop.find(":radio").click(function() {
									  var radioSelectedNum = $prop.find(":radio").index($(this)[0]);
									  $prop.find(":radio").not($(this)).attr("checked", false);
									  $comp.find(":radio:eq(" + radioSelectedNum + ")").attr("checked", true);
									  $comp.find(":radio:eq(" + radioSelectedNum + ")").prop("checked", true);
									  $comp.find(":radio").not(":radio:eq(" + radioSelectedNum + ")").attr("checked", false);
									  $comp.find(":radio").not(":radio:eq(" + radioSelectedNum + ")").prop("checked", false);
									});
									$modal.modal("hide");
								  }
								}, {
								  value: "关闭",
								  dismiss: true
								}]
							  });
							});
							//绑定拖拽事件
							$radioWrapper.droppable({
								accept: "a.drag-item"
							}).sortable({
								opacity: .5,
								start: function(event, ui) {
									//拖动元素起始位置
									beginIndex = ui.item.index();
									beginIndex = parseInt(beginIndex);
								},
								stop: function(event, ui) {
									//拖动结束的位置
									var endIndex = ui.item.index();
									endIndex = parseInt(endIndex);
									$(this).exchange($comp.last().find("label:eq(" + beginIndex + ")"),$comp.last().find("label:eq(" + endIndex + ")"));
								}
							}).disableSelection();
						  },
						  get: function($comp, $prop) {
						  	//判断是否是绑定数据
						  	var dataInfo = $comp.last().attr("data-info");
						  	var selectedEntity = "";
						  	if(dataInfo){
						  		selectedEntity = $.parseJSON($comp.last().attr("data-info")).entity;//如果存在data数据显示自动绑定面板
								$prop.slice(0,2).hide();
								$prop.slice(2).show();
						  	}else{
						  		  $comp.find("input:radio").each(function(index, value) {
								  //动态从comp到prop映射
								  var $radioDiv = $("<div class=\"form-inline\">" +
								  						"<input type=\"radio\">&nbsp;" +
								  						"<input type=\"text\" class=\"form-control\" style=\"width:56%\">" +
								  						"<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">" +
								  							"<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span>" +
							  							"</a>" +
							  							"<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">" +
											  				"<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\">" +
											  				"</span>" +
										  				"</a>" +
						  							"</div>");
								  $radioDiv.children(":radio").prop("checked", $(this).prop("checked"));
								  $radioDiv.children(":text").attr("value", $(this).parent().text());
								  //绑定移除点击事件
								  $radioDiv.children("a.remove-item").click(function() {
									var indexNum = $radioDiv.index();
									if ($comp.find(":radio").length > 1) {
									  //移除prop对应行
									  $radioDiv.fadeOut("fast", function() {
										$(this).remove();
									  });
									  //移除comp对应行
									  $comp.find(":radio:eq(" + indexNum + ")").parent().remove();
									} else {
									  $.epm.snackbar("至少保留一个选项",1000);
									}
								  });
								  //绑定radio只能选择一项事件
								  $radioDiv.children(":radio").click(function() {
									var radioSelectedNum = $radioDiv.index();
									$prop.find(":radio").not($(this)).attr("checked", false);
									$comp.find(":radio:eq(" + radioSelectedNum + ")").attr("checked", true);
									$comp.find(":radio:eq(" + radioSelectedNum + ")").prop("checked", true);
									$comp.find(":radio").not(":radio:eq(" + radioSelectedNum + ")").attr("checked", false);
									$comp.find(":radio").not(":radio:eq(" + radioSelectedNum + ")").prop("checked", false);
								  });
								  $prop.first().append($radioDiv);
								});
						  	}
						  	var op = "<option></option>";
							entityJson = {
									EntityVersionID:"",
									ExtendFlag:"",
									IsDictionaryTable:"1",
									limit:"-1",
									offset:"-1"
							}
							$.post("entity!get.action",{"entityJson":JSON.stringify(entityJson)},function(data,status){				//获得绑定的码表实体
									$(data.data).each(function(index,item){
											$op = $(op);
											$op.val(item.entityVersionID);
											$op.text(item.entityName);
											$prop.find("select").eq(0).append($op);
											if(selectedEntity == item.entityVersionID){
													$op.prop("selected",true);
											}
									});
									$prop.find("select").eq(0).change();//获得后出发change事件，选中被绑定的KYE和VALUE
							},"json");
						  }
						},{
						  name: '显示',
						  html: '<div><label class="radio-inline"><input type="radio" value="0" checked><span>横向</span></label><label class="radio-inline"><input type="radio" value="1"><span>纵向</span></label></div>',
						  set: function($comp, $prop) {
						  	$prop.find(":radio").click(function() {
							  $prop.find(":radio").not($(this)).attr("checked", false);
							  if($(this).attr("value") == "0"){
							  	$comp.find("br").each(function(){
							  		$(this).remove();
							  	});
							  }else{
							 	$comp.find("label").each(function(index,value){
							 		if(index != $comp.find("label").length - 1 && $(this).next("br").length < 1){
							 			$(this).after("<br>");
							 		}
							 	}); 
							  }
							});
						  },
						  get: function($comp, $prop) {
						  	if($comp.find("br").length > 0){
						  		$prop.find(":radio:first").prop("checked", false);
						  		$prop.find(":radio:last").prop("checked", true);
						  	}else{
						  		$prop.find(":radio:first").prop("checked", true);
						  		$prop.find(":radio:last").prop("checked", false);
						  	}
						  }
						},{
						  name: '校验',
						  html: '<div><input type="checkbox">&nbsp;<label>只读</label>&nbsp;&nbsp;<input type="checkbox">&nbsp;<label>必填</label></div>',
						  set: function($comp, $prop) {
							$prop.change(function() {
							  if($prop.find(":checkbox").first().prop("checked")){
						  		$comp.find(":radio").attr("disabled","disabled");
						  		$comp.find(".radio-inline").addClass("disabled");
							  }else{
							  	$comp.find(":radio").attr("disabled",false);
							  	$comp.find(".radio-inline").removeClass("disabled");
							  }
							  $comp.find("span:first").attr("hidden", !$prop.find(":checkbox").last().prop("checked"));
							});
						  },
						  get: function($comp, $prop) {
							$prop.find(":checkbox").first().prop("checked", $comp.find(".radio-inline").hasClass("disabled"));
							$prop.find(":checkbox").last().prop("checked", !$comp.find("span:first").attr("hidden"));
						  }
						}],
						onload: function($comp) {
						  //生成radio控件没有name属性，控制只能单选
						  $comp.find(":radio").each(function() {
							$(this).click(function() {
							  $(this).attr("checked", true);
							  $comp.find(":radio").not($(this)).attr("checked", false);
							})
						  });
						},
						onsubmit: function($comp) {
						  //校验至少有一项被选中
						  if (!$comp.find("span").prop("hidden")) {
							var isChecked = false;
							$comp.find(":radio").each(function() {
							  if ($(this).prop("checked")) {
								isChecked = true;
							  }
							});
							if (!isChecked) {
							  $comp.popover({
								content: "单选框至少有一项被选中",
								placement: "top"
							  }).popover("show").closest(".form-group").addClass("has-error");
							  setTimeout(function(){
								$comp.popover("hide").popover("destroy").closest(".form-group").removeClass("has-error");
							  },2000);
							  return false;
							}
							return true;
						  }
						}
					 }
                };
            },
            //实体下拉复选框控件
            "00006": function(field) {
                return {
                    //name: field.dataColumnName, dataColumnName导致数据获取不到 jiasong Update 2015-10-28 14:30
                    name: field.fieldCode,
                    component: {
                        title: field.fieldName,
                        html: '<div data-info="">' +
									'<span hidden style="color:#F00;font-weight:bold">*</span>' +
									'<div>' +
										'<select class="selectpicker" multiple data-live-search="true">' +
											'<option value="option1">选项1</option>' +
											'<option value="option2">选项2</option>' +
											'</select>' +
									'</div>' +
								'</div>',
                        allocate: '.selectpicker',
                        defaultName: field.fieldName,
                        props: [{
								name: '选项',
								html: '<div class="draggable-div">' +
									  '</div>' +
									  '<div>' +
											'<br>' +
											'<a class="btn btn-default btn-sm add-item">添加选项</a>' +
											'&amp;nbsp;&amp;nbsp;' +
											'<a class="btn btn-default btn-sm batch-edit">批量编辑</a>' +
											'<a class="btn btn-default add-data-rel" style="margin-top:10px;width:148px;">自动绑定</a>' +
									  '</div>' + 
									  '<div style="display:none;" class="auto-bind">' +
					                    '<label>选择码表</label><select class="form-control"></select>' +
					                    '<label>选择KEY</label><select class="form-control"></select>' +
					                    '<label>选择VALUE</label><select class="form-control"></select>' +
					                    '<label>选择排序</label><select class="form-control"></select>' +
					                    '<br>' +
					                    '<a class="btn btn-small btn-default save" style="">保存</a>&amp;nbsp;' +
					                    '<a class="btn btn-small btn-default clean" style="">清除</a>' +
					                    '<a class="btn btn-default add-data-self" style="margin-top:10px;width:148px;">手动添加</a>' +
					                  '</div>',
								set: function($comp, $prop) {
									var $checkboxWrapper = $prop.first();
									var $addBtn = $prop.find("a.add-item").first();
									var $batchEditBtn = $prop.find("a.batch-edit").last();
									var $compOption = $comp.find("select");
									var checkedValue = new Array();
									
									var $entityRelBtn = $prop.find("a.add-data-rel");
          							var $addDataSelf = $prop.find("a.add-data-self");
          							
      								  //自动绑定数据
						              var $dirSelect = $prop.slice(2).find("select:eq(0)");
						              var $keySelect = $prop.slice(2).find("select:eq(1)");
						              var $valSelect = $prop.slice(2).find("select:eq(2)");
						              var $ordSelect = $prop.slice(2).find("select:eq(3)");
						              
						              var fieldop = "<option></option>";
						              var dataexist = $comp.last().attr("data-info");
						
						              $dirSelect.change(function() {  //配置自动绑定码表
						
						                  var selectedKey = "";
						                  var selectedVal = "";
						                  var selectedOrder = "";
						                  if(dataexist && dataexist != null){  
						                      var currObj = $.parseJSON(dataexist);
						                      selectedKey = currObj.key;     //获取实体中绑定的key字段FieldCode
						                      selectedVal = currObj.value;   //获取实体中绑定的value字段FieldCode
						                      selectedOrder = currObj.order;
						                  }
						
						                  var op = $(this).find("option:selected");           //获得被选中的option(选中作为码表的实体)
						                  $keySelect.html("");
						                  $valSelect.html("");
						                  $ordSelect.html("");
						                  $.post("entity!getfield.action",{"entityVersionID":op.val()},function(data,status){     //获得选中码表的字段信息
						                      $(data.data).each(function(index,item){
						                          $keyop = $(fieldop);
						                          $valueop = $(fieldop);
						                          $ordop = $(fieldop);
						                          $keyop.val(item.fieldCode);
						                          $keyop.text(item.fieldName);
						                          $valueop.val(item.fieldCode);
						                          $valueop.text(item.fieldName);
						                          $ordop.val(item.fieldCode);
						                          $ordop.text(item.fieldName);
						                          if(index == 0){                           //选中第一条数据，当实体没有绑定码表实体时默认选中第一条
						                              $keyop.prop("selected",true);
						                              $valueop.prop("selected",true);
						                          }
						                          selectedKey == item.fieldCode ? $keyop.prop("selected",true) : "";
						                          selectedVal == item.fieldCode ? $valueop.prop("selected",true) : "";
						                          selectedOrder == item.fieldCode ? $ordop.prop("selected",true) : "";
						                          $keySelect.append($keyop);        //将option插入
						                          $valSelect.append($valueop);
						                          $ordSelect.append($ordop);
						                      });
						                      //不存在实体绑定时,默认依次取值
						                      data.data.length > 1 && !dataexist ? $valSelect.find("option:eq(1)").prop("selected",true) : "";
						                      data.data.length > 2 && !dataexist ? $ordSelect.find("option:eq(2)").prop("selected",true) : "";
						                  },"json");
						              });
						              var dictionaryTable = {               //绑定码表json
						                  entity:"",
						                  key:"",
						                  value:"",
						                  order:""
						              };
						              $prop.find("a.clean").click(function(){
						                  $comp.last().attr("data-info","");
						                  $compOption.empty();
						                  $compOption.append("<option value=\"default\">默认项</option>");
						                  $compOption.selectpicker("refresh");
						                  dataexist = "";
						              });
						              $prop.find("a.save").click(function() {           //将绑定码表json插入到comp的data-info中
						                  dictionaryTable.entity = $dirSelect.find("option:selected").val();
						                  dictionaryTable.key = $keySelect.find("option:selected").val();
						                  dictionaryTable.value = $valSelect.find("option:selected").val();
						                  dictionaryTable.order = $ordSelect.find("option:selected").val();
						                  
						                  //判断是横向纵向展示
						                  var emptyDataNum = 0;
						                  var op = "<option value=\"default\">默认项</option>";
						                  $.post("entity!getDictionaryTable.action",{"entityJson":JSON.stringify(dictionaryTable)},function(data,status){
						                      if(data.success && data.data != null) {
						                          var $prepareToAppend = $("<div></div>");
						                          $(data.data).each(function(index,item) {
						                            if(item.VALUE && item.VALUE != ""){
						                              var $op = $(op);
						                              $op.attr("value",item.KEY == null ? "":item.KEY);//key
						                              $op.text(item.VALUE == null ? "":item.VALUE);//value
						                              $prepareToAppend.append($op);
						                            }else{
						                              emptyDataNum++;
						                            }
						                          })
						                          if(emptyDataNum == data.data.length){
						                            $.epm.snackbar("该码表内无任何数据,请编辑后重新添加...");
						                          }else{
						                            $compOption.empty();
						                            //判断是横向纵向添加
						                            $compOption.append($prepareToAppend.html());
						                            $compOption.selectpicker("refresh");
						                            dataexist = JSON.stringify(dictionaryTable);
						                            $comp.last().attr("data-info",dataexist);
						                          }
						                      }
						                  },"json");
						              });
						              //自动绑定实体数据
						              $entityRelBtn.click(function(){
						                $.epm.snackbar("是否确定清空当前数据,并自动绑定码表?", 2350, "撤销",
						                  function() {
						                    $compOption.empty();
						                    $compOption.append("<option value=\"default\">默认项</option>");
						                    $compOption.selectpicker("refresh");
						                    $prop.slice(0,2).slideUp();
						                    $prop.slice(2).slideDown();
						                  },
						                  function() {
						                    //do nothing
						                  }
						                );
						              });
						              //手动添加数据
						              $addDataSelf.click(function(){
						                if(dataexist != "" && dataexist != null){
						                  $.epm.snackbar("是否确定清空当前数据,并手动添加?", 2350, "撤销",
						                    function() {
						                      $comp.attr("data-info","");
						                      dataexist = "";
						                      $compOption.empty();
					                  		  $compOption.append("<option value=\"default\">默认项</option>");
						                      $compOption.selectpicker("refresh");
						                      $prop.slice(2).slideUp();
						                      $prop.slice(0,2).slideDown();
						                      $comp.click();
						                    },
						                    function() {
						                      //do nothing
						                    }
						                  );
						                }else{
						                  $prop.slice(2).slideUp();
						                  $prop.slice(0,2).slideDown();
						                  $comp.click();
						                }
						              });

									$prop.first().change(function() {
										$prop.find(":checkbox").each(function(index, value) {
											if ($(this).prop("checked")) {
												checkedValue.push($(this).val());
											}
											$comp.find("option:eq(" + index + ")").text($(this).next().val());
											//修改下拉框值刷新列表--对此类下拉框字段名增删改均需刷新
											$compOption.selectpicker("refresh");
										});
										if (checkedValue.length > 0) {
											$compOption.selectpicker("val", checkedValue);
										} else {
											$compOption.selectpicker("val", "请选择...");
										}
										//清空array
										checkedValue = [];
									});
									//增加下拉选项
									$addBtn.click(function() {
										var optionVal = "option" + ($prop.first().find(":checkbox").length + 1);
										var $checkboxDiv = $("<div class=\"form-inline\">" +
																"<input type=\"checkbox\" value=" + optionVal + ">&nbsp;" +
																"<input type=\"text\" class=\"form-control\" value=" + "选项" + ($comp.find("option").length + 1) + " style=\"width:56%\">" +
																"<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">" +
																	"<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span>" +
																"</a>" +
																"<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">" +
									                              "<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\">" +
									                              "</span>" +
									                            "</a>" +
															"</div>");
										//增加选项时绑定移除事件
										$checkboxDiv.children("a.remove-item").click(function() {
											var indexNum = $checkboxDiv.index();
											if ($comp.find("option").length > 1) {
												$checkboxDiv.fadeOut("fast", function() {
													$(this).remove();
												});
												//移除comp中对应的option
												$comp.find("option:eq(" + indexNum + ")").remove();
												//删除元素，刷新下拉框
												$compOption.selectpicker("refresh");
											} else {
												$.epm.snackbar("至少保留一个选项",1000);
											}
										});
										$checkboxWrapper.append($checkboxDiv);
										$compOption.append("<option value=" + optionVal +">选项" + ($comp.find("option").length + 1) + "</option>");
										//新增元素，刷新下拉框
										$compOption.selectpicker("refresh");
									});
									//模态窗批量编辑选项值
									$batchEditBtn.click(function() {
										var modInitValue = "";
										var modInitText = "";
										$comp.find("select option").each(function(){
											modInitText = modInitText + $(this).text() + "\r\n";
											modInitValue = modInitValue + $(this).attr("value") + "\r\n";
										});
										var $modal = $.epm.modal({
											title: "批量编辑",
											size: "",
											body: "<div style=\"height:474px;\">" +
													"<ul>" +
														"<li>每一行对应一个选项值,可通过多行数据增加选项</li>" +
														"<li>左栏对应显示值,右栏对应value</li>" +
														"<li>请确保显示值和value对应同一行</li>" +
													"</ul>" +
													"<textarea style=\"width:235px;float:left;\" rows=\"20\" cols=\"60\">" + modInitText + "</textarea>" +
													"<textarea style=\"width:235px;float:left;margin-left:10px;\" rows=\"20\" cols=\"60\">" + modInitValue + "</textarea>" +
												"</div>",
											autoDismiss: false,
											showCloseBotton: true,
											buttons: [{
												value: "保存",
												style: "primary",
												click: function($modal) {
													var textArray = $modal.find("textarea:first").val().trim().split("\n");
													var valueArray = $modal.find("textarea:last").val().trim().split("\n");
													for (var i in textArray) {
														if (textArray[i] != "" && typeof(textArray[i]) != "undefined") {
															//对应批量编辑的值改变prop
															$($prop.find(":text").get(i)).val(textArray[i].trim());
															//对应批量编辑的值改变comp
															$($comp.find("option").get(i)).text(textArray[i].trim());
															//处理如有多余行数据，对应Prop新增选项
															if ("undefined" == typeof($prop.find(":text").get(i))) {
																var $checkboxDiv = $("<div class=\"form-inline\">" +
																						"<input type=\"checkbox\" value=" + valueArray[i] + ">&nbsp;" +
																						"<input type=\"text\" class=\"form-control\" style=\"width:56%\">" +
																						"<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">" +
																							"<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span>" +
																						"</a>" +
																						"<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">" +
													                                        "<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\">" +
													                                    	"</span>" +
													                                  	"</a>" +
																					"</div>");
																$checkboxDiv.children(":text").attr("value", textArray[i].trim());
																$prop.first().append($checkboxDiv);
																$comp.find("select").append("<option value=" + valueArray[i] + ">" + textArray[i].trim() + "</option>");
															}
															//改变内容，刷新下拉框
															$compOption.selectpicker("refresh");
														}
													}
													//重新绑定click移除事件
													$prop.find("a.remove-item").off();
													$prop.find("a.remove-item").click(function() {
														var indexNum = $prop.find("a.remove-item").index($(this)[0]);
														if ($comp.find("option").length > 1) {
															//移除组件中对应的行
															$comp.find("option:eq(" + indexNum + ")").parent().remove();
															//移除属性栏中的行
															$(this).parent().fadeOut("fast", function() {
																$(this).remove();
															});
														} else {
															$.epm.snackbar("至少保留一个选项",1000);
														}
													})
													$modal.modal("hide");
												}
											}, {
												value: "关闭",
												dismiss: true
											}]
										});
									})
								  //绑定拖拽事件
								  var selectPriVal = ""; 
					              $checkboxWrapper.droppable({
					                accept: "a.drag-item"
					              }).sortable({
					                opacity: .5,
					                start: function(event, ui) {
					                  //拖动元素起始位置
					                  beginIndex = ui.item.index();
					                  beginIndex = parseInt(beginIndex);
					                  selectPriVal = $compOption.val();
					                },
					                stop: function(event, ui) {
					                  //拖动结束的位置
					                  var endIndex = ui.item.index();
					                  endIndex = parseInt(endIndex);
					                  if(beginIndex != endIndex){
					                  	$(this).exchange($comp.last().find("option:eq(" + beginIndex + ")"),$comp.last().find("option:eq(" + endIndex + ")"));
					                  }
					                  $compOption.selectpicker("refresh");
					                  $compOption.selectpicker("val",selectPriVal);
					                }
					              }).disableSelection();
								},
								get: function($comp, $prop) {
									//判断是否是绑定数据
					                var dataInfo = $comp.last().attr("data-info");
					                var selectedEntity = "";
					                if(dataInfo){
					                    selectedEntity = $.parseJSON($comp.last().attr("data-info")).entity;//如果存在data数据显示自动绑定面板
						                $prop.slice(0,2).hide();
						                $prop.slice(2).show();
					                }else{
					                	$comp.find("option").each(function(index, value) {
											var selectValue = $comp.find("select").val();
											var checkedFlag = false;
											//由于是动态扩展的字段，每次从comp到prop映射时均采用如下append展示
											var $checkboxDiv = $("<div class=\"form-inline\">" +
																	"<input type=\"checkbox\" value=" + $(this).val() + ">&nbsp;" +
																	"<input type=\"text\" class=\"form-control\" style=\"width:56%\">" +
																	"<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">" +
																		"<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span>" +
																	"</a>" +
																	"<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">" +
										                                "<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\">" +"</span>" +
										                            "</a>" +
																"</div>");
											if (selectValue != "" && typeof(selectValue) != "undefined" && selectValue != null) {
												//comp中select的value包含遍历字段时，设置checkbox选中
												if (selectValue.indexOf($(this).val()) > -1) {
													checkedFlag = true;
												}
												$checkboxDiv.children(":checkbox").prop("checked", checkedFlag);
											}
											$checkboxDiv.children(":text").attr("value", $(this).text());
											//初始从组件到属性映射时绑定移除事件
											$checkboxDiv.children("a.remove-item").click(function() {
												var indexNum = $checkboxDiv.index();
												if ($comp.find("option").length > 1) {
													//移除属性栏中的行
													$checkboxDiv.fadeOut("fast", function() {
														$(this).remove();
													});
													//移除组件中对应的行
													$comp.find("option:eq(" + indexNum + ")").remove();
													$comp.find("select").selectpicker("refresh");
												} else {
													$.epm.snackbar("至少保留一个选项",1000);
												}
											});
											$prop.first().append($checkboxDiv);
										});
					                  }
					                  var op = "<option></option>";
						              entityJson = {
						                  EntityVersionID:"",
						                  ExtendFlag:"",
						                  IsDictionaryTable:"1",
						                  limit:"-1",
						                  offset:"-1"
						              };
						              $.post("entity!get.action",{"entityJson":JSON.stringify(entityJson)},function(data,status){       //获得绑定的码表实体
						                  $(data.data).each(function(index,item){
						                      $op = $(op);
						                      $op.val(item.entityVersionID);
						                      $op.text(item.entityName);
						                      $prop.find("select").eq(0).append($op);
						                      if(selectedEntity == item.entityVersionID){
						                          $op.prop("selected",true);
						                      }
						                  });
						                  $prop.find("select").eq(0).change();//获得后出发change事件，选中被绑定的KYE和VALUE
						              },"json");
								}
							}, {
								name: '校验',
								html: '<div><input type="checkbox">&nbsp;<label>只读</label>&nbsp;&nbsp;<input type="checkbox">&nbsp;<label>必填</label></div>',
								set: function($comp, $prop) {
									$prop.change(function() {
										$comp.find("option").attr("disabled", $prop.find(":checkbox").first().prop("checked"));
										//更新状态，刷新
										$comp.find("select").selectpicker("refresh");
										$comp.find("span:first").attr("hidden", !$prop.find(":checkbox").last().prop("checked"));
									});
								},
								get: function($comp, $prop) {
									$prop.find(":checkbox").first().prop("checked", $comp.find("option").attr("disabled"));
									$prop.find(":checkbox").last().prop("checked", !$comp.find("span:first").attr("hidden"));
								}
							}],
							onload: function($comp) {

							},
							onsubmit: function($comp) {
								//校验至少有一项被选中
								if (!$comp.find("span").prop("hidden")) {
									var isChecked = false;
									var multiSelectValue = $comp.find("select").val();
									if (multiSelectValue != "" && multiSelectValue != null) {
										isChecked = true;
									}
									if (!isChecked) {
										$comp.popover({
											content: "下拉复选框至少有一项被选中",
											placement: "top"
										}).popover("show").closest(".form-group").addClass("has-error");
										setTimeout(function(){
											$comp.popover("hide").popover("destroy").closest(".form-group").removeClass("has-error");
										},2000);
										return false;
									}
									return true;
								}
							},
							ondrop: function($comp) {
								//加载下拉多选控件
								$comp.find(".selectpicker").selectpicker({
									noneSelectedText: "请选择..."
								});
							}
						}
                };
            },
            //实体子表单控件
            "00010": function(field) {
                return {
                    //name: field.dataColumnName, dataColumnName导致数据获取不到 jiasong Update 2015-10-28 14:30
                    name: field.fieldCode,
                    component: {
                        title: field.fieldName,
                        html: '<div class="center-block"><table class="table table-hover" data-self-entity=' + field.fieldValues + ' style="text-align:center"><thead><tr></tr></thead><tbody><tr><td style=\"display:none;\" class=\"removeTd\"><a class=\"btn btn-sm\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除记录\"></span></a></td></tr></tbody></table><div class="form-control">请添加字段</div><a class=\"btn btn-sm add-row\"><span class="glyphicon glyphicon-plus text-info" data-toggle=\"tooltip\" data-placement=\"right\" title=\"新建记录\">新建记录</span></a></div>',
                        allocate: function($comp) {
                            var result = [];
                            $comp.find("table thead tr td").each(function(index, value) {
                                if ($("table > tbody tr td:nth-child(" + (index + 1) + ")").find("select").not(".selectpicker").length > 0) {
                                    result.push({
                                        titleSelector: "table > thead tr td:eq(" + index + ") label",
                                        nameSelector: "table > tbody tr td:nth-child(" + (index + 1) + ") select"
                                    });
                                } else if ($("table > tbody tr td:nth-child(" + (index + 1) + ")").find("select.selectpicker").length > 0) {
                                    result.push({
                                        titleSelector: "table > thead tr td:eq(" + index + ") label",
                                        nameSelector: "table > tbody tr td:nth-child(" + (index + 1) + ") select.selectpicker"
                                    });
                                } else {
                                    result.push({
                                        titleSelector: "table > thead tr td:eq(" + index + ") label",
                                        nameSelector: "table > tbody tr td:nth-child(" + (index + 1) + ") input"
                                    });
                                }
                            });
                            return result;
                        },
                        defaultName: field.fieldName,
                        props: [{
                            name: '字段',
                            html: '<div><div class="draggable-div"></div><a class=\"btn btn-sm add-item\"><span class="glyphicon glyphicon-plus text-info">添加字段</span></a><div><select class="form-control" style="display:none"><option value="com_text">单行文本</option><option value="com_num">数字</option><option value="com_date">日期时间</option><option value="com_select">下拉框</option><option value="com_multi_select">下拉复选框</option></select></div></div><div><button type="button" class="form-control">设置默认值</button></div>',
                            set: function($comp, $prop) {
                                //文本框属性栏
                                var com_text = {
                                    title: "单行文本",
                                    html: "<div class=\"form-group\"><label></label><span hidden style=\"color:#F00;font-weight:bold\">*</span><input  type=\"text\" class=\"form-control\"/></div>",
                                    defaultName: "单行文本",
                                    props: [{
                                            name: "默认值",
                                            html: "<input type=\"text\" class=\"form-control\"/>",
                                            set: function($comp, $prop) {
                                                $prop.keyup(function() {
                                                    $comp.find("input").val($prop.val());
                                                });
                                            },
                                            get: function($comp, $prop) {
                                                $prop.val($comp.find("input").val());
                                            }
                                        }, {
                                            name: "校验",
                                            html: "\
                                                    <div class=\"form-group\">\
                                                        <input type=\"checkbox\" name=\"\" value=\"readonly\"\>只读</input>\
                                                        <input type=\"checkbox\" value=\"required\"\>必填</input>\
                                                    </div>\
                                                    ",
                                            set: function($comp, $prop) {
                                                $prop.click(function() {
                                                    $prop.find(":checkbox").each(function(index, item) {
                                                        $comp.find("input").prop($(item).val(), $(item).prop("checked"));
                                                        if (index == 1)
                                                            $comp.find("span").attr("hidden", !$(item).prop("checked"));
                                                    });
                                                });
                                            },
                                            get: function($comp, $prop) {
                                                $prop.find(":checkbox").each(function(index, item) {
                                                    $(item).prop("checked", $comp.find("input").prop($(item).val()));
                                                    if (index == 1)
                                                        $comp.find("span").prop("hidden", !$(item).prop("checked"));
                                                });
                                            }
                                        }, {
                                            name: "",
                                            html: "<div style=\"text-align:center\"><button type=\"button\" class=\"btn btn-primary\">完成</button></div>",
                                            set: function($comp, $prop) {
                                                $prop.find("button").click(function() {
                                                    $comp.click();
                                                })
                                            },
                                            get: function($comp, $prop) {

                                            }
                                        }

                                    ]
                                };
                                //数字框属性栏
                                var com_num = {
                                    title: "数字",
                                    html: "<div class=\"form-group\"><span hidden style=\"color:#F00;font-weight:bold\">*</span><input type=\"text\" class=\"form-control\"/></div>",
                                    defaultName: "数字",
                                    props: [{
                                        name: "默认值(请输入数字0~9)",
                                        html: "<div class=\"from-group\"><input type=\"text\" class=\"form-control\"/></div>",
                                        set: function($comp, $prop) {
                                            $prop.keyup(function() {
                                                if (!isNaN($prop.find("input").val())) {
                                                    $prop.removeClass("has-error");
                                                    $comp.find("input").val($prop.find("input").val());
                                                } else {
                                                    $prop.addClass("has-error");
                                                }
                                            });
                                        },
                                        get: function($comp, $prop) {
                                            $prop.val($comp.find("input").val());
                                        }
                                    }, {
                                        name: "校验",
                                        html: "\
                                                        <div class=\"form-group\">\
                                                        <input type=\"checkbox\" name=\"\" value=\"readonly\"\>只读</input>\
                                                        <input type=\"checkbox\" value=\"required\"\>必填</input>\
                                                        </div>\
                                                    ",
                                        set: function($comp, $prop) {
                                            $prop.click(function() {
                                                $prop.find(":checkbox").each(function(index, item) {
                                                    $comp.find("input").prop($(item).val(), $(item).prop("checked"));
                                                    if (index == 1)
                                                        $comp.find("span").attr("hidden", !$(item).prop("checked"));
                                                });
                                            });
                                        },
                                        get: function($comp, $prop) {
                                            $prop.find(":checkbox").each(function(index, item) {
                                                $(item).prop("checked", $comp.find("input").prop($(item).val()));
                                                if (index == 1)
                                                    $comp.find("span").attr("hidden", !$(item).prop("checked"));
                                            });
                                        }
                                    }, {
                                        name: "",
                                        html: "<div style=\"text-align:center\"><button type=\"button\" class=\"btn btn-primary\">完成</button></div>",
                                        set: function($comp, $prop) {
                                            $prop.find("button").click(function() {
                                                $comp.click();
                                            })
                                        },
                                        get: function($comp, $prop) {

                                        }
                                    }]
                                };
                                //日期属性栏
                                var com_date = {
                                    title: "日期时间",
                                    html: "<div class=\"input-append date form_datetime\">\
                                              <span hidden style=\"color:#F00;font-weight:bold\">*</span>\
                                              <input size=\"16\" type=\"text\" class=\"form-control\">\
                                              <span class=\"add-on\"><i class=\"icon-th\"></i></span>\
                                         </div>",
                                    defaultName: "日期时间",
                                    props: [{
                                        name: "默认值",
                                        html: "<div class=\"input-append date form_datetime\">\
                                                  <span hidden style=\"color:#F00;font-weight:bold\">*</span>\
                                                  <input size=\"16\" type=\"text\" class=\"form-control\">\
                                                  <span class=\"add-on\"><i class=\"icon-th\"></i></span>\
                                             </div>",
                                        set: function($comp, $prop) {
                                            //加载datatimepicker控件
                                        	$prop.find("input").datetimepicker({
                   							  language:  "zh-CN",
                   						        weekStart: 1,
                   						        format: "yyyy-mm-dd",
                   						        todayBtn:  1,
                   								autoclose: 1,
                   								todayHighlight: 1,
                   								startView: 2,
                   								minView: 2,
                   								forceParse: 0

                   													});
                                            $prop.change(function() {
                                                $comp.find("input").val($prop.find("input").val());
                                            });
                                        },
                                        get: function($comp, $prop) {
                                            $prop.find("input").prop("value", $comp.find("input").val());
                                        }
                                    }, {
                                        name: "校验",
                                        html: "<div><input type=\"checkbox\" value=\"disabled\">&nbsp;<label>只读</label>&nbsp;&nbsp;<input type=\"checkbox\" value=\"required\">&nbsp;<label>必填</label></div>",
                                        set: function($comp, $prop) {
                                            $prop.change(function() {
                                                $prop.find(":checkbox").each(function() {
                                                    $comp.find("input").attr($(this).val(), $(this).prop("checked"));
                                                    $comp.find("span").attr("hidden", !($(this).prop("checked")));
                                                });
                                            });
                                        },
                                        get: function($comp, $prop) {
                                            $prop.find(":checkbox").each(function() {
                                                $(this).prop("checked", $comp.find("input").prop($(this).val()));
                                                $comp.find("span").attr("hidden", !($(this).prop("checked")));
                                            });
                                        }
                                    }, {
                                        name: "",
                                        html: "<div style=\"text-align:center\"><button type=\"button\" class=\"btn btn-primary\">完成</button></div>",
                                        set: function($comp, $prop) {
                                            $prop.find("button").click(function() {
                                                $comp.click();
                                            })
                                        },
                                        get: function($comp, $prop) {

                                        }
                                    }]
                                };
                                //下拉框属性
                                var com_select = {
                                    title: "下拉框",
                                    html: "<div class=\"form-group\" data-info=\"\"><select class=\"form-control\"></select></div>",
                                    defaultName: "下拉框",
                                    props: [{
                                        name: "添加选项",
                                        html: "<a class=\"btn btn-default btn-sm btn-block manual\">手动添加</a>\
                                                        <div class=\"form-group manual\">\
                                                        <table>\
                                                            <thead>\
                                                                <tr>\
                                                                    <td>\
                                                                        <label class=\"control-label\">Key</label>\
                                                                    </td>\
                                                                    <td>\
                                                                        <label class=\"control-label\">Value</label>\
                                                                    </td>\
                                                                    <td>\
                                                                    </td>\
                                                                </tr>\
                                                            </thead>\
                                                            <tbody>\
                                                            </tbody>\
                                                            <tfoot>\
                                                                <tr>\
                                                                    <td colspan=\"2\">\
                                                                        <a class=\"btn btn-default btn-sm btn-block\">添加选项</a>\
                                                                    </td>\
                                                                <tr>\
                                                            <tfoot>\
                                                        </table>\
                                                    </div>\
                                                    <a class=\"btn btn-default btn-sm btn-block automatic\">自动绑定</a>\
                                                    <div class=\"form-group automatic\">\
                                                        <label class=\"control-label\">选择码表</label>\
                                                        <select class=\"form-control\"></select>\
                                                        <label class=\"control-label\">选择Key</label>\
                                                        <select class=\"form-control\"></select>\
                                                        <label class=\"control-label\">选择Value</label>\
                                                        <select class=\"form-control\"></select>\
                                                        <br><a class=\"btn btn-default btn-sm save\">保存</a>\
                                                        <a class=\"btn btn-default btn-sm clean\">清除</a>\
                                                    </div>",
                                        set: function($comp, $prop) {
                                            var dataexist = $comp.attr("data-info"); //用来判断是否存在data数据

                                            $("a.automatic").click(function() {
                                                $("div.manual").slideToggle();
                                                $("div.automatic").slideToggle();
                                            });
                                            $("a.manual").click(function() {
                                                $("div.manual").slideToggle();
                                                $("div.automatic").slideToggle();
                                            });
                                            var $addBtn = $prop.find("table > tfoot > tr > td > a");
                                            var $optionWrapper = $prop.find("table > tbody");
                                            $addBtn.click(function() {
                                                var $newOptionData = $("<tr>" +
                                                    "<td>" +
                                                    "<input type=\"text\" class=\"form-control key\"/>" +
                                                    "</td>" +
                                                    "<td>" +
                                                    "<input type=\"text\" class=\"form-control value\"/>" +
                                                    "</td>" +
                                                    "<td>" +
                                                    "<a class=\"btn btn-link btn-xs\">" +
                                                    "<span class=\"glyphicon glyphicon-remove text-danger\" aria-hidden=\"true\"></span>" +
                                                    "</a>" +
                                                    "</td>" +
                                                    "</tr>");
                                                var $newOption = $("<option></option>");
                                                $newOptionData.find("td:eq(0) > input").keyup(function() {
                                                    $newOption.text($newOptionData.find("td:eq(0) > input").val());
                                                });
                                                $newOptionData.find("td:eq(1) > input").keyup(function() {
                                                    $newOption.val($newOptionData.find("td:eq(1) > input").val());
                                                });

                                                $newOptionData.find("td > a").click(function() {
                                                    var indexNum = $newOptionData.index();
                                                    $(this).parent().parent().remove();
                                                    $comp.find("option:eq(" + indexNum + ")").remove();
                                                });

                                                $optionWrapper.append($newOptionData);
                                                $comp.find("select").append($newOption);
                                            })

                                            var fieldop = "<option></option>";

                                            $prop.find("select").eq(0).change(function() {

                                                var selectedKey = "";
                                                var selectedVal = "";
                                                if (dataexist) {
                                                    selectedKey = $.parseJSON($comp.attr("data-info")).key;
                                                    selectedVal = $.parseJSON($comp.attr("data-info")).value;
                                                }

                                                var op = $(this).find("option:selected");
                                                $prop.find("select").eq(1).html("");
                                                $prop.find("select").eq(2).html("");
                                                $.post("entity!getfield.action", {
                                                    "entityVersionID": op.val()
                                                }, function(data, status) {
                                                    $(data.data).each(function(index, item) {
                                                        $keyop = $(fieldop);
                                                        $valueop = $(fieldop);
                                                        $keyop.val(item.fieldCode);
                                                        $keyop.text(item.fieldName);
                                                        $valueop.val(item.fieldCode);
                                                        $valueop.text(item.fieldName);
                                                        if (index == 0) {
                                                            $keyop.prop("selected", true);
                                                            $valueop.prop("selected", true);
                                                        }
                                                        if (selectedKey == item.fieldCode)
                                                            $keyop.prop("selected", true);
                                                        if (selectedVal == item.fieldCode)
                                                            $valueop.prop("selected", true);
                                                        $prop.find("select").eq(1).append($keyop);
                                                        $prop.find("select").eq(2).append($valueop);
                                                    });
                                                }, "json");
                                            });
                                            var dictionaryTable = {
                                                entity: "",
                                                key: "",
                                                value: ""
                                            };
                                            $prop.find("a.clean").click(function() {
                                                $comp.attr("data-info", "");
                                                $comp.find("select").html("");
                                            });
                                            $prop.find("a.save").click(function() {
                                                dictionaryTable.entity = $prop.find("select").eq(0).find("option:selected").val();
                                                dictionaryTable.key = $prop.find("select").eq(1).find("option:selected").val();
                                                dictionaryTable.value = $prop.find("select").eq(2).find("option:selected").val();
                                                $comp.attr("data-info", JSON.stringify(dictionaryTable));
                                            });
                                        },
                                        get: function($comp, $prop) {
                                            var selectedEntity = "";
                                            var dataexist = $comp.attr("data-info"); //用来判断是否存在data数据

                                            if (dataexist) {
                                                selectedEntity = $.parseJSON($comp.attr("data-info")).entity;
                                                $("div.manual").slideUp();
                                                $("div.automatic").slideDown();
                                            } else {
                                                $("div.manual").slideDown();
                                                $("div.automatic").slideUp();

                                                $comp.find("option").each(function(index, value) {
                                                    var $optionVal = $(value);
                                                    var $optionWrapper = $prop.find("table > tbody");
                                                    var $newOptionData = $("<tr>" +
                                                        "<td>" +
                                                        "<input type=\"text\" class=\"form-control key\"/>" +
                                                        "</td>" +
                                                        "<td>" +
                                                        "<input type=\"text\" class=\"form-control value\"/>" +
                                                        "</td>" +
                                                        "<td>" +
                                                        "<a class=\"btn btn-link btn-xs\">" +
                                                        "<span class=\"glyphicon glyphicon-remove text-danger\" aria-hidden=\"true\"></span>" +
                                                        "</a>" +
                                                        "</td>" +
                                                        "</tr>");
                                                    $newOptionData.find("td:eq(0) > input").val($optionVal.text());
                                                    $newOptionData.find("td:eq(1) > input").val($optionVal.val());
                                                    $newOptionData.find("td > a").click(function() {
                                                        var indexNum = $newOptionData.index();
                                                        $(this).parent().parent().remove();
                                                        $comp.find("option:eq(" + indexNum + ")").remove();
                                                    });
                                                    $optionWrapper.append($newOptionData);
                                                });
                                            }
                                            var op = "<option></option>";
                                            entityJson = {
                                                EntityVersionID: "",
                                                ExtendFlag: "",
                                                IsDictionaryTable: "1",
                                                limit: "-1",
                                                offset: "-1"
                                            }
                                            $.post("entity!get.action", {
                                                "entityJson": JSON.stringify(entityJson)
                                            }, function(data, status) {
                                                $(data.data).each(function(index, item) {
                                                    $op = $(op);
                                                    $op.val(item.entityVersionID);
                                                    $op.text(item.entityName);
                                                    $prop.find("select").eq(0).append($op);
                                                    if (selectedEntity == item.entityVersionID) {
                                                        $op.prop("selected", true);
                                                    }
                                                });
                                                $prop.find("select").eq(0).change();
                                            }, "json");
                                        }
                                    }, {
                                        name: "",
                                        html: "<div style=\"text-align:center\"><button type=\"button\" class=\"btn btn-primary\">完成</button></div>",
                                        set: function($comp, $prop) {
                                            $prop.find("button").click(function() {
                                                $comp.click();
                                            })
                                        },
                                        get: function($comp, $prop) {

                                        }
                                    }]
                                };
                                //下拉多选框属性
                                var com_multi_select = {
                                    title: "下拉复选框",
                                    html: "<div><span hidden style=\"color:#F00;font-weight:bold\">*</span><div><select class=\"selectpicker\" multiple data-live-search=\"true\"><option>选项1</option><option>选项2</option></select></div></div>",
                                    defaultName: "下拉复选框",
                                    props: [{
                                        name: "选项",
                                        html: "<div></div><div><button type=\"button\" class=\"btn btn-sm\">添加选项</button>&amp;nbsp;&amp;nbsp;<button type=\"button\" class=\"btn btn-sm\">批量编辑</button></div>",
                                        set: function($comp, $prop) {
                                            var $checkboxWrapper = $prop.first();
                                            var $addBtn = $prop.find(":button").first();
                                            var $batchEditBtn = $prop.find(":button").last();
                                            var $compOption = $comp.find("select");
                                            var checkedValue = new Array();

                                            $prop.change(function() {
                                                $prop.find(":checkbox").each(function(index, value) {
                                                    if ($(this).prop("checked")) {
                                                        checkedValue.push($(this).next().val());
                                                    }
                                                    $comp.find("option:eq(" + index + ")").text($(this).next().val());
                                                    //修改下拉框值刷新列表--对此类下拉框字段名增删改均需刷新
                                                    $(".selectpicker").selectpicker("refresh");
                                                });
                                                if (checkedValue.length > 0) {
                                                    $(".selectpicker").selectpicker("val", checkedValue);
                                                } else {
                                                    $(".selectpicker").selectpicker("val", "请选择...");
                                                }
                                                //清空array
                                                checkedValue = [];
                                            });
                                            //增加下拉选项
                                            $addBtn.click(function() {
                                                var $checkboxDiv = $("<div class=\"form-inline\"><input type=\"checkbox\">&nbsp;<input type=\"text\" class=\"form-control\" value=\"选项\" style=\"width:65%\"><a class=\"btn btn-sm remove-item\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span></a></div>");
                                                //增加选项时绑定移除事件
                                                $checkboxDiv.children("a.remove-item").click(function() {
                                                    var indexNum = $checkboxDiv.index();
                                                    if ($comp.find("option").length > 1) {
                                                        $checkboxDiv.remove();
                                                        //移除comp中对应的option
                                                        $comp.find("option:eq(" + indexNum + ")").remove();
                                                        //删除元素，刷新下拉框
                                                        $(".selectpicker").selectpicker("refresh");
                                                    } else {
                                                        $.epm.snackbar("至少保留一个选项",1000);
                                                    }
                                                });
                                                $checkboxWrapper.append($checkboxDiv);
                                                $compOption.append("<option>选项</option>");
                                                //新增元素，刷新下拉框
                                                $(".selectpicker").selectpicker("refresh");
                                            });
                                            //模态窗批量编辑选项值
                                            $batchEditBtn.click(function() {
                                                var modInitValue = "";
                                                $prop.find(":text").each(function() {
                                                    modInitValue = modInitValue + $(this).val() + "\r\n";
                                                });
                                                var $modal = $.epm.modal({
                                                    title: "批量编辑",
                                                    size: "",
                                                    body: "<div><label>每一行对应一个选项值,可通过增加多行数据增加选项</label><textarea rows=\"20\" cols=\"60\">" + modInitValue + "</textarea></div>",
                                                    autoDismiss: false,
                                                    showCloseBotton: true,
                                                    buttons: [{
                                                        value: "保存",
                                                        style: "primary",
                                                        click: function($modal) {
                                                            var array = $modal.find("textarea").val().trim().split("\n");
                                                            for (var i in array) {
                                                                if (array[i] != "" && typeof(array[i]) != "undefined") {
                                                                    //对应批量编辑的值改变prop
                                                                    $($prop.find(":text").get(i)).val(array[i].trim());
                                                                    //对应批量编辑的值改变comp
                                                                    $($comp.find("option").get(i)).text(array[i].trim());
                                                                    //处理如有多余行数据，对应Prop新增选项
                                                                    if ("undefined" == typeof($prop.find(":text").get(i))) {
                                                                        var $checkboxDiv = $("<div class=\"form-inline\"><input type=\"checkbox\">&nbsp;<input type=\"text\" class=\"form-control\" style=\"width:65%\"><a class=\"btn btn-sm remove-item\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span></a></div>");
                                                                        $checkboxDiv.children(":text").attr("value", array[i].trim());
                                                                        $prop.first().append($checkboxDiv);
                                                                        $comp.find("select").append("<option>" + array[i].trim() + "</option>");
                                                                    }
                                                                    //改变内容，刷新下拉框
                                                                    $(".selectpicker").selectpicker("refresh");
                                                                }
                                                            }
                                                            //重新绑定click移除事件
                                                            $prop.find("a.remove-item").off();
                                                            $prop.find("a.remove-item").click(function() {
                                                                var indexNum = $prop.find("a.remove-item").index($(this)[0]);
                                                                if ($comp.find(":option").length > 1) {
                                                                    //移除组件中对应的行
                                                                    $comp.find(":option:eq(" + indexNum + ")").parent().remove();
                                                                    //移除属性栏中的行
                                                                    $(this).parent().fadeOut("fast", function() {
                                                                        $(this).remove();
                                                                    });
                                                                } else {
                                                                    $.epm.snackbar("至少保留一个选项",1000);
                                                                }
                                                            })
                                                            $modal.modal("hide");
                                                        }
                                                    }, {
                                                        value: "关闭",
                                                        dismiss: true
                                                    }]
                                                });
                                            })
                                        },
                                        get: function($comp, $prop) {
                                            $comp.find("option").each(function(index, value) {
                                                var selectValue = $(".selectpicker").val();
                                                var checkedFlag = false;
                                                //由于是动态扩展的字段，每次从comp到prop映射时均采用如下append展示
                                                var $checkboxDiv = $("<div class=\"form-inline\"><input type=\"checkbox\">&nbsp;<input type=\"text\" class=\"form-control\" style=\"width:65%\"><a class=\"btn btn-sm remove-item\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span></a></div>");
                                                if (selectValue != "" && typeof(selectValue) != "undefined" && selectValue != null) {
                                                    //comp中select的value包含遍历字段时，设置checkbox选中
                                                    if (selectValue.indexOf($(this).text()) > -1) {
                                                        checkedFlag = true;
                                                    }
                                                    $checkboxDiv.children(":checkbox").prop("checked", checkedFlag);
                                                }
                                                $checkboxDiv.children(":text").attr("value", $(this).text());
                                                //初始从组件到属性映射时绑定移除事件
                                                $checkboxDiv.children("a.remove-item").click(function() {
                                                    var indexNum = $checkboxDiv.index();
                                                    if ($comp.find("option").length > 1) {
                                                        //移除属性栏中的行
                                                        $checkboxDiv.remove();
                                                        //移除组件中对应的行
                                                        $comp.find("option:eq(" + indexNum + ")").remove();
                                                        $(".selectpicker").selectpicker("refresh");
                                                    } else {
                                                        $.epm.snackbar("至少保留一个选项",1000);
                                                    }
                                                });
                                                $prop.first().append($checkboxDiv);
                                            });
                                        }
                                    }, {
                                        name: "校验",
                                        html: "<div><input type=\"checkbox\">&nbsp;<label>只读</label>&nbsp;&nbsp;<input type=\"checkbox\">&nbsp;<label>必填</label></div>",
                                        set: function($comp, $prop) {
                                            $prop.change(function() {
                                                $comp.find("option").attr("disabled", $prop.find(":checkbox").first().prop("checked"));
                                                $comp.find("span").attr("hidden", !$prop.find(":checkbox").last().prop("checked"));
                                            });
                                        },
                                        get: function($comp, $prop) {
                                            $prop.find(":checkbox").first().prop("checked", $comp.find("option").attr("disabled"));
                                            $prop.find(":checkbox").last().prop("checked", !$comp.find("span").attr("hidden"));
                                        }
                                    }, {
                                        name: "",
                                        html: "<div style=\"text-align:center\"><button type=\"button\" class=\"btn btn-primary\">完成</button></div>",
                                        set: function($comp, $prop) {
                                            $prop.find("button").click(function() {
                                                $comp.click();
                                            })
                                        },
                                        get: function($comp, $prop) {

                                        }
                                    }]
                                };
                                var $select = $prop.find("select");
                                var $compTable = $();
                                //点击新增属性
                                $prop.find("a.add-item").click(function(event) {
                                    //阻止事件冒泡,实现点击下拉框区域触发，区域外隐藏下拉框
                                    event.stopPropagation();
                                    //展示增加项下拉框
                                    $select.slideDown("fast");
                                    //通过点击时设置size模拟实现select自动展开
                                    if ($prop.find("select option").length > 5) {
                                        $select.prop("size", 5);
                                    } else {
                                        $select.prop("size", $prop.find("select option").length);
                                    }
                                });
                                //点击任何区域，隐藏下拉框
                                $(document).click(function() {
                                    $select.slideUp("fast");
                                })
                                $select.click(function(event) {
                                        //阻止事件冒泡
                                        event.stopPropagation();
                                        var optTitle = $select.children("option:selected").text().trim();
                                        var optValue = $select.children("option:selected").val();
                                        var $compThead = $comp.find("table thead tr");
                                        var $compTbody = $comp.find("table tbody tr td.removeTd");
                                        var $propSelector = $prop.find("div.draggable-div");
                                        var beginIndex = "";
                                        var $compSpan = $("<td><label>" + optTitle + "</label></td>");
                                        var $propSpan = $("<div class=\"sortableDiv form-inline\"><input type=\"text\" readonly=\"true\" class=\"form-control\" style=\"width:65%\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"点击编辑属性\" value=" + optTitle + "><a class=\"btn btn-sm remove-item\" style=\"padding:5px 5px;\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除字段\"></span></a><a class=\"btn btn-sm drag-item\" style=\"padding:5px 5px;\"><span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动字段\"></span></a></div>");
                                        //隐藏comp中添加字段DIV
                                        $comp.find("div.form-control").hide();
                                        //当有字段添加展示移除功能选项
                                        $comp.find("td.removeTd").show();
                                        $compThead.append($compSpan);
                                        $propSelector.append($propSpan);
                                        //绑定子组件移除事件
                                        $propSpan.find("a.remove-item").click(function() {
                                                var spanIndex = $propSpan.index();
                                                //移除comp对应组件
                                                $comp.find("table tr").find("td:eq(" + spanIndex + ")").remove();
                                                //移除prop对应组件
                                                $(this).parent().fadeOut("fast", function() {
                                                    $(this).remove();
                                                });
                                                //如果移除所有字段，则隐藏removeTd标签，显示添加字段div
                                                if ($comp.find("table tbody tr td").not(".removeTd").length < 1) {
                                                    $comp.find("div.form-control").show();
                                                    $comp.find("td.removeTd").hide();
                                                }
                                            })
                                            //子组件可拖拽
                                        $(".draggable-div").droppable({
                                            accept: "a.drag-item"
                                        }).sortable({
                                            opacity: .5,
                                            start: function(event, ui) {
                                                //拖动元素起始位置
                                                beginIndex = ui.item.index();
                                                beginIndex = parseInt(beginIndex);
                                            },
                                            stop: function(event, ui) {
                                                //拖动结束的位置
                                                var endIndex = ui.item.index();
                                                endIndex = parseInt(endIndex);
                                                //拖动之前comp对应的的位置
                                                var $beforeTd = $comp.find("table tr").find("td:eq(" + beginIndex + ")");
                                                //拖动之后的comp对应的位置
                                                var $afterTd = $comp.find("table tr").find("td:eq(" + endIndex + ")");
                                                var $compTr = $comp.find("table tr");
                                                /*
                                                 * 遍历comp中的tr，每次移动完成之后，在comp中endIndex元素的位置后添加
                                                 * beginIndex位置的td，然后再移除beginIndex位置的整个TD列
                                                 */
                                                if (beginIndex <= endIndex) {
                                                    $compTr.each(function() {
                                                        var targetTd = $(this).find("td:eq(" + beginIndex + ")").get(0);
                                                        $(this).find("td:eq(" + endIndex + ")").after(targetTd);
                                                    })
                                                } else {
                                                    $compTr.each(function() {
                                                        var targetTd = $(this).find("td:eq(" + endIndex + ")").get(0);
                                                        $(this).find("td:eq(" + beginIndex + ")").insertBefore(targetTd);
                                                    })
                                                }
                                            }
                                        }).disableSelection();
                                        switch (optValue) {
                                            case ("com_text"):
                                                //绑定子组件点击进入属性更改栏
                                                $propSpan.children(":text").click(function() {
                                                    var textIndex = $propSpan.index();
                                                    //对应表单内子属性title
                                                    var $customTitle = $comp.find("table thead tr td:eq(" + textIndex + ")").find("label");
                                                    //属性编辑，取对应的comp
                                                    $comp = $comp.find("table tr").find("td:eq(" + textIndex + ")");
                                                    $.bdt.loadPropertys($comp, com_text, $customTitle);
                                                })
                                                $compTbody.before("<td><input type=\"text\" class=\"form-control\"></td>");
                                                break;
                                            case ("com_num"):
                                                //绑定子组件点击进入属性更改栏
                                                $propSpan.children(":text").click(function() {
                                                    var textIndex = $propSpan.index();
                                                    //对应表单内子属性title
                                                    var $customTitle = $comp.find("table thead tr td:eq(" + textIndex + ")").find("label");
                                                    $comp = $comp.find("table tr").find("td:eq(" + textIndex + ")");
                                                    $.bdt.loadPropertys($comp, com_num, $customTitle);
                                                })
                                                $compTbody.before("<td><input type=\"number\" class=\"form-control\"></td>");
                                                break;
                                            case ("com_date"):
                                                //绑定子组件点击进入属性更改栏
                                                $propSpan.children(":text").click(function() {
                                                    var textIndex = $propSpan.index();
                                                    //对应表单内子属性title
                                                    var $customTitle = $comp.find("table thead tr td:eq(" + textIndex + ")").find("label");
                                                    $comp = $comp.find("table tr").find("td:eq(" + textIndex + ")");
                                                    $.bdt.loadPropertys($comp, com_date, $customTitle);
                                                })
                                                var dateTd = "<td><div class=\"input-append date form_datetime\">\
                                                      <input size=\"16\" type=\"text\" class=\"form-control\">\
                                                      <span class=\"add-on\"><i class=\"icon-th\"></i></span>\
                                                 </div></td>";
                                                $compTbody.before(dateTd);
                                                //加载对应扩展的datetimepicker
                                                var tempIndex = 0;
                                                $comp.find("table tbody tr td").each(function() {
                                                  $temp = $comp.find("tbody tr td").find(".form_datetime").last();
                                                  tempIndex = $temp.parent().index();
                                                });
                                                $comp.find("table tbody tr td:nth-child(" + (tempIndex + 1) + ")").each(function() {
                                                  $(this).find(".form_datetime").datetimepicker();
                                                });
                                                break;
                                            case ("com_select"):
                                                //绑定子组件点击进入属性更改栏
                                                $propSpan.children(":text").click(function() {
                                                    var textIndex = $propSpan.index();
                                                    //对应表单内子属性title
                                                    var $customTitle = $comp.find("table thead tr td:eq(" + textIndex + ")").find("label");
                                                    $comp = $comp.find("table tr").find("td:eq(" + textIndex + ")");
                                                    $.bdt.loadPropertys($comp, com_select, $customTitle);
                                                })
                                                $compTbody.before("<td><select class=\"form-control\"></select></td>");
                                                break;
                                            case ("com_multi_select"):
                                                //绑定子组件点击进入属性更改栏
                                                $propSpan.children(":text").click(function() {
                                                    var textIndex = $propSpan.index();
                                                    //对应表单内子属性title
                                                    var $customTitle = $comp.find("table thead tr td:eq(" + textIndex + ")").find("label");
                                                    $comp = $comp.find("table tr").find("td:eq(" + textIndex + ")");
                                                    $.bdt.loadPropertys($comp, com_multi_select, $customTitle);
                                                })
                                                $compTbody.before("<td><select class=\"selectpicker\" multiple data-live-search=\"true\"><option>选项1</option><option>选项2</option></select></td>");
                                                //加载对应扩展的selectpicker
                                                var tempIndex = 0;
                                                $comp.find("table tbody tr td").each(function() {
                                                    $temp = $comp.find("tbody tr td").find(".selectpicker").last();
                                                    tempIndex = $temp.parent().index();
                                                });
                                                $comp.find("table tbody tr td:nth-child(" + (tempIndex + 1) + ")").each(function() {
                                                    $(this).find(".selectpicker").selectpicker({
                                                        noneSelectedText: "请选择..."
                                                    });
                                                });
                                                break;
                                            default:
                                        }
                                        //添加完成隐藏下拉框
                                        $select.slideUp("fast");
                                    })
                                    //获取comp中table内容，以便在模态窗中获取
                                $compTable = $comp.find("table");
                                //模态窗批量编辑选项默认值
                                $prop.find("button").first().click(function() {
                                        //复制comp中的table，此时cloneTable对应模态框中的table
                                        var $cloneTable = $compTable.clone();
                                        var modalBody = "";
                                        if ($cloneTable != "" && typeof($cloneTable.html()) != "undefined") {
                                            //取comp中的值域信息赋给modal
                                            $cloneTable.find("table").empty().append($comp.find("table").html());
                                            modalBody = $cloneTable.html();
                                        }
                                        var $modal = $.epm.modal({
                                            title: "批量编辑",
                                            size: "",
                                            body: "<div><label>默认值</label><div class=\"center-block\"><table class=\"table table-hover\" style=\"text-align:center\">" + modalBody + "</table></div></div>",
                                            autoDismiss: false,
                                            showCloseBotton: true,
                                            buttons: [{
                                                value: "添加记录",
                                                style: "info",
                                                click: function($modal) {
                                                    $modal.find("table tbody").append("<tr>" + $modal.find("table tbody tr:eq(0)").html() + "</tr>");
                                                    //模态框绑定删除行功能
                                                    $modal.find("td.removeTd").off();
                                                    $modal.find("td.removeTd").click(function() {
                                                        //至少保留一行数据
                                                        if ($modal.find("table tbody tr").length > 1) {
                                                            $(this).parent().fadeOut("fast", function() { //fade
                                                                $(this).remove(); //then remove from the DOM
                                                            });
                                                        } else {
                                                            $.epm.snackbar("至少保留一项数据！",1000);
                                                        }
                                                    })
                                                }
                                            }, {
                                                value: "保存",
                                                style: "primary",
                                                click: function($modal) {
                                                    //将modal中对应增加的多行记录映射到comp中
                                                    $comp.find("table").empty().append($modal.find("table").html());
                                                    //遍历modal中的值域赋给comp
                                                    $modal.find("table tbody tr td input").each(function() {
                                                        //获取当前元素所在的行和列的Index
                                                        var hangNum = $(this).parent().parent().prevAll().length;
                                                        var lieNum = $(this).parent().prevAll().length;
                                                        //modal中值赋给对应comp中
                                                        $comp.find("table tbody tr:eq(" + hangNum + ")").find("td:eq(" + lieNum + ")").find("input").val($(this).val());
                                                    })
                                                    $modal.modal("hide");
                                                }
                                            }, {
                                                value: "关闭",
                                                dismiss: true
                                            }],
                                            show: function($modal) {
                                                //模态框展示之前遍历comp中的值域赋给modal
                                                $comp.find("table tbody tr td input").each(function() {
                                                        //获取当前元素所在的行和列的Index
                                                        var hang = $(this).parent().parent().prevAll().length;
                                                        var lie = $(this).parent().prevAll().length;
                                                        //comp中值赋给对应modal中
                                                        $modal.find("table tbody tr:eq(" + hang + ")").find("td:eq(" + lie + ")").find("input").val($(this).val());
                                                    })
                                                    //模态框绑定删除行功能
                                                $modal.find("td.removeTd").click(function() {
                                                    //至少保留一行数据
                                                    if ($modal.find("table tbody tr").length > 1) {
                                                        $(this).parent().fadeOut("fast", function() { //fade
                                                            $(this).remove(); //then remove from the DOM
                                                        });
                                                    } else {
                                                        $.epm.snackbar("至少保留一项数据！",1000);
                                                    }
                                                })
                                            },
                                            close: function($modal) {}
                                        });
                                    })
                                    /*
                                     * 以下为原get方法内容，为避免代码冗余过多而合并
                                     * 变量共享，其余方法同原写法
                                     */
                                $comp.find("table thead tr label").each(function(index, value) {
                                    var typeValue = $(this).text().trim();
                                    //判断当前遍历label所对应的控件的类型
                                    var $inputTypeDis = $(this).parent().parent().parent().next().find("tr:first td:eq(" + index + ")");
                                    var $propSpan = $("<div class=\"sortableDiv form-inline\"><input type=\"text\" readonly=\"true\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"点击编辑属性\" class=\"form-control\" style=\"width:65%\" value=" + typeValue + "><a class=\"btn btn-sm remove-item\" style=\"padding:5px 5px;\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除字段\"></span></a><a class=\"btn btn-sm drag-item\" style=\"padding:5px 5px;\"><span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动字段\"></span></a></div>");
                                    //绑定点击子表单编辑属性
                                    $propSpan.children("input").click(function() {
                                            var textIndex = $propSpan.index();
                                            //对应表单内子属性title
                                            var $customTitle = $comp.find("table thead tr td:eq(" + textIndex + ")").find("label");
                                            $comp = $comp.find("table tr").find("td:eq(" + textIndex + ")");
                                            if ($inputTypeDis.find(":text").length > 0) {
                                                $.bdt.loadPropertys($comp, com_text, $customTitle);
                                            }
                                            if ($inputTypeDis.find("input[type=\"number\"]").length > 0) {
                                                $.bdt.loadPropertys($comp, com_num, $customTitle);
                                            }
                                            if ($inputTypeDis.find(".form_datetime").length > 0) {
                                                $.bdt.loadPropertys($comp, com_date, $customTitle);
                                            }
                                            if ($inputTypeDis.find("select").not(".selectpicker").length > 0) {
                                                $.bdt.loadPropertys($comp, com_select, $customTitle);
                                            }
                                            if ($inputTypeDis.find("select.selectpicker").length > 0) {
                                                $.bdt.loadPropertys($comp, com_multi_select, $customTitle);
                                            }
                                        })
                                        //子组件可拖拽
                                    $(".draggable-div").droppable({
                                        accept: "a.drag-item"
                                    }).sortable({
                                        opacity: .5,
                                        start: function(event, ui) {
                                            //拖动元素起始位置
                                            beginIndex = ui.item.index();
                                            beginIndex = parseInt(beginIndex);
                                        },
                                        stop: function(event, ui) {
                                            //拖动结束的位置
                                            var endIndex = ui.item.index();
                                            endIndex = parseInt(endIndex);
                                            //拖动之前comp对应的的位置
                                            var $beforeTd = $comp.find("table tr").find("td:eq(" + beginIndex + ")");
                                            //拖动之后的comp对应的位置
                                            var $afterTd = $comp.find("table tr").find("td:eq(" + endIndex + ")");
                                            var $compTr = $comp.find("table tr");
                                            /*
                                             * 遍历comp中的tr，每次移动完成之后，在comp中endIndex元素的位置后添加
                                             * beginIndex位置的td，然后再移除beginIndex位置的整个TD列
                                             */
                                            if (beginIndex <= endIndex) {
                                                $compTr.each(function() {
                                                    var targetTd = $(this).find("td:eq(" + beginIndex + ")").get(0);
                                                    $(this).find("td:eq(" + endIndex + ")").after(targetTd);
                                                })
                                            } else {
                                                $compTr.each(function() {
                                                    var targetTd = $(this).find("td:eq(" + endIndex + ")").get(0);
                                                    $(this).find("td:eq(" + beginIndex + ")").insertBefore(targetTd);
                                                })
                                            }
                                        }
                                    }).disableSelection();
                                    //绑定移除组件操作
                                    $propSpan.children("a.remove-item").click(function() {
                                        var spanIndex = $propSpan.index();
                                        //移除comp对应组件
                                        $comp.find("table tr").find("td:eq(" + spanIndex + ")").remove();
                                        //移除prop对应组件
                                        $(this).parent().fadeOut("fast", function() {
                                            $(this).remove();
                                        });
                                        //如果移除所有字段，则隐藏removeTd标签，显示添加字段div
                                        if ($comp.find("table tbody tr td").not(".removeTd").length < 1) {
                                            $comp.find("div.form-control").show();
                                            $comp.find("td.removeTd").hide();
                                        }
                                    })
                                    $prop.find("div:first").append($propSpan);
                                });
                            },
                            get: function($comp, $prop) {

                            }
                        }],
                        onload: function($comp) {

                            //绑定子表单中数字输入框只能输入数字
                            $comp.find("input[type=\"number\"]").keypress(function(event){
                                var evt = event || window.event;
                                var keyCode = evt.keyCode || evt.which;
                                //对应ASCII码表，只能包含输入和.小数
                                if((keyCode >= 48 && keyCode <= 57) || keyCode == 46 && $prop.find("input").val().split(".").length-1 < 1 || keyCode == 8){
                                    return true;
                                }else{
                                    return false;
                                }
                                //绑定数字框粘贴事件
                            }).bind("paste",function(e){
                                var el = $(this);
                                var pri_value = $(this).val();
                                setTimeout(function(){
                                    //获取粘贴板的值
                                    var clipboard = $(el).val();
                                    var r = /^\d+(\.\d+)?$/;
                                    if (r.test(clipboard))
                                        return true;
                                    else
                                        //不匹配则还原输入框的值
                                        $(el).val(pri_value);
                                        return false;
                                },100);
                            });
                            $comp.find("td.removeTd").off();
                            $comp.find("td.removeTd").click(function() {
                                    //至少保留一行数据
                                    if ($comp.find("table tbody tr").length > 1) {
                                        $(this).parent().fadeOut("fast", function() { //fade
                                            $(this).remove(); //then remove from the DOM
                                        });
                                    } else {
                                        $.epm.snackbar("至少保留一项数据！",1000);
                                    }
                                })
                                //防止多次执行重复绑定
                            $comp.find("a.add-row").off();
                            $comp.find("a.add-row").click(function() {
                                $comp.find("table tbody").append("<tr>" + $comp.find("table tbody tr:eq(0)").html() + "</tr>");
                                //绑定删除行功能
                                $comp.find("td.removeTd").off();
                                $comp.find("td.removeTd").click(function() {
                                    //至少保留一行数据
                                    if ($comp.find("table tbody tr").length > 1) {
                                        $(this).parent().fadeOut("fast", function() { //fade
                                            $(this).remove(); //then remove from the DOM
                                        });
                                    } else {
                                        $.epm.snackbar("至少保留一项数据！",1000);
                                    }
                                })
                            })
                        },
                        ondrop: function($comp) {

                            //获取实体信息中的子实体信息
                            var fieldValues = $comp.find("table").data("self-entity");
                            
                            var subEntityVersionID = (fieldValues == null) ? "" : fieldValues.entity;
                            if(subEntityVersionID != ""){
                                $.post("entity!getfield.action", {
                                    "entityVersionID": subEntityVersionID
                                }, function(data) {
                                    if (data.success) {
                                        var subformLabelTd = "";
                                        var subformInputTd = "";
                                        var otherFieldNum = 0;
                                        $.each(data.data, function(index, field) {
                                            /*
                                             * field.dataColumnName 宽表列名
                                             * field.fieldName 字段名
                                             * field.fieldOrder 字段排序
                                             * field.fieldType 字段类型
                                             * field.widgetType 控件类型
                                             * field.fieldValues 是否包含下级子表单
                                             */
                                            //此处不考虑子表单中包含子表单因素
                                            if (null == field.fieldValues) {
                                                switch (field.widgetType) {
                                                    case ("00001"):
                                                        //单行文本
                                                        subformLabelTd = subformLabelTd + "<td><label data-epm-entity-fieldcode=" + field.fieldCode + ">" + field.fieldName + "</label></td>";
                                                        subformInputTd = subformInputTd + "<td><input type=\"text\" class=\"form-control\"></td>";
                                                        break;
                                                    case ("00007"):
                                                        //数字
                                                        subformLabelTd = subformLabelTd + "<td><label data-epm-entity-fieldcode=" + field.fieldCode + ">" + field.fieldName + "</label></td>";
                                                        subformInputTd = subformInputTd + "<td><input type=\"number\" class=\"form-control\"></td>";
                                                        break;
                                                    case ("00008"):
                                                        //日期时间
                                                        subformLabelTd = subformLabelTd + "<td><label data-epm-entity-fieldcode=" + field.fieldCode + ">" + field.fieldName + "</label></td>";
                                                        subformInputTd = subformInputTd + "<td><div class=\"input-append date form_datetime\">\
                                                                                                <input size=\"16\" type=\"text\" class=\"form-control\">\
                                                                                                <span class=\"add-on\"><i class=\"icon-th\"></i></span>\
                                                                                           </div></td>";
                                                        break;
                                                    case ("00005"):
                                                        //下拉框
                                                        subformLabelTd = subformLabelTd + "<td><label data-epm-entity-fieldcode=" + field.fieldCode + ">" + field.fieldName + "</label></td>";
                                                        subformInputTd = subformInputTd + "<td><select class=\"form-control\"></select></td>";
                                                        break;
                                                    case ("00006"):
                                                        //下拉复选框
                                                        subformLabelTd = subformLabelTd + "<td><label data-epm-entity-fieldcode=" + field.fieldCode + ">" + field.fieldName + "</label></td>";
                                                        subformInputTd = subformInputTd + "<td><select class=\"selectpicker\" multiple data-live-search=\"true\"><option>选项1</option><option>选项2</option></select></td>";
                                                        break;
                                                    default:
                                                        otherFieldNum++;
                                                }
                                            }
                                        });
                                        if (otherFieldNum > 0) {
                                            $.epm.snackbar("实体包含" + otherFieldNum + "个非子表单类型字段，其它字段生成成功",3000);
                                        }
                                        if (subformLabelTd != "" && subformInputTd != "") {
                                            //隐藏comp中添加字段DIV
                                            $comp.find("div.form-control").hide();
                                            //当有字段添加展示移除功能选项
                                            $comp.find("td.removeTd").show();
                                        } else {
                                            $.epm.snackbar("实体没有关联字段展示",2000);
                                            //显示comp中添加字段DIV
                                            $comp.find("div.form-control").show();
                                            //当无字段添加隐藏移除功能选项
                                            $comp.find("td.removeTd").hide();
                                        }
                                        //获取实体字段扩展到comp中，然后click对应更新prop
                                        $comp.find("table thead tr").append(subformLabelTd);
                                        $comp.find("table tbody tr td.removeTd").before(subformInputTd);
                                        //如果是选择实体添加的字段，不能点击修改prop对应属性,只能添加或删除
                                        //onload时取不到prop属性，故不能设为不能点击，待补充
                                        //                                      $prop.find(":text").off();
                                        $comp.click();
                                    }
                                    //加载下拉多选控件
                                    $comp.find(".selectpicker").selectpicker({
                                        noneSelectedText: "请选择..."
                                    });
                                    $comp.find(".form_datetime").datetimepicker();
                                }, "json");
                            }
                        }
                    }
                };
            },
			/*
			 *新加控件 11_12
			 */
			//实体引用控件
			"00011": function(field) {
				return {
					name: field.fieldCode,
					component: {
						title: field.fieldName,                    // 必要！ 控件名,实体字段名称
						html: '\
							<div class="form-group quote data-show="">\
								<span hidden style="color:#F00;font-weight:bold">*</span>\
								<input  type="text" class="form-control" " data-info="'+ $.parseJSON(field.fieldValues).entity +'" readonly/>\
								<input type="hidden"/>\
							</div>\
						',
						defaultName: field.fieldName,               // 必要！ 默认标题
						allocate: 'input[type="hidden"]',
						props: [
							{
								name: '选择引用实体',
								html: '\
									<div data-show=\"\" data-info=\"\">\
										<input type="text" class="form-control" readonly/>\
										<h5><strong>选择展示字段</strong></h5>\
										<div class=\"showField\">\
											<select class=\"form form-control\">\
												<option value=\"\">选项1</option>\
												<option value=\"\">选项1</option>\
											</select>\
										</div>\
									</div>\
								',
								set: function($comp, $prop) {
									$prop.find("input:text").click(function(){
									  	//设置每页显示数目
										var limit = -1;
									  	var nowPage = 0;
									  	var nowLoadedFlag = 1;
									  	var initFlag = 0;
									  	var entityJson = {
											EntityVersionID:"",
											ExtendFlag:"",
											IsDictionaryTable:"",
											limit:limit,
											offset:nowPage
										}// entityJson
										
										//加载实体字段名称
										$.post("entity!get.action",{"entityJson": JSON.stringify(entityJson)},function(data){
										//	console.log(data.data);
											var $table = $("<table class=\"table table-condensed entire-row\"><thead><tr><th hidden><input type=\"checkbox\"></th><th>实体名称</th><th>实体描述</th></tr></thead><tbody></tbody></table>");
											if(data.success && data.data.length > 0){
												//所有记录合计，数据总数
												var totalDataArray = data.data;
												var temp = 0;
												var filterNum = 0;
												//tbody一行数据
												var tbodyTr = "";
												//依次遍历结果
												for(var i=0;i<totalDataArray.length;i++){
													var entityVersionId = totalDataArray[i].entityVersionID;
													var entityName = totalDataArray[i].entityName;
													var entityDesc = totalDataArray[i].entityDesc;
													//逐行添加到$table中
													var info = $comp.find("input:text").attr("data-info") && $comp.find("input:text").attr("data-info") == entityVersionId;
													tbodyTr += "\
														<tr class=\"" + (info ? "info" : "") + "\">\
															<th hidden><input value=\"" + entityVersionId + "\" type=\"checkbox\"></th>\
															<td>" + (entityName == null ? "" : entityName) + "</td>\
															<td>" + (entityDesc == null ? "" : entityDesc) + "</td>\
														</tr>\
													";
													if(info){
														$comp.data("entityName",entityName);
														$prop.val(entityName);
													}
												} // for
												$table.append(tbodyTr);
												$.epm.selectableTable($table);
											}else{
												//实体没有包含任何字段，在页面添加标记
												var warnHtml = ""
												warnHtml+="\
													<div class=\"row\">\
														<div class=\"alert alert-warning\" role=\"alert\">\
														暂无可引用实体......\
														</div>\
													</div>\
												";
												$("#tools-demo-table").append(warnHtml);
												//隐藏加载更多选项
												$("#loadMore").hide();
											} // if else
									
											//加载模态框
									 		$.epm.modal({
												title: "选择引用实体",
												size: "lg",
												body: $table[0].outerHTML,
												autoDismiss: false,
												showCloseBotton: false,
												buttons: [
													{
														value: "关闭",
														dismiss: true
													},
													{
														value: "确认",
														style: "primary",
														click: function($modal) {
															debugger;
															$prop.find("div.showField > select").html("");
															$modal.find("tbody > tr.info").each(function(index, value) {
																$prop.find("input:text").val($(value).find("td").eq("0").html());
																$comp.find("input:text").attr("data-info",$(value).find("th input").val());
																$comp.data("entityName",$(value).find("td").eq("0").html());
																$.post("entity!getEntitiyFields.action",{"entityVersionID":$(value).find("th input").val()},function(data){
																	if(data.success) {
																		$(data.data).each(function(index,item){
																			var optionHtml = "\
																				<option value=\"" + item.fieldCode + "\">"+item.fieldName+"</option>\
																			";
																			
																			var $option = $(optionHtml);
																			if(index == 0)
																				$option.attr("selected",true);
																			$prop.find("div.showField > select").append($option);
																		});
																	} else {
																		$.epm.snackbar(data.msg);
																	}
																	$prop.find("div.showField > select").change();
																	$modal.modal("hide");
																})
	    													});
														}
													}
												],
												show: function($modal) {
													$modal.addClass("table-responsive");
													var $table = $modal.find("table");
													$.epm.selectableTable($table);
													
													$table.on("epm.table.select", function(event, element, checkedSum) {
														if(checkedSum >= 1) {
															$(this).find("tbody > tr.active").removeClass("active");
															$(this).find("tbody > tr.info").removeClass("info");
															element.addClass("info");
														}
													});
													
												},
												close: function($modal) {
													$comp.attr("data-show",$prop.find("input:radio").val());
													$prop.find("input:radio").change(function(){
														$comp.attr("data-show",$(this).val());
													});
												}
											}); // $.epm.modal
										},"json");// post
                                    });// $prop.click
								},// set
								get: function($comp, $prop) {
									$prop.find("input:text").val($comp.data("entityName"));
									debugger;
									if($comp.find("input:text").attr("data-info")) {
										$prop.find("div.showField > select").html("");
										$.post("entity!getEntitiyFields.action",{"entityVersionID":$comp.find("input:text").attr("data-info")},function(data){
											if(data.success) {
												$(data.data).each(function(index,item){
													var optionHtml = "\
														<option value=\"" + item.fieldCode + "\">"+item.fieldName+"</option>\
													";
													var $option = $(optionHtml);
													if($comp.attr("data-show")){
														$option.attr("selected",item.fieldCode == $comp.attr("data-show"));
													} else {
														$option.attr("selected",index == 0);
													}
													
													$prop.find("div.showField > select").append($option);
												});
											} else {
												$.epm.snackbar(data.msg);
											}
											$prop.find("div.showField > select").change(function(){
												$comp.attr("data-show",$(this).val());
											});
										});
										$.post("entity!getQuoteEntity",{"entityVersionID":$comp.find("input:text").attr("data-info")},function(data){
											if(data.success){
												$prop.find("input:text").val(data.data.entityName);
											}
										});
									}
								} // get
							},
							{
								name: '校验',
								html: '\
								<div class="form-group">\
									<input type="checkbox" value="required"\>必填</input>\
								</div>\
								',
								set: function($comp, $prop) {
									$prop.click(function() {
										$prop.find(":checkbox").each(function(index, item) {
											$comp.find("input").prop($(item).val(),$(item).prop("checked"));
											if(index == 0)
												$comp.find("span").attr("hidden",!$(item).prop("checked"));
										});
									});
								},
								get: function($comp, $prop) {
									$prop.find(":checkbox").each(function(index, item) {
										$(item).prop("checked",$comp.find("input").prop($(item).val()));
											if(index == 0)
												$comp.find("span").prop("hidden",!$(item).prop("checked"));
										});
								}
							}
						],
						onload: function($comp) {
							$comp.find("input:first").off("click");
							var i = 0;
							$comp.find("input:text").click(function(){
								i++;
								if($comp.find("input:text").attr("data-info") == "" || !$comp.find("input:text").attr("data-info")){
									$.epm.snackbar("未引用实体");
									return;
								}
								//获取从实体页面传的实体版本ID
								var entityVersionID = $comp.find("input:text").attr("data-info");
								//设置每页显示数目
								var limit = -1;
								var nowPage = 0;
								var nowLoadedFlag = 1;
								var initFlag = 0;
								entityJson = {
									EntityVersionID: entityVersionID,
									"QueryOptions":[
										{
											fieldName:"",
											fieldValue:""
										},
										{
											fieldName:"",
											fieldValue:""
										}
									],
									"FieldList":[
										{
											"fieldCode":""
										}
									],
									limit:limit,
									offset:nowPage
								}// entityJson

								//加载实体字段名称
								$.post("entity!entityData.action",{"entityJson": JSON.stringify(entityJson)},function(data){
								//	console.log(data.data);
									var $table = $("<table class=\"table table-condensed entire-row\"><thead><tr></tr></thead><tbody></tbody></table>");
									var $theadTr = $table.find("thead tr");
									if(data.success && data.data.length > 0){
										//所有记录合计，数据总数
										var totalDataArray = data.data;
										var temp = 0;
										var filterNum = 0;
										//拼接形成查询字段，暂时支持文本型
										var $filterOption = $("#tools-select-table").find("tr");
										$theadTr.append("<th hidden><input type=\"checkbox\"></th>");
										//依次遍历结果，形成实体字段
										for(var i=0;i<totalDataArray.length;i++){
											//单条记录，包括所有字段的array
											var singleDataArray = totalDataArray[i];

											//map记录key对应一条数据的instanceID,value对应一条记录的Array
											for(var key in singleDataArray){
												var tbodyTr = $("<tr><th hidden><input value=\"" + key + "\" type=\"checkbox\"></th></tr>");
												var tbodyTd = "";
												for(var j=0;j<singleDataArray[key].length;j++){
													//单个字段的json
													var singleDataJson = singleDataArray[key][j];
													if(singleDataJson.fieldValue){
														if(i == 0){
															//字段名
															var fieldName = singleDataJson.fieldName;
															if(!singleDataJson.associateFieldValueList){
																$theadTr.append("<th style=\"vertical-align: middle;\">" + fieldName + "</th>");
															} // if
														} // if
														var fieldValue = singleDataJson.fieldValue;
														var fieldCode = singleDataJson.fieldCode;
														tbodyTd +="\
															<td data-code=\"" + (fieldCode == null ? "" : fieldCode) + "\">" + (fieldValue == null ? "" : fieldValue) + "</td>\
														";
													}
												} // for
												tbodyTr.append(tbodyTd);
												$table.append(tbodyTr);
											} // for
										} // for
										$.epm.selectableTable($table);
									}else{
										//实体没有包含任何字段，在页面添加标记
										var warnHtml = "\
											<div class=\"row\">\
												<div class=\"alert alert-warning\" role=\"alert\">\
													实体没有任何关联字段展示......\
												</div>\
											</div>\
										";
										$table.append(warnHtml);
									} // if else

									//加载模态框
									$.epm.modal({
										title: "选择引用数据",
										size: "lg",
										body: $table[0].outerHTML,
										autoDismiss: false,
										showCloseBotton: false,
										buttons: [
											{
												value: "关闭",
												dismiss: true
											},
											{
												value: "确认",
												style: "primary",
												click: function($modal) {
													$modal.find("tbody > tr.info").each(function(index, value) {
														if($comp.attr("data-show") != "") {
															console.log($comp.attr("data-show"))
															debugger;
															$(value).find("td").each(function(index,item){
																if($(item).data("code") == $comp.attr("data-show")){
																	$comp.find("input:first").val($(item).html());
																}
															});
														} else {
															$comp.find("input:first").val($(value).find("td").eq(0).html());
														}
														
														$comp.find("input[type=hidden]").val($(value).find("th > input").val());
													});
													$modal.modal("hide");
												}
											}
										],
										show: function($modal) {
											$modal.addClass("table-responsive");
											var $table = $modal.find("table");
											$.epm.selectableTable($table);

											$table.on("epm.table.select", function(event, element, checkedSum) {
												if(checkedSum >= 1) {
													$(this).find("tbody > tr.info").removeClass("info");
													$(this).find("tbody > tr.active").removeClass("active");
													element.addClass("info");
												}
											});
										},
										close: function($modal) {
										}
									}); // $.epm.modal
								},"json");// post
							}) // $comp.find("input:input").click()
						},// onload
						ondrop: function($comp) {
							$.post("entity!getEntitiyFields.action",{"entityVersionID":$comp.find("input:text").attr("data-info")},function(data){
								if(data.success) {
									$comp.attr("data-show",data.data[0].fieldCode);
								}
							});
						}// ondrop
					} // component
				} // return
			}, // function
							
			//流程标签
			"00013": function(field) {                      
				 return {
					 name: field.fieldCode,                  
					 component: {
						 title: field.fieldName,
						 html: '\
							<div class=\"step_tab container\" >\
								<input  type=\"hidden\">\
								<div class=\"row\">\
									<div class=\"col-md-3 tip\" data-dataurl=\"\">\
										<div class=\"panel panel-primary\">\
											<div class=\"panel-heading\">\
												<h3 class=\"panel-title\"><a data-url=\"#\" href=\"#\">NEW TIP</a></h3>\
											</div>\
											<div class=\"panel-body\">\
												未配置\
											</div>\
										</div>\
									</div>\
									<div class=\"col-md-3 tip\" data-dataurl=\"\">\
										<div class=\"panel panel-primary\">\
											<div class=\"panel-heading\">\
												<h3 class=\"panel-title\"><a data-url=\"#\" href=\"#\">NEW TIP</a></h3>\
											</div>\
											<div class=\"panel-body\">\
												未配置\
											</div>\
										</div>\
									</div>\
									<div class=\"col-md-3 tip\" data-dataurl=\"\">\
										<div class=\"panel panel-primary\">\
											<div class=\"panel-heading\">\
												<h3 class=\"panel-title\"><a data-url=\"#\" href=\"#\">NEW TIP</a></h3>\
											</div>\
											<div class=\"panel-body\">\
												未配置\
											</div>\
										</div>\
									</div>\
								</div>\
							</div>\
						 ',
						 defaultName: field.fieldName, 
						 allocate: 'input[type="hidden"]',
						 props: [					
							{
								name: '配置标签',			
								html: '\
									<div>\
										<label class="control-label">选择TIP</label>\
										<select class=\"form form-control\"></select>\
										<label class="control-label">TIP名称</label>\
										<input type=\"text\" class=\"form form-control tipname\">\
										<label class="control-label">TIPURL</label>\
										<input type=\"text\" class=\"form form-control tipurl\">\
										<label class="control-label">DATAURL</label>\
										<input type=\"text\" class=\"form form-control dataurl\">\
										<a class=\"btn btn-default btn-block add\" style=\"margin-top:5px\">添加TIP</a>\
										<a class=\"btn btn-danger btn-block del\">删除TIP</a>\
									</div>\
								',				
								set: function($comp, $prop) {
									init();
									$prop.find("a.add").click(function(){
										var tabHtml = "\
											<div class=\"col-md-3 tip\" data-dataurl=\"\">\
												<div class=\"panel panel-primary\">\
													<div class=\"panel-heading\">\
														<h3 class=\"panel-title\"><a data-url=\"#\" href=\"#\">NEW TIP</a></h3>\
													</div>\
													<div class=\"panel-body\">\
														未配置\
													</div>\
												</div>\
											</div>\
										";
										var $tab = $(tabHtml);
										$tab.appendTo($comp.find("div.row"));
										init();
									})
									$prop.find("a.del").click(function(){
										$comp.find("div.tip").each(function(index,item){
											var $optionselected = $prop.find("select").find("option:selected");
											$comp.find("div.tip").eq($optionselected.index()).fadeOut(function(){
												$(this).remove();
												init();
											})
										})
									})
								},
								get: function($comp, $prop) {
									init = function () {									
										var $select = $prop.find("select");
										$select.html("");
										$comp.find("div.tip").each(function(index,item){
											var optionHtml = "\
												<option>"+($(item).find("h3 a").html())+"</option>\
											";
											var $option = $(optionHtml);
											$option.appendTo($select);
										});
										$select.unbind("change");
										$select.change(function(){
											var $selectoption = $(this).find("option:selected");
											$comp.find("div.tip").css("background-color","");
											var $tipselected = $comp.find("div.tip").eq($selectoption.index());
											$tipselected.css("background-color","#9e9e9e");
											//设置已有值
											$prop.find("input.tipname").val($tipselected.find("h3 a").html());
											$prop.find("input.tipurl").val($tipselected.find("h3 a").data("url"));
											$prop.find("input.dataurl").val($tipselected.data("dataurl"));
											//绑定输入事件
											$prop.find("input.tipname").off();
											$prop.find("input.tipname").keyup(function(){
												$tipselected.find("h3 a").html($(this).val());
												$selectoption.text($(this).val());
											});
											$prop.find("input.tipurl").off();
											$prop.find("input.tipurl").keyup(function(){
												$tipselected.find("h3 a").data("url",$(this).val());
												$tipselected.find("h3 a").attr("data-url",$(this).val());
											});
											$prop.find("input.dataurl").off();
											$prop.find("input.dataurl").keyup(function(){
												$tipselected.data("dataurl",$(this).val());
												$tipselected.attr("data-dataurl",$(this).val());
											});
										}).change();
									}
									
								}
							}
						],
						onload: function($comp) {
//							var testdata;
//							window.addEventListener("message",function(event){
//								console.log(event.data);
//								testdata = event.data;
//								debugger;
//
//							})
							
							var formVersionId = $.epm.tools.request.getParam("version");
							function showdesc (tip,data) {
								var url = tip.data("dataurl");
								if(url != ""){
									var handler = function(data){
										console.log("a");
									}
									
									$.ajax({
										url:url,
										data:{"formversionid":formVersionId,"data":data},
										success:function(data){
											tip.find("div.panel-body").html(JSON.stringify(data.desc).substring(1,JSON.stringify(data.desc).length-1));
										},
										type:"POST",
										dataType:"JSON"
									});
//									$.post(url,{"formversionid":formVersionId,"data":data},function(data){
//										console.log(data.data.desc);
////										tip.find("div.panel-body").html(data.data.desc);
//										tip.find("div.panel-body").html(JSON.stringify(data.desc).substring(1,JSON.stringify(data.desc).length-1));
//									})
								} else {
									$.epm.snackbar("未配置数据地址");
								}								
							}
							$comp.find("div.tip").css("background-color","");
							var dbdata = {
								"data":[]
							};
							if($comp.find("input[type=\"hidden\"]").val() != "") {
								var dbdata = $comp.find("input[type=\"hidden\"]").val();
								dbdata = $.parseJSON(dbdata);
								$comp.find("div.tip").each(function(index,item){
									var $tip = $(item);
									showdesc($tip,JSON.stringify(dbdata[index]));
								})
							} else {
								dbdata.data = new Array($comp.find("div.tip").length);
							}
							$comp.find("div.tip h3 a").off();
							$comp.find("div.tip h3 a").click(function(){
								var name = $(this).html()
								var a = $(this);
								var url = $(this).data("url");
								console.log(url);
								var cross_message = {
									"version":formVersionId,
									"type":""
								};
								$.epm.modal({
									title: name,
									size: "lg",
									body: "<iframe id=\"aaa\" src=\""+url+"\"></iframe>",
									autoDismiss: false,
									showCloseBotton: false,
									buttons: [
										{
											value: "取消",
											dismiss: true
										},
										{
											value: "确定",
											style: "primary",
											click: function($modal) {
												$modal.find("iframe")[0].contentWindow.postMessage("save",url);
												$(window).one("message",function(event){
													if(event.originalEvent.data){
														dbjson = event.originalEvent.data;
														var $tip = a.parent().parent().parent().parent();
														//回显数据
														showdesc($tip,dbjson);
														console.log(dbjson);
														//给最终数据数组赋值，将的到的JSON转成字符串
														dbdata.data[$comp.find("div.tip").index($tip)] = dbjson;
														console.log(JSON.stringify(dbdata));
														//将最终值放入input隐藏域
														$comp.find("input[type=\"hidden\"]").val(JSON.stringify(JSON.stringify(dbdata)).substring(1,JSON.stringify(JSON.stringify(dbdata)).length-1));
														console.log($comp.find("input[type=\"hidden\"]").val());
														$modal.modal("hide");	
													}
												});
											}
										}
									],
									                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           show: function($modal) {
										$modal.find("iframe").load(function(){
											debugger;
											cross_message.type = "post";
											$modal.find("iframe")[0].contentWindow.postMessage(cross_message,url);
										}); 
										
										$(window).one("message",function(event){
											console.log(event.originalEvent.data);
										});
									},
									close: function($modal) {
										
									}
								});
//								$.ajax({
//									url: url,
//									type: "post",
//									data:{"formversionid":formVersionId},
//									success: function(data) {
//										$.epm.modal({
//											title: $comp.find("div.tip h3 a").html(),
//											size: "lg",
//											body: data,
//											autoDismiss: false,
//											showCloseBotton: false,
//											buttons: [
//												{
//													value: "取消",
//													dismiss: true
//												},
//												{
//													value: "确定",
//													style: "primary",
//													click: function($modal) {
//														//获得JSON
//														var dbjson = getDataJson();
//														if(dbjson){
//															var $tip = a.parent().parent().parent().parent();
//															//回显数据
//															showdesc($tip,dbjson);
//															console.log(dbjson);
//															//给最终数据数组赋值，将的到的JSON转成字符串
//															dbdata.data[$comp.find("div.tip").index($tip)] = dbjson;
//															console.log(JSON.stringify(dbdata));
//															//将最终值放入input隐藏域
//															$comp.find("input[type=\"hidden\"]").val(JSON.stringify(JSON.stringify(dbdata)).substring(1,JSON.stringify(JSON.stringify(dbdata)).length-1));
//															console.log($comp.find("input[type=\"hidden\"]").val());
//															$modal.modal("hide");	
//														} else{
//															
//														}
//													}
//												}
//											],
//											show: function($modal) {
//
//											},
//											close: function($modal) {
//											}
//										});
//									},
//									error: function(XMLHttpRequest, textStatus, errorThrown) {
//										console.log(XMLHttpRequest);
//										$.epm.snackbar("地址错误，请检查配置地址");
//									}
//								});
							});
						},
						 ondrop: function($comp) {
							
						}
						
					}
				}
        	} 

        } });
    });
})(jQuery);