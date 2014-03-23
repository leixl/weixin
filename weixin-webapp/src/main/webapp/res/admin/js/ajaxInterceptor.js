var basePath=(document.getElementsByTagName("base")[0])?document.getElementsByTagName("base")[0].href:"/";
function checkRequestValidity_prompt(url){
	var dom=null;
	if(frameElement){
		var dg = null;
		dg = frameElement.lhgDG;
		if(dg){
			if(dg.inwin){
				dom=dg.inwin;
			}
		}
	}
	if(dom==null)dom=window;
	dom.location.href = url;
}
/**
 * 请求状态码参考GlobalResults
 * @param {} data
 * @return {Boolean}
 */
function checkAjaxRequestValidity(data){
	if(data){
		var obj = null;
		if(typeof(data) == "string"){
			try{obj = eval('(' + data + ')');}catch(e){}
		}else if(typeof(data) == "object"){
			obj = data;
		}
		if(obj && obj.http_status_code_){
			var code = obj.http_status_code_;
			if(code=="systemNotLogin"){
				var url=basePath+'common/prompt/systemNotLogin.shtml';
				checkRequestValidity_prompt(url);
				return false;
			}else if(code=="memberNotLogin"){
				var url=basePath+'common/prompt/memberNotLogin.shtml';
				checkRequestValidity_prompt(url);
				return false;
			}else if(code=="memberNoPass"){
				var url=basePath+'common/prompt/memberNoPass.shtml';
				checkRequestValidity_prompt(url);
				return false;
			}else if(code=="noPerm"){
				var url=basePath+'common/prompt/noPerm.shtml';
				checkRequestValidity_prompt(url);
				return false;
			}else if(code=="memberNoPerm"){
				var url=basePath+'common/prompt/memberNoPerm.shtml';
				checkRequestValidity_prompt(url);
				return false;
			}else if(code=="exception"){
				var url=basePath+'common/prompt/exception.shtml';
				checkRequestValidity_prompt(url);
				return false;
			}else if(code=="invalidRequest"){
				var url=basePath+'common/prompt/invalidRequest.shtml';
				checkRequestValidity_prompt(url);
				return false;
			}else if(code=="infoLocked"){
				var url=basePath+'common/prompt/infoLocked.shtml';
				checkRequestValidity_prompt(url);
				return false;
			}else if(code=="token"){
				var url=basePath+'common/prompt/token.shtml';
				checkRequestValidity_prompt(url);
				return false;
			}
		}
		return true;
	}
	return true;
}