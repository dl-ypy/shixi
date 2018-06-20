(function($) {
    $(function() {
        var formInfo = $('[data-epm-form]').data('epm-form');
        if($.epm.tools.request.getParam('instance')) {
            $.getJSON('form!getFieldData', {version: formInfo.version, instance: $.epm.tools.request.getParam('instance')}, function(data) {
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
                            
                            var $div = $('div[data-bdt-form-group-name]="' + prefix + '"');
                            var echo = eval("(function(){return " + $div.data('bdt-com-echo') + " })()")($div.children(), values);
                        } else {
                            // 普通控件
                            $.bdt.setInputsValue(field.fieldCode, field.fieldValue);
                        }
                    });
                }
            });
        }
        
        $('form').validate({
            submitHandler: function(form) {
                $.post('form!submit?version=' + $.epm.tools.request.getParam('version'), $('form').serialize(), function(data) {
                    if(data.success) {
                        // 添加跳转
                        $.epm.snackbar('提交成功！');
                        console.log(data.data);
                    } else {
                        $.epm.snackbar(data.msg ? data.msg : '提交失败！');
                    }
                });
                // form.ajaxSubmit();
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
        
        $('[data-bdt-com-onload]').each(function() {
            var $div = $(this);
            eval("(function(){return " + $div.data('bdt-com-onload') + " })()")($div.children());
        });
        
        $('#submit-btn').click(function() {
            var validate = true;
            $('[data-bdt-com-onsubmit]').each(function() {
                var $div = $(this);
                !eval("(function(){return " + $div.data('bdt-com-onsubmit') + " })()")($div.children()) ? validate = false : null;
            });
            validate ? $('form').submit() : $.epm.snackbar('数据填写有误，请检查后再提交！');
        });
    });
})(jQuery);