var rank = "";
           var zTreeNodes ;
           var ztree ;
           var setting = {
		     view: {
			   showLine: false
		     },
		     check: {
			   enable: false
		     },
		     data: {
			    simpleData: {
				enable: true
			    }
		     },
		    callback: {
			   onCheck: null,
			   onClick: zTreeOnClick1
		    }
	       };
	
	// 节点OnClick 点击赋值
	function zTreeOnClick1(event, treeId, treeNode) {		
		//上级节点
		var pNode = treeNode.getParentNode();
		if(pNode == null){
			return;
		}
		$("#selectParentId").val(pNode.id); //指标父节点 用来确定自主经营体 编码的
		$("#selectKpi").attr("title",treeNode.name);
		$("#selectKpi").val(treeNode.name);
		$("#selectKpiId").val(treeNode.id);
		
	};	
	
jQuery(document).ready(function(){
	initKpi();
});	

function initKpi() {
                   ztree= null;
	               var monthId = $("#monthId").val();
	               var url="task-kpi-ratio!initKpiLv.action";
	              jQuery.ajax({
		   url : url,
		dataType :"json",
		data : {"params.monthId": monthId},
		type : "post",
		success : function(data){
			zTreeNodes = data;
		}
	});            
				}


// 开始选择指标
function showKpiRatioWin(){
	if(ztree == null){
		ztree = jQuery.fn.zTree.init(jQuery("#tree1"), setting, zTreeNodes);
		//$("#tree1 li span").click();默认展开Ztree
	}
	var offset = $("#selectKpi").offset();
	var _height = $("#selectKpi").height()+5;
	$("#mainTree").css('left',offset.left);
	$("#mainTree").css('top',offset.top+_height);
	$("#mainTree").show();
};
//取消
function closeTree(){
	$("#mainTree").hide();
}
var closeWin=function(){
	$("#mainTree").hide();
	
};
	//查询任务|调了过程
function queryRatio(){
	
	//编号
 	var kpiId =$("#selectKpiId").val();
	var kpiName =encodeURI($("#selectKpi").val());
	if(kpiName == ""){
		alert("指标列表不能为空");
		return;
	}
	
	//名称
	var radioValue =$("#selectKpi").val();
	var start = jQuery("#startMonthId").val();//起始账期
	var end= jQuery("#EndMonthId").val();//结束账期
	if(start == ""){
		alert("账期不可以为空");
		return;
	}
	if(end == ""){
		alert("账期不可以为空");
		return;
	}
	if(end < start ){
    	alert("结束账期不能大于起始账期!!!");
    	return;
    }
    var startSubstr = start.substr(0,4);
    var endSubstr = end.substr(0,4);
    if(startSubstr != endSubstr){
    	alert("不可以跨年选择账期!!!");
    	return;
    }
    // 省 || 市 || 自主经营体  V_TYPE
	var select = $("#ratioSelect").val();
	//alert(select);
	var url = "task-kpi-ratio!queryList.action?kpiId="+kpiId+"&start="+start+"&end="+end+"&params.kpiName="+kpiName+"&select="+select;
	//alert(url);
	jQuery.ajax({
		type:"POST",
		url:url,
		success:function(data){
			jQuery("#tabData").html(data);
		}
	});
}

		//给生成日期赋值
		function ceShi(){
			//如果指标框没值不能  生成任务
			if($("#kpiRatioCheck").val() == ""){
				alert("请您选择指标!");
			}
			//给生成任务(账期)赋值  自动带入生成页面
			var aaa = jQuery("#monthId").val();
			var bbb = jQuery("#EndMonthId").val();
		    jQuery("#aaa").val(aaa+"~"+bbb);
		}
		
		
		//生成任务
		function add(){
			var selectParentId = jQuery("#ratioSelect").val();
			//alert(selectParentId);
			
			//1：省  2：市  3:经营体
			var select = $("#ratioSelect").val();
			var start = jQuery("#startMonthId").val();
			var end= jQuery("#EndMonthId").val();
		    var addMonthId = start+"~"+end;
		    //alert(addMonthId);
		    var kpiName =encodeURI($("#selectKpi").val());
		    if(kpiName == ""){
				alert("指标列表不能为空");
				return;
			}
			if(start == ""){
				alert("账期不可以为空");
				return;
			}
			if(end == ""){
				alert("账期不可以为空");
				return;
			}
		    if(end < start ){
		    	alert("结束账期不能大于起始账期!!!");
		    	return;
		    }
		    var startSubstr = start.substr(0,4);
		    var endSubstr = end.substr(0,4);
		    if(startSubstr != endSubstr){
		    	alert("不可以跨年选择账期!!!");
		    	return;
		    }
		   //  var spaceJson = {
		    // addMonthId:addMonthId,
		    // params.selectParentId:selectParentId,
			  // select: select,
			//};			
		    // var url = "task-kpi-ratio!add.action";
		     //$.post(url,{"spaceJson":JSON.stringify(spaceJson)},function(data,status){
			var url = "task-kpi-ratio!add.action?addMonthId="+addMonthId+"&select="+select+"&params.selectParentId="+selectParentId;
			jQuery("#tabData").load(url);
			
		}
		
		//保存分解
		function doAdd(){
			
			var select = $("#ratioSelect").val();
			//alert(select);
		 	//编号
		 	var kpiId =$("#selectKpiId").val();
			//名称
			var kpiName =encodeURI($("#selectKpi").val());
			//alert(kpiName);
			var start = jQuery("#startMonthId").val();//起始账期
			var end= jQuery("#EndMonthId").val();//结束账期
			var startSubstr = start.substr(0,4);
		    var endSubstr = end.substr(0,4);
		    if(kpiName == ""){
				alert("指标列表不能为空");
				return;
			}
			if(start == ""){
				alert("账期不可以为空");
				return;
			}
			if(end == ""){
				alert("账期不可以为空");
				return;
			}
		    if(startSubstr != endSubstr){
		    	alert("不可以跨年选择账期!!!");
		    	return;
		    }
			var url = "task-kpi-ratio!doAdd.action?params.start="+start+"&params.end="+end+"&params.kpiId="+kpiId+"&params.kpiName="+kpiName+"&params.select="+select;
			//alert(encodeURI(url));
			if(confirm('确定要保存本次操作么？')){
				jQuery.ajax({
					url  : encodeURI(url),
					type :"post",
					dataType:"text",
					data : jQuery("#form0").serialize(),
					success : function(data){
						alert("操作成功");
						queryRatio();
					}
					
				});	
			
			}
			
		}			
		
		//删除任务
		function deleteInfo(){
			var select = $("#ratioSelect").val();//分解级别 
			//alert(select);
			var selectParentId = jQuery("#selectParentId").val();//指标项节点 对应的  组织机构
			//alert(selectParentId);
		 	var kpiId =$("#selectKpiId").val();//编号
		 	alert(kpiId);
			var kpiName =encodeURI($("#selectKpi").val());//名称
			//alert(kpiName);
			var start = jQuery("#startMonthId").val();//起始账期
			//alert(start);
			var end= jQuery("#EndMonthId").val();//结束账期
			//alert(end);
			var startSubstr = start.substr(0,4);
		    var endSubstr = end.substr(0,4);
			 if(kpiName == ""){
				alert("指标列表不能为空");
				return;
			}
			if(start == ""){
				alert("账期不可以为空");
				return;
			}
			if(end == ""){
				alert("账期不可以为空");
				return;
			}
		    if(startSubstr != endSubstr){
		    	alert("不可以跨年选择账期!!!");
		    	return;
		    }
		    
		    var url ="task-kpi-ratio!deleteInfo.action?params.start="+start+"&params.end="+end+"&params.kpiId="+kpiId+"&params.kpiName="+kpiName+"&params.select="+select+"&params.selectParentId="+selectParentId;
		    if(confirm('确定要进行删除任务操作么？')){
		    	jQuery.ajax({
		    		url : url,
		    		type : "post",
		    		success : function(data){
		    			alert(data);	
		    			queryRatio();
		    			//window.history.go();
		    		}
		    	});
		    }
			
		}
		
		
		//检查指标值
		function isNum(obj){
			//alert(obj.value);
		/*	验证 是否为 整数  数值  前面只能加一个负号
			str= obj.value;
			str1 = str.substr(0,1);
			str2 = str.substr(1);
			obj.value = str1.replace(/[^-\d]/gi, "") + str2.replace(/\D/gi, ""); */
			var re = /^-?[0-9]*(\.\d*)?$|^-?d^(\.\d*)?$/;
				if (!re.test(obj.value)){
					if(isNaN(obj.value)){        
						alert("请您输入正确格式数字");
						obj.value="";
						obj.focus();
						return false;
				}
			}
		}