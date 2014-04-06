function checkedAll(chekedElementName, who) {
	var element = document.getElementsByName(chekedElementName);
	if (element.length > 0) {
		for (var i = 0; i < element.length; i++) {
			element[i].checked = who.checked
		}
	}
}
function checkedOne(chekedElementName,currentCheckedId) {
	var element = document.getElementsByName(chekedElementName);
	if (element.length > 0) {
		for (var i = 0; i < element.length; i++) {
			element[i].checked = "";
		}
	}
	document.getElementById(currentCheckedId).checked = true;
}
function validateLeastChecked(chekedElementName, parent){
	var element = document.getElementsByName(chekedElementName);
	var count = 0;
	for (var i = 0; i < element.length; i++) {
		if (element[i].checked) {
			count++
		}
	}
	if (count==0){
		try{
			var DOM = $;
			var parent = parent;
			if(frameElement&&frameElement.lhgDG){
				DOM = frameElement.lhgDG.curWin.$;
				parent = frameElement.lhgDG;
			}
			DOM.alertInfo("\u8bf7\u81f3\u5c11\u9009\u62e9\u4e00\u9879\u8fdb\u884c\u64cd\u4f5c\uff01", {parent: parent});
		}catch(e){
			alert("\u8bf7\u81f3\u5c11\u9009\u62e9\u4e00\u9879\u8fdb\u884c\u64cd\u4f5c\uff01");
		}
		return false;
	}else{
		return true;
	}
}
function submitAllChecked(form, chekedElementName, confirmMessage, actionurl, parent){
	document.getElementById(form).action = actionurl;
	if(validateLeastChecked(chekedElementName, parent)){
		if (confirmMessage == undefined || confirmMessage == null || confirmMessage == "") {
			confirmMessage = "\u786e\u8ba4\u8981\u6267\u884c\u6b64\u64cd\u4f5c\u5417\uff1f"
		}
		try{
			var DOM = $;
			var parent = parent;
			if(frameElement&&frameElement.lhgDG){
				DOM = frameElement.lhgDG.curWin.$;
				parent = frameElement.lhgDG;
			}
			DOM.confirmInfo(confirmMessage, {parent: parent, onOk: function(){
				DOM.processInfo("\u4fe1\u606f\u5904\u7406\u4e2d..........", {parent: parent});
				document.getElementById(form).submit();
			}});
		}catch(e){
			if (confirm(confirmMessage)) {
				document.getElementById(form).submit();
			}
		}
	}
}