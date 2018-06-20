/**
 * 主页面框架及公用公用方法
 * @author 姚林刚
 * 
 */

var tabPanel,i=0,tabCount=1;
var timer,winWidth,winHeight,isRun = 1,changeTime = 15*1000,cloneLabel,tabsLength,track=0,istoggle=0;
/**
 * 判断浏览器类型公用属性
 **/
var browser={
	    versions:function(){
	    var u = window.navigator.userAgent;
	    return {
	        trident: u.indexOf('Trident') > -1, //IE内核
	        presto: u.indexOf('Presto') > -1, //opera内核
	        webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
	        gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
	        mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/), //是否为移动终端
	        ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
	        android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
	        iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者安卓QQ浏览器
	        iPad: u.indexOf('iPad') > -1, //是否为iPad
	        webApp: u.indexOf('Safari') == -1 ,//是否为web应用程序，没有头部与底部
	        weixin: u.indexOf('MicroMessenger') == -1 //是否为微信浏览器
	        };
	    }()
	}
/**
 * 主页面公用弹出框方法
 */
function jAlert(msg,title, icon, fn){
	layer.alert(msg); 
	fn();
}
/**
 * 确认判断公共方法
 * @param msg
 * @param title
 * @param fn
 */
function jConfirm(msg, title, fn){
	var fun=fn;
	layer.confirm(msg,function(index){
		fun();
		layer.close(index);
	});
	
}

/**
 * 消息提示公共方法
 * @param title
 * @param msg
 */
function jMessage(title,msg){
	
	toastr.options = {
			  "closeButton": false,
			  "debug": false,
			  "positionClass": "toast-bottom-right",
			  "onclick": null,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "5000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
			};
	toastr.info(msg);
	
}

/**
 *进度条公用方法
 **/
function openProcessBar(){
	if(typeof(arguments[0])!='undefined'&& arguments[0] != null){
		$("#progressBar").html(arguments[0]);
	}
	$("#background,#progressBar").show();
}

function closeProcessBar(){
	$("#background,#progressBar").hide();
}





/**
 * 页面框架相关方法
 */
function openWindow(url,title,id){
	if(url==null||url==""||url.replace(/\/+/g,"").replace(/\\+/g,"")==rootPath.replace(/\/+/g,"").replace(/\\+/g,"")){
		return;
	}
	var content = '<div class="frameContents"><iframe id="iframe'+id+'" class="iframeCon" scrolling="no" frameborder="0" src="'+url+'"></iframe><a href="javascript:closePanel(\''+title+'\',\''+id+'\')"></a></div>';  
	$(".frameContainer").find("div").hide();
	if($(".frameContainer").find("div").find("#iframe"+id).length==0){
		$(".frameContainer").append(content);
		$("#tabLabel").append("<li id='li"+id+"'><a href=\"javascript:selectTab('"+url+"','"+title+"','"+id+"')\"><span>"+title+"</span><em onclick='javascript:nowReload(\""+url+"\",\""+title+"\",\""+id+"\");' class='glyphicon glyphicon-refresh refreshButton'></em><em onclick='closePanel(\""+title+"\",\""+id+"\",event)' class='closeBtn'>&times;</em></a></li>");
        $(".badge").text(++tabCount);
	}else{
		$(".frameContainer").find("div").find("#iframe"+id).parent("div").show();
	}
	selectLi(id);
	$("#header").animate({
		opacity:'hide'
	},200);
}

function nowReload(url,title,id){
	if(id=="main"){
		selectTab(url,title,id);
		$(".frameContainer").find("div").find("#mainFrame").get(0).contentWindow.location.reload();
	}
	selectTab(url,title,id);
	$(".frameContainer").find("div").find("#iframe"+id).get(0).contentWindow.location.reload();
}

function selectLi(id,ord){
	$("#tabLabel").find("li").each(function(i,obj){
		$(obj).removeClass("active");
	});
	$("#newTrack").find("li").each(function(i,obj){
		$(obj).removeClass("active");
	});
	if(id=="main"){
		$("#tabLabel").find("li").eq(0).addClass("active");
		$("#newTrack").find("li").eq(0).addClass("active");
	}
	if(ord){
		$("#tabLabel").find("li").eq(ord).addClass("active");
		$("#newTrack").find("li").eq(ord).addClass("active");
	}else{
		$("#tabLabel").find("#li"+id).addClass("active");
		$("#newTrack").find("#li"+id).addClass("active");
	}
	
	
}

function selectTab(url,title,id){
	$(".frameContainer").find("div").hide();
	$(".frameContainer").find("div").find("#iframe"+id).parent("div").show();
	if(id=="main"){
		$(".frameContainer").find("div").eq(0).show();
	}
	selectLi(id);
}

function closePanel(title,id){
	track=0;
	$(".frameContainer").find("div").find("#iframe"+id).parent("div").prev().show();
	$(".frameContainer").find("div").find("#iframe"+id).parent("div").remove();
	$("#tabLabel").find("li").each(function(i,obj){
		$(obj).removeClass("active");
	});
	console.info(id);
	$("#tabLabel").find("#li"+id).prev().addClass("active");
	$("#tabLabel").find("#li"+id).remove();
	$("#newTrack").find("#li"+id).prev().addClass("active");
	$("#newTrack").find("#li"+id).remove();
	$("#track").unbind("toggle");
	$("#track").bind("toggle");
	$("#newTrack").remove();
	$(".badge").text(--tabCount);
	//阻止事件冒泡
	if (event && event.stopPropagation){
		event.stopPropagation()
	}
    else{
    	window.event.cancelBubble=true
    }
	//阻止 a 的默认事件
	if(event && event.preventDefault){
		event.preventDefault(); 
	}else{
		window.event.returnValue = false; 
		return false;
	}
}

function retMain(){
	$(".frameContainer").find("div").eq(0).show();
	selectLi("main");
}



/**
 * 全屏效果及滚动方法
 */
function fullScream() {
	$(".frameHeader").removeClass("frameShow");
	$(".frameHeader, .frameFooter").addClass("frameHide");
	$(".frameContainer").css('top','0');
	$(".frameContainer").css('bottom','0');
	$(".frameFooter").hide();

	$("#fsb").show();
	$('.frameHeader, .frameContainer, .frameFooter').removeClass('frameMinScreen');
	tabsLength = $(".frameContainer").children("div").length;
}

function outFullScream(){
	$(".frameHeader").addClass("frameShow");
	$(".frameHeader, .frameFooter").removeClass("frameHide");
	$(".frameContainer").css('top','40px');
	$(".frameContainer").css('bottom','0');
	$(".btnToggleScreen").text('切换窄屏');
	$(".btnToggleFoot").text('显示页脚');
	$(".btnToggleMenu").text('切换树形菜单');
	$("#fsb").show();
	$('.frameHeader').css('height','40px');
	$('.frameHeader').css('background','#1d354d');
//	$('.northInter .brand').removeClass('brand-new-2');
//	$('.northInter .brand').addClass('brand-new-1');
	$('.northInter .brand').css('bottom','-60px!important');
	$('#main-nav').css('float','right');
//	$('#header').removeClass('toggleMenu');
//	$('#topbar').removeClass('toggleBar');
	$("#fsb").hide();
	clearInterval(timer);
	track=0;
	isRun = 1;
	$("#pause").attr("title","播放");
	$("#pause").attr("src",rootPath+"/resources/spk_resource/globle/image/icons/pause.png");
	$("#pause").get(0).src=pauseCls;
	
}

//框架切换宽窄
function toggleScreen(){
		var dmText = $(".btnToggleScreen").text();
		if(dmText == '切换窄屏'){
			$(".btnToggleScreen").text('切换宽屏');
			$('.frameHeader, .frameContainer, .frameFooter').addClass('frameMinScreen');
			$('body').css('background','#16283a');
		}
		else{
			$(".btnToggleScreen").text('切换窄屏');
			$('.frameHeader, .frameContainer, .frameFooter').removeClass('frameMinScreen');
		}
}
//框架显示页脚
function toggleFoot(){
	var ckText = $(".btnToggleFoot").text();
	if(ckText == '显示页脚'){
		$(".btnToggleFoot").text('隐藏页脚');
		$('.frameFooter').show();
		$(".frameContainer").css('bottom','30px');
	}
	else{
		$(".btnToggleFoot").text('显示页脚');
		$('.frameFooter').hide();
		$(".frameContainer").css('bottom','0');

	}
}
//框架切换菜单
	function toggleMenu(){
			var dmText = $(".btnToggleMenu").text();
			if(dmText == '切换树形菜单'){
				istoggle=0;
				$(".btnToggleMenu").text('切换浮动菜单');
				/*$('.frameHeader').css('background','#1d354d');*/
				$('.frameHeader').css('height','38px');
				$('.frameContainer').css('top','38px');
				$('#header').addClass('toggleMenu');
				$('#topbar').addClass('toggleBar');
				$('.northInter .brand').removeClass('brand-new-1');
				$('.northInter .brand').addClass('brand-new-2');
				$('.northInter .brand').css('bottom','4px');
				$(".northInter #menu-control1").show();
				
			}
			else{
				$(".btnToggleMenu").text('切换树形菜单');
				$(".nav-collapse").show();
				/*$('.frameHeader').css('background','#1d354d');*/
				$('.frameHeader').css('height','40px');
				$('.frameContainer').css('top','40px');
				$('#header').removeClass('toggleMenu');
				$('#topbar').removeClass('toggleBar');
				$('.northInter .brand').removeClass('brand-new-2');
				$('.northInter .brand').addClass('brand-new-1');
				$(' #main-nav>li').eq(0).addClass('nBg');
				$(".container .nav-collapse").removeClass("collapse");
				$(".container .nav-collapse").removeClass("in");
				$(".northInter #menu-control1").hide();
				
			}
		
	}


/**
 * 暂停按钮
 * isRun=0:播放
 * isRun=1:暂停
 */
	
var pauseCls = rootPath+"/resources/spk_resource/globle/image/icons/pause.png";
var runCls = rootPath+"/resources/spk_resource/globle/image/icons/run.png";

function pauseLoop(){
	if(isRun==0){
		clearInterval(timer);
		isRun = 1;
		$("#pause").attr("title","播放");
		$("#pause").attr("src",rootPath+"/resources/spk_resource/globle/image/icons/pause.png")
		$("#pause").get(0).src=pauseCls;
	}else{
		timer = setInterval("nextScream();",changeTime);
		isRun = 0;
		$("#pause").attr("title","暂停");
		$("#pause").attr("src",rootPath+'/resources/spk_resource/globle/image/icons/run.png');
		$("#pause").get(0).src=runCls;
	}
}

/**
 * 下页
 */
function nextScream(){
	var selDiv = $(".frameContainer").find("div:visible");
	$(".frameContainer").find("div").hide();
	if(selDiv.next().length==1){
		selDiv.next().show();
		$("#tabLabel .active").removeClass("active").next().addClass("active");
		$("#newTrack .active").removeClass("active").next().addClass("active");
	}else{
		if(selDiv.prevAll().length>0){
			selDiv.prevAll().last().show();
			$("#tabLabel .active").removeClass("active").prevAll().last().addClass("active");
			$("#newTrack .active").removeClass("active").prevAll().last().addClass("active");
		}else{
			selDiv.show();
		}
	}
	
}

/**
 * 上页
 */
function prevScream(){
	var selDiv = $(".frameContainer").find("div:visible");
	$(".frameContainer").find("div").hide();
	$(".frameContainer").find("div").hide();
	if(selDiv.prev().length==1){
		selDiv.prev().show();
		$("#tabLabel .active").removeClass("active").prev().addClass("active");
		$("#newTrack .active").removeClass("active").prev().addClass("active");
	}else{
		if(selDiv.nextAll().length>0){
			selDiv.nextAll().last().show();
			$("#tabLabel .active").removeClass("active").nextAll().last().addClass("active");
			$("#newTrack .active").removeClass("active").nextAll().last().addClass("active");
		}else{
			selDiv.show();
		}
	}
	
}

/**
 * 刷新页面
 */
function reloadIframe(){
	$(".frameContainer").find("div:visible").find("iframe").get(0)
	.contentWindow.location.reload(true);
}

//全屏显示浏览轨迹
//------------------------
function getTrack(){
	$("#newTrack").remove();
	
	var trackMenu = document.getElementById("tabLabel");
	var pNode = document.getElementById("fsb");
	var nTrackMenu = trackMenu.cloneNode(true);
	$(nTrackMenu).attr("id","newTrack");
	
	$(pNode).append($(nTrackMenu));
	var l = document.getElementById('newTrack').getElementsByTagName('li').length;
	if(l>5 && l<=9){
		$("#newTrack").css("top",-33-(l-5)*40);
	}else if(l>9){
		$("#newTrack").css("top",-33-(l-5)*32);
	}
}

//检测显示器窗口的宽高
function getWindowSize(){
	//获取窗口宽度
	if(window.innerWidth){
		winWidth = window.innerWidth;
	}else if((document.body)&&(document.body.clientWidth)){
		winWidth=document.body.clientWidth;
	}
	//获取窗口高度
	if(window.innerHeight){
		winHeight=window.innerHeight;	
	}else if((document.body)&&(document.body.clientHeight)){
		winHeight=document.body.clientHeight;	
	}
}
//返回按钮的显示隐藏
function linkPage(url){
	var node = document.getElementById("returnButtom");
	$(node).show();
}

function hideButtom(){
	window.history.back();
	var node = document.getElementById("returnButtom");
	$(node).hide();
}


$("#newTrack").hover(function(){},function(){
	$("#newTrack").hide();
})
$("#fsb").hover(function(){
	$("#newTrack").show();
},function(){
	$("#newTrack").hide();
})

$("#track").click(function(){
	if(track==0){
		getTrack();
		track=1;
	}else{
		$("#newTrack").remove();
		track=0;
	}
})


$('.btn-navbar').click(function(){
	//第一次点击树形菜单 istoggle =0，否则=1
	if(istoggle==0){
		istoggle=1;
		$(".container .nav-collapse").addClass("collapse");
		$(".container .nav-collapse").addClass("in");
		$(".nav-collapse").show();
	}else{
		istoggle=0;
		$(".nav-collapse").hide();
	}
	})

//首页左侧侧按钮控件
 $(function retrunBtnL(){
	$('.glt-2').click(function(){
		if($('.glt-2').text()== "<") {
			$('.glt-2').empty();
			$('.glt-2').append('>');
			$('.searchArea').animate({left:"-240px"}, 300);//左侧容器收回
			$('.BMap_stdMpCtrl.BMap_stdMpType1.BMap_noprint.anchorTL, .BMap_noprint.anchorTL, .BMap_scaleCtrl.BMap_noprint.anchorBL').animate({left:"4px"}, 300);//地图左侧控件收回
		}
		else {
			$('.glt-2').empty();
			$('.glt-2').append('<');
			$('.searchArea').animate({left:"0"}, 180);//左侧容器展开
			$('.BMap_stdMpCtrl.BMap_stdMpType1.BMap_noprint.anchorTL, .BMap_noprint.anchorTL, .BMap_scaleCtrl.BMap_noprint.anchorBL').animate({left:"244px"}, 180);//地图左侧控件展开
		}
	}) 
 	
 })
 /**
  * 
  */
function tipAndReLoad(){
	jAlert("登录信息失效，请重新登录",null,null,function(){
		location.href=rootPath+"/login/toLogin.do";
	});
}

//支持框架自适应,窗口大小变化时，监听事件
window.onresize = function(){
	getWindowSize();
	if(Number(winWidth) <= 768){
		// window.location.href="${ctx }/main/common.do";
	}	
} 
//判断屏幕大小,加载时，监听事件
window.onload = function(){
	getWindowSize();
	if(Number(winWidth) <= 768){
		// window.location.href="${ctx }/main/common.do";
	}
}

/**
 * 获取请求地址参数
 * @param name 参数名称
 * @returns
 */
function getQueryString(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
//切换到全屏
function tofullScreen(){
	 if($("body").hasClass('mini-navbar')){
		 //全屏
		 $(".row.border-bottom").css("display","none");
		 $("#right-sidebar").css("display","none");  
		 $("#content-main").css("width","110%");
		 $("#content-main").css("height","90%");
		 
		 $HTML=$('<li><a class="J_menuItem" href="javascript:outFullScreen();">退出全屏</a></li>');
		 $(".dropdown-menu.dropdown-menu-right").append( $HTML);
	 }else{
		 //非全屏
		 outFullScreen();
	 }
}
function outFullScreen(){
	$(".row.border-bottom").css("display","block");
	$("#right-sidebar").css("display","block");
	$("#content-main").removeAttr("style");
	$(".dropdown-menu.dropdown-menu-right>li:last-child").remove();
	$('body').removeClass('mini-navbar');
}
//阻止冒泡事件
function stopEventBubble(){
    var e=arguments.callee.caller.arguments[0] || window.event;
    if (e && e.stopPropagation){
        e.stopPropagation();    
    }
    else{
        e.cancelBubble=true;
    }
    return false;
}  

