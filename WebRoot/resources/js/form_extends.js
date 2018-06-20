(function($) {
	$.bdt.form_extends = {
		file : {
			
			/**
			 * 添加事件 这个模块用于上传文件
			 * 1、遍历整个dom的file类型
			 * 2、获取该类型的dom元素
			 * 3、赋予该元素change事件(当事件触发 上传文件  并设置值 返回)
			 */
			fileIdArr: null,
			eventbind : function() {
				/*$('input[type="file"]').change(
					function() {
						var $this = $(this);
						var uuid = "12"; //TODO 这个要调用一个方法
						//上传文件
						//1、对dom元素添加form  成功后删除form元素
						var $formHTML = $('<form id="' + uuid + '" action="com!fileUpload.action" enctype="multipart/form-data" method="post"></form>');
						var fieldName = $this.attr("name");
						$this.attr("name", "file");
						var prefileName = $this.val();
						$this.wrap($formHTML);
						$("#" + uuid + "").ajaxSubmit({
							data: {
								"prefileName": prefileName,
								"fieldName": fieldName
							},
							dataType: "json",
							success: function(data) {
								var saveFileName = data.saveFileName;
								$this.attr("value", saveFileName); //设置文件上传成功返回一个值
								$this.attr("name", fieldName);
								$this.clone().prependTo($this.parent().parent());
								$this.parent().parent().children('input[type="hidden"]').remove();
								//处理多次添加，拼接文件Id
								var fileIdArr = $.bdt.form_extends.file.fileIdArr;
								if(!fileIdArr){
									fileIdArr = data.file_id;
									$.bdt.form_extends.file.fileIdArr = fileIdArr;
								}else{
									fileIdArr = fileIdArr + "," + data.file_id;
									$.bdt.form_extends.file.fileIdArr = fileIdArr;
								}
								$('<input type="hidden" value="' + fileIdArr + '" name=' + fieldName + '>').prependTo($this.parent().parent());
								$this.parent().remove();
								$.bdt.form_extends.file.eventbind(); //重新绑定事件
							}
						});
				});*/
			},
			
			/**
			 * assignment 赋值 :)
			 * 这个模块用于加载上传文件的内容
			 * 用于修改实体时获取文件的内容
			 * @param fileValue 这个是文件的唯一标识
			 */
			assignment : function(code,value) {
				//1、获取dom元素
				var $dom = $('.uploadifive-button');
				//此处实现为点击隐藏，提交删除关联关系
				var prepareToDelList = [];
				
				//2、异步请求数据 添加数据到dom元素中
				$.ajax( {
					url : "com!getFileList",
					data : {
						"data_id" : value
					},
					dataType : "json",
					success : function(data) {
						if(data.data){
							var fileList = data.data;
							for(var i=0;i<fileList.length;i++){
								var file_id = fileList[i].file_id;
								var $html = $("<span><a target=\"_self\" href=" + "com!downloadFile.action?file_id=" + file_id + " data-file=" + file_id + ">" + fileList[i].pre_name + "</a><a class=\"glyphicon glyphicon-remove text-danger\" style=\"cursor: pointer;\" title=\"删除\"></a></span>");
								$dom.after($html);
								$dom.next().html($dom.next().html() + "&nbsp;&nbsp");
								$html.find("a:last").click(function(){
									prepareToDelList.push($(this).prev().data("file"));
									$(this).parent().fadeOut("fast");
									console.log(prepareToDelList);
								});
							}
							//提交保存删除关联关系
							$("#submit-btn").click(function(){
								if(prepareToDelList != null && prepareToDelList.length > 0){
									$.post("com!delRelByFileId",{"file_ids": prepareToDelList.join(),"data_id": value},function(data){
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
		
	};
	
	
	$(function() {
		//$.bdt.form_extends.file.eventbind();
	});
})(jQuery);