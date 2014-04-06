(function($){
	$.fn.disableAll = function() {
		return $(this).find("*").each(function() {
			var type=$(this).attr("type");
			if(type=="text"){
				$(this).val('');
			}
			$(this).attr("disabled", "disabled");
		});
	}
	$.fn.enableAll = function() {
		return $(this).find("*").each(function() {
			$(this).removeAttr("disabled");
		});
	}
})(jQuery);