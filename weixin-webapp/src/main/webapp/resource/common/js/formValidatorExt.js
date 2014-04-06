/**
 * 电话手机必填一项验证，表单控件id、提示内容为默认初始化
 * @param {验证分组，默认为默认分组“1”【选填参数】} validatorGroup
 * @param {页面打开显示的提示内容，默认为固定的提示内容【选填参数】} noShow
 * @param {是否弹窗模式} isAlertMode
 */
function phoneMobileValidator(validatorGroup,noShow,isAlertMode){
	_phoneMobileValidator("telArea","telCode","telExt","mobile","tel_mobile_Tip",validatorGroup,noShow,isAlertMode);
}
/**
 * 电话手机必填一项验证，表单控件id、提示内容可以自助设置
 * @param {区号控件id【必填】} telAreaId
 * @param {主机号码控件id【必填】} telCodeId 电话区号控件id
 * @param {分机控件id【必填】} telExtId 电话区号控件id
 * @param {手机控件id【必填】} mobileId
 * @param {提示的tipId【必填】} tipId
 * @param {验证分组，默认为默认分组“1”【选填参数】} validatorGroup
 * @param {页面打开显示的提示内容，默认为固定的提示内容【选填参数】} noShow
 */
function phoneMobileValidatorHelper(telAreaId,telCodeId,telExtId,mobileId,tipId,validatorGroup,noShow){
	_phoneMobileValidator(telAreaId,telCodeId,telExtId,mobileId,tipId,validatorGroup,noShow);
}
function _phoneMobileValidator(telAreaId,telCodeId,telExtId,mobileId,tipId,validatorGroup,noShow,isAlertMode){
	var group = (validatorGroup)?validatorGroup:"1";
	var showHtml = (noShow)?"":"固定电话和移动电话必填一项";
	var firstNode="";
	if(!isAlertMode){
		firstNode="#"+telAreaId+",";
	}
	$(""+firstNode+"#"+telCodeId+",#"+telExtId+",#"+mobileId+"").formValidator({validatorGroup:group,empty:false,tipID:""+tipId+"",onShow:showHtml,onFocus:"固定电话和移动电话必填一项，请填写完整的电话号码或者手机号码"})
	.functionValidator({
		fun:function(){
			var areaDOM=$("#"+telAreaId+"");
			var codeDOM=$("#"+telCodeId+"");
			var extDOM=$("#"+telExtId+"");
			var mobileDOM=$("#"+mobileId+"");
			
			var areaVal=$.trim(areaDOM.val());
			var codeVal=$.trim(codeDOM.val());
			var extVal=$.trim(extDOM.val());
			var mobileVal=$.trim(mobileDOM.val());
			if(((areaVal==null||areaVal=="")&&(codeVal==null||codeVal=="")
					&&(extVal==null||extVal=="")&&(mobileVal==null||mobileVal==""))){
				return "固定电话和移动电话必填一项";
			}else{
				var bool=_validatePhone(telAreaId,telCodeId,telExtId);
				if(bool==true){
					bool=_validateMobile(mobileId);
				}
				return bool;
			}
		}
	});
}
function _validatePhone(telAreaId,telCodeId,telExtId){
	var areaDOM=$("#"+telAreaId+"");
	var codeDOM=$("#"+telCodeId+"");
	var extDOM=$("#"+telExtId+"");
	
	var areaVal=$.trim(areaDOM.val());
	var codeVal=$.trim(codeDOM.val());
	var extVal=$.trim(extDOM.val());
	if((areaVal!=null&&areaVal!="")&&!/^\d{3,4}$/.test(areaVal)){
		return "请填写正确的区号";
	}
	if((codeVal!=null&&codeVal!="")&&!/^\d{7,8}$/.test(codeVal)){
		return "请填写正确的主机号码";
	}
	if((extVal!=null&&extVal!="")&&!/^\d{1,5}$/.test(extVal)){
		return "请填写正确的分机号码";
	}
	//分机不为空，区号或者主机号码为空
	if(extVal!=null&&extVal!=""){
		if(areaVal==null||areaVal==""){
			return "请填写正确的区号";
		}else if(codeVal==null||codeVal==""){
			return "请填写正确的主机号码";
		}
	}else if((codeVal!=null&&codeVal!="")&&(areaVal==null||areaVal=="")){//主机号码不为空，区号为空
		return "请填写正确的区号";
	}else if((areaVal!=null&&areaVal!="")&&(codeVal==null||codeVal=="")){//区号不为空，主机号码为空
		return "请填写正确的主机号码";
	}
	return true;
}
function _validateMobile(mobileId){
	var mobileDOM=$("#"+mobileId+"");
	var mobileVal=$.trim(mobileDOM.val());
	if((mobileVal!=null&&mobileVal!="")){
		if(mobileVal.length>11){
			return "请填写正确的手机号码";
		}else if(!/^13[0-9]{9}|14[0-9]{9}|15[0-9]{9}|18[0-9]{9}$/.test(mobileVal)){
			return "请填写正确的手机号码";
		}
	}
	return true;
}
/**
 * 传值验证，表单控件id、提示内容为默认初始化
 * @param {验证分组，默认为默认分组“1”【选填参数】} validatorGroup
 * @param {页面打开显示的提示内容，默认为固定的提示内容【选填参数】} noShow
 * @param {是否允许空，默认为true【选填参数】} isAllowEmpty
 */
function faxValidator(validatorGroup,noShow,isAllowEmpty){
	_faxValidator("faxArea","faxCode","faxTip",validatorGroup,noShow,isAllowEmpty);
}
/**
 * 传值验证，表单控件id、提示内容可以自助设置
 * @param {区号控件id【必填】} faxAreaId
 * @param {主机号码控件id【必填】} faxCodeId
 * @param {提示的tipId【必填】} tipId
 * @param {验证分组，默认为默认分组“1”【选填参数】} validatorGroup
 * @param {页面打开显示的提示内容，默认为固定的提示内容【选填参数】} noShow
 * @param {是否允许空，默认为true【选填参数】} isAllowEmpty
 */
function faxValidatorHelper(faxAreaId,faxCodeId,tipId,validatorGroup,noShow,isAllowEmpty){
	_faxValidator(faxAreaId,faxCodeId,tipId,validatorGroup,noShow,isAllowEmpty);
}
function _faxValidator(faxAreaId,faxCodeId,tipId,validatorGroup,noShow,isAllowEmpty){
	var allowEmpty = (isAllowEmpty)?isAllowEmpty:true;
	var group = (validatorGroup)?validatorGroup:"1";
	var showHtml = (noShow)?"":"请填写传真号码";
	$("#"+faxAreaId+",#"+faxCodeId+"").formValidator({validatorGroup:group,empty:allowEmpty,tipID:""+tipId+"",onShow:showHtml,onFocus:"请填写正确的传真号码"})
	.functionValidator({
		fun:function(){
			var areaDOM=$("#"+faxAreaId+"");
			var codeDOM=$("#"+faxCodeId+"");
			
			var areaVal=$.trim(areaDOM.val());
			var codeVal=$.trim(codeDOM.val());
			if((areaVal==null||areaVal=="")&&(codeVal==null||codeVal=="")){
				return "请填写正确的传真号码";
			}else{
				if((areaVal!=null&&areaVal!="")&&!/^\d{3,4}$/.test(areaVal)){
					return "请填写正确的区号";
				}
				if((codeVal!=null&&codeVal!="")&&!/^\d{7,8}$/.test(codeVal)){
					return "请填写正确的主机号码";
				}
				if((codeVal!=null&&codeVal!="")&&(areaVal==null||areaVal=="")){//主机号码不为空，区号为空
					return "请填写正确的区号";
				}else if((areaVal!=null&&areaVal!="")&&(codeVal==null||codeVal=="")){//区号不为空，主机号码为空
					return "请填写正确的主机号码";
				}
			}
		}
	});
}
/**
 * 电话验证，表单控件id、提示内容为默认初始化
 * @param {验证分组，默认为默认分组“1”【选填参数】} validatorGroup
 * @param {页面打开显示的提示内容，默认为固定的提示内容【选填参数】} noShow
 * @param {是否允许空，默认为true【选填参数】} isAllowEmpty
 */
function phoneValidator(validatorGroup,noShow,isAllowEmpty){
	_phoneValidator("telArea","telCode","telExt","telTip",validatorGroup,noShow,isAllowEmpty);
}
/**
 * 电话验证，表单控件id、提示内容可以自助设置
 * @param {区号控件id【必填】} telAreaId
 * @param {主机号码控件id【必填】} telCodeId 电话区号控件id
 * @param {分机控件id【必填】} telExtId 电话区号控件id
 * @param {提示的tipId【必填】} tipId
 * @param {验证分组，默认为默认分组“1”【选填参数】} validatorGroup
 * @param {页面打开显示的提示内容，默认为固定的提示内容【选填参数】} noShow
 * @param {是否允许空，默认为true【选填参数】} isAllowEmpty
 */
function phoneValidatorHelper(telAreaId,telCodeId,telExtId,tipId,validatorGroup,noShow,isAllowEmpty){
	_phoneValidator(telAreaId,telCodeId,telExtId,tipId,validatorGroup,noShow,isAllowEmpty);
}
function _phoneValidator(telAreaId,telCodeId,telExtId,tipId,validatorGroup,noShow,isAllowEmpty){
	var allowEmpty = (isAllowEmpty)?isAllowEmpty:true;
	var group = (validatorGroup)?validatorGroup:"1";
	var showHtml = (noShow)?"":"请填写固定电话";
	$("#"+telAreaId+",#"+telCodeId+",#"+telExtId+"").formValidator({validatorGroup:group,empty:allowEmpty,tipID:""+tipId+"",onShow:showHtml,onFocus:"请填写正确的固定电话"})
	.functionValidator({
		fun:function(){
			var areaDOM=$("#"+telAreaId+"");
			var codeDOM=$("#"+telCodeId+"");
			var extDOM=$("#"+telExtId+"");
			
			var areaVal=$.trim(areaDOM.val());
			var codeVal=$.trim(codeDOM.val());
			var extVal=$.trim(extDOM.val());
			if(((areaVal==null||areaVal=="")&&(codeVal==null||codeVal=="")&&(extVal==null||extVal==""))){
				return "请填写正确的固定电话";
			}else{
				return _validatePhone(telAreaId,telCodeId,telExtId);
			}
		}
	});
}
/**
 * 手机验证，表单控件id、提示内容为默认初始化
 * @param {验证分组，默认为默认分组“1”【选填参数】} validatorGroup
 * @param {页面打开显示的提示内容，默认为固定的提示内容【选填参数】} noShow
 * @param {是否允许空，默认为true【选填参数】} isAllowEmpty
 */
function mobileValidator(validatorGroup,noShow,isAllowEmpty){
	_mobileValidator("mobile","mobileTip",validatorGroup,noShow,isAllowEmpty);
}
/**
 * 手机验证，表单控件id、提示内容可以自助设置
 * @param {手机控件id【必填】} mobileId
 * @param {提示的tipId【必填】} tipId
 * @param {验证分组，默认为默认分组“1”【选填参数】} validatorGroup
 * @param {页面打开显示的提示内容，默认为固定的提示内容【选填参数】} noShow
 * @param {是否允许空，默认为true【选填参数】} isAllowEmpty
 */
function mobileValidatorHelper(mobileId,tipId,validatorGroup,noShow,isAllowEmpty){
	_mobileValidator(mobileId,tipId,validatorGroup,noShow,isAllowEmpty);
}
function _mobileValidator(mobileId,tipId,validatorGroup,noShow,isAllowEmpty){
	var allowEmpty = (isAllowEmpty)?isAllowEmpty:true;
	var group = (validatorGroup)?validatorGroup:"1";
	var showHtml = (noShow)?"":"请填写手机号码";
	$("#"+mobileId+"").formValidator({validatorGroup:group,empty:allowEmpty,tipID:""+tipId+"",onShow:showHtml,onFocus:"请填写正确的手机号码"})
	.functionValidator({
		fun:function(){
			var mobileDOM=$("#"+mobileId+"");
			var mobileVal=$.trim(mobileDOM.val());
			if((mobileVal==null||mobileVal=="")){
				return "请填写正确的手机号码";
			}else{
				return _validateMobile(mobileId);
			}
		}
	});
}