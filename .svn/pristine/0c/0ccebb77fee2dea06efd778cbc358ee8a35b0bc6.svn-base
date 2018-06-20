(function($) {
	var quoteData = {};//TODO 这样做。
    $(function() {
        var onloadDeferreds = [];
        $('[data-bdt-com-onload]').each(function() {
            var $div = $(this);
            var deferred = eval("(function(){return " + $div.data('bdt-com-onload') + " })()")($div.children());
            if(deferred) {
                onloadDeferreds.push(deferred);
            }
        });
        
        var onloadPromiseCombined = $.when(onloadDeferreds);
        
        onloadPromiseCombined.done(function() {
            var formInfo = $('[data-epm-form]').data('epm-form');
            var instanceId = $.epm.tools.request.getParam('instance');
            var formVersionId = $.epm.tools.request.getParam('version');
            
            if(instanceId) {
                $.post("econf!entityDataDetailShowForm.action", { entityVersionID : formInfo.version, instanceID : instanceId, formVersionID : formVersionId}, function(data) {
                    // TODO 以下的处理逻辑暂未改变
                    
                    
	        		if(data.success) {
	                    $.each(data.data, function(index, field) {
	                        if(field.associateFieldValueList) {
	                            // 控件组（子表单）
	                            var prefix = field.fieldCode;
	                            var values = [];
	                            $.each(field.associateFieldValueList, function(index, list) {
	                                var subValues = [];
	                                $.each(list, function(index, subField) {
	                                    subValues.push({
	                                        name: prefix + '.' + subField.fieldCode,
	                                        value: subField.fieldValue
	                                    });
	                                });
	                                values.push(subValues);
	                            });
	                            //var $div = $('div[data-bdt-form-group-name]="' + prefix + '"');
	                            //var echo = eval("(function(){return " + $div.data('bdt-com-echo') + " })()")($div.children(), values);
	                            //根据values 然后找到这个字表单所对应的div元素
	                            var $div = $('div[data-bdt-form-group-name="' + prefix + '"]');
	                            var $tbody = $div.find("table > tbody");
	                            var $tr = $div.find("table > tbody > tr");
								if(values.length > 0) {
									var k = 1;//因为初始有一个。所以需要少少添加一个。所有k从1开始 而非0开始
									while(k < values.length) {
										$tbody.append($tr.clone());
										k++;
									}
									for(var i=0; i<values.length; i++) {
										for(var j=0; j<values[i].length; j++) {
											var selector = 'input[name="' +values[i][j].name+ '"]:eq(' + i + ')';
											console.log("selector : " + selector);
											var $element = $(selector);
											console.log("$element : " + $element.length);
											assigment($element, values[i][j].name, values[i][j].value);	
											
										}
									}
								}
	                            //根据自表单对应的div元素添加相应的数据
	                            
	                        } else {
	                        	if("00011" === field.widgetType) {// 引用 TODO 硬编码
	                        		$('input[name="'+field.fieldCode+ '"]').val(field.instanceIds[0]);
	                        		$('input[name="'+field.fieldCode+ '"]').prev().val(field.instanceIds[0]);
	                        		var queryJson = {
									    "EntityVersionID": $('input[name="'+field.fieldCode+ '"]').prev().attr("data-info"),
									    "QueryOptions": [{"fieldName": "","fieldValue": ""}],
									    "FieldList": [{"fieldCode": ""}],
									    "limit": -1,
									    "offset": 0
									}
	                        		$.ajax({
	                        			url : "entity!entityData.action",
	                        			data : {
	                        				"entityJson" : JSON.stringify(queryJson)
	                        			},
	                        			async : false,
	                        			success : function(data) {
	                        				quoteData = data.data;
	                        			}
	                        		});
	                        		try {//TODO 待明翰更新
	                        			for(var i = 0; i < quoteData.length; i++) {
		                        			if(typeof quoteData[i][field.instanceIds[0]] !== "undefined") {
		                        				$('input[name="'+field.fieldCode+ '"]').prev().val(quoteData[i][field.instanceIds[0]][0].fieldValue);
		                        			}
		                        		}
	                        		} catch(e) {
	                        			console.log(e);
	                        		}
	                        	} else {
	                        		// 普通控件
	                            	$.bdt.setInputsValue(field.fieldCode, field.fieldValue);
	                        	}
	                        }
	                    });
	                }
                    
                    
                    $('[data-bdt-com-echo]').each(function() {
                        var $div = $(this);
                        eval("(function(){return " + $div.data('bdt-com-echo') + " })()")($div.children());
                    });
                    
                });
            }
        });
        
        
        $('form').validate({
            submitHandler: function(form) {
                $.post('form!submit.action?version=' + $.epm.tools.request.getParam('version'), $('form').serialize(), function(data) {
                    if(data.success) {
                        $.epm.snackbar('提交表单成功！');
                        $('form').attr("formInstanceId", data.data);
                    } else {
                        $.epm.snackbar(data.msg ? data.msg : '提交失败！');
                    }
                });
            },
            errorPlacement: function(error, $element) {
                $element.popover({
                    content: error.text(),
                    placement: 'top'
                }).popover('show').parent().addClass('has-error');
            },
            success : function(error, element) {
                $(element).popover('hide').popover('destroy').parent().removeClass('has-error');
            }
        });
        
        // TODO 表单提交逻辑修改
        $('#submit-btn').click(function() {
            var validate = true;
            var formInfo = $('[data-epm-form]').data('epm-form');
            $('[data-bdt-com-onsubmit]').each(function() {
                var $div = $(this);
                !eval("(function(){return " + $div.data('bdt-com-onsubmit') + " })()")($div.children()) ? validate = false : null;
            });
            if(validate) {
				$.ajaxSetup({async : false}); //设置为同步
            	$('form').submit();//提交表单
            	var instance_id = formInfo.instance;
                if(instance_id.length > 0) {//instance_id不为空。表示为修改。那么需要添加删除 在添加 TODO需要修改为更新实体
                    $.post('com!deleteEntity.action?instanceId='+ instance_id, function(data) {});//删除实体数据
                }
                $.post("com!saveEntity.action?formInstanceId=" + $("form").attr("formInstanceId"),function(data) {
					$.epm.snackbar('表单转换实体成功！');
                	location.href="econf!data.action?entityVersionID=" + formInfo.version;
                });
            } else {
            	$.epm.snackbar('数据填写有误，请检查后再提交！');
            }
        });
        
        
        function assigment($element) {
	      var $element;
	      var name;
	      var value;
	      switch(arguments.length) {
	        case 3:
	            name = arguments[1];
	            value = arguments[2];
	            break;
	        case 4:
	            $scope = arguments[1];
	            name = arguments[2];
	            value = arguments[3];
	            break;
	      }
	      if($element.is(':checkbox') || $element.is(':radio')) {
	        $element.filter('[value="' + value + '"]').prop('checked', true);
	      } else if($element.is('select')) {
	        $element.children('option[value="' + value + '"]').prop('selected', true);
	      } else {
	        $element.val(value);
	      }
	    }
    });
})(jQuery);