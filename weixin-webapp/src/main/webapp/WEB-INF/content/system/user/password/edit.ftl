<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>系统管理-修改密码</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/default.css" type="text/css" />
  </head>
  
  <body>
	<div class="main addadmin">
		<div class="path"><label>当前位置: </label>首页<span>&gt;</span>系统管理<span>&gt;</span><strong>修改密码</strong></div>
		<div class="lpage">
			<form id="contentForm" action="system/user/password/update.shtml" method="post">
				<div class="forms">
					<div class="ftit">
						<h4>修改密码</h4>
						<em>加<span class="red">*</span>为必填信息</em>
					</div>
					<ul>
						<li class="fc">
							<label><span class="red">*</span>旧密码：</label>
							<div class="emg">
								<input id="oldUrMm" name="user.oldUrMm" type="password" class="w200" /> 
							</div>
							<div id="oldUrMmTip" class="tip"></div>
						</li>
						<li class="fc">
							<label><span class="red">*</span>新密码：</label>
							<div class="emg">
								<input id="urMm" name="user.urMm" type="password" class="w200" /> 
							</div>
							<div id="urMmTip" class="tip"></div>
						</li>
						<li class="fc">
							<label><span class="red">*</span>确认密码：</label>
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
				<@s.token></@s.token>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
    <script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/validate/formValidator.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/validate/formValidatorRegex.js"></script>
  	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
    <script type="text/javascript">
		//<![CDATA[
		$(function(){
			$.formValidator.initConfig({formID:"contentForm",errorFocus:true,onSuccess:checkSubmitForm});
			$("#oldUrMm").formValidator({onShow:"",onFocus:"请输入您的原始密码"}).inputValidator({max:20});
			$("#urMm").formValidator({onShow:"",onFocus:"密码应为6到20个字符"})
			.inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空,密码两边不能有空符号"}});
			$("#confirmUrMm").formValidator({onShow:"",onFocus:"密码应为6到20个字符"})
			.inputValidator({min:6,max:20}).compareValidator({desID:"urMm",operateor:"=",onError:"2次密码不一致,请确认"});
		});
		function showResponse(responseText, statusText, xhr, $form) {
    		if(checkAjaxRequestValidity(responseText)){
			    if(responseText == "success"){
			    	$.successInfo("密码修改成功!",{onOk:function(){
			    		window.location.reload();
			    	}});
			    }else if(responseText == "invalidPwd"){
			    	$.errorInfo("旧密码验证错误!修改失败!",{onOk:function(){
			    		window.location.reload();
			    		$("#oldUserPwdTip").html($.formValidator.getTipStateHtml("onError","旧密码验证错误"));
			    	}});
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