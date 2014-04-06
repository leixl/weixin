<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>系统管理-用户管理</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/default.css" type="text/css" />
  </head>
  
  <body>
	<div class="main addadmin">
		<div class="path"><label>当前位置: </label>首页<span>&gt;</span>系统管理<span>&gt;</span><strong>用户管理</strong></div>
		<div class="lpage">
			<@s.set name="isAdd" value="(user==null||user.urId==null)?true:false"></@s.set>
			<form id="contentForm" action="system/user/save.shtml" method="post">
				<div class="forms">
					<div class="ftit">
						<h4><@s.property value="(#isAdd)?'添加':'编辑'" /></h4>
						<em>加<span class="red">*</span>为必填信息</em>
					</div>
					<ul>
						<li class="fc">
							<label><span class="red">*</span>用户名：</label>
							<div class="emg">
								<input id="urYhm" name="user.urYhm" value="<@s.property value='user.urYhm' />" type="text" class="w200" />
							</div>
							<div id="urYhmTip" class="tip"></div>
						</li>
						<li class="fc">
							<label><span class="red">*</span>姓名：</label>
							<div class="emg">
								<input id="urXm" name="user.urXm" value="<@s.property value='user.urXm' />" type="text" class="w200" />
							</div>
							<div id="urXmTip" class="tip"></div>
						</li>
						<li class="fc">
							<label><@s.if test="#isAdd"><span class="red">*</span>密码</@s.if><@s.else>重置密码</@s.else>：</label>
							<div class="emg">
								<input id="urMm" name="user.urMm" type="password" class="w200" /> 
							</div>
							<div id="urMmTip" class="tip"></div>
						</li>
						<li class="fc">
							<label><@s.if test="#isAdd"><span class="red">*</span>确认密码</@s.if><@s.else>确认重置密码</@s.else>：</label>
							<div class="emg">
								<input id="confirmUrMm" type="password" class="w200" /> 
							</div>
							<div id="confirmUrMmTip" class="tip"></div>
						</li>
						<li class="but">
							<label>&nbsp;</label>
							<input type="submit" class="ibut" value="确认" />
							<input type="reset" class="ibut" value="重填" />
						</li>
					</ul>
				</div>
				<@s.if test="!#isAdd">
					<input type="hidden" name="user.urId" value="<@s.property value='user.urId' />" />
				</@s.if>
				<@s.token></@s.token>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<input type="hidden" id="hidOldUrYhm" value="<@s.property value='user.urYhm' />" />
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
    <script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/validate/formValidator.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/validate/formValidatorRegex.js"></script>
  	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
    <script type="text/javascript">
		//<![CDATA[
		var isAdd = "<@s.property value='#isAdd' />";
		$(function(){
			$.formValidator.initConfig({formID:"contentForm",errorFocus:true,onSuccess:checkSubmitForm});
			var urYhm = $("#hidOldUrYhm").val();
			$("#urYhm").formValidator({onShow:"",onFocus:"以英文字母开头，4-30个字母或数字，不能用中文。"})
			.inputValidator({min:4,max:30})
			.regexValidator({regExp:"username",dataType:"enum"})
			.ajaxValidator({
				type:"post",
				async:true,
				url:"system/user/getExistByYhm.shtml",
				success:function(data){
					if(checkAjaxRequestValidity(data)){
						if($.trim($("#urYhm").val())==$.trim(urYhm)){
							return true;
						}else{
							if(data=="false"){
								return true;
							}else {
								return false;
							}
						}
					}
				},
				onError:"用户名已存在，请更换",
				onWait:"正在检查用户名唯一性，请稍后……"
			});
			$("#urXm").formValidator({onShow:"",onFocus:"长度最多10个汉字(或20个字符)"}).inputValidator({max:20});
			if(isAdd == "true"){
				$("#urMm").formValidator({onShow:"",onFocus:"密码应为6到20个字符"})
				.inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空,密码两边不能有空符号"}});
				$("#confirmUrMm").formValidator({onShow:"",onFocus:"密码应为6到20个字符"})
				.inputValidator({min:6,max:20}).compareValidator({desID:"urMm",operateor:"=",onError:"2次密码不一致,请确认"});
			}else{
				$("#urMm").formValidator({empty:true,onShow:"重置密码,不输入不会自动重置",onFocus:"密码应为6到20个字符"})
				.inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空,密码两边不能有空符号"}});
				$("#confirmUrMm").formValidator({onShow:"",onFocus:"密码应为6到20个字符"})
				.compareValidator({desID:"urMm",operateor:"=",onError:"2次密码不一致,请确认"});
			}
		});
		function showResponse(responseText, statusText, xhr, $form) {
    		if(checkAjaxRequestValidity(responseText)){
			    if(responseText && responseText != null){
			    	var url = "<@s.property value='url' />";
			    	if(url != null && url != ""){
			    		window.location.href="${basePath}common/prompt/handleSuccess.shtml?url="+url;
			    	}else{
				    	$.successInfo("操作成功!",{onOk:function(){
				    		window.location.reload();
				    	}});
				    }
			    }else{
			    	$.errorInfo("信息提交失败!");
			    }
			}
		}
		function checkSubmitForm(){
			var options = {
		        success:       showResponse
		    };
			$.processInfo("信息正在提交,请稍候...");
			$("#contentForm").ajaxSubmit(options);
			return false;
  		}
		//]]>
	</script>
  </body>
</html>