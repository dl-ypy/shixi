(function($) {
    $(function() {
        $.bdt.extend({
			generic: {
				title: "基本控件",
				components: {
					/* Components start */
					//单行文本
					com_edit: {
						title: '单行文本',
						html: '\
							<div class="form-group">\
								<span hidden style="color:#F00;font-weight:bold">*</span>\
								<input type="text" class="form-control"/>\
							</div>\
						',
						defaultName: '单行文本',
						allocate: 'input',
						props: [
							{
								name: '默认值',
								html: '<input type="text" class="form-control"/>',
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
						],
						onload: function($comp){
							$comp.on("sendmessage",function(){
								alert();
							})
						}
					},
					//数字
					com_num: {
						title: '数字',
						html: '\
							<div class="form-group">\
								<span hidden style="color:#F00;font-weight:bold">*</span>\
								<input type="text" class="form-control" style="ime-mode: disabled;"/>\
							</div>\
						',
						defaultName:'数字',
						allocate: 'input',
						props: [
							{
								name: '默认值(请输入数字0~9)',
								html: '<div class="from-group"><input type="text" class="form-control" style="ime-mode: disabled;"/></div>',
								set: function($comp, $prop) {
									var trueval = "";
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
											} else {
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
					},
					//下拉框
					com_select: {
						title: '下拉框',
						html: '\
							<div class="form-group" data-info="">\
								<select class="form-control">\
									<option value="1">选项1</option>\
									<option value="2">选项2</option>\
								</select>\
							</div>\
						',
						defaultName: '下拉框',
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
												<tr>\
													<td colspan="2">\
														<a class="btn btn-default btn-sm btn-block">关联控件设置</a>\
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
									var dataexist = $comp.attr("data-info"); //用来判断是否存在data数据
									$("a.automatic,a.manual").click(function() {    //显示/隐藏自动绑定
										$("div.manual").slideToggle();		
										$("div.automatic").slideToggle();
									});
									var $addBtn = $prop.find("table > tfoot > tr:eq(0) > td > a");		//获得手动绑定添加option按钮
									var $optionWrapper = $prop.find("table > tbody"); 					//获得手动绑定输入数据的tbody
									$addBtn.click(function() {
										//新建一行输入框，每行对应一条option
										var newOptionDataHtml = "\
											<tr>\
												<td>\
													<input type=\"text\" class=\"form-control key\"/>\
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
										//创建一条新option
										var $newOption = $("<option></option>");						
										//插入VALUE值（这里的KYE和VALUE与html中的value不同value为显示的具体值）	
										$newOptionData.find("td:eq(0) > input").keyup(function() {						
											$newOption.text($newOptionData.find("td:eq(0) > input").val());
										});
										//插入KEY值
										$newOptionData.find("td:eq(1) > input").keyup(function() {						
											$newOption.val($newOptionData.find("td:eq(1) > input").val());
										});
										//删除一行输入框，并删除对应的option
										$newOptionData.find("td > a").click(function() {					
											var indexNum = $newOptionData.index();
											$(this).parent().parent().remove();
											$comp.find("option:eq(" + indexNum + ")").remove();
										});

												$optionWrapper.append($newOptionData);					//将新建的输入框插入到手动绑定面板
												$comp.find("select").append($newOption);				//将新建的option插入到select中
										});
										var pos = -1;
										var $relationElements = $("<select class=\"selectpicker\" data-width=\"100%\" multiple data-live-search=\"true\"></select>");
										var $relationBtn = $prop.find("table > tfoot > tr:eq(2) > td > a");	
										var $relationPanelHtml = $("<div class=\"container\"><div class=\"row\"><div class=\"col-md-8  relationPanel\"></div><div class=\"col-md-4  relationRight\"></div></div></div>");
										var $contentLeft = $relationPanelHtml.find(".row:eq(0) > .col-md-8");
										var $contentRight = $relationPanelHtml.find(".row:eq(0) > .col-md-4");
										$contentRight.append("<div>所有关联控件</div>");
										
										

										
										$relationBtn.click(function() {
											debugger;
											$contentLeft.empty();
											$relationElements.empty();
											//初始化关联控件设置模态框面板组件
											$.bdt.doc.getComponents().each(function(index,value) {
												if($comp.parent().parent()[0]==value){
													pos = index;
													return true;
												}
												if(pos!=-1){
													var $newOption2 = $("<option ></option>");
													$newOption2.text($(value).data("epm-field-name"));
													$newOption2.val($(value).data("epm-field-name"));
													$relationElements.append($newOption2);
												}
											});
											
											$($comp.get(1)).find("option").each(function(index,value) {
												var $item = $("<div class=\"row\"></div>");
												$item.append("<div>"+value.text+"<span style=\"float:right\">关联以下控件</span><ul></ul></div>");
												$item.append($relationElements.clone());
												$contentLeft.append($item);
											});
											
											
											$.epm.modal({
												title: "选项关联控件",
												autoDismiss: true,
												showCloseBotton: true,
												body:$relationPanelHtml.get(0).outerHTML,
												buttons: [
															{
																value: "取消",
																style: "default",
																dismiss: true
															},
															{
																value: "开始创建",
																style: "primary",
																click: function($modal) {
																	$modal.find(".selectpicker").each(function(index,value){
																		$($comp.get(1)).find("option:eq("+index+")").attr("data-relationComp",$(value).val());
																	});
																	$modal.modal("hide");
																}

															}
														
													],
												show: function($modal) {
													//初始化下拉复选框组件
													$modal.find(".selectpicker").selectpicker({
														noneSelectedText:"请选择...."
													});
													//初始化下拉复选框选中状态
													$contentLeft.find(".selectpicker").each(function(index,value) {
														var preState = $comp.find("option:eq("+index+")").attr("data-relationComp");
														if(preState){
															$modal.find(".selectpicker:eq("+index+")").selectpicker("val",preState.split(","));
														}
														
													});
													
													var preSelectedMap = new Map();
													var str ;
													$modal.find(".selectpicker").each(function(index,value){
														str = $(value).prev().text();
														str = str.substring(0, str.length-6);  
														preSelectedMap.put(str,$(value).selectpicker("val"));
													});
													var $ulContainer = $modal.find(".relationRight ul");
													var preSelectedArr = preSelectedMap.toArray();
													for(var i=0;i<preSelectedArr.length;i++){
														$ulContainer.append("<li data="+preSelectedArr[i].key+">"+preSelectedArr[i].value+"</li>");
													}
													$modal.find(".selectpicker").change(function(){
														str = $(this).prev().text();
														str = str.substring(0, str.length-6); 
														var selectedValuePre = preSelectedMap.get(str);
														console.log(selectedValuePre);
														if($.isArray(selectedValuePre)){//del
															preSelectedMap.removeByKey(str);
														}else{//add
															preSelectedMap.put(str,$(this).selectpicker("val"));
															console.log($(this).selectpicker("val"));
														}
														console.log(preSelectedMap.get(str));
														
													});
													
												}
											
												
											})
									});
									var fieldop = "<option></option>";
									//配置自动绑定码表
									$prop.find("select.codeTable").change(function() {
										var selectedKey = "";
										var selectedVal = "";
										var selectedOrd = "";							
										if(dataexist && dataexist != "null"){
											dataexist = $.parseJSON($comp.attr("data-info"));
											selectedKey = dataexist.key;     //获取实体中绑定的key字段FieldCode
											selectedVal = dataexist.value;   //获取实体中绑定的value字段FieldCode
											selectedOrd = dataexist.order;   //获取实体中绑定的ord字段FieldCode
										}
										//获得被选中的option(选中作为码表的实体)
										var op = $(this).find("option:selected");
										$prop.find("select.key").html("");
										$prop.find("select.value").html("");
										$prop.find("select.ord").html("");
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
												//选中第一条数据，当实体没有绑定码表实体时默认选中第一条
												if(index == 0){														
													$keyop.prop("selected",true);
													$valueop.prop("selected",true);
													$ordop.prop("selected",true);
												}
												//选中绑定的KEY,VALUE,ORD
												if(selectedKey == item.fieldCode)					
													$keyop.prop("selected",true);
												if(selectedVal == item.fieldCode)
													$valueop.prop("selected",true);
												if(selectedOrd == item.fieldCode){
													$ordop.prop("selected",true);
												}
												//将option插入
												$prop.find("select.key").append($keyop);				
												$prop.find("select.value").append($valueop);
												$prop.find("select.ord").append($ordop);
											});
										},"json");
									});
									var dictionaryTable = {								//绑定码表json
										entity:"",
										key:"",
										value:"",
										order:""
									};
									//清除已经拥有的配置信息(下拉框选项,配置数据data-info,配置存在标识)
									$prop.find("a.clean").click(function(){
										$comp.attr("data-info","");
										$comp.find("select").html("");
										dataexist = "";
									});
									//将绑定码表json插入到comp的data-info中
									$prop.find("a.save").click(function() {						
										dictionaryTable.entity = $prop.find("select.codeTable").find("option:selected").val();
										dictionaryTable.key = $prop.find("select.key").find("option:selected").val();
										dictionaryTable.value = $prop.find("select.value").find("option:selected").val();
										dictionaryTable.order = $prop.find("select.ord").find("option:selected").val();
										dataexist = JSON.stringify(dictionaryTable);
										$comp.attr("data-info",JSON.stringify(dictionaryTable));
									});
								},
								get: function($comp, $prop) {
									var selectedEntity = "";
									//用来判断是否存在data数据
									var dataexist = $comp.attr("data-info"); 
									//如果存在data数据显示自动绑定面板
									if(dataexist && dataexist != "null"){
										dataexist = $.parseJSON($comp.attr("data-info"));
										selectedEntity = dataexist.entity;
										$("div.manual").slideUp();
										$("div.automatic").slideDown();
									} else {
										$("div.manual").slideDown();
										//$("div.automatic").slideUp();
										$("div.automatic").hide();
										$comp.find("option").each(function(index,value) {						//根据comp中的select生成手动绑定面板
											var $optionVal = $(value);
											var $optionWrapper = $prop.find("table > tbody");
											var newOptionDataHtml = "\
												<tr>\
													<td>\
														<input type=\"text\" class=\"form-control value\"/>\
													</td>\
													<td>\
														<input type=\"text\" class=\"form-control key\"/>\
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
											var pThis = this;
											$newOptionData.find("td > input").change( function(index,value) {
												var isKey = $(this).hasClass("key");
												if(isKey){
													pThis.value = this.value;
												}else{
													pThis.innerText = this.value;
												}

											});
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
									//获得绑定的码表实体
									$.post("entity!get.action",{"entityJson":JSON.stringify(entityJson)},function(data,status){				
										$(data.data).each(function(index,item){
											$op = $(op);
											$op.val(item.entityVersionID);
											$op.text(item.entityName);
											$op.prop("selected",index == 0);
											if(selectedEntity == item.entityVersionID){
												$op.prop("selected",true);
											}
											$prop.find("select.codeTable").append($op);
										});
										$prop.find("select.codeTable").change();					//获得后出发change事件，选中被绑定的KYE和VALUE
									},"json");
								}
							}
						],
						onload: function($comp) {
							var dataexist = $comp.attr("data-info"); //用来判断是否存在data数据
							if(dataexist && dataexist != "null"){
								$comp.find("select").html("");
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
							var pos = -1;
							var compShow = false;
							var hasRelation = false;
							//此Map 是建立起组件下拉框选项和关联组件之间的关系  key 为下拉框的index值  value是关联组件的name的数组集合
							var compMap = new Map();
							var comps = $.bdt.doc.getComponents();
								var compareComp = $comp.parent().parent()[0];
								
								if(comps.length==0){
									comps =$comp.parent().parent().children();
									compareComp = $comp.parent().get(0);
								}
							comps.each(function(index,value) {
								if(compareComp==value){
									pos = index;
									return true;
								}
								if(pos!=-1){
									$comp.find("option").each(function(index1,value1){
										var relationComp = $(value1).attr("data-relationComp");
										var keyStr = $(value).data("epm-field-name")?$(value).data("epm-field-name"):$(value).find(".control-label").text();
										if(relationComp&&relationComp.toString().indexOf(keyStr)!=-1){
											hasRelation = true;
											var comTemp = compMap.get(index1);
											if(comTemp){
												comTemp.push(value);
											}else{
												compMap.put(index1,[value]);
											}
										}
									});
								}
								if(hasRelation){
									$(value).hide();
								}
								hasRelation = false;
							}); 
							$comp.find("select").change(function(){
								//发生change事件先让全部关联组件隐藏
								$(compMap.values()).each(function(index,value){
									$(this).hide();
								});
								//紧接着让当前项关联的显示出来
								$(compMap.get(this.selectedIndex)).each(function(index,value){
									$(this).show();
								});

							});

							//未发生初始状态的关联对象需要显示
							var currentSelectIndex = $comp.find("select").get(0).selectedIndex;
							if(currentSelectIndex!=-1){
								$(compMap.get(currentSelectIndex)).each(function(index,value){
									$(this).show();
								});
							}
								
						},
						onEditAgain: function($comp) {
							//在继续编辑的时候让所有表单组件显示
							$.bdt.doc.getComponents().each(function(index,value) {
								$(value).show();
							});
						}
					},
					// 文件
					com_file : {
						title : '文件',
						html : '\
							<div class="form-group">\
								<span hidden style="color:#F00;font-weight:bold">*</span>\
								<input type="text" hidden>\
								<input type="file" uploadify name="fileName" multiple="true"/>\
								<div id="fileQueue"></div>\
								<a class="btn btn-primary btn-sm confirm" style="display:none;">确定上传</a>\
								<a class="btn btn-default btn-sm cancel" style="display:none;">取消上传</a>\
							</div>\
						',
						defaultName : '文件',
						allocate : 'input:first',
						props : [
							{
								name : '校验',
								html : '\
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
								"uploadScript" : "com!fileUpload", // 这里是通过MVC里的FileUpload控制器里的Upload
																	// 方法
								"queueID" : "fileQueue",
								"multi" : true,
								"queueSizeLimit" : 5,
								"fileSizeLimit" : "200MB",
								"method" : "post",
								onFallback : function() {
									$.epm.snackbar("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
								},
								onUploadComplete : function(file, data,response) { // 单个文件上传完成触发
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
									$.epm.snackbar("所有文件上传成功!");
								}
							});
                        },
                        onload: function($comp) {
                        	//还原为初始状态
							$comp.find(".uploadifive-button").after($comp.find(":file:first"));
							$comp.find(".uploadifive-button").remove();
							$comp.find(":file").show();
							
							var status = $comp.find(":file:first").prop("disabled");
							var uuid = newId.newId(16);
							var $fileInput = $comp.find("input").first();
							//此处实现为点击隐藏，提交删除关联关系
							var prepareToDelList = [];
							
							//map对象，key为file的唯一标识id，value为file_id
							var map = new Map();
							$comp.find("[uploadify]").uploadifive({
								"fileObjName" : "fileName",
								"auto" : true,
								"buttonText" : "选择文件",
								"buttonClass" : "btn btn-primary",
								"height" : "25",
								"width" : "85",
								"removeCompleted" : false,
								"uploadScript" : "com!fileUpload?data_id=" + uuid, // 这里是通过MVC里的FileUpload控制器里的Upload
																	// 方法
								"queueID" : "fileQueue",
								"multi" : true,
								"queueSizeLimit" : 5,
								"fileSizeLimit" : "200MB",
								"method" : "post",
								onFallback : function() {
									$.epm.snackbar("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
								},
								onUploadComplete : function(file, data,response) { // 单个文件上传完成触发
									map.put(file.lastModified,$.parseJSON(data).file_id);
									$.epm.snackbar("文件上传成功!"); // data就是action中返回来的数据
								},
								onCancel : function(file) { // 取消时触发
									prepareToDelList.push(map.get(file.lastModified));
								},
								onSelect : function(file) { // 当有文件进入队列展示操作按钮
									//$comp.find("a.confirm").show();
									//$comp.find("a.cancel").show();
								},
								onQueueComplete : function(queueData) { // 所有文件上传完成
									$fileInput.val(uuid);
									$.epm.snackbar("所有文件上传成功!");
								}
							});
							//设为启用和禁用状态
							$comp.find(":file:last").attr("disabled",status);
				
							//提交保存删除关联关系
							$("#submit-btn").click(function(){
								if(prepareToDelList != null && prepareToDelList.length > 0){
									$.post("com!delRelByFileId",{"file_ids": prepareToDelList.join(),"data_id": uuid},function(data){
										if(data.data){
											//$.epm.snackbar("删除成功");
										}else{
											//$.epm.snackbar("删除失败");
										}
									},"json");	
								}
							});
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
                        }
					},
					//多行文本
					com_textarea: {
						title: '多行文本',
						html: '<div><span hidden style="color:#F00;font-weight:bold">*</span><textarea rows="3" value="" class="form-control"></textarea></div>',
						defaultName: '多行文本',
						allocate: "textarea",
						props: [
							{
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
							}, 
							{
							name: '校验',
								html: '\
									<div>\
										<input type="checkbox" value="readonly">&nbsp;<label>只读</label>&nbsp;&nbsp;\
										<input type="checkbox" value="required">&nbsp;<label>必填</label>\
									</div>\
								',
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
							}
						],
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
					},
				  	//日期时间
					com_date: {
						title: '日期时间',
						html: '\
							<div>\
								<span hidden style="color:#F00;font-weight:bold">*</span>\
								<div class="input-group date form_date ">\
	                            	<input class="form-control" size="16" type="text" value="" >\
	    							<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
	                    		</div>\
								<div class="input-group date form_datetime">\
	                            	<input class="form-control" size="16" type="text" value="" >\
	    							<span class="input-group-addon">\
										<span class="glyphicon glyphicon-th"></span>\
									</span>\
	                    		</div>\
							</div>\
						',
						defaultName: '日期时间',
						allocate: "input",
						props: [
							{
						  		name: '类型',
							  	html: '\
									<div class="form-group" data-info="">\
										<select class="form-control">\
											<option value="1">日期</option>\
											<option value="2">日期时间</option>\
										</select>\
									</div>\
								',
							  	set: function($comp, $prop) {
							  		$prop.find("select").change( function() {
								  		if(this.selectedIndex==0){
									  		$prop.eq(2).show();
										  	$prop.eq(6).hide();
									  	} else {
										  	$prop.eq(2).hide();
										  	$prop.eq(6).show();
									  	}
								  	});
							  	},
							  	get: function($comp, $prop) {	 
							  		if($comp.eq(1).find(".form_date").is(":visible")==true){
									  	$prop.find("select").get(0).selectedIndex = 0 ;  
								  	} else {
								  		$prop.find("select").get(0).selectedIndex = 1 ;
										  
								  	} 
							  	}
							},
							{
						  		name: '默认值',//<option value="2">日期范围</option>
							  	html: '\
									<div class="form-group" data-info=""><select class="form-control"><option value="1">自定义</option></select></div>\
										  <div   class="input-group date form_date "  >\
				                        	<span hidden style="color:#F00;font-weight:bold">*</span>\
				                            <input class="form-control" size="16" type="text" value="" >\
				    					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
				                    </div>\
										  <div   class="input-group date form_datetime "  >\
				                        	<span hidden style="color:#F00;font-weight:bold">*</span>\
				                            <input class="form-control" size="16" type="text" value="" >\
				    					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>\
				                    </div>	  \
									<div hidden="false"><button class="form-control" type="button">日期范围设置</button></div>  ',
									  set: function($comp, $prop) {
										  var opt_date = {
												    language:  "zh-CN",
											        format: "yyyy-mm-dd",
											        todayBtn:  1,
													autoclose: 1,
													todayHighlight: 1,
													startView: 2,
													minView: 2,
													forceParse: 0
													};
										  var opt_datetime = {
												    language:  "zh-CN",
											        format: "yyyy-mm-dd HH:ii:ss",
											        todayBtn:  1,
													autoclose: 1,
													todayHighlight: 1,
													startView: 2,
													forceParse: 0
													};
										  $prop.eq(2).datetimepicker(opt_date);
										  $prop.eq(4).datetimepicker(opt_datetime);
										  if($comp.eq(1).find(".form_date").is(":visible")==true){
											  $prop.eq(2).show();
											  $prop.eq(4).hide();
										  }else{
											  $prop.eq(4).show();
											  $prop.eq(2).hide();
										  }
										  
										 
										 
										  $prop.eq(6).click(function(){
											  var $bodyHtml = $("<div class=\"form-inline\"></div>");
											  $bodyHtml.append("<input class=\"form-control\" size=\"16\" type=\"text\" value=\"\" >");
											  $bodyHtml.append("<select class=\"form-control\"><option>&le;</option><option>&lt;</option></select>");
											  $bodyHtml.append("<label><日期<</label>");
											  $bodyHtml.append("<select class=\"form-control\" ><option>&le;</option><option>&lt;</option></select>");
											  $bodyHtml.append("<input class=\"form-control\" size=\"16\" type=\"text\" value=\"\" >");
											  $bodyHtml.wrap("<div></div>");
											  $.epm.modal({"title":"日期设置",body:$bodyHtml.prop("outerHTML")});
											  
										  });
										  $prop.find("select").change( function() {
											  if(this.selectedIndex==0){
												  $prop.eq(2).show();
												  $prop.eq(6).hide();
											  }else{
												  $prop.eq(2).hide();
												  $prop.eq(6).show();
											  }
//											  
										  });
										  $prop.parents(".property").siblings().eq(3).change( function() {
											  if($(this).find("select").get(0).selectedIndex==0){
												  $comp.eq(1).find(".form_date").show();
												  $comp.eq(1).find(".form_datetime").hide();
												  $prop.eq(2).show();
												  $prop.eq(4).hide();
												  $comp.find("input").val($prop.eq(2).find("input").val());
											  }else{
												  $comp.eq(1).find(".form_date").hide();
												  $comp.eq(1).find(".form_datetime").show();
												  $prop.eq(2).hide();
												  $prop.eq(4).show();
												  $comp.find("input").val($prop.eq(4).find("input").val());
											  }
											  
										  });
									  },
									  get: function($comp, $prop) {
										  $prop.eq(2).find("input").change(function() {
											  $comp.find("input").val($prop.eq(2).find("input").val());
											});
										  $prop.eq(4).find("input").change(function() {
											  $comp.find("input").val($prop.eq(4).find("input").val());
										  });
									  }
									},
							  {
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
								 $comp.eq(1).find(".form_datetime").hide();
							},
							onload: function($comp){
								$comp.find(".form_date").datetimepicker({
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
								$comp.find(".form_datetime").datetimepicker({
									language:  "zh-CN",
							        format: "yyyy-mm-dd HH:ii:ss",
							        todayBtn:  1,
									autoclose: 1,
									todayHighlight: 1,
									startView: 2,
									forceParse: 0
								});
							}
						  },
				 		com_radio: {
						title: '单选按钮组',
						html: '<div data-info="">' +
								'<span hidden style="color:#F00;font-weight:bold">*</span>' +
								'<label class="radio-inline"><input type="radio" value="option1"><span>选项1</span></label>' +
								'<label class="radio-inline"><input type="radio" value="option2"><span>选项2</span></label>' +
							'</div>',
						defaultName: '单选按钮组',
						allocate: ":radio",
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
					  },
					  com_checkbox: {
						title: '复选框组',
						html: '<div data-info="">' +
								'<span hidden style="color:#F00;font-weight:bold">*</span>' +
								'<label class="checkbox-inline"><input type="checkbox" value="option1"><span>选项1</span></label>' +
								'<label class="checkbox-inline"><input type="checkbox" value="option2"><span>选项2</span></label>' +
							'</div>',
						defaultName: '复选框组',
						allocate: ":checkbox",
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
					  },
						com_multi_select: {
							title: '下拉复选框',
							html: '<div data-info="">' +
									'<span hidden style="color:#F00;font-weight:bold">*</span>' +
									'<div>' +
										'<select class="selectpicker" multiple data-live-search="true">' +
											'<option value="option1">选项1</option>' +
											'<option value="option2">选项2</option>' +
											'</select>' +
									'</div>' +
								'</div>',
							defaultName: '下拉复选框',
							allocate: ".selectpicker",
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
								$comp.find(".selectpicker").selectpicker({
									noneSelectedText: "请选择..."
								});
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
						},
						com_subform: {
							title: '子表单',
							html: '<div class="center-block"><table class="table table-hover" style="text-align:center"><thead><tr></tr></thead><tbody><tr><td style=\"display:none;\" class=\"removeTd\"><a class=\"btn btn-sm\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除记录\"></span></a></td></tr></tbody></table><div class="form-control">请添加字段</div><a class=\"btn btn-sm add-row\"><span class="glyphicon glyphicon-plus text-info" data-toggle=\"tooltip\" data-placement=\"right\" title=\"新建记录\">新建记录</span></a></div>',
							defaultName: '子表单',
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
							props: [{
								name: '字段',
								html: '<div><div class="draggable-div"></div><a class="btn btn-sm add-item"><span class="glyphicon glyphicon-plus text-info">添加字段</span></a><div><select class="form-control" style="display:none"><option value="com_text">单行文本</option><option value="com_num">数字</option><option value="com_date">日期时间</option><option value="com_select">下拉框</option><option value="com_multi_select">下拉复选框</option></select></div></div><div><button type="button" class="form-control">设置默认值</button><button type="button" class="form-control">选择关联实体</button></div>',
								set: function($comp, $prop) {
									//文本框属性栏
									var com_text = {
											title: "单行文本",
											html: "<div class=\"form-group\"><span hidden style=\"color:#F00;font-weight:bold\">*</span><input  type=\"text\" class=\"form-control\"/></div>",
											defaultName: "单行文本",
											props: [
													{
															name: "默认值",
															html: "<input type=\"text\" class=\"form-control\"/>",
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
											html: "<div class=\"form-group\"><span hidden style=\"color:#F00;font-weight:bold\">*</span><input type=\"text\" class=\"form-control\" style=\"ime-mode: disabled;\"/></div>",
											defaultName:"数字",
											props: [
													{
															name: "默认值(请输入数字0~9)",
															html: "<div class=\"from-group\"><input type=\"text\" class=\"form-control\" style=\"ime-mode: disabled;\"/></div>",
															set: function($comp, $prop) {
																	var trueval = "";
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
									
									//日期属性栏
									var com_date = {
										title: "日期时间",
										html: "<div class=\"input-append date form_datetime\">\
																<span hidden style=\"color:#F00;font-weight:bold\">*</span>\
																<input size=\"16\" type=\"text\" class=\"form-control\" readonly>\
																<span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-th\"></span></span>\
													 </div>",
										defaultName: "日期时间",
										props: [{
											name: "默认值",
											html: "<div class=\"input-group date form_datetime\">\
																<span hidden style=\"color:#F00;font-weight:bold\">*</span>\
																<input size=\"16\" type=\"text\" class=\"form-control\">\
												                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-th\"></span>\
													 </div>",
											set: function($comp, $prop) {
												//加载datatimepicker控件
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
																											<label class=\"control-label\">VALUE</label>\
																									</td>\
																									<td>\
																											<label class=\"control-label\">KEY</label>\
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
																			<label class=\"control-label\">选择VALUE</label>\
																			<select class=\"form-control\"></select>\
																			<label class=\"control-label\">选择KEY</label>\
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
													if (dataexist && dataexist != "null") {
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

												if (dataexist && dataexist != "null") {
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
													var $selectpicker = $("<td><select class=\"selectpicker\" multiple data-live-search=\"true\"><option>选项1</option><option>选项2</option></select></td>");
													$compTbody.before($selectpicker);
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
										//子表单关联选择实体展示
									$prop.find("button").last().click(function() {
											entityJson = {
												EntityVersionID: "",
												ExtendFlag: "1",
												IsDictionaryTable: "0",
												limit: "-1",
												offset: "-1"
											}

											var $modal = $.epm.modal({
												title: "选择父实体",
												size: "",
												body: "<div><label></label><div><table class=\"table table-hover\"><thead><tr><th class=\"hidden\">实体编号</th><th>业务实体名称</th><th>实体描述</th><th></th></tr></thead><tbody></tbody></table></div></div>",
												autoDismiss: false,
												showCloseBotton: true,
												buttons: [{
													value: "清空实体关联",
													style: "info",
													click: function($modal) {
														$comp.find("table thead tr").empty();
														$comp.find("table tbody tr").empty();
														$comp.click();
														//显示comp中添加字段DIV
														$comp.find("div.form-control").show();
														$modal.modal("hide");
													}
												}, {
													value: "关闭",
													dismiss: true
												}],
												show: function($modal) {
													$.ajax({
														type: "post",
														url: "entity/get",
														data: {
															"entityJson": JSON.stringify(entityJson)
														},
														dataType: "json",
														async: true,
														success: function(data, status) {
															if (data.success) {
																var $tbody = $modal.find("tbody");
																$(data.data).each(function(index, item) {
																	var $entityTr = $("<tr><th id=\"parentId\" class=\"hidden\">" + item.entityVersionID + "</th><td>" + item.entityName + "</td><td>" + item.entityDesc + "</td><td><a class=\"btn btn-default\">选择</a></td></tr>");
																	$entityTr.find("a").click(function() {
																		//根据ID查询实体字段
																		$.post("entity!getfield.action", {
																			"entityVersionID": item.entityVersionID
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
																								//统计生成失败的字段记录
																								otherFieldNum++;
																						}
																					}
																				});
																				if (otherFieldNum > 0) {
																					$.epm.snackbar("实体包含" + otherFieldNum + "个非子表单类型字段，其它字段生成成功",3000);
																				}
																				//获取实体字段扩展到comp中，然后click对应更新prop
																				$comp.find("table thead tr").empty().append(subformLabelTd);

																				//每次选择关联实体后清除原table中的内容
																				var $removeTd = $("<td class=\"removeTd\"><a class=\"btn btn-sm\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除记录\"></span></a></td>");
																				$comp.find("table tbody").empty();
																				$comp.find("table tbody").append("<tr></tr>");
																				$comp.find("table tbody tr").append($removeTd);
																				$comp.find("table tbody tr td.removeTd").before(subformInputTd);

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
																				//如果是选择实体添加的字段，不能点击修改prop对应属性,只能添加或删除
																				$prop.find(":text").off();
																				$comp.click();
																			}
																			//异步请求的控件中包含下拉复选不会直接调用ondrop中的方法，在此定义加载selectpicker控件
																			$comp.find(".selectpicker").selectpicker({
																				noneSelectedText: "请选择..."
																			});
																			$comp.find(".form_datetime").datetimepicker();
																		}, "json");
																		$modal.modal("hide");
																	})
																	$tbody.append($entityTr);
																});
																$modal.find("table").append($tbody);

															}
														}
													});
												},
												close: function($modal) {

												}
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
												})
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
									var appendedTr = "<tr>" + $comp.find("table tbody tr:eq(0)").html() + "</tr>";
									$comp.find("table tbody").append(appendedTr);
									$(appendedTr).find(".selectpicker").selectpicker({
											noneSelectedText: "请选择..."
									});
									$(appendedTr).find(".form_datetime").datetimepicker();
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
								//加载selectpicker控件
								$comp.find(".selectpicker").selectpicker({
									noneSelectedText: "请选择..."
								});
								//加载datetimepicker控件
								$comp.find(".form_datetime").datetimepicker();
							}
						},

					/*
					 *新加通用组件 11_12
					 */
					//引用
					com_quote: {
						title: '实体引用',					
						html: '\
							<div data-show="" data-info="" class="form-group quote">\
								<span hidden style="color:#F00;font-weight:bold">*</span>\
								<input  type="text" class="form-control" readonly/>\
								<input type="hidden"/>\
							</div>\
						',					
						defaultName: '实体引用',
						allocate:'input[type="hidden"]',
						props: [
							{
                                name: '绑定实体',
                                html: '\
									<div>\
										<input type="text" class="form-control" readonly/>\
										<h5><strong>选择展示字段</strong></h5>\
										<div class=\"showField\">\
											<select class=\"form form-control\">\
												<option value=\"\">选项1</option>\
												<option value=\"\">选项1</option>\
											</select>\
										</div>\
										<h5><strong>数据联动配置</strong></h5>\
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
													var info = $comp.attr("data-info") && $comp.attr("data-info") == entityVersionId;
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
																$comp.attr("data-info",$(value).find("th input").val());
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
									if($comp.attr("data-info")) {
										$prop.find("div.showField > select").html("");
										$.post("entity!getEntitiyFields.action",{"entityVersionID":$comp.attr("data-info")},function(data){
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
										})	
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
							sendmessege = function() {
								console.log("send");
							};
							$comp.find("input:first").off("click");
							var i = 0;
							$comp.find("input:first").click(function(){
								i++;
								if($comp.attr("data-info") == "" || !$comp.attr("data-info")){
									$.epm.snackbar("未引用实体");
									return;
								}
								//获取从实体页面传的实体版本ID
								var entityVersionID = $comp.attr("data-info");
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
										var warnHtml = ""
										warnHtml+=""
													+"<div class=\"row\">"
														+"<div class=\"alert alert-warning\" role=\"alert\">"
														+"实体没有任何关联字段展示......"
														+"</div>"
													+"</div>";
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
													sendmessege();
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
							
						}// ondrop
					}, // com_quote
					com_panel: {
			            title: '向导',
			            html: '<div class="form-group">\
			            	<div class="list-inline text-left">\
			            	<button type="button" class="btn btn-theme active"  style=\"margin-left:5px;margin-top:5px;\">面板1</button></div>\
			            	<div class="table-list text-left" style="padding-top:5px;">\
			            	<div class="table-wrap">\
			            	<div class="panel panel-default">\
			            	 <div class="panel-body bdt-droppable">\
			            	</div></div></div></div>\
			            	<div class="list-inline text-right">\
			            	<button type="button" class="btn btn-default" disabled="disabled">Previous</button>\
			            	<button type="button" class="btn btn-default" disabled="disabled">Next</button>\
			            	</div></div></div>',
			            type:'complex',
			            defaultName: '向导',
						allocate: 'panel',
			            props: [
			              {
			                name: '向导',
			                html: '<div><div class="table-list text-left"></div>\
			                	<div class="list-inline text-left" style="padding-top:10px;">\
			                	<button type="button" class="btn btn-default">添加面板</button></div></div>',
			                set: function($ly, $prop) {
			                	var _that= {
			                		menuObj:{/**用于向导控件*/
				                		index:0,
				                		menuall:0,
				                		oldmenu:null,
				                		editmenu:null
			                		}
			                	};
			                	var $comContainer = $ly.closest(".com-container");
			                	
				                function clickBtn(btn){
				                	_that.menuObj.index = $(btn).index();
				              		var cls = $(btn).attr("class");
				              		if(cls.indexOf("active")!=-1){
				              			return ;
				              		}else{
				              			_that.menuObj.menuall = $comContainer.find(".list-inline:first > button").length;
				              			$(btn).parent().find("button").each(function(){
			          		    			$(this).removeClass("active");
			          		    		});
				              			$comContainer.find(".list-inline").each(function(mindex){
				              		    	if(mindex==1){
				              		    		$(this).children("button").each(function(m){
				              		    			if(m==0){
				              		    				if(_that.menuObj.index==0){
				              								$(this).removeClass("btn-theme").addClass("btn-default").attr("disabled","disabled");
				              							}else{
				              								$(this).removeClass("btn-default").addClass("btn-theme").removeAttr("disabled");
				              							}
				              		    			}else if(m==1){
				              		    				if(_that.menuObj.menuall-1==_that.menuObj.index){
				              		    					$(this).removeClass("btn-theme").addClass("btn-default").attr("disabled","disabled");
				              							}else{
				              								$(this).removeClass("btn-default").addClass("btn-theme").removeAttr("disabled");
				              							}
				              		    			}
				              					});
				              		    	}
				              		    });
				              			$(btn).addClass("active");
				              			if(cls.indexOf("btn-default")!=-1){
				              				$(btn).removeClass("btn-default");
				              				$(btn).addClass("btn-theme");
				              			}
				              		}
				              		$comContainer.find(".table-list > .table-wrap").each(function(i){
				              			if(i==_that.menuObj.index){
				              				$(this).show();
				              			}else{
				              				$(this).hide();
				              			}
				              		});
				              		_that.menuObj.oldmenu = btn;
				              		_that.menuObj.editmenu = btn;
				              	};
				              	function addPanel($menuline,panname){
				            		 var $panDiv = $("<div class=\"form-inline\">" +
				            							  		"<input type=\"text\" class=\"form-control\" value=" + panname + " style=\"width:70%\">" +
				            					  				"<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">" +
				            						  				"<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\">" +
				            						  				"</span>" +
				            					  				"</a>" +
				            					  				"<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">" +
				            						  				"<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\">" +
				            						  				"</span>" +
				            					  				"</a>" +
				            				  				"</div>");
				            		 
				            		 $panDiv.children(".form-control").blur(function() {
				            			 var indexNum = $panDiv.index();
				            			 $comContainer.find(".list-inline:first > button:nth-child("+(indexNum+1)+")").text($(this).val());
				            			 
				            		 }).click(function(){
				            			 var indexNum = $panDiv.index();
				            			 clickBtn($comContainer.find(".list-inline:first > button:nth-child("+(indexNum+1)+")"));
				            		 });
				            	 	$panDiv.children("a.remove-item").click(function() {
				            			var indexNum = $panDiv.index();
				            			var menunum = $prop.find(".table-list > .form-inline");
				            			if (menunum.length > 1) {
				            				$(this).parent().remove();
				            				$comContainer.find(".table-list > .table-wrap:nth-child("+(indexNum+1)+")").remove();
				            				$comContainer.find(".list-inline:first > button:nth-child("+(indexNum+1)+")").remove();
				            				_that.menuObj.menuall--;
				            				if(_that.menuObj.index==indexNum){
				            				 	var mbtn = $comContainer.find(".list-inline:first > button:first");
				            					clickBtn(mbtn);
				            				 }
				            			}else {
				            				$.epm.snackbar("至少保留一个面板",1000);
				            			}
				            		});
				            	 	
				            	 	var indexIndex = 0;
				            	 	//绑定拖拽事件
				            	 	$prop.find(".table-list").sortable({
										handle:".drag-item",
										opacity: .5,
										start: function(event, ui) {
											//拖动元素起始位置
											indexIndex = ui.item.index();
											indexIndex = parseInt(indexIndex);
										},
										stop: function(event, ui) {
											//拖动结束的位置
											var endIndex = ui.item.index();
											endIndex = parseInt(endIndex);

											var statrbtn = $comContainer.find(".table-list > .table-wrap:nth-child("+(indexIndex+1)+")");
				            				var endbtn = $comContainer.find(".table-list > .table-wrap:nth-child("+(endIndex+1)+")");
				            				var startpanel = $comContainer.find(".list-inline:first > button:nth-child("+(indexIndex+1)+")");
				            				var endpanel = $comContainer.find(".list-inline:first > button:nth-child("+(endIndex+1)+")");
				            				  
				            				  
				            				if(indexIndex==endIndex){
				            					 return ;
				            				}else if(indexIndex>endIndex){
				            					 endbtn.before(statrbtn);
				            					 endpanel.before(startpanel);
				            				}else{
				            					 endbtn.after(statrbtn);
				            					 endpanel.after(startpanel);
				            				} 
										}
									}).disableSelection();

				            		$prop.find(".table-list").append($panDiv);
				            	};
				            	function addPanelMenu(panname){
				            		var btn = $("<button type=\"button\" class=\"btn btn-default\" style=\"margin-left:5px;margin-top:5px;\">"+panname+"</button>");
				            		btn.on("click",function(){
				                		clickBtn(this);
				                	});
				            		$comContainer.find(".list-inline:nth-child(1)").append(btn);
				            		var tb = "<div class=\"table-wrap\" style=\"display:none;\">";
				            		tb +="<div class=\"panel panel-default\">";
				            		tb +="<div class=\"panel-body bdt-droppable\">";
				            		tb +="</div></div></div>";
				            		var cont = $(tb);
				            		$comContainer.find(".table-list").append(cont);
				            		_that.menuObj.editmenu = btn;
				            		_that.menuObj.menuall++;
				            		$.bdt.bindDroppableAreaEvents($comContainer.find(".table-list:last").find($.bdt.doc.droppableAreaSelector));
				            	};
				            	$prop.find("button").on("click",function(){
									debugger;
			        				var $menuline = $prop.find(".table-list > .form-inline");
			        				var panname = "面板"+($menuline.length + 1);
			        				addPanel($menuline,panname);
			        				addPanelMenu(panname);
			        			});
			    				
			    				$comContainer.find(".list-inline:nth-child(1) > button").each(function(i){
			    					addPanel(i+1,$(this).text());
			    					_that.menuObj.menuall++;
			    				});
			    				
			                },
			                get:function($ly, $prop){
			                  var $comContainer = $ly.closest(".com-container");
			                }
			              }
			            ],
			            ondrop: function($comp) {
			            	var _that= {
			            		menuObj:{/**用于向导控件*/
			                		index:0,
			                		menuall:0,
			                		oldmenu:null,
			                		editmenu:null
			            		}
			                };
							function clickBtn(btn){
			                	_that.menuObj.index = $(btn).index();
			              		var cls = $(btn).attr("class");
			              		if(cls.indexOf("active")!=-1){
			              			return ;
			              		}else{
			              			_that.menuObj.menuall = $comp.find(".list-inline:first > button").length;
			              			
			              			$(btn).parent().find("button").each(function(){
			      		    			$(this).removeClass("active");
			      		    		});
			              			$comp.find(".list-inline:last > button").each(function(m){
			              				if(m==0){
			      		    				if(_that.menuObj.index==0){
			      								$(this).removeClass("btn-theme").addClass("btn-default").attr("disabled","disabled");
			      							}else{
			      								$(this).removeClass("btn-default").addClass("btn-theme").removeAttr("disabled");
			      							}
			      		    			}else if(m==1){
			      		    				if(_that.menuObj.menuall-1==_that.menuObj.index){
			      		    					$(this).removeClass("btn-theme").addClass("btn-default").attr("disabled","disabled");
			      							}else{
			      								$(this).removeClass("btn-default").addClass("btn-theme").removeAttr("disabled");
			      							}
			      		    			}
			              		    });
			              			$(btn).addClass("active");
			              			if(cls.indexOf("btn-default")!=-1){
			              				$(btn).removeClass("btn-default").addClass("btn-theme");
			              			}
			              		}
			              		$comp.find(".table-list > .table-wrap").each(function(i){
			              			if(i==_that.menuObj.index){
			              				$(this).show();
			              			}else{
			              				$(this).hide();
			              			}
			              		});
			              		_that.menuObj.oldmenu = btn;
			              		_that.menuObj.editmenu = btn;
			              	};
			              	$comp.find(".list-inline:first > button").each(function(index){
			              		$(this).on("click",function(){
			                		clickBtn(this);
			                	});
			              		_that.menuObj.menuall = index+1;
			              	});
			              	$comp.find(".list-inline:last > button").each(function(index){
			              		if(index==0){
			              			$(this).on("click",function(){
				              			var page = 0
				              			$(this).parent().parent().find(".list-inline:first > button").each(function(nn){
				              				var cls = $(this).attr("class");
						              		if(cls.indexOf(" active")!=-1){
				              					page = nn;
						              			return ;
						              		}
				              			});
				              			var mbtn = $comp.find(".list-inline:first > button:nth-child("+page+")");
			    						clickBtn(mbtn);
				    				});
		    						
		    					}else if(index==1){
		    						$(this).on("click",function(){
				              			var page = 0
				              			$(this).parent().parent().find(".list-inline:first > button").each(function(nn){
				              				var cls = $(this).attr("class");
						              		if(cls.indexOf(" active")!=-1){
				              					page = nn+2;
						              			return ;
						              		}
				              			});
				              			var mbtn = $comp.find(".list-inline:first > button:nth-child("+page+")");
			    						clickBtn(mbtn);
				    				});
		    					}
			              		
			              		
			            	});
		                },
						onload:function($comp) {
							var _that= {
			            		menuObj:{/**用于向导控件*/
			                		index:0,
			                		menuall:0,
			                		oldmenu:null,
			                		editmenu:null
			            		}
			                };
							function clickBtn(btn){
			                	_that.menuObj.index = $(btn).index();
			              		var cls = $(btn).attr("class");
			              		if(cls.indexOf("active")!=-1){
			              			return ;
			              		}else{
			              			$(btn).parent().find("button").each(function(){
			      		    			$(this).removeClass("active");
			      		    		});
			              			$comp.find(".list-inline:last > button").each(function(m){
			              				if(m==0){
			      		    				if(_that.menuObj.index==0){
			      								$(this).removeClass("btn-theme").addClass("btn-default").attr("disabled","disabled");
			      							}else{
			      								$(this).removeClass("btn-default").addClass("btn-theme").removeAttr("disabled");
			      							}
			      		    			}else if(m==1){
			      		    				if(_that.menuObj.menuall-1==_that.menuObj.index){
			      		    					$(this).removeClass("btn-theme").addClass("btn-default").attr("disabled","disabled");
			      							}else{
			      								$(this).removeClass("btn-default").addClass("btn-theme").removeAttr("disabled");
			      							}
			      		    			}
			              		    });
			              			$(btn).addClass("active");
			              			if(cls.indexOf("btn-default")!=-1){
			              				$(btn).removeClass("btn-default").addClass("btn-theme");
			              			}
			              		}
			              		$comp.find(".table-list > .table-wrap").each(function(i){
			              			if(i==_that.menuObj.index){
			              				$(this).show();
			              			}else{
			              				$(this).hide();
			              			}
			              		});
			              		_that.menuObj.oldmenu = btn;
			              		_that.menuObj.editmenu = btn;
			              	};
			              	$comp.find(".list-inline:first > button").each(function(index){
			              		$(this).on("click",function(){
			                		clickBtn(this);
			                	});
			              		_that.menuObj.menuall = index+1;
			              	});
			              	$comp.find(".list-inline:last > button").each(function(index){
			              		$(this).on("click",function(){
			    					if(index==0){
			    						var page = _that.menuObj.index;
			    						var mbtn = $comp.find(".list-inline:first > button:nth-child("+page+")");
			    						clickBtn(mbtn);
			    					}else if(index==1){
			    						var page = _that.menuObj.index+2;
			    						var mbtn = $comp.find(".list-inline:first > button:nth-child("+page+")");
			    						clickBtn(mbtn);
			    					}
			    				});
			            	});
			            	
						}
			},

					//下拉框联动控件
					com_selectAction: {
						title: '联动下拉框',
			            html: '\
							<div class="form-group">\
			            		<select class="form form-control linkage">\
									<option>选项1</option>\
									<option>选项2</option>\
								</select>\
			            		<div class="table-list text-left" style="padding-top:5px;">\
			            			<div class="table-wrap">\
			            				<div class="panel panel-default">\
			            	 				<div class="panel-body bdt-droppable">\
			            					</div>\
										</div>\
									</div>\
									<div class="table-wrap">\
			            				<div class="panel panel-default">\
			            	 				<div class="panel-body bdt-droppable">\
			            					</div>\
										</div>\
									</div>\
								</div>\
							</div>\
						',
			            type:'complex',
			            defaultName: '联动下拉框',
						allocate: 'panel',
			            props: [
							{
								name: '联动下拉框',
			                	html: '\
									<div>\
										<div class="table-list text-left">\
										</div>\
			                			<div class="list-inline text-left" style="padding-top:10px;">\
			                				<button type="button" class="btn btn-default">添加面板</button>\
									   	</div>\
									</div>\
								',
			                	set: function($ly, $prop){
									var _that= {
										menuObj:{/**用于向导控件*/
											index:0,
											menuall:0,
											oldmenu:null,
											editmenu:null
										}
									};
									var $comContainer = $ly.closest(".com-container");
										
									function changeOption(opt){
										_that.menuObj.index = $(opt).index();
										 $comContainer.find(".table-list > .table-wrap").each(function(i){
											if(i==_that.menuObj.index){
												$(this).show();
											}else{
												$(this).hide();
											}
										});
										_that.menuObj.oldmenu = opt;
										_that.menuObj.editmenu = opt;
									};
									function addPanel($menuline,panname){
										var panelHtml = "\
											<div class=\"form-inline\">\
												<input type=\"text\" class=\"form-control\" value=" + panname + " style=\"width:70%\">\
												<a class=\"btn btn-sm remove-item\" style=\"padding:0 5px;\">\
													<span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span>\
				            					</a>\
												<a class=\"btn btn-sm drag-item\" style=\"padding:0 5px;\">\
													<span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动选项\"></span>\
												</a>\
											</div>\
										";
										var $panDiv = $(panelHtml);
										$panDiv.children(".form-control").blur(function() {
											var indexNum = $panDiv.index();
											$comContainer.find("select.linkage > option:nth-child("+(indexNum+1)+")").text($(this).val());
										}).click(function(){
											var indexNum = $panDiv.index();
											var $mopt = $comContainer.find("select.linkage > option:nth-child("+(indexNum+1)+")").attr("selected",true)
											changeOption($mopt);
										});
										$panDiv.children("a.remove-item").click(function() {
											var indexNum = $panDiv.index();
											var menunum = $prop.find(".table-list > .form-inline");
											if (menunum.length > 1) {
												$(this).parent().remove();
												$comContainer.find(".table-list > .table-wrap:nth-child("+(indexNum+1)+")").remove();
												$comContainer.find("select.linkage > option:nth-child("+(indexNum+1)+")").remove();
												_that.menuObj.menuall--;
												if(_that.menuObj.index==indexNum){
													var mopt = $comContainer.find("select.linkage > option:nth-child"+(indexNum+1)+"").attr("selected", true);
													changeOption(mopt);
												 }
											} else {
												$.epm.snackbar("至少保留一个面板",1000);
											}
										});
										var indexIndex = 0;
										//绑定拖拽事件
										$prop.find(".table-list").sortable({
											handle:".drag-item",
											opacity: .5,
											start: function(event, ui) {
												//拖动元素起始位置
												indexIndex = ui.item.index();
												indexIndex = parseInt(indexIndex);
											},
											stop: function(event, ui) {
												//拖动结束的位置
												var endIndex = ui.item.index();
												endIndex = parseInt(endIndex);

												var statrbtn = $comContainer.find(".table-list > .table-wrap:nth-child("+(indexIndex+1)+")");
												var endbtn = $comContainer.find(".table-list > .table-wrap:nth-child("+(endIndex+1)+")");
												var startpanel = $comContainer.find(".list-inline:first > button:nth-child("+(indexIndex+1)+")");
												var endpanel = $comContainer.find(".list-inline:first > button:nth-child("+(endIndex+1)+")");

												if(indexIndex==endIndex){
													 return ;
												}else if(indexIndex>endIndex){
													 endbtn.before(statrbtn);
													 endpanel.before(startpanel);
												}else{
													 endbtn.after(statrbtn);
													 endpanel.after(startpanel);
												} 
											}
										}).disableSelection();

										$prop.find(".table-list").append($panDiv);
									};
									function addPanelMenu(panname){
										
										var tb = "\
											<div class=\"table-wrap\" style=\"display:none;\">\
												<div class=\"panel panel-default\">\
													<div class=\"panel-body bdt-droppable\">\
													</div>\
												</div>\
											</div>\
										";
										var cont = $(tb);
										$comContainer.find(".table-list").append(cont);
										var $opt = $("<option>"+panname+"</option>");
										$opt.attr("selected",true);
										$comContainer.find("select.linkage").append($opt);
										changeOption($opt);
										_that.menuObj.editmenu = $opt;
										_that.menuObj.menuall++;
										$.bdt.bindDroppableAreaEvents($comContainer.find(".table-list:last").find($.bdt.doc.droppableAreaSelector));
									}
									$prop.find("button").on("click",function(){
										var $menuline = $prop.find(".table-list > .form-inline");
										var panname = "选项"+($menuline.length + 1);
										addPanel($menuline,panname);
										addPanelMenu(panname);
									});
									
									$comContainer.find("select.linkage > option").each(function(i){
										addPanel(i+1,$(this).text());
										_that.menuObj.menuall++;
									});
								},
								get: function($ly, $prop){
									var $comContainer = $ly.closest(".com-container");
								}
							}
						],
						ondrop: function($comp){
							var _that= {
			            		menuObj:{/**用于向导控件*/
			                		index:0,
			                		menuall:0,
			                		oldmenu:null,
			                		editmenu:null
			            		}
			                };
							function changeOption(opt){
			                	_that.menuObj.index = $(opt).index();
			              		$comp.find(".table-list > .table-wrap").each(function(i){
			              			if(i==_that.menuObj.index){
			              				$(this).show();
			              			}else{
			              				$(this).hide();
			              			}
			              		});
			              		_that.menuObj.oldmenu = opt;
			              		_that.menuObj.editmenu = opt;
			              	};
							$comp.find("select.linkage > option").each(function(index){
			              		_that.menuObj.menuall = index+1;
			              	});
							$comp.find("select.linkage").on("change",function(){
								changeOption($(this).find("option:selected"));
							}).change();
						},
						onload: function($comp){
							var _that= {
			            		menuObj:{/**用于向导控件*/
			                		index:0,
			                		menuall:0,
			                		oldmenu:null,
			                		editmenu:null
			            		}
			                };
							function changeOption(opt){
			                	_that.menuObj.index = $(opt).index();
			              		$comp.find(".table-list > .table-wrap").each(function(i){
			              			if(i==_that.menuObj.index){
			              				$(this).show();
			              			}else{
			              				$(this).hide();
			              			}
			              		});
			              		_that.menuObj.oldmenu = opt;
			              		_that.menuObj.editmenu = opt;
			              	};
							$comp.find("select.linkage > option").each(function(index){
			              		_that.menuObj.menuall = index+1;
			              	});
							$comp.find("select.linkage").on("change",function(){
								changeOption($(this).find("option:selected"));
							}).change();
						},
						onsubmit: function($comp){
							var optionIndex = $comp.find("select.linkage > option:selected").index();
							$comp.find("select.linkage > option").each(function(index,item){
								if(index != optionIndex){
									$(item).find(":input").val("");
									$(item).find(":input").attr("name","");
								}
							});
						}
					}

          /* Components end */
        }
        
			}
		});
    });
})(jQuery);