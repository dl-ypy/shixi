(function($) {
	$(function() {
		function rqMenu(){
			requireuse.use(["js/bdtrq/config"],function(lod){
				  var arr = lod.menuArr;
				  var comparr = {};
				  var i,j;
				  var group,node,id;
				  for(i=0;i<arr.length;i++){
					  group = arr[i];
					  if(comparr[group.group]==null){
							comparr[group.group] = {
						 		title:group.groupname,
						 		components:{}
							};
					  }
					  for(j=0;j<group.child.length;j++){
						  node = group.child[j];
						  id = createUUID();
						  comparr[group.group].components[id]={
							  id:id,
							  filename:node.id,
							  title:node.title,
							  path:node.path
						  };
					  }
				  }
				 $.bdt.extend(comparr);
				  entityMenu();
		     });
		}
		var createUUID = function() {
	        var uuid = newId.newId(16);
	        return uuid;
	      };
		function entityMenu(){
			var entityId = $.bdt.doc.$container.data('epm-entity');
		    if(entityId) {
		      $.getJSON("entity!getEntity.action", {"entityVersionID": entityId}, function(data) {
		    	$.extend($.epm.data, {entity : data.data});
		        if(data.success) {
		          var comparr = {},id;
		          comparr["entity"] = {
					 		title:"实体控件",
					 		components:{}
					};
		          $.each($.epm.data.entity.entityFieldList, function(index, field) {
		        	  id = createUUID();
		        	  comparr["entity"].components[id]={
							  id:id,
							  filename:field.widgetType,
							  title:field.fieldName,
							  field:field,
							  path:"js/entityrq/"
						  };
		          });
		          $.bdt.extend(comparr);
		          
		          $.bdt.load();
		        }else {
		          $.bdt.load();
		          $.epm.snackbar(data.msg ? data.msg : "系统错误，实体信息获取失败！");
		        }
		        
		      });
		    }else{
		    	 $.bdt.load();
		    }
		}
		rqMenu();
	});
})(jQuery);