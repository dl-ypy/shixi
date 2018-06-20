function pageHandler($pTable,json,action,callback){
	$.post(action,{"json":JSON.stringify(json)},function(data,status){
		callback(data,status);
		var data = data.data;
		var pageHtml="<div class='gigantic pagination'>" +
		"<span>每页显示<input type='text' id='pageSize' value="+json.limit+"  />条</span>" +
		"<a  class='first' data-action='first'>&laquo;</a>" +
		"<a  class='previous' data-action='previous'>&lsaquo;</a>" +
		"<input type='text' readonly='readonly' />" +
		"<a  class='next' data-action='next'>&rsaquo;</a>" +
		"<a  class='last' data-action='last'>&raquo;</a>" +
		"<span>共"+data.pagiParam.totalRowNum+"条记录</span>" +
		"</div>";
		$pTable.after(pageHtml);
		
		$(".pagination").jqPagination({
			link_string	: "/?page={page_number}",
			max_page	: Math.ceil(data.pagiParam.totalRowNum/json.limit),
			pageSized   :function(currentPageNum,pageSize) {
				json.limit = parseInt(pageSize,10);
				json.offset = json.limit*currentPageNum;
				$.post(action,{"json":JSON.stringify(json)},function(data,status){
					$(".pagination").data("jqPagination").options.max_page=Math.ceil(data.data.pagiParam.totalRowNum/json.limit);
					$(".pagination").data("jqPagination").setInputValue(currentPageNum);
					callback(data,status);
				}); 
				},
			paged		: function(page) {
				json.limit = $(".pagination span > input").val();
				json.offset = json.limit*page;
				$.post(action,{"json":JSON.stringify(json)},callback); 
			}
		});
	}); 
	
	
	
	
}


function initPage(data,json){
	$(".pagination span:last-child").empty();
	var tmp = "共"+data.pagiParam.totalRowNum+"条记录"
	$(".pagination span:last-child").append(tmp);
	$(".pagination").jqPagination({
		link_string	: "/?page={page_number}",
		max_page	: Math.ceil(data.pagiParam.totalRowNum/json.limit),
		pageSized   :function(currentPageNum,pageSize) {
			json.limit = parseInt(pageSize,10);
			json.offset = json.limit*currentPageNum;
			$.post(action,{"json":JSON.stringify(json)},function(data,status){
				$(".pagination").data("jqPagination").options.max_page=Math.ceil(data.data.pagiParam.totalRowNum/json.limit);
				$(".pagination").data("jqPagination").setInputValue(currentPageNum);
				callback(data,status);
			}); 
			},
		paged		: function(page) {
			json.limit = $(".pagination span > input").val();
			json.offset = json.limit*page;
			$.post(action,{"json":JSON.stringify(json)},callback); 
		}
	});
}







