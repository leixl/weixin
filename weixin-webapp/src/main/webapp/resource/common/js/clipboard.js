function copyText(content) {
	if (window.clipboardData) {
		try {
			window.clipboardData.clearData();
			window.clipboardData.setData("Text", content);
			alert("已成功复制到剪切板！");
			return true
		} catch (e) {
			alert("复制到剪切板失败！");
			return false
		}
	} else if (navigator.userAgent.indexOf("Opera") != -1) {
		window.location = content;
		alert("已经复制到浏览器栏，您可以手动复制栏内容！")
		return true
	} else if (window.netscape) {
		try {
			netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect")
		} catch (e) {
			alert("复制被浏览器拒绝！请在浏览器栏输入'about:config'并回车,然后将'signed.applets.codebase_principal_support'设置为'true'");
			return false
		}
		try {
			var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
			if (!clip)return;
			var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
			if (!trans)return;
			trans.addDataFlavor('text/unicode');
			var str = new Object();
			var len = new Object();
			var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
			str.data = content;
			trans.setTransferData("text/unicode", str, content.length * 2);
			var clipid = Components.interfaces.nsIClipboard;
			if (!clip)return false;
			clip.setData(trans, null, clipid.kGlobalClipboard);
			alert("已成功复制到剪切板！");
			return true
		} catch (e) {
			alert("复制到剪切板失败！请尝试在ie下使用此功能！");
			return false
		}
	} else {
		alert("浏览器不支持复制到剪切板！请尝试在ie下使用此功能！");
		return false
	}
}