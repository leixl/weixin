;(function(J){
var alert_skin = "notitle";
getUrl = (function(){
var sc = document.getElementsByTagName('script'), bp = '',
    i = 0, l = sc.length, re = /lhgdialog(?:\.min)?\.js/i;
	for( ; i < l; i++ ){
	    if( re.test(sc[i].src) ){
		    bp = !!document.querySelector ? sc[i].src : sc[i].getAttribute('src',4);
			break;
		}
	}
	return bp.split('?');
})(),
getPath = getUrl[0].substr( 0, getUrl[0].lastIndexOf('/') + 1 ),
J('head',top.document).append( '<link href="' + getPath + 'skins/' + alert_skin + '.css" rel="stylesheet" type="text/css"/>' );
/*
 * alert
 */
J.fn.alertInfo = function(msg, opts) {
	if( this[0] ){
		this.bind( 'click', function(){
			new _msgDialog("_lhgdgMsgId_alertInfo", "lhgdg_info", "\u63d0\u793a" ,msg, opts);
		});
	}
	return false;
}
J.alertInfo = function(msg, opts) {
	new _msgDialog("_lhgdgMsgId_alertInfo", "lhgdg_info", "\u63d0\u793a" , msg, opts);
}
/*
 * success
 */
J.fn.successInfo = function(msg, opts) {
	if( this[0] ){
		this.bind( 'click', function(){
			new _msgDialog("_lhgdgMsgId_successInfo", "lhgdg_success", "\u6210\u529f\u63d0\u793a", msg, opts);
		});
	}
	return false;
}
J.successInfo = function(msg, opts) {
	new _msgDialog("_lhgdgMsgId_successInfo", "lhgdg_success", "\u6210\u529f\u63d0\u793a" , msg, opts);
}
/*
 * error
 */
J.fn.errorInfo = function(msg, opts) {
	if( this[0] ){
		this.bind( 'click', function(){
			new _msgDialog("_lhgdgMsgId_errorInfo", "lhgdg_error", "\u9519\u8bef\u63d0\u793a" , msg, opts);
		});
	}
	return false;
}
J.errorInfo = function(msg, opts) {
	new _msgDialog("_lhgdgMsgId_errorInfo", "lhgdg_error", "\u9519\u8bef\u63d0\u793a" , msg, opts);
}
/*
 * confirm
 */
J.fn.confirmInfo = function(msg, opts) {
	if( this[0] ){
		this.bind( 'click', function(){
			new _msgDialog("_lhgdgMsgId_confirmInfo", "lhgdg_confirm", "\u786e\u8ba4\u63d0\u793a" , msg, opts);
		});
	}
	return false;
}
J.confirmInfo = function(msg, opts) {
	new _msgDialog("_lhgdgMsgId_confirmInfo", "lhgdg_confirm", "\u786e\u8ba4\u63d0\u793a" , msg, opts);
}
/*
 * process
 */
J.fn.processInfo = function(msg, opts) {
	if( this[0] ){
		this.bind( 'click', function(){
			new _msgDialog("_lhgdgMsgId_processInfo", "lhgdg_process", "\u8fdb\u5ea6\u63d0\u793a" , msg, opts);
		});
	}
	return false;
}
J.processInfo = function(msg, opts) {
	new _msgDialog("_lhgdgMsgId_processInfo", "lhgdg_process", "\u8fdb\u5ea6\u63d0\u793a" , msg, opts);
}
/*
 * pageDialog
 */
J.fn.pageDialog = function(content, title, opts) {
	if( this[0] ){
		this.bind( 'click', function(){
			new _dialog('page', content, title, opts);
		});
	}
	return false;
}
J.pageDialog = function(content, title, opts) {
	new _dialog('page', content, title, opts);
}
/*
 * htmlDialog
 */
J.fn.htmlDialog = function(content, title, opts) {
	if( this[0] ){
		this.bind( 'click', function(){
			new _dialog('html', content, title, opts);
		});
	}
	return false;
}
J.htmlDialog = function(content, title, opts) {
	new _dialog('html', content, title, opts);
}
_msgDialog = function(id, className, default_title, msg, opts){
	var width = 320;
	var dlg;
	var S = this,
	opt = S.opt = J.extend({
		parent: (frameElement) ? frameElement.lhgDG : null,
		onOk: null,
		drag: true,
		fixed : true,
		timer: null,
		top: "center",
		left: "center",
		okText: "\u786e\u5b9a",
		cancelText: "\u53d6\u6d88",
		loadingText: "\u7A97\u53E3\u5185\u5BB9\u52A0\u8F7D\u4E2D\uFF0C\u8BF7\u7A0D\u7B49..."
	}, opts || {} );
	var cancelBtn = false;
	var okBtn = true;
	
	var btnBar = true;
	
	if(id == "_lhgdgMsgId_confirmInfo"){
		cancelBtn = true;
	}else if(id == "_lhgdgMsgId_processInfo"){
		okBtn = false;
		
		btnBar = false;
		width = 238;
	}
	var titleMsg = (opt.title) ? opt.title : default_title;
	var html = '<div class="'+className+'"><div class="lhgdg_alertInner"><div class="title">'+titleMsg+'</div><div class="msg">'+msg+'</div></div></div>';
    var curWin = (opt.parent) ? opt.parent.curWin : null;
	var args = {
		id : id,
		html : html,
		width : width,
		height : 0,
		title : "",
		parent : opt.parent,
		cover : true,
		resize: false,
		iconTitle: false,
		titleBar: false,
		xButton: false,
		cancelBtn: false,
		btnBar: btnBar,
		drag: opt.drag,
		fixed : opt.fixed,
		timer: opt.timer,
		left: opt.left,
		top: opt.top,
		loadingText: opt.loadingText,
		skin: alert_skin
	};
	var ids = ["_lhgdgMsgId_alertInfo", "_lhgdgMsgId_successInfo", "_lhgdgMsgId_errorInfo", "_lhgdgMsgId_confirmInfo", "_lhgdgMsgId_processInfo"];
	$.each(ids, function(i,v){
		if($("#lhgdlg_"+v)[0])$("#lhgdlg_"+v).remove();
		else if(curWin&&curWin.$("#lhgdlg_"+v)[0])curWin.$("#lhgdlg_"+v).remove();
		else if(top.document.getElementById("lhgdlg_"+v)){
			var dom = top.document.getElementById("lhgdlg_"+v);
			dom.parentNode.removeChild(dom);
		}
	});
	dlg = (curWin) ? new curWin.$.dialog(args) : new $.dialog(args);
	dlg.ShowDialog();
	if (cancelBtn) {
		dlg.addBtn("cancelBtn", opt.cancelText,
				function() {
					dlg.cancel();
					if (opt.onCancel)new opt.onCancel();
					return false;
				})
	}
	if (okBtn) {
		dlg.addBtn("ok", opt.okText,
				function() {
					dlg.cancel();
					if (opt.onOk)new opt.onOk();
					return false;
				})
	}
	return false
};
_dialog = function(type, content, title, opts){
	var dlg;
	var S = this,
	opt = S.opt = J.extend({
		id: new Date().getTime(),
		parent: (frameElement) ? frameElement.lhgDG : null,
		cover: true,
		autoPos: {left:'center',top:'center'},
		width: 400,
		height: 300,
		title: title,
		cancelBtn: false,
		top: "center",
		left: "center",
		resize: true,
		drag: true,
		fixed : false,
		maxBtn: true,
		minBtn: false,
		timer: null,
		titleBar: true,
		rang: false,
		autoSize: false,
		iconTitle: false,
		loadingText: "\u7A97\u53E3\u5185\u5BB9\u52A0\u8F7D\u4E2D\uFF0C\u8BF7\u7A0D\u7B49..."
	}, opts || {} );
	if(opt.onXclick)opt.onXclick = function(){dlg.cancel();new opt.onXclick();return false;};
    var curWin = (opt.parent) ? opt.parent.curWin : null;
	if(type == "html")opt.html = content;
	else if(type == "page")opt.page = content;
	dlg = (curWin) ? new curWin.$.dialog(opt) : new $.dialog(opt);
	dlg.ShowDialog();
	return false
};
})(jQuery);