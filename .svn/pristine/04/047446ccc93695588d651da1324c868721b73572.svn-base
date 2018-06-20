(function($) {
    $(function() {
        $.bdt.extend({
			expand: {
				title: "扩展控件",
				components: {
                /* Components start */
                
                    //滚动表格
                    com_scrollTable: {
                        title: '滚动表格',
                        html: '\
					            <div class="wizard">\
					                <ul class="status">\
                                        <span class="glyphicon glyphicon-menu-left menu-left"></span>\
					                    <li class="active">1.新建页1</li>\
					                    <li>2.新建页2</li>\
					                    <li>3.新建页3</li>\
                                        <span class="glyphicon glyphicon-menu-right menu-right"></span>\
					                </ul>\
	                        <div class="items">\
				                      <div class="page">\
										              <div class="form-control add-item-hint">请在右侧选择添加字段...</div>\
					                        <div class="btn_nav">\
					                            <input type="button" class="next right" value="下一步&raquo;" />\
					                        </div>\
					                    </div>\
					                    <div class="page">\
                                  <div class="form-control add-item-hint">请在右侧选择添加字段...</div>\
					                        <div class="btn_nav">\
					                            <input type="button" class="prev" style="float:left" value="&laquo;上一步" />\
					                            <input type="button" class="next right" value="下一步&raquo;" />\
					                        </div>\
					                    </div>\
					                    <div class="page">\
					                        <div class="form-control add-item-hint">请在右侧选择添加字段...</div>\
					                        <div class="btn_nav">\
					                            <input type="button" class="prev" style="float:left" value="&laquo;上一步" />\
					                        </div>\
					                    </div>\
					                </div>\
					            </div>\
						          ',
                        defaultName: '滚动表格',
                        allocate: function($comp) {
                          var result = [];
                          $comp.find("div.items p").each(function(index, value) {
                            if($(this).find(":checkbox").length > 0){
                            	result.push({
		                               titleSelector: "div.items p:eq(" + index + ") label:first",
		                               nameSelector: "div.items p:eq(" + index + ") checkbox"
		                            });
                            }else if($(this).find(":radio").length > 0){
                            	result.push({
		                               titleSelector: "div.items p:eq(" + index + ") label:first",
		                               nameSelector: "div.items p:eq(" + index + ") :radio"
		                            });
                            }else if($(this).find("textarea").length > 0){
                            	result.push({
		                               titleSelector: "div.items p:eq(" + index + ") label:first",
		                               nameSelector: "div.items p:eq(" + index + ") textarea"
		                            });
                            }else if($(this).find("select").length > 0){
                            	result.push({
		                               titleSelector: "div.items p:eq(" + index + ") label:first",
		                               nameSelector: "div.items p:eq(" + index + ") select"
		                            });
                            }else{
                            	result.push({
		                               titleSelector: "div.items p:eq(" + index + ") label:first",
		                               nameSelector: "div.items p:eq(" + index + ") input"
		                            });
                            }
                          });
                          return result;
                        },
                        props: [
                        	{
                                name: '标签名',
                                html: '<input type="text" class="form-control"/>',
                                set: function($comp, $prop) {
                                	var $targetLi = $comp.find("ul.status > li.active");
                                	var priValue = $targetLi.html();
                                	if(typeof(priValue) != "undefined"){
                                		var index = priValue.indexOf(".") > -1 ? priValue.substring(0,priValue.indexOf(".")) : "";
	                                    $prop.keyup(function(){
	                                    	//处理自动拼接序号
	                                        $targetLi.html(index + "." + $prop.val());
	                                    });
                                	}
                                },
                                get: function($comp, $prop) {
                                	var $targetLi = $comp.find("ul.status > li.active");
                                	var priValue = $targetLi.html();
                                	if(typeof(priValue) != "undefined"){
                                		$prop.val(priValue.indexOf(".") > -1 ? priValue.substring(priValue.indexOf(".") + 1) : priValue);
                                	}
                                }
                            },
                            {
                                name: '字段',
                                html: '<div>' +
                                			'<div class="draggable-div">' +
                            			'</div>' +
                            			'<a class="btn btn-sm add-item">' +
                            				'<span class="glyphicon glyphicon-plus text-info">添加字段</span>' +
                            			'</a>' +
                            			'<div>' +
                            				'<select class="form-control" style="display:none">' +
	                            				'<option value="com_text">单行文本</option>' +
	                            				'<option value="com_num">数字</option>' +
                                      '<option value="com_textarea">多行文本</option>' +
	                            				'<option value="com_date">日期时间</option>' +
                                      '<option value="com_radio">单选按钮组</option>' +
                                      '<option value="com_checkbox">复选按钮组</option>' +
	                            				'<option value="com_select">下拉框</option>' +
	                            				'<option value="com_multi_select">下拉复选框</option>' +
                                      '<option value="com_file">文件</option>' +
                            				'</select>' +
                        				'</div>' +
                        				'</div>' +
                        				'<div>' +
                        					'<button type="button" class="form-control">批量编辑</button>' +
                    					'</div>',
                                set: function($comp, $prop) {
                                  //文本框属性栏
                            	  /**
                            	   * define start
                            	   */
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
                                              });
                                            },
                                            get: function($comp, $prop) {

                                            }
                                          }
                                      ]
                                  };
                                  //多行文本
                                  var com_textarea = {
                                    title: "多行文本",
                                    html: "<div><span hidden style=\"color:#F00;font-weight:bold\">*</span><textarea rows=\"3\" class=\"form-control\"></textarea></div>",
                                    defaultName: "多行文本",
                                    allocate: "textarea",
                                    props: [{
                                      name: "默认值",
                                      html: "<textarea class=\"form-control\" rows=\"3\"></textarea>",
                                      set: function($comp, $prop) {
                                        $prop.change(function() {
                                          $comp.find("textarea").val($prop.val());
                                        });
                                      },
                                      get: function($comp, $prop) {
                                        $prop.val($comp.find("textarea").val());
                                      }
                                    }, {
                                      name: "校验",
                                      html: "<div><input type=\"checkbox\" value=\"readonly\">&nbsp;<label>只读</label>&nbsp;&nbsp;<input type=\"checkbox\" value=\"required\">&nbsp;<label>必填</label></div>",
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
                                    },{
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
                                  //复选框组
                                  var com_checkbox = {
                                    title: "复选框组",
                                    html: "<div><span hidden style=\"color:#F00;font-weight:bold\">*</span><div class=\"form-control\"><input type=\"checkbox\"><label>选项1</label></div><div class=\"form-control\"><input type=\"checkbox\"><label>选项2</label></div></div>",
                                    defaultName: "复选框组",
                                    allocate: ":checkbox",
                                    props: [{
                                      name: "选项",
                                      html: "<div></div><div><a class=\"btn btn-default btn-sm add-item\">添加选项</a>&amp;nbsp;&amp;nbsp;<a class=\"btn btn-default btn-sm batch-edit\">批量编辑</a></div>",
                                      set: function($comp, $prop) {
                                        var $checkboxWrapper = $prop.first();
                                        var $addBtn = $prop.find("a.add-item").first();
                                        var $batchEditBtn = $prop.find("a.batch-edit").last();

                                        $prop.change(function() {
                                          $prop.find(":checkbox").each(function(index, value) {
                                            $($comp.find(":checkbox").get(index)).attr("checked", $(this).prop("checked"));
                                            $($comp.find("label").get(index)).text($(this).next().val());
                                          });
                                        });
                                        //增加下拉选项
                                        $addBtn.click(function() {
                                          var $checkboxDiv = $("<div class=\"form-inline\"><input type=\"checkbox\">&nbsp;<input type=\"text\" class=\"form-control\" value=\"选项\" style=\"width:65%\"><a class=\"btn btn-sm remove-item\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span></a></div>");
                                          //增加选项时绑定移除事件
                                          $checkboxDiv.children("a.remove-item").click(function() {
                                            var indexNum = $checkboxDiv.index();
                                            if ($comp.find(":checkbox").length > 1) {
                                              $checkboxDiv.fadeOut("fast", function() {
                                                $(this).remove();
                                              });
                                              $comp.find(":checkbox:eq(" + indexNum + ")").parent().remove();
                                            } else {
                                              $.epm.snackbar("至少保留一个选项");
                                            }
                                          });
                                          $checkboxWrapper.append($checkboxDiv);
                                          $comp.find(".form-control:last").after("<div class=\"form-control\"><input type=\"checkbox\"><label>选项 </label></div>");
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
                                            body: "<div><label>每一行对应一个选项值，可通过增加多行数据增加选项</label><textarea rows=\"20\" cols=\"60\">" + modInitValue + "</textarea></div>",
                                            autoDismiss: false,
                                            showCloseBotton: true,
                                            buttons: [{
                                              value: "保存",
                                              style: "primary",
                                              click: function($modal) {
                                                var array = $modal.find("textarea").val().trim().split("\n");
                                                for (var i in array) {
                                                  if (array[i] != "" && typeof(array[i]) != "undefined") {
                                                    $($prop.find(":text").get(i)).val(array[i].trim());
                                                    $($comp.find("label").get(i)).text(array[i].trim());
                                                    //处理如有多余行数据，对应Prop新增选项
                                                    if ("undefined" == typeof($prop.find(":text").get(i))) {
                                                      var $checkboxDiv = $("<div class=\"form-inline\"><input type=\"checkbox\">&nbsp;<input type=\"text\" class=\"form-control\" value=\"选项\" style=\"width:65%\"><a class=\"btn btn-sm remove-item\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span></a></div>");
                                                      $checkboxDiv.children(":text").attr("value", array[i].trim());
                                                      $prop.first().append($checkboxDiv);
                                                      $comp.find(".form-control:last").after("<div class=\"form-control\"><input type=\"checkbox\"><label>" + array[i].trim() + "</label></div>");
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
                                                    $.epm.snackbar("至少保留一个选项");
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
                                        $comp.find(":checkbox").each(function(index, value) {
                                          //由于是动态扩展的字段，每次从comp到prop映射时均采用如下append展示
                                          var $checkboxDiv = $("<div class=\"form-inline\"><input type=\"checkbox\">&nbsp;<input type=\"text\" class=\"form-control\" style=\"width:65%\"><a class=\"btn btn-sm remove-item\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span></a></div>");
                                          $checkboxDiv.children(":checkbox").prop("checked", $(this).prop("checked"));
                                          $checkboxDiv.children(":text").attr("value", $(this).next().text());
                                          //初始从组件到属性映射时绑定移除事件
                                          $checkboxDiv.children("a.remove-item").click(function() {
                                            var indexNum = $checkboxDiv.index();
                                            if ($comp.find(":checkbox").length > 1) {
                                              //移除组件中对应的行
                                              $comp.find(":checkbox:eq(" + indexNum + ")").parent().remove();
                                              //移除属性栏中的行
                                              $checkboxDiv.fadeOut("fast", function() {
                                                $(this).remove();
                                              });
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
                                          $comp.find(":checkbox").attr("disabled", $prop.find(":checkbox").first().prop("checked"));
                                          $comp.find("span").attr("hidden", !$prop.find(":checkbox").last().prop("checked"));
                                        });
                                      },
                                      get: function($comp, $prop) {
                                        $prop.find(":checkbox").first().prop("checked", $comp.find(":checkbox").attr("disabled"));
                                        $prop.find(":checkbox").last().prop("checked", !$comp.find("span").attr("hidden"));
                                      }
                                    },{
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
                                  //单选按钮组
                                  var com_radio = {
                                    title: "单选按钮组",
                                    html: "<div><span hidden style=\"color:#F00;font-weight:bold\">*</span><div class=\"form-control\"><input type=\"radio\"><label>选项1</label></div><div class=\"form-control\"><input type=\"radio\"><label>选项2</label></div></div>",
                                    defaultName: "单选按钮组",
                                    allocate: ":radio",
                                    props: [{
                                      name: "选项",
                                      html: "<div></div><div><a class=\"btn btn-default btn-sm add-item\">添加选项</a>&amp;nbsp;&amp;nbsp;<a class=\"btn btn-default btn-sm batch-edit\">批量编辑</a></div>",
                                      set: function($comp, $prop) {
                                        var $radioWrapper = $prop.first();
                                        var $addBtn = $prop.find("a.add-item").first();
                                        var $batchEditBtn = $prop.find("a.batch-edit").last();
                                        $prop.change(function() {
                                          $prop.find("input:radio").each(function(index, value) {
                                            $($comp.find("input:radio").get(index)).attr("checked", $(this).prop("checked"));
                                            $($comp.find("label").get(index)).text($(this).next().val());
                                          });
                                        });
                                        //增加下拉选项
                                        $addBtn.click(function() {
                                          var $radioDiv = $("<div class=\"form-inline\"><input type=\"radio\">&nbsp;<input type=\"text\" class=\"form-control\" value=\"选项\" style=\"width:65%\"><a class=\"btn btn-sm remove-item\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span></a></div>");
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
                                          $comp.find(".form-control:last").after("<div class=\"form-control\"><input type=\"radio\"><label>选项</label></div>");
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
                                            body: "<div><label>每一行对应一个选项值,可通过多行数据增加选项</label><textarea rows=\"20\" cols=\"60\">" + modInitValue + "</textarea></div>",
                                            autoDismiss: false,
                                            showCloseBotton: true,
                                            buttons: [{
                                              value: "保存",
                                              style: "primary",
                                              click: function($modal) {
                                                var array = $modal.find("textarea").val().trim().split("\n");
                                                for (var i in array) {
                                                  if (array[i] != "" && typeof(array[i]) != "undefined") {
                                                    $($prop.find(":text").get(i)).val(array[i].trim());
                                                    $($comp.find("label").get(i)).text(array[i].trim());
                                                    //处理如有多余行数据，对应Prop新增选项
                                                    if ("undefined" == typeof($prop.find(":text").get(i))) {
                                                      var $radioDiv = $("<div class=\"form-inline\"><input type=\"radio\">&nbsp;<input type=\"text\" class=\"form-control\" style=\"width:65%\"><a class=\"btn btn-sm remove-item\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span></a></div>");
                                                      $radioDiv.children(":text").attr("value", array[i].trim());
                                                      $prop.first().append($radioDiv);
                                                      $comp.find(".form-control:last").after("<div class=\"form-control\"><input type=\"radio\"><label>" + array[i].trim() + "</label></div>");
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
                                        })
                                      },
                                      get: function($comp, $prop) {
                                        $comp.find("input:radio").each(function(index, value) {
                                          //动态从comp到prop映射
                                          var $radioDiv = $("<div class=\"form-inline\"><input type=\"radio\">&nbsp;<input type=\"text\" class=\"form-control\" style=\"width:65%\"><a class=\"btn btn-sm remove-item\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除选项\"></span></a></div>");
                                          $radioDiv.children(":radio").prop("checked", $(this).prop("checked"));
                                          $radioDiv.children(":text").attr("value", $(this).next().text());
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
                                    }, {
                                      name: "校验",
                                      html: "<div><input type=\"checkbox\">&nbsp;<label>只读</label>&nbsp;&nbsp;<input type=\"checkbox\">&nbsp;<label>必填</label></div>",
                                      set: function($comp, $prop) {
                                        $prop.change(function() {
                                          $comp.find(":radio").attr("disabled", $prop.find(":checkbox").first().prop("checked"));
                                          $comp.find("span").attr("hidden", !$prop.find(":checkbox").last().prop("checked"));
                                        });
                                      },
                                      get: function($comp, $prop) {
                                        $prop.find(":checkbox").first().prop("checked", $comp.find(":radio").attr("disabled"));
                                        $prop.find(":checkbox").last().prop("checked", !$comp.find("span").attr("hidden"));
                                      }
                                    },{
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
                                  //文件栏
                                  var com_file = {
                                      title: "文件",
                                      html: "\
                                      <div class=\"form-group\">\
                                          <input type=\"file\"></input>\
                                      </div>",
                                      defaultName: "文件",
                                      allocate: "input",
                                      props: [
                                          {
                                              name: "校验",
                                              html: "\
                                                  <div class=\"form-group\">\
                                                      <input type=\"checkbox\" value=\"readonly\"\>只读</input>\
                                                      <input type=\"checkbox\" value=\"required\"\>必填</input>\
                                                  </div>\
                                              ",
                                              set: function($comp, $prop) {
                                                  $prop.click(function() {
                                                      $prop.find(":checkbox").each(function(index, item) {
                                                          $comp.find("input").prop($(item).val(),$(item).prop("checked"));
                                                          if(index == 1)
                                                              $comp.find("span").attr("hidden",$(item).prop("checked"));
                                                      });
                                                  });
                                              },
                                              get: function($comp, $prop) {
                                                  $prop.find(":checkbox").each(function(index, item) {
                                                      $(item).prop("checked",$comp.find("input").prop($(item).val()));
                                                      if(index == 1)
                                                          $comp.find("span").attr("hidden",$(item).prop("checked"));
                                                  });
                                              }
                                          },{
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
                                        $prop.datetimepicker();
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
                                        });
                                      },
                                      get: function($comp, $prop) {

                                      }
                                    }]
                                  };
                                  /*
                                   * define end
                                   */
                                  var $select = $prop.find("select");
                                  var $compTable = $();
                                  //获取对应当前页标签内容
                                  var $targetPage = $comp.find(".items > .page").eq($("ul.status").find("li.active").index(".status > li"));
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
                                      var $propSelector = $prop.find("div.draggable-div");
                                      var beginIndex = "";
                                      var $compSpan = $("<p><label>" + optTitle + "</label></p>");
                                      var $hintDiv = $targetPage.find(".add-item-hint");
                                      var $propSpan = $("<div class=\"sortableDiv form-inline\"><input type=\"text\" readonly=\"true\" class=\"form-control\" style=\"width:65%\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"点击编辑属性\" value=" + optTitle + "><a class=\"btn btn-sm remove-item\" style=\"padding:5px 5px;\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除字段\"></span></a><a class=\"btn btn-sm drag-item\" style=\"padding:5px 5px;\"><span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动字段\"></span></a></div>");
                                      var $insertHelper = $targetPage.find(".btn_nav");
                                      $propSelector.append($propSpan);
                                      //当有元素插入之前隐藏提示div
                                      $hintDiv.hide();
                                      $insertHelper.before($compSpan);
                                      //绑定子组件移除事件
                                      $propSpan.find("a.remove-item").click(function() {
                                          var spanIndex = $propSpan.index();
                                          //移除comp对应组件
                                          $targetPage.find("p:eq(" + spanIndex + ")").remove();
                                          //移除prop对应组件
                                          $(this).parent().fadeOut("fast", function() {
                                            $(this).remove();
                                          });
                                          if($targetPage.find("p").length < 1){
                                          	  $hintDiv.show();
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
                                          var $beforeP = $targetPage.find("p:eq(" + beginIndex + ")");
                                          //拖动之后的comp对应的位置
                                          var $afterP = $targetPage.find("p:eq(" + endIndex + ")");
                                          var $compP = $targetPage.find("p");
                                          //根据起始位置和结束位置实现表格中位置互换
                                          if (beginIndex <= endIndex) {
                                          	  $beforeP.insertAfter($afterP);
                                          }else{
                                              $beforeP.insertBefore($afterP);
                                          }
                                        }
                                      }).disableSelection();
                                      switch (optValue) {
                                        case ("com_text"):
                                          //绑定文本框点击进入属性更改栏
                                          var textIndex = 0;
                                          $propSpan.children(":text").click(function() {
                                            var textIndex = $propSpan.index();
                                            //对应表单内子属性title
                                            var $customTitle = $targetPage.find("p:eq(" + textIndex + ")").find("label");
                                            //属性编辑，取对应的comp
                                            $comp = $targetPage.find("p:eq(" + textIndex + ") > label").nextAll();
                                            $.bdt.loadPropertys($comp, com_text, $customTitle);
                                          })
                                          $targetPage.find("p:last").append("<div><input type=\"text\" class=\"form-control\" style=\"max-width:40%\"></div>");
                                          break;
                                        case ("com_num"):
                                          //绑定数字栏点击进入属性更改栏
                                          $propSpan.children(":text").click(function() {
                                            var textIndex = $propSpan.index();
                                            //对应表单内子属性title
                                            var $customTitle = $targetPage.find("p:eq(" + textIndex + ")").find("label");
                                            //属性编辑，取对应的comp
                                            $comp = $targetPage.find("p:eq(" + textIndex + ") > label").nextAll();
                                            $.bdt.loadPropertys($comp, com_num, $customTitle);
                                          })
                                          $targetPage.find("p:last").append("<div><input type=\"number\" class=\"form-control\" style=\"max-width:40%\"></div>");
                                          break;
                                        case ("com_textarea"):
                                          //绑定多行文本点击进入属性更改栏
                                          $propSpan.children(":text").click(function() {
                                            var textIndex = $propSpan.index();
                                            //对应表单内子属性title
                                            var $customTitle = $targetPage.find("p:eq(" + textIndex + ")").find("label");
                                            //属性编辑，取对应的comp
                                            $comp = $targetPage.find("p:eq(" + textIndex + ") > label").nextAll();
                                            $.bdt.loadPropertys($comp, com_textarea, $customTitle);
                                          })
                                          $targetPage.find("p:last").append("<div><textarea rows=\"3\" class=\"form-control\"></textarea></div>");
                                          break;
                                        case ("com_radio"):
                                          //绑定单选按钮组点击进入属性更改栏
                                          $propSpan.children(":text").click(function() {
                                            var textIndex = $propSpan.index();
                                            //对应表单内子属性title
                                            var $customTitle = $targetPage.find("p:eq(" + textIndex + ") > label");
                                            //属性编辑，取对应的comp
                                            $comp = $targetPage.find("p:eq(" + textIndex + ") > label").nextAll();
                                            $.bdt.loadPropertys($comp, com_radio, $customTitle);
                                          })
                                          $targetPage.find("p:last").append("<div><div class=\"form-control\"><input type=\"radio\"><label>选项1</label></div><div class=\"form-control\"><input type=\"radio\"><label>选项2</label></div></div>");
                                          break;
                                        case ("com_checkbox"):
                                          //绑定复选按钮组点击进入属性更改栏
                                          $propSpan.children(":text").click(function() {
                                            var textIndex = $propSpan.index();
                                            //对应表单内子属性title
                                            var $customTitle = $targetPage.find("p:eq(" + textIndex + ") > label");
                                            //属性编辑，取对应的comp
                                            $comp = $targetPage.find("p:eq(" + textIndex + ") > label").nextAll();
                                            $.bdt.loadPropertys($comp, com_checkbox, $customTitle);
                                          })
                                          $targetPage.find("p:last").append("<div class=\"form-control\"><input type=\"checkbox\"><label>选项1</label></div><div class=\"form-control\"><input type=\"checkbox\"><label>选项2</label></div>");
                                          break;
                                        case ("com_file"):
                                          //绑定文件点击进入属性更改栏
                                          $propSpan.children(":text").click(function() {
                                            var textIndex = $propSpan.index();
                                            //对应表单内子属性title
                                            var $customTitle = $targetPage.find("p:eq(" + textIndex + ")").find("label");
                                            //属性编辑，取对应的comp
                                            $comp = $targetPage.find("p:eq(" + textIndex + ") > label").nextAll();
                                            $.bdt.loadPropertys($comp, com_file, $customTitle);
                                          })
                                          $targetPage.find("p:last").append("<div><input type=\"file\"></div>");
                                          break;
                                        case ("com_date"):
                                          //绑定日期点击进入属性更改栏
                                          $propSpan.children(":text").click(function() {
                                            var textIndex = $propSpan.index();
                                            //对应表单内子属性title
                                            var $customTitle = $targetPage.find("p:eq(" + textIndex + ")").find("label");
                                            //属性编辑，取对应的comp
                                            $comp = $targetPage.find("p:eq(" + textIndex + ") > label").nextAll();
                                            $.bdt.loadPropertys($comp, com_date, $customTitle);
                                          })
                                          var dateDiv = "<div><div class=\"input-append date form_datetime\" style=\"max-width:40%\">\
                                                <input size=\"16\" type=\"text\" class=\"form-control\">\
                                                <span class=\"add-on\"><i class=\"icon-th\"></i></span>\
                                           </div></div>";
                                          $targetPage.find("p:last").append(dateDiv);
                                          //加载对应扩展的datetimepicker
                                          $targetPage.find("p").find(".form_datetime").last().datetimepicker();
                                          break;
                                        case ("com_select"):
                                          //绑定下拉框点击进入属性更改栏
                                          $propSpan.children(":text").click(function() {
                                            var textIndex = $propSpan.index();
                                            //对应表单内子属性title
                                            var $customTitle = $targetPage.find("p:eq(" + textIndex + ")").find("label");
                                            //属性编辑，取对应的comp
                                            $comp = $targetPage.find("p:eq(" + textIndex + ") > label").nextAll();
                                            $.bdt.loadPropertys($comp, com_select, $customTitle);
                                          })
                                          $targetPage.find("p:last").append("<div><select class=\"form-control\" style=\"max-width:40%\"></select></div>");
                                          break;
                                        case ("com_multi_select"):
                                          //绑定下拉复选框点击进入属性更改栏
                                          $propSpan.children(":text").click(function() {
                                            var textIndex = $propSpan.index();
                                            //对应表单内子属性title
                                            var $customTitle = $targetPage.find("p:eq(" + textIndex + ")").find("label");
                                            //属性编辑，取对应的comp
                                            $comp = $targetPage.find("p:eq(" + textIndex + ") > label").nextAll();
                                            $.bdt.loadPropertys($comp, com_multi_select, $customTitle);
                                          })
                                          var $selectpicker = $("<div><select class=\"selectpicker\" multiple data-live-search=\"true\"><option>选项1</option><option>选项2</option></select></div>");
                                          $targetPage.find("p:last").append($selectpicker);
                                          //加载对应扩展的selectpicker
                                          $targetPage.find("p").find(".selectpicker").last().selectpicker({
                                              noneSelectedText: "请选择..."
                                          });
                                          break;
                                        default:
                                      }
                                      //添加完成隐藏下拉框
                                      $select.slideUp("fast");
                                      //判断当前窗口添加组件的高度，如果超过文本域给予提示
                                      if($targetPage.height() > 392){
                                      	$.epm.snackbar("页面内容过多,请添加新的页面...");
                                      	$propSelector.find(".sortableDiv:last").remove();
                                      	$targetPage.find("p:last").remove();
                                      }
                                    })
                                  //模态窗批量编辑选项默认值
                                  $prop.find("button").first().click(function() {
                                      var $modal = $.epm.modal({
                                        title: "批量编辑",
                                        size: "",
                                        body: "<div><div class=\"content-div\"></div></div>",
                                        autoDismiss: false,
                                        showCloseBotton: true,
                                        buttons: [ 
                                        {
                                          value: "保存",
                                          style: "primary",
                                          click: function($modal) {
                                            //将modal中对应记录映射到comp中
                                            var dataSourceDiv = $modal.find(".content-div");
                                            dataSourceDiv.find("dl").each(function(index,value){
                                              //单个dl对应滚动表格中的一页
                                              //滚动表格对象
                                              var $compDiv = $comp.last();
                                              var $targetTitle = $compDiv.find(".status > li").eq(index);
                                              var $targetPage = $compDiv.find(".items > .page").eq(index);
                                              var $sourceTitle = $(this).find("dt").find("div");
                                              var $sourcePage = $(this).find("dd");
                                              //导航名称赋值，包含序号
                                              $targetTitle.text($sourceTitle.text() + $sourceTitle.find("input").val());
                                              //遍历每一页中的控件对象并给comp赋值
                                              $sourcePage.each(function(i,value){
                                                //comp对应控件
                                                var $paralComp = $targetPage.find("p").eq(i);
                                                //首先判断控件类型
                                                $(this).find(":text").length > 0 ? $paralComp.find("input").val($(this).find("input").val()) : "";
                                                $(this).find("input[type=\"number\"]").length > 0 ? $paralComp.find("input").val($(this).find("input").val()) : "";
                                                $(this).find(".form_datetime").length > 0 ? $paralComp.find("input").val($(this).find("input").val()) : "";
                                                $(this).find("select").not(".selectpicker").length > 0 ? $paralComp.find("select").val($(this).find("select").val()) : "";
                                                $(this).find("select.selectpicker").length > 0 ? $paralComp.find("select").val($(this).find("select").val()) : "";
                                                $(this).find("textarea").length > 0 ? $paralComp.find("textarea").val($(this).find("textarea").val()) : "";
                                                $(this).find(":file").length > 0 ? $paralComp.find("input").val($(this).find("input").val()) : "";
                                                if($(this).find(":radio").length > 0){
                                                  $(this).find(":radio").each(function(index, value) {
                                                    $targetPage.find(":radio").eq(index).attr("checked", $(this).prop("checked"));
                                                  });
                                                }
                                                if($(this).find(":checkbox").length > 0){
                                                  $(this).find(":checkbox").each(function(index, value) {
                                                    $targetPage.find(":checkbox").eq(index).attr("checked", $(this).prop("checked"));
                                                  });
                                                }
                                              });
                                            });
                                            $modal.modal("hide");
                                          }
                                        }, {
                                          value: "关闭",
                                          dismiss: true
                                        }],
                                        show: function($modal) {
                                          var $compDiv = $comp.last();
                                          var $targetDiv = $modal.find(".content-div");
                                          //模态框展示之前遍历comp中的值域赋给modal
                                          $compDiv.find(".status > li").each(function(index,value){
                                              var liText = $(this).text();
                                              var num = 0;
                                              var priName = liText;
                                              if(liText.indexOf(".") > -1){
                                                num = liText.substring(0,liText.indexOf("."));
                                                priName = liText.substring(liText.indexOf(".") + 1);
                                              }
                                              //添加标题
                                              $targetDiv.append("<dl><dt><div class=\"form-inline\">" + num + "." + "<input type=\"text\"  class=\"form-control\" style=\"max-width:20%\" value=" + priName + ">" + "</div></dt></dl>");
                                              var targetHtml = "";
                                              var $compPage = $compDiv.find(".page").eq(index);
                                              $compPage.find("p").each(function(index,value){
                                                var contentHtml = "<dd>" + $(this).html() + "</dd>";
                                                targetHtml += contentHtml;
                                              });
                                              var $targetHtml = $(targetHtml);
                                               //添加标题对应的组件
                                              $targetDiv.find("dt").eq(index).after($targetHtml);
                                              //为其初始化值
                                              $targetHtml.each(function(index,value){
                                                var $comP = $compPage.find("p").eq(index);
                                                //首先判断控件类型
                                                $comP.find(":text").length > 0 ? $(this).find("input").val($comP.find("input").val()) : "";
                                                $comP.find("input[type=\"number\"]").length > 0 ? $(this).find("input").val($comP.find("input").val()) : "";
                                                $comP.find("select").not(".selectpicker").length > 0 ? $(this).find("select").val($comP.find("select").val()) : "";
                                                $comP.find("textarea").length > 0 ? $(this).find("textarea").val($comP.find("textarea").val()) : "";
                                                $comP.find(":file").length > 0 ? $(this).find("input").val($comP.find("input").val()) : "";
                                                if ($comP.find(".form_datetime").length > 0) {
                                                  $(this).find("input").val($comP.find("input").val());
                                                  $(this).find(".form_datetime").datetimepicker("setStartDate", "2012-01-01");
                                                }
                                                if ($comP.find("select.selectpicker").length > 0) {
                                                  $(this).find("select").val($comP.find("select").val());
                                                  $(this).find(".selectpicker").selectpicker({
                                                    noneSelectedText: "请选择..."
                                                  });
                                                }
                                                if($comP.find(":radio").length > 0){
                                                  $comP.find(":radio").each(function(index, value) {
                                                    $comP.find(":radio").eq(index).attr("checked", $(this).prop("checked"));
                                                  });
                                                }
                                                if($comP.find(":checkbox").length > 0){
                                                  $comP.find(":checkbox").each(function(index, value) {
                                                    $comP.find(":checkbox").eq(index).attr("checked", $(this).prop("checked"));
                                                  });
                                                }
                                                //单选按钮此处没有name控制只能单选
                                                var $temp = $(this);
                                                $temp.find(":radio").each(function(index,value){
                                                  $(this).click(function(){
                                                    $(this).attr("checked", true);
                                                    $temp.find(":radio").not($(this)).attr("checked", false);
                                                  });
                                                });
                                              });
                                          });
                                        },
                                        close: function($modal) {}
                                      });
                                    })
                                    /*
                                     * 以下为原get方法内容，为避免代码冗余过多而合并
                                     * 变量共享，其余方法同原写法
                                     */
                                  $targetPage.find("p > label").each(function(index, value) {
                                    var typeValue = $(this).text().trim();
                                    //判断当前遍历label所对应的控件的类型
                                    var $inputTypeDis = $(this).nextAll();
                                    var $propSpan = $("<div class=\"sortableDiv form-inline\"><input type=\"text\" readonly=\"true\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"点击编辑属性\" class=\"form-control\" style=\"width:65%\" value=" + typeValue + "><a class=\"btn btn-sm remove-item\" style=\"padding:5px 5px;\"><span class=\"glyphicon glyphicon-remove text-danger\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"移除字段\"></span></a><a class=\"btn btn-sm drag-item\" style=\"padding:5px 5px;\"><span class=\"glyphicon glyphicon-move\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"拖动字段\"></span></a></div>");
                                    //绑定点击子表单编辑属性
                                    $propSpan.children("input").click(function() {
                                        var textIndex = $propSpan.index();
                                        //对应表单内子属性title
                                        var $customTitle = $targetPage.find("p:eq(" + textIndex + ") > label:first");
                                        $comp = $targetPage.find("p:eq(" + textIndex + ") > label").nextAll();
                                        //根据comp中控件的类型加载对应的属性修改栏
                                        $inputTypeDis.find(":text").length > 0 ? $.bdt.loadPropertys($comp, com_text, $customTitle) : "";
                                        $inputTypeDis.find("input[type=\"number\"]").length > 0 ? $.bdt.loadPropertys($comp, com_num, $customTitle) : "";
                                        $inputTypeDis.find(".form_datetime").length > 0 ? $.bdt.loadPropertys($comp, com_date, $customTitle) : "";
                                        $inputTypeDis.find("select").not(".selectpicker").length > 0 ? $.bdt.loadPropertys($comp, com_select, $customTitle) : "";
                                        $inputTypeDis.find("select.selectpicker").length > 0 ? $.bdt.loadPropertys($comp, com_multi_select, $customTitle) : "";
                                        $inputTypeDis.find("textarea").length > 0 ? $.bdt.loadPropertys($comp, com_textarea, $customTitle) : "";
                                        $inputTypeDis.find(":file").length > 0 ? $.bdt.loadPropertys($comp, com_file, $customTitle) : "";
                                        $inputTypeDis.find(":radio").length > 0 ? $.bdt.loadPropertys($comp, com_radio, $customTitle) : "";
                                        $inputTypeDis.find(":checkbox").length > 0 ? $.bdt.loadPropertys($comp, com_checkbox, $customTitle) : "";
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
                                          var $beforeP = $targetPage.find("p:eq(" + beginIndex + ")");
                                          //拖动之后的comp对应的位置
                                          var $afterP = $targetPage.find("p:eq(" + endIndex + ")");
                                          var $compP = $targetPage.find("p");
                                          //根据起始位置和结束位置实现表格中位置互换
                                          if (beginIndex <= endIndex) {
                                          	  $beforeP.insertAfter($afterP);
                                          }else{
                                              $beforeP.insertBefore($afterP);
                                          }
                                        }
                                      }).disableSelection();
                                    //绑定移除组件操作
                                    $propSpan.children("a.remove-item").click(function() {
                                      var spanIndex = $propSpan.index();
                                      //移除comp对应组件
                                      $targetPage.find("p:eq(" + spanIndex + ")").remove();
                                      //移除prop对应组件
                                      $(this).parent().fadeOut("fast", function() {
                                          $(this).remove();
                                      })
                                    })
                                    $prop.find("div:first").append($propSpan);
                                  });
                                },
                                get: function($comp, $prop) {
                                	
                                }
                            },
                            {
                                name: '操作',
                                html: '<div>' +
                                        '<label style="text-align:center;" class="show-page hidden">page 1 of 3</label><br/>' +
                                    	  '<div>' +
                                    	  	'<a style="float:left;"><button class="btn btn-primary btn-sm prev-pag">上一页</button></a>' +
                                    	  	'<a style="float:right;margin-left: 25px;"><button class="btn btn-primary btn-sm next-pag">下一页</button></a>' +
                                	  	  '</div><hr/>' + 
                                	  	  '<div class="margin-top:30px;">' +
                                    	  	'<a style="float:left;"><button class="btn btn-primary btn-sm add-item">增加页</button></a>' +
                                    	  	'<a style="float:right;margin-left: 25px;"><button class="btn btn-primary btn-sm del-item">删除页</button></a>' +
                                	  	  '</div>' +
                                      '</div>',
                                set: function($comp, $prop) {
                                    //总页数
                                    var totalPageNum = $(".items > .page").length;
                                    //当前页
                                    var currPageNum = $("ul.status").find("li.active").index(".status > li") + 1;
                                    //导航栏
                                    var $leadingUl = $("ul.status");
                                    //内容栏
                                    var $contentDiv = $("div.items");
                                    $prop.find(".next-pag").click(function(){
                                        //下一步，目前实现是点击对应页面的按钮，以后可用js实现,目前源码压缩版..
                                        $comp.find(".items > .page").eq(0).find(".next").click();
                                        currPageNum != totalPageNum ? currPageNum = currPageNum + 1 : "";
                                        $(".wizard").adjust();
                                        //因为是延时animate动画，必须取到动画执行结束的页面点击，暂时采用延时的方法，时间要大于animate的时间
                                        setTimeout(function(){
	                                        $comp.click();
	                                        },401);
                                    });
                                    $prop.find(".prev-pag").click(function(){
                                        //上一步
                                        $comp.find(".items > .page").eq(1).find(".prev").click();
                                        currPageNum != 1 ? currPageNum = currPageNum - 1 : "";
                                        $(".wizard").adjust();
                                        //因为是延时animate动画，必须取到动画执行结束的页面点击，暂时采用延时的方法，时间要大于animate的时间
                                        setTimeout(function(){
                                        	$comp.click();
                                        	},401);
                                    });
                                    $prop.find(".add-item").click(function(){
                                        //增加页
                                        var $ul = $("<li>" + (totalPageNum + 1) + ".新建页</li>");
                                        var $div = $("<div class=\"page\">\
														                            <div class=\"form-control add-item-hint\">请在右侧选择添加字段...</div>\
                                                        <div class=\"btn_nav\">\
                                                            <input type=\"button\" class=\"prev\" style=\"float:left\" value=\"&laquo;上一步\" />\
														                                <input type=\"button\" class=\"next right\" value=\"下一步&raquo;\" />\
                                                        </div>\
                                                    </div>");
                                        //在当前页面的最后一个页面添加下一页操作
                                        if(totalPageNum < 0){
                                            //添加页面为第一页,且仅有一页
                                            $div.find(".btn_nav").empty();
                                        }else if(currPageNum == totalPageNum){
                                            //最后一页,前一个页面增加下一步
                                            $contentDiv.find(".page:eq(" + (totalPageNum - 1) + ")").find(".btn_nav").append("<input type=\"button\" class=\"next right\" value=\"下一步&raquo;\" />");
                                        	$div.find(".btn_nav .next").remove();
                                        }
                                        //添加页面
                                        if(totalPageNum < 0 || currPageNum == totalPageNum){
                                        	$leadingUl.find("span:last").before($ul);
                                        }else{
                                        	$leadingUl.find("li").eq(currPageNum).before($ul);
                                        }
                                        //自动处理节点的index数值
                                        $(".wizard").autoModidyIndex(currPageNum);
                                        $contentDiv.find(".page").eq(currPageNum).before($div);
                                        //定位到新添加的页面
                                        $comp.find(".items > .page").eq(0).find(".next").click();
                                        totalPageNum += 1;
                                        currPageNum +=1;
                                        $(".wizard").adjust();
                                        setTimeout(function(){
                                        	$comp.click();
                                        	},401);
                                    });
                                    $prop.find(".del-item").click(function(){
                                        //删除页
                                        if(currPageNum > 0){
                                            $leadingUl.find("li:eq(" + (currPageNum-1) + ")").fadeOut("fast");
                                            $contentDiv.find(".page:eq(" + (currPageNum-1) + ")").fadeOut("fast");
                                            $.epm.snackbar("删除成功", 2000, "撤销",
                                                function() {
                                                    $leadingUl.find("li:eq(" + (currPageNum-1) + ")").remove();
                                                    $contentDiv.find(".page:eq(" + (currPageNum-1) + ")").remove();
                                                    //根据删除页的位置处理前后页面的上一步下一步操作展示
                                                    if(currPageNum > 1 && currPageNum == totalPageNum){
                                                        //最后一页
                                                        $contentDiv.find(".page:eq(" + (currPageNum - 2) + ")").find(".btn_nav > .next").remove();
                                                        $prop.find(".prev-pag").click();
                                                    }else if(currPageNum == 1 && totalPageNum > 1){
                                                        //第一页位置
                                                        $contentDiv.find(".page:eq(" + (currPageNum-1) + ")").find(".btn_nav > .prev").remove();
                                                    }else{
                                                        //中间位置页面不作处理
                                                    }
                                                    //删除之后如果不是唯一一页，自动跳转到下一页或前一页
                                                    if($comp.find(".items > .page").length > 0){
                                                    	$("ul.status > li").eq(currPageNum-1).addClass("active");
                                                    }
                                                    //自动处理节点的index数值
                                                    $(".wizard").autoModidyIndex(currPageNum);
                                                    $(".wizard").adjust();
                                                    setTimeout(function(){
      			                                        	$comp.click();
      			                                        	},401);
                                                },
                                                function() {
                                                    $leadingUl.find("li:eq(" + (currPageNum-1) + ")").fadeIn("fast");
                                                    $contentDiv.find(".page:eq(" + (currPageNum-1) + ")").fadeIn("fast");
                                                }
                                            );
                                        }else{
                                            $.epm.snackbar("暂无可以删除的页面");
                                        }
                                    });
                                },
                                get: function($comp, $prop) {
                                }
                            }
                        ],
                        ondrop: function($comp){
                        	$(".wizard").scrollable({
				                onSeek: function (event, i) {
				                    $(".status li").removeClass("active").eq(i).addClass("active");
				                }
				            });
				            $(".wizard").adjust();
				            $comp.change(function(){
				            	$(".wizard").scrollable({
				                onSeek: function (event, i) {
				                    $(".status li").removeClass("active").eq(i).addClass("active");
				                }
				            });
				            $(".wizard").adjust();
				            });
                        },
                        onload: function($comp){
                        	//预览时点击页面切换自动更新导航栏效果
				            $(document).on("click",".next,.prev",function(){
				            	$(".wizard").adjust();
				            });
                        }
                    },
                    //动态表格
                    com_dynamic_table: {
                        title: '动态表格',
                        html: '<div><table class="table table-bordered" style="-webkit-user-select: none;-moz-user-select: none;">\
								   <thead>\
								   </thead>\
								   <tbody>\
									  <tr>\
								         <td>a</td>\
								         <td>a</td>\
								         <td>a</td>\
								      </tr>\
								      <tr>\
								         <td>b</td>\
								         <td>b</td>\
								         <td>b</td>\
								      </tr>\
								      <tr>\
								         <td>c</td>\
								         <td>c</td>\
								         <td>c</td>\
								      </tr>\
								      <tr>\
								         <td>d</td>\
								         <td>d</td>\
								         <td>d</td>\
								      </tr>\
								   </tbody>\
								</table></div>',
                        defaultName: '动态表格',
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
                        ondrop: function($comp){
                    		$comp.find("td").click(function(){
                    			$(this).toggleClass("active");
                    		});
                    		$comp.parent().dblclick(function(){
							  $.epm.modal({
									title: "编辑表格",
									body: "<div style=\"text-align:right;margin-bottom: 15px;\">" +
												"<button class=\"btn btn-primary btn-sm merge\" style=\"margin-right: 25px;\">合并</button>" +
												"<button class=\"btn btn-primary btn-sm split\" style=\"margin-right: 25px;\">拆分</button>" +
												"<button class=\"btn btn-primary btn-sm add\" style=\"margin-right: 25px;\">添加</button>" +
												"<button class=\"btn btn-primary btn-sm remove\">删除</button>" +
											"</div>" +
											"<div class=\"table-div\">" +
											"</div>",
									buttons: [
										{
											value: "取消",
											style: "default",
											dismiss: true
										},
										{
											value: "确定",
											style: "primary",
											click: function($modal) {
												
											}
										}
									],
									show: function($modal) {
										$modal.find(".table-div").append($comp.find("table").clone());
										var $table = $modal.find("table");//模态框内table
										var flag = false;//鼠标左键按下flag
										var beginTr=0;//起始位置tr坐标
										var beginTd=0;//起始位置td坐标
										/*$modal.click(function(){
											$table.find("td").each(function(){
												$(this).css("background-color","white");
											});
										});*/
										function bindSelectEvent(){
											$table.find("tr").each(function(i,v){
												$(this).find("td").each(function(index,value){
													$(this).off();
												});
											});
											$table.find("tr").each(function(i,v){
												$(this).find("td").each(function(index,value){
													$(this).on({
														mousedown: function(e){
															//按下鼠标之前清除所有已选择的表格
															$table.find("td").each(function(){
																if($(this).hasClass("drag-selected")){
																	$(this).removeClass("drag-selected");
																}
															});
															beginTr = i;
															beginTd = index;
															$(this).addClass("drag-selected");
															flag = true;
															console.log("mousedown:" + i + "------" + index);
															},
														mouseup: function(e){
															$(this).addClass("drag-selected");
																flag = false;
															},
														mouseover: function(e){
															if(flag){
																if(i >= beginTr && index >= beginTd){
																	//左上至右下
																	$table.find("tr").slice(beginTr,i+1).each(function(subi,subv){
																		$(this).find("td").slice(beginTd,index+1).each(function(subindex,subvalue){
																			$(this).addClass("drag-selected");
																		});
																	});
																}else if(i <= beginTr && index >= beginTd){
																	//左下至右上
																	$table.find("tr").slice(i,beginTr+1).each(function(subi,subv){
																		$(this).find("td").slice(beginTd,index+1).each(function(subindex,subvalue){
																			$(this).addClass("drag-selected");
																		});
																	});
																}else if(i >= beginTr && index <= beginTd){
																	//右上至左下
																	$table.find("tr").slice(beginTr,i+1).each(function(subi,subv){
																		$(this).find("td").slice(index,beginTd+1).each(function(subindex,subvalue){
																			$(this).addClass("drag-selected");
																		});
																	});
																}else if(i <= beginTr && index <= beginTd){
																	//右下至左上
																	$table.find("tr").slice(i,beginTr+1).each(function(subi,subv){
																		$(this).find("td").slice(index,beginTd+1).each(function(subindex,subvalue){
																			$(this).addClass("drag-selected");
																		});
																	});
																}
															}
															console.log("mouseover:" + i + "------" + index);
														},//mouseover end
														click: function(e){
															$(this).addClass("drag-selected");
															$table.find("td").not($(this)).each(function(){
																$(this).removeClass("drag-selected");
															});
														}
													});//on end
												});//td each end
											});//tr each end
										}
										
										bindSelectEvent();
										
										$table.find("tr").each(function(i,v){
											$(this).find("td").each(function(index,value){
												$(this).click(function(){
												
													console.log("当前坐标:" + i + "---------" + index);
												});
											});
										});
										
										//合并
										$modal.find("button.merge").click(function(){
											var result = [];
											var selectedLength = $modal.find("td.drag-selected").length;//选中数目
											console.log("选择区域数目:" + selectedLength);
											if(selectedLength < 1){
												$.epm.snackbar("未选中任何区域");
											}else if(selectedLength == 1){
												$.epm.snackbar("单个区域无法合并");
											}else{
												$table.find("tr").each(function(i,v){
													$(this).find("td").each(function(index,value){
														if($(this).hasClass("drag-selected")){
															result.push({
																rowNum: i,
																colNum:index
															});
														}
													});
												});
												var beginTr,endTr,beginTd,endTd;
												function Sorts(a,b){
													return (a.rowNum + a.colNum) - (b.rowNum + b.colNum);
												}
												//按下表之和从小到大排序,最后对应左上至右下的方式方便选取
												result.sort(Sorts);
												for(var i=0;i<result.length;i++){
													beginTr = result[0].rowNum;
													beginTd = result[0].colNum;
													endTr = result[result.length -1].rowNum;
													endTd = result[result.length -1].colNum;
												}
												console.log("起止行:" + beginTr + "------" + endTr);
												console.log("起止列:" + beginTd + "------" + endTd);
												//判断选择的区域为行,列或多行列
												if(beginTr == endTr){
													//单行合并
													$table.mergeTable({
														rowsToMerger:[],
														colsToMerger:[{rows:beginTr,cols:[beginTd,endTd]}],
														multiToMerger:[]
													});
													
												}else if(beginTd == endTd){
													//单列合并
													$table.mergeTable({
														rowsToMerger:[{cols:beginTd,rows:[beginTr,endTr]}],
														colsToMerger:[],
														multiToMerger:[]
													});
												}else{
													//多行多列合并
													var mergeJson = {};
													mergeJson.rowsToMerger = [];
													mergeJson.colsToMerger = [];
													mergeJson.multiToMerger = [{rows:[beginTr,endTr],cols:[beginTd,endTd],val:"merger"}];
													$table.mergeTable(mergeJson);
												}
											}		
											bindSelectEvent();
										});
									}//show end
								});//modal end
							});
                        }
                    },
                    com_comboTree: {
						title: '下拉菜单树',
						html: '<div class="form-group"><span hidden style="color:#F00;font-weight:bold">*</span><input type="hidden" id="selectVal"><input id="treeSelect" type="text" class="form-control"/></div>',
						defaultName: '下拉菜单树',
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
							$("#treeSelect").bindJstreeSelect({
								  url: "form!getNodes",
								  idField: "selectVal", //隐藏域来保存id
							  	  width: 200,
							  	  height: 250,
							  	  fontSize: "x-small", //树字体大小String支持属性(xx-small x-small small medium large x-large xx-large)
							  	  enRightClick: false,   //是否允许右键 boolean
							  	  enCheckbox: true,    //是否包含checkbox boolean
							      enFilter: true      //是否包含搜索 boolean
							});
						}
					}
                /* Components end */
                }
			}
		});
    });
})(jQuery);