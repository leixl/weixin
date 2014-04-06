function radioIsChecked(elementsName){
	var count=0;
	var elements=document.getElementsByName(elementsName);
	var len=elements.length;
	for(var i=0;i<len;i++){
		if(elements[i].checked){
			count++;
		}
	}
	return (count>0)?true:false;
}
function getRadioValue(elementsName){
	var elements=document.getElementsByName(elementsName);
	for(var i=0;i<elements.length;i++){
		if(elements[i].checked){
			return elements[i].value
		}
	}
	return 0;
}
function checkBoxIsChecked(elementsName){
	var element = document.getElementsByName(elementsName);
	var count = 0;
	for (var r = 0; r < element.length; r++) {
		if (element[r].checked == true) {
			count++;
		}
	}
	return (count>0)?true:false;
}
function siteURLIsValidity(id, ignoreEmpty){
	var element=document.getElementById(id);
 	var url=element.value;
 	var Expression = /http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
	var objExp = new RegExp(Expression);
	if (url=="") {
  		return (ignoreEmpty)?true:false;
	}else {
		if (!objExp.test(url)) {
			return false;
		} 
	}
	return true;
}
function emailIsValidity(id, ignoreEmpty){
	var element=document.getElementById(id);
	var str=element.value.replace(/(^\s*)|(\s*$)/g, "");
	var dregu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$";
	var dre = new RegExp(dregu);
	if (str==""){
		return (ignoreEmpty)?true:false;
	}else{
		return (str.search(dre)==-1)?false:true;
	}
}
function textLenIsOverstep(id, maxlength, ignoreEmpty){
	var element=document.getElementById(id);
	var str=element.value.replace(/(^\s*)|(\s*$)/g, "");
	if (str==""){
		return (ignoreEmpty)?true:false;
	}else{
		var theLen=str.replace(/[^\x00-\xff]/g,"00").length;
		return (theLen > maxlength) ? false : true;
	}
}