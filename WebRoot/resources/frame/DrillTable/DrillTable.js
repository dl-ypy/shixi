
/*
	功能：表格下钻和嵌套的jsp实现，在不能用ext配置的时候可以选择用jsp表格下钻、嵌套功能
	用法：引入该js和base.js(依赖)
	页面js写法
	function drill(markArea)
	{	
		var param='markArea='+markArea+'&monthId='+monthId;
		action({ 
			url:path+'/dss/km/product/ProductHot!drill.action',//请求的url，不要带参数
			mode:'drill',//drill：下钻；embed：嵌套；link：新链接
			parameters:param,//参数，字符串表示
			onComplete:function(data)//完成后调用
			{
				//complete(data,param)
			}
		 });
		
	}
	然后在需要下钻的表格列上加上上面的drill函数
	<td nowrap="nowrap" style="cursor: pointer; text-decoration: underline;" onclick="drill('571')">杭州</td>
	@author：tomfans 1.0
*/
function getNewId() {
	return "bonc_el_" + new Date().getTime() + "_" + parseInt(Math.random() * 10000);
}	

var WEB_APP_CONTEXT_PATH = "/";
var WEB_APP_ACTION_EXTENSION = "action";

function getFullPath(b) {
	if (!b || "string" != typeof(b)) {
		return b || "";
	}
	if (b.indexOf("/") === 0) {
		b = (WEB_APP_CONTEXT_PATH === "/"
				? ""
				: WEB_APP_CONTEXT_PATH)
				+ b;
	}
	var a = b.indexOf("?");
	if (a < 0) {
		a = b.length;
	}
	return b.lastIndexOf(".", a) < 0 ? b.substring(0, a) + "."
			+ WEB_APP_ACTION_EXTENSION + b.substring(a) : b;
};

var contextPath=null;

function _myAjax(url,parms,isDebug){
	_ajaxloading();
	
	var url=getFullPath(url);//Bonc.toFullPath(url);
	if(parms.parameters)
		url+='?'+parms.parameters;
	//alert(url);
		
	var Http;
	if (window.ActiveXObject){   // IE下创建XMLHTTPREQUEST
	    Http = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if (window.XMLHttpRequest){   // 其他浏览器创建XMLHTTPREQUEST
	    Http = new XMLHttpRequest();
	}
 	
 	Http.onreadystatechange = function(){
		if(Http.readyState==4){
			if(isDebug){
				alert(Http.responseText);
			}
			
			parms.data=Http.responseText;
			model(parms);
			
           	// 执行其中的javascript(要执行的script标签必须作为容器的一级子结点)
           	var obj=document.createElement("div");
			obj.innerHTML=Http.responseText;
           	var head = document.getElementsByTagName('head').item(0);
           	var scripts = obj.getElementsByTagName("SCRIPT");
           	for (var i = 0; i < scripts.length; i++){
				if (scripts[i].tagName == "SCRIPT"){
					scripts[i].src = scripts[i].src;
					scripts[i].defer = true;
					scripts[i].type =  "text/javascript";
		        }
            }
            _ajaxloading();
           	if(parms.onComplete)
           		parms.onComplete(Http.responseText);
		}
	}
	Http.open("GET",url,true);
	Http.send(null);
}

function action(parms)
{
	parms.td=parms.td||_getEvent().srcElement||_getEvent().target;
	var td=parms.td
	
	//作一些检查工作
	if(td==undefined||td.tagName!='TD'){
		alert('parms.td参数必须为td对象');
		return;
	}
	var url=parms.url;
	var ctr=td.parentNode;
	var cTable=ctr.parentNode;
	
	if(!(ctr.tagName=='TR'&&(cTable.tagName=='TBODY'||cTable.tagName=='TABLE'))){
		alert('请确保table为规则的table');
		return;
	}
	
	if(ctr.lv==undefined){
		ctr.lv=0;
	}
	
	if(ctr.iid==undefined){
		ctr.iid=getNewId();//Bonc.newId();
	}
	
	var _trs=cTable.rows;
	var _tr;
	var isExp=false;
	
	for(var i=0;i<_trs.length;i++){//是否有子节点
		_tr=_trs[i];
		if(ctr.iid==_tr.pid){
			isExp=true;
			break;
		}
	}

	if(ctr.drillMark==undefined){
		ctr.drillMark=false;
	}
	if (ctr.drillMark) {
		ctr.drillMark = false;
		clear(ctr);
	} else {
		ctr.drillMark = true;
	}
	/*
	for(var i=0;i<_trs.length;i++){//删除同级的所有行
		_tr=_trs[i];
		if(ctr.lv==_tr.lv){
			clear(_tr);
		}
	}
	*/
	if(!isExp)
		_myAjax(url,parms);
}

function model(parms)
{
	//处理创建方式：如嵌入还是插入
	if(parms.mode==undefined){
		parms.mode='embed'
	}
	var mode=parms.mode;
	
	if(mode=='drill'){
		driller(parms);
	}else if(mode=='embed'){
		embeder(parms);
	}else if(mode=='link'){
		linker(parms);
	}else{
		return;
	}
	
}

function driller(parms)
{
	var ctd=parms.td;
	var ctr=ctd.parentNode;
	var table=ctr.parentNode;
	var data=parms.data;
	
	//将数据放到一个div中
	var div=document.createElement("div");
	div.innerHTML=data;
	var vTable=div.getElementsByTagName('TABLE')[0];
	var vtrs=vTable.rows;
	var vtdSize=0;
	var vtrSize=vtrs.length;
	if(vtrSize==0){	
		embeder(parms);
		return;
	}
	var _ctr=ctr;
	for(var i=0;i<vtrSize;i++){
		var _tr=vtrs[0];
		var _td=_tr.cells[0];
		_tr.iid=getNewId();//Bonc.newId();
		_tr.pid=ctr.iid;
		_tr.lv=ctr.lv+1;
		//设置第一列td样式
		_td.style.paddingLeft=_tr.lv*16+'px';
		if(_td.outerHTML.indexOf('drill')!=-1){
			_td.style.cursor='pointer';
			// _td.style.textDecoration='underline';
		}
		table.insertBefore(_tr,_ctr.nextSibling);
		_ctr=_tr;
	}
}

function embeder(parms)
{
	var ctd=parms.td;
	var ctr=ctd.parentNode;
	var table=ctr.parentNode;
	var data=parms.data;
	var div=document.createElement("div");
	div.innerHTML=data;
	var newTr=document.createElement("tr"); // 创建tr
	var newTd=document.createElement("td"); // 创建td
	newTr.pid=ctr.iid;
	newTr.iid=getNewId();//Bonc.newId();
	newTr.lv=ctr.lv+1;
	newTd.colSpan=ctr.cells.length;
	newTd.appendChild(div);
	newTr.appendChild(newTd); // tr中添加td
	table.insertBefore(newTr,ctr.nextSibling);
}

function linker(parms)
{
	var url=getFullPath(url);//Bonc.toFullPath(url);
	if(parms.parameters)
		url+='?'+parms.parameters;
	window.location=url;
}

//删除该行以下的所有子行
function clear(ctr)
{
	var tr=ctr;
	var table=tr.parentNode;
	if(table.tagName=='TBODY')
		table=table.parentNode;
	var trs=table.rows;//得到所有行
	var _tr;
	for(var i=trs.length-1;i>=0;i--){//找出所有以该结点为父结点的子节点
		_tr=trs[i];
		if(tr.iid==_tr.pid){//说明还有子节点
			clear(_tr);
			table.deleteRow(_tr.rowIndex);//删除该行
		}
	}
}

function _getEvent()
{
	return arguments[0]||window.event;
}

function _getContextPath(){

    if(contextPath==null)
    {
	   var scripts = document.getElementsByTagName("script");
	   var script;
	   for(var i=0;i<scripts.length;i++)
	   {
			if(scripts[i].src.indexOf("/") == 0)
			{
				script=scripts[i];
				break;
			}
	   }
	   
	   if(script!=null)
	   {
	   		contextPath=script.src.substring(0,script.src.indexOf('/',2));//修改前为2
	   }
    }
    
    if(contextPath==null){
	    var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		contextPath = projectName;
    }

    if(contextPath==null){
    	return "/cwfw";
    }

    return contextPath;
}
function _getContextPath2(){
/*	if(ivBasePath!='undefined'&&ivBasePath!=null&&ivBasePath!="null"){
		alert(ivBasePath);
		return ivBasePath;
	}*/
	return _getContextPath();
}

function _ajaxloading()
{
	var ajaxloading=jQuery("#myajax-indicator");
	if(ajaxloading.size()==0){	
		ajaxloading=jQuery('<div id="myajax-indicator" style="width:80px;background-color:#dedede;text-align:left;display:none;z-index:9999;position: absolute;filter: alpha(opacity = 80);"><img src="'+_getContextPath2()+'/resources/img/loading.gif" style="vertical-align:middle;"/><span> 载入中...</span></div').appendTo(document.body);
	}
	var event=_getEvent();
	
	if(event){
		ajaxloading.css('top',event.clientY);
		ajaxloading.css('left',event.clientX);
	}
	
	if(ajaxloading.css('display')=='none')
	{
		ajaxloading.show();
	}else{
		ajaxloading.hide();
	}
}
