;
var bonc_hn_ztree_tree_id = "";

var bonc_hn_ztree_setting = {
	check: {
		enable: true,
		chkboxType: {"Y":"", "N":""}
	},
	view: {
		dblClickExpand: false
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeClick: bonc_hn_ztree_beforeClick,
		onCheck: bonc_hn_ztree_onCheck
	}
};

function bonc_hn_ztree_beforeClick(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("bonc_hn_ztree_treeShow");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function bonc_hn_ztree_onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("bonc_hn_ztree_treeShow"),
	nodes = zTree.getCheckedNodes(true),
	v = "";
	for (var i=0, l=nodes.length; i<l; i++) {
		v += nodes[i].name + ",";
	}
	if (v.length > 0 ) v = v.substring(0, v.length-1);
	var cityObj = $("#"+bonc_hn_ztree_tree_id);
	cityObj.attr("value", v);
}

function bonc_hn_ztree_showMenu() {
	var cityObj = $("#"+bonc_hn_ztree_tree_id);
	var cityOffset = $("#"+bonc_hn_ztree_tree_id).offset();
	$("#bonc_hn_ztree_menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
	$("body").bind("mousedown", bonc_hn_ztree_onBodyDown);
}

function bonc_hn_ztree_hideMenu() {
	$("#bonc_hn_ztree_menuContent").fadeOut("fast");
	$("body").unbind("mousedown", bonc_hn_ztree_onBodyDown);
}

function bonc_hn_ztree_onBodyDown(event) {
	if (!(event.target.id == bonc_hn_ztree_tree_id || event.target.id == "bonc_hn_ztree_menuContent" || $(event.target).parents("#bonc_hn_ztree_menuContent").length>0)) {
		bonc_hn_ztree_hideMenu();
	}
}

function bonc_hn_ztree_initZTree(selectId){
	bonc_hn_ztree_tree_id = selectId;
	var bonc_hn_ztree_Content_str = '<div id="bonc_hn_ztree_menuContent" class="menuContent" style="display:none; position: absolute;"><ul id="bonc_hn_ztree_treeShow" class="ztree" style="margin-top:0; width:180px; height:300px;"></ul>';
	jQuery("body").append(bonc_hn_ztree_Content_str);
	var parmater = {};
	var url = '../custom/Custom!initAllOrganizationTree.action';
	var zNodes=null;
	jQuery.ajax({
 	       url: url,
 	       async:true,
 	       type: "post",
 	       data: parmater,
 	       dataType: "html",
 	       success: function(data){
 	    	    if(data != ""){
 	    	    	alert(data);
 	    	    	zNodes = eval("("+data+")");
 	    	    	//zNodes = data;
 	    	    	//console.log(zNodes);
 	    	    	$.fn.zTree.init($("#bonc_hn_ztree_treeShow"), bonc_hn_ztree_setting, zNodes);
 	    	    }
 	       }
	});
	//console.log(zNodes);
	//$.fn.zTree.init($("#bonc_hn_ztree_treeShow"), bonc_hn_ztree_setting, zNodes);
}

