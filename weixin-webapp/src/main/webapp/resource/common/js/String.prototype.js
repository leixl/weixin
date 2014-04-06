String.prototype.len=function(){           
	return this.replace(/[^\x00-\xff]/g,"00").length;       
};
String.prototype.sub=function(len,ext){
	var r = /[^\x00-\xff]/g;    
	if(this.replace(r, "00").length <=len)return this;   
	var m = Math.floor(len/2);
	var strLength=this.length;
	var subLen=0;
	for(var i=m; i<strLength; i++) { 
		subLen=this.substr(0, i).replace(r, "00").length;
		if(subLen>=len) {
			var result=this.substr(0, (subLen>len)?i-1:i);
			if(ext)result+=ext;
			return result; 
		}
	} 
	return this;   
};
String.prototype.replaceAll=function(s1,s2){
    return this.replace(new RegExp(s1,"g"),s2);
};
String.prototype.trim=function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
String.prototype.trimL=function(){
	return this.replace(/(^\s*)/g,'');
};
String.prototype.trimR=function(){
	return this.replace(/(\s*$)/g,'');
};
function subContent(content, len, dg){
	var str=content.sub(len);
	var dom=null;
	if(dg&&dg.inwin){
		dom=dg.inwin.document;
	}else{
		dom=document;
	}
	dom.write(str);
}
String.prototype.validateMoney=function(obj){
	if(!this.match(/^\d*?\.?\d*?$/))obj.value=obj.t_value;else obj.t_value=this;if(this.match(/^(?:\d+(?:\.\d+)?)?$/))obj.o_value=this;
};
String.prototype.validatePlus=function(obj){
	obj.value=this.replace(/[^\d]/g,'');
};