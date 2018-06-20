(function($) {
  $(function() {
    var entityId = $.bdt.doc.$container.data('epm-entity');
    if(entityId) {
      $.getJSON("entity!getEntity.action", {"entityVersionID": entityId}, function(data) {
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
            var entityCom = null;
            if(entityCom = entityComponentsCallbacks[field.widgetType] ? entityComponentsCallbacks[field.widgetType](field) : null) {
              $.bdt.groups.entity.components[entityCom.name] = entityCom.component;
            }
          });
        } else {
          $.epm.snackbar(data.msg ? data.msg : "系统错误，实体信息获取失败！");
        }
        $.bdt.reload();
      });
    } else {
      //$.bdt.reload();
    }
  });
})(jQuery);