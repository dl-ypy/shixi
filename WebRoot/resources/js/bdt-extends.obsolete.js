(function($) {
  $(function() {
    var entityId = $.bdt.doc.$container.data('epm-entity');
    if(entityId) {
      $.getJSON("entity!getEntity.action", {"entityVersionID": entityId}, function(data) {
    	var entityArr = [];
        if(data.success) {
          $.extend($.epm.data, {entity : data.data});
          $.bdt.extend({
            entity: {
              title: "实体控件",
              components: {}
            }
          });
          var entityComponentsCallbacks = $.epm.data.entityComponentsCallbacks;
          
          $.each($.epm.data.entity.entityFieldList, function(index, field) {
        	  entityArr[entityArr.length] = {id:field.widgetType,field:field};
        	
        	  /**
            var entityCom = null;
            if(entityCom = entityComponentsCallbacks[field.widgetType] ? entityComponentsCallbacks[field.widgetType](field) : null) {
              $.bdt.groups.entity.components[entityCom.name] = entityCom.component;
              
              
            }*/
          });
        }else {
          $.epm.snackbar(data.msg ? data.msg : "系统错误，实体信息获取失败！");
        }
        
        var dtd = $.Deferred();
        var wait = function(){
        	 require(["js/bdtrq/reqload"],function(lod){
     			lod.loadModel($.bdt);
     			dtd.resolve();
             });
        };
        dtd.promise(wait);
		wait.done(function(){
			 require(["js/entityrq/entitydata"],function(lod){
				 lod.initEntity($.bdt.groups.entity,entityArr);
			 });
		}).fail(function(){
			require(["js/entityrq/entitydata"],function(lod){
				 lod.initEntity($.bdt,entityArr);
			 });
		});
		wait(dtd);
      });
    } else {
      //$.bdt.reload();
    }
  });
})(jQuery);