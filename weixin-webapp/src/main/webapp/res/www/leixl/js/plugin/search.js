//搜索框检测代码
function checkinput(){
	var search = $('#search-keyword');
	var isNull = /^[\s' ']*$/;
	if(search.val() == '输入关键词' || search.val().length <= 0 || isNull.test(search.val())){
		search.focus();
		window.alert("请输入关键词，搜索关键词不能为空");
		return false;
	}
}

//搜索热门关键字代码
function fbbox(fbboxID,ObjID){
	$(fbboxID).click(function(){
		$(ObjID).show();
	});
	$(ObjID).hover('',function(){
		$(ObjID).hide();
	});
	$(fbboxID).keydown(function(){
		$(ObjID).hide();
	});
	$(ObjID).find('li').click(function(){
		var text = $(this).find('span').text();
		$(fbboxID).val(text);
		$(ObjID).hide();
	});
}
fbbox('#search-keyword','#hotwords');