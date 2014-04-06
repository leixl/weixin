<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>编辑</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/default.css" type="text/css" />
  </head>
  
  <body>
	<div class="main">
		<form id="contentForm" action="system/common/param/update.shtml" method="post">
			<div class="forms">
				<div class="ftit">
					<h4>编辑</h4>
					<em>加<span class="red">*</span>为必填信息</em>
				</div>
				<ul>
					<li class="fc">
						<label><span class="red">*</span>英文名称：</label>
						<div class="emg">
							<input id="paramYwmc" name="param.paramYwmc" value="<@s.property value='param.paramYwmc' />" type="text" class="w200" />
						</div>
						<div id="paramYwmcTip" class="tip"></div>
					</li>
					<li class="fc">
						<label><span class="red">*</span>中文名称：</label>
						<div class="emg">
							<input id="paramZwmc" name="param.paramZwmc" value="<@s.property value='param.paramZwmc' />" type="text" class="w200" /> 
						</div>
						<div id="paramZwmcTip" class="tip"></div>
					</li>
					<li class="fc">
						<label><span class="red">*</span>参数值：</label>
						<div class="emg">
							<input id="paramCsz" name="param.paramCsz" value="<@s.property value='param.paramCsz' />" type="text" class="w200" /> 
						</div>
						<div id="paramCszTip" class="tip"></div>
					</li>
					<li class="fc">
						<label>备注：</label>
						<div class="emg">
				    		<textarea id="paramBz" name="param.paramBz" rows="" class="w300"
							  style="height:120px;"><@s.property value="param.paramBz" /></textarea>
						</div>
					</li>
					<li class="fc">
						<label>&nbsp;</label>
						<div id="paramBzTip" class="tip"></div>
					</li>
				</ul>
			</div>
			<input type="hidden" name="param.paramId" value="<@s.property value='param.paramId' />" />
			<input type="hidden" name="url" value="<@s.property value='url' />" />
		</form>
	</div>
	<input type="hidden" id="hidOldParamYwmc" value="<@s.property value='param.paramYwmc' />" />
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
    <script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/validate/formValidator.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/validate/formValidatorRegex.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		var dg = frameElement.lhgDG;
		var curWin=dg.curWin;
		dg.addBtn( 'no', '取消', cancel);
		dg.addBtn( 'submit', '确定', checkSubmitForm);
		function cancel(){
			dg.cancel();
		}
		$(function(){
			$.formValidator.initConfig({errorFocus:true});
			var paramYwmc = $("#hidOldParamYwmc").val();
			$("#paramYwmc").formValidator({onShow:"",onFocus:"长度最多50个字符"})
			.inputValidator({max:50})
			.ajaxValidator({
				type:"post",
				async:true,
				url:"system/common/param/getExistByYwmc.shtml",
				success:function(data){
					if(checkAjaxRequestValidity(data)){
						if($.trim($("#paramYwmc").val())==$.trim(paramYwmc)){
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
				onError:"名称已存在，请更换",
				onWait:"正在检查名称唯一性，请稍后……"
			});
			$("#paramZwmc").formValidator({onShow:"",onFocus:"长度最多25个汉字(或50个字符)"}).inputValidator({max:50});
			$("#paramCsz").formValidator({onShow:"",onFocus:"长度最多125个汉字(或255个字符)"}).inputValidator({max:255});
			$("#paramBz").formValidator({empty:true,onShow:"",onFocus:"长度最多125个汉字(或255个字符)"}).inputValidator({max:255});
		});
		function checkSubmitForm(){
			var commonSuccess=$.formValidator.pageIsValid("1");
			if(commonSuccess==true){
				curWin.$.processInfo("信息正在提交,请稍候...",{parent:dg});
				$("#contentForm").submit();
			}
			return false;
		}
		//]]>
	</script>
  </body>
</html>