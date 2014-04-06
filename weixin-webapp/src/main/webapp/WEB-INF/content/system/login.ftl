<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title><@s.property value="@com.juncsoft.portal.common.util.ParamUtil@ENUM.getCszByYwmc('PARAM_APP_TITLE')" /></title>
	<style type="text/css">
	<!--
	body {background-color: #5F98C5;}
	td{font-size: 12px;color: #007AB5;}
	input, img {vertical-align: middle;}
	input{border: 0px;padding-left: 25px;line-height: 20px;height: 21px;}
	.TxtUserNameCssClass{background: url(resource/system/images/user_login_name.gif) no-repeat; width: 140px;}
	.TxtPasswordCssClass{background: url(resource/system/images/user_login_password.gif) no-repeat; width: 140px;}
	.TxtValidateCodeCssClass{background: url(resource/system/images/user_login_validatecode.gif) no-repeat; width: 66px;}
	-->
	</style>
  </head>
  <body>
	<form id="contentForm" method="post" action="user/login/save.shtml">
		<table align="center" cellpadding="0" cellspacing="0" style="width: 888px;height: 596px;border: 0px;">
			<tr>
    			<td colspan="3" style="background: url(resource/system/images/login_7.gif);height: 52px;">&nbsp;</td>
	  		</tr>
	  		<tr>
	    		<td style="background: url(resource/system/images/login_1.gif);width: 458px;height: 326px;">&nbsp;</td>
	    		<td style="background: url(resource/system/images/login_2_1.gif);width: 289px;"><p>&nbsp;</p>
	      			<table align="center" cellpadding="2" cellspacing="0" style="width: 261px;height: 247px;border: 0px;">
		            	<tr>
		              		<td align="left" style="width: 60px;height: 35px;">用户名：</td>
		              		<td><input id="urYhm" name="user.urYhm" type="text" maxlength="20" class="TxtUserNameCssClass" title="用户名" /></td>
		            	</tr>
		            	<tr>
		              		<td align="left" style="height: 35px;">密&nbsp;&nbsp;码：</td>
		              		<td><input id="urMm" name="user.urMm" type="password" maxlength="20" class="TxtPasswordCssClass" title="密码"/></td>
		            	</tr>
		            	<tr>
		              		<td style="height: 35px;"> 验证码： </td>
						  	<td><input id="validateCode" name="validateCode" type="text" maxlength="4" class="TxtValidateCodeCssClass" title="验证码"/>
						  	<img id="randImage" src="validateCode.shtml" style="border:none; cursor:pointer; width:65px; height:20px" alt="" title="点击刷新验证码" onclick="loadValidateCode();" /></td>
	            		</tr>
	            		<tr>
		              		<td colspan="2" align="center" style="height: 25px;"><span id="result" style="font-family:Arial;font-size:12px;color: #FF0000;">&nbsp;</span></td>
		            	</tr>
		          		<tr>
		              		<td colspan="2" align="right" style="height: 74px;"><input style="height: 30px;width: 86px;padding: 0px;" type="image" src="resource/system/images/coolicon04.gif"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
		            	<tr>
		              		<td colspan="2" style="height: 2px;"></td>
		            	</tr>
	    			</table>
     			</td>
	    		<td style="background: url(resource/system/images/login_3.gif);width: 141px;">&nbsp; </td>
	  		</tr>
	  		<tr>
    			<td colspan="3" style="background: url(resource/system/images/login_4.gif);height: 219px;">
    				<div align="center" style="font-weight: lighter;font-size: 12px;color: black;">
    					<@s.property value="@com.juncsoft.portal.common.util.ParamUtil@ENUM.getCszByYwmc('PARAM_APP_COPYRIGHT')" />
    				</div>
    			</td>
	  		</tr>
		</table>
	</form>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/jquery.form.js"></script>
    <script type="text/javascript">
    	//<![CDATA[
    	function loadValidateCode(){
    		$("#randImage").attr("src","validateCode.shtml?r="+Math.random());
	  	}
    	function showResponse(responseText, statusText, xhr, $form) {
    		if(checkAjaxRequestValidity(responseText)){
    			var resultDOM = $("#result");
    			if(responseText == "success"){
    				resultDOM.html("");
			    	window.location.href = "${basePath}system/index.shtml";
			    }else{
			    	loadValidateCode();
			    	if(responseText == "invalidName"){
			    		resultDOM.html("用户名错误!");
				    	$("#urYhm").focus();
		    			return false;
				    }else if(responseText == "invalidPwd"){
				    	resultDOM.html("密码错误!");
				    	$("#urMm").focus();
		    			return false;
				    }else if(responseText == "invalidCode"){
				    	resultDOM.html("验证码错误!");
				    	$("#validateCode").focus();
		    			return false;
				    }
		    	}
    		}
		}
    	$(function() {
	    	var options = {
		        success:       showResponse
		    };
    		$("#contentForm").submit(function() {
		        if($.trim($("#urYhm").val()) == ""){
	    			alert("请输入用户名!");
	    			$("#urYhm").focus();
	    			return false;
	    		}else if($.trim($("#urMm").val()) == ""){
	    			alert("请输入密码!");
	    			$("#urMm").focus();
	    			return false;
	    		}else if($.trim($("#validateCode").val()) == ""){
	    			alert("请输入验证码!");
	    			$("#validateCode").focus();
	    			return false;
	    		}
		        $(this).ajaxSubmit(options); 
		        return false; 
		    }); 
	    });
    	//]]>
    </script>
  </body>
</html>