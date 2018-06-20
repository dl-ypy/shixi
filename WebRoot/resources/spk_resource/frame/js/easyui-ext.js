/**
 * 修正easyUI弹出框超出组件方法
 * 姚林刚 
 * 针对panel window dialog三个组件拖动时会超出父级元素的修正
// * 如果父级元素的overflow属性为hidden，则修复上下左右个方向
// * 如果父级元素的overflow属性为非hidden，则只修复上左两个方向
 * @param left
 * @param top
 * @returns
 */
var easyuiDialogOnMove = function(left, top) {
	var parentObj = $(this).panel('panel').parent();
	if (left < 0) {
		$(this).dialog('move', {
			left : 1
		});
	}
	if (top < 0) {
		$(this).dialog('move', {
			top : 1
		});
	}
	var width = $(this).panel('options').width;
	var height = $(this).panel('options').height;
	var right = left + width;
	var buttom = top + height;
	var parentWidth = parentObj.width();
	var parentHeight = parentObj.height();
//	if(parentObj.css("overflow")=="hidden"){
		if(left > parentWidth-width){
			$(this).dialog('move', {
				"left":parentWidth-width
			});
		}
		if(top > parentHeight-height){
			$(this).dialog('move', {
				"top":parentHeight-height
			});
		}
//	}
};
$.fn.dialog.defaults.onMove = easyuiDialogOnMove;


/**
 * 自定义验证
 * 姚林刚
 */
$.extend($.fn.validatebox.defaults.rules, {   
    isNumber: {   
        validator: function(value, param){   
            return  !(isNaN(value));
        },   
        message: '请输入一个数字'  
    },
    phone: {
	    // 验证手机号码
	    validator: function (value) {
	        return /^(13|15|18)\d{9}$/.test(value); //这里就是一个正则表达是
	    },
	    message: '手机号码格式不正确'//这里是错误后的提示信息
    },
    minLength : { // 判断最小长度
		validator : function(value, param) {
			return value.length >= param[0];
		},
		message : '最少输入 {0} 个字符。'
	},
	length:{validator:function(value,param){
		var len=$.trim(value).length;
			return len>=param[0]&&len<=param[1];
		},
		message:"内容长度介于{0}和{1}之间."
	},
	telephone : {// 验证电话号码
		validator : function(value) {
			return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
		},
		message : '格式不正确,请使用下面格式:020-88888888'
	},
	mobile : {// 验证手机号码
		validator : function(value) {
			return /^(13|14|15|18)\d{9}$/i.test(value);
		},
		message : '手机号码格式不正确(正确格式如：13450774432)'
	},
	phoneOrMobile:{//验证手机或电话
		validator : function(value) {
			return /^(13|14|15|18)\d{9}$/i.test(value) || /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
		},
		message:'请填入手机或电话号码,如13688888888或020-8888888'
	},
	idcard : {// 验证身份证
		validator : function(value) {
			return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
		},
		message : '身份证号码格式不正确'
	},
	floatOrInt : {// 验证是否为小数或整数
		validator : function(value) {
			return /^(\d{1,3}(,\d\d\d)*(\.\d{1,3}(,\d\d\d)*)?|\d+(\.\d+))?$/i.test(value);
		},
		message : '请输入数字，并保证格式正确'
	},
	currency : {// 验证货币
		validator : function(value) {
			return /^d{0,}(\.\d+)?$/i.test(value);
		},
		message : '货币格式不正确'
	},
	qq : {// 验证QQ,从10000开始
		validator : function(value) {
			return /^[1-9]\d{4,9}$/i.test(value);
		},
		message : 'QQ号码格式不正确(正确如：453384319)'
	},
	integer : {// 验证整数
		validator : function(value) {
			return /^[+]?[1-9]+\d*$/i.test(value);
		},
		message : '请输入整数'
	},
	chinese : {// 验证中文
		validator : function(value) {
			return /^[\u0391-\uFFE5]+$/i.test(value);
		},
		message : '请输入中文'
	},
	english : {// 验证英语
		validator : function(value) {
			return /^[A-Za-z]+$/i.test(value);
		},
		message : '请输入英文'
	},
	unnormal : {// 验证是否包含空格和非法字符
		validator : function(value) {
			return /.+/i.test(value);
		},
		message : '输入值不能为空和包含其他非法字符'
	},
	username : {// 验证用户名
		validator : function(value) {
			return /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value);
		},
		message : '用户名不合法（字母开头，允许6-16字节，允许字母数字下划线）'
	},
	faxno : {// 验证传真
		validator : function(value) {
//			return /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/i.test(value);
			return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
		},
		message : '传真号码不正确'
	},
	zip : {// 验证邮政编码
		validator : function(value) {
			return /^[1-9]\d{5}$/i.test(value);
		},
		message : '邮政编码格式不正确'
	},
	ip : {// 验证IP地址
		validator : function(value) {
			return /d+.d+.d+.d+/i.test(value);
		},
		message : 'IP地址格式不正确'
	},
	name : {// 验证姓名，可以是中文或英文
			validator : function(value) {
				return /^[\u0391-\uFFE5]+$/i.test(value)|/^\w+[\w\s]+\w+$/i.test(value);
			},
			message : '请输入姓名'
	},
	carNo:{
		validator : function(value){
			return /^[\u4E00-\u9FA5][\da-zA-Z]{6}$/.test(value); 
		},
		message : '车牌号码无效（例：粤J12350）'
	},
	carenergin:{
		validator : function(value){
			return /^[a-zA-Z0-9]{16}$/.test(value); 
		},
		message : '发动机型号无效(例：FG6H012345654584)'
	},
	email:{
		validator : function(value){
			return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value); 
		},
		message : '请输入有效的电子邮件账号(例：abc@126.com)'	
	},
	msn:{
		validator : function(value){
			return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value); 
		},
		message : '请输入有效的msn账号(例：abc@hotnail(msn/live).com)'
	},
	department:{
		validator : function(value){
			return /^[0-9]*$/.test(value); 
		},
		message : '请输入部门排序号(例：1)'	
	},
    //  长日期时间(yyyy-MM-dd hh:mm:ss)格式
    longDate: {
        validator: function (value) { 
        	return /^\1|2\d{3}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/.test(value);
        },
        message: "输入的内容必须是长日期时间(2014-08-02 12:21:32)格式."
    },
    //  短日期(yyyy-MM-dd)格式
    shortDate: {
        validator: function (value) { 
        	return /^\1|2\d{3}-\d{2}-\d{2}$/.test(value);
        },
        message: "输入的内容必须是短日期(2014-08-02)格式."
    },
    //  长日期时间(yyyy-MM-dd hh:mm:ss)或短日期(yyyy-MM-dd)格式
    date: {
        validator: function (value) { 
        	return /^\1|2\d{3}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/.test(value) || /^\1|2\d{3}-\d{2}-\d{2}$/.test(value); 
        },
        message: "输入的内容必须是长日期时间(2014-08-02 12:21:32)或短日期(2014-08-02)格式."
    },
	equals:{
		validator : function(value, param){
			if($("#"+param[0]).val() != "" && value != ""){
				return $("#"+param[0]).val() == value; 
			}else{
				return true;
			}
		},
		message : '两次输入不一致！'	
	}
});


/**
 * 自定义验证相关方法，移除验证，提示验证信息方法，添加验证，显示隐藏验证
 */
$.extend($.fn.validatebox.methods, {  
    remove : function(jq, newposition) {  
        return jq.each(function() {  
            $(this).removeClass("validatebox-text validatebox-invalid").unbind('focus.validatebox').unbind('blur.validatebox');  
                // remove tip  
                // $(this).validatebox('hideTip', this);  
            });  
    },  
    reduce : function(jq, newposition) {  
        return jq.each(function() {  
            var opt = $(this).data().validatebox.options;  
            $(this).addClass("validatebox-text").validatebox(opt);  
                // $(this).validatebox('validateTip', this);  
            });  
    },  
    validateTip : function(jq) {  
        jq = jq[0];  
        var opts = $.data(jq, "validatebox").options;  
        var tip = $.data(jq, "validatebox").tip;  
        var box = $(jq);  
        var value = box.val();  
        function setTipMessage(msg) {  
            $.data(jq, "validatebox").message = msg;  
        };  
        var disabled = box.attr("disabled");  
        if (disabled == true || disabled == "true") {  
            return true;  
        }  
        if (opts.required) {  
            if (value == "") {  
                box.addClass("validatebox-invalid");  
                setTipMessage(opts.missingMessage);  
                $(jq).validatebox('showTip', jq);  
                return false;  
            }  
        }  
        if (opts.validType) {  
            var result = /([a-zA-Z_]+)(.*)/.exec(opts.validType);  
            var rule = opts.rules[result[1]];  
            if (value && rule) {  
                var param = eval(result[2]);  
                if (!rule["validator"](value, param)) {  
                    box.addClass("validatebox-invalid");  
                    var message = rule["message"];  
                    if (param) {  
                        for (var i = 0; i < param.length; i++) {  
                            message = message.replace(new RegExp("\\{" + i + "\\}", "g"), param[i]);  
                        }  
                    }  
                    setTipMessage(opts.invalidMessage || message);  
                    $(jq).validatebox('showTip', jq);  
                    return false;  
                }  
            }  
        }  
        box.removeClass("validatebox-invalid");  
        $(jq).validatebox('hideTip', jq);  
        return true;  
    },  
    showTip : function(jq) {  
        jq = jq[0];  
        var box = $(jq);  
        var msg = $.data(jq, "validatebox").message  
        var tip = $.data(jq, "validatebox").tip;  
        if (!tip) {  
            tip = $("<div class=\"validatebox-tip\">" + "<span class=\"validatebox-tip-content\">" + "</span>" + "<span class=\"validatebox-tip-pointer\">" + "</span>" + "</div>").appendTo("body");  
            $.data(jq, "validatebox").tip = tip;  
        }  
        tip.find(".validatebox-tip-content").html(msg);  
        tip.css({  
                    display : "block",  
                    left : box.offset().left + box.outerWidth(),  
                    top : box.offset().top  
                });  
    },  
    hideTip : function(jq) {  
        jq = jq[0];  
        var tip = $.data(jq, "validatebox").tip;  
        if (tip) {  
            tip.remove;  
            $.data(jq, "validatebox").tip = null;  
        }  
    }  
});  