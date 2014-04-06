<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>编辑</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/popup.css" type="text/css" />
	<style type="text/css">
		<!--
		label{ float:left;}
		.blp li input{ float:left; margin:4px 0 0 5px;}
		.blp li span{ float:left; clear:none;}
		-->
	</style>
  </head>
  
  <body>
  	<div class="blp">
    	<form id="contentForm" action="system/editor/picture/update.shtml" method="post">
	        <ul>
	        	<li>
	        		<label>文件名称:</label><input id="epXsmc" name="picture.epXsmc"
	        	 	 value="<@s.property value='picture.epXsmc' />" size="40" maxlength="100" type="text" />
	        	 </li>
	        </ul>
	        <input type="hidden" name="url" value="<@s.property value='url' />" />
	        <input type="hidden" id="epId" name="picture.epId" value="<@s.property value='picture.epId' />" />
        </form>
	</div>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
    <script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
    <script type="text/javascript" src="resource/common/js/String.prototype.js"></script>
    <script type="text/javascript" src="resource/common/js/formUtil.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		var dg = frameElement.lhgDG;
		var curWin=dg.curWin;
		var curWin$=curWin.$;
		dg.addBtn( 'cancel', '取消', cancel );
		dg.addBtn( 'ok', '确定', submitForm );
		
		function checkMc(){
			var epId="<@s.property value='picture.epId' />";
			var oldDisName="<@s.property value='picture.epXsmc' />";
			var epXsmc=$("#epXsmc").val().trim();
			if((epId!=null&&epId>0)&&oldDisName.trim()==epXsmc){
		    	return true;
		    }
			var result=false;
			var epfId="<@s.property value='picture.epfId' />";
			$.ajax({
		        type: "POST",
		        url: "system/editor/picture/getExistByXsmc.shtml",
		        data: {"picture.epXsmc":epXsmc,"picture.epfId":epfId},
		        async: false,
		        success:function(bool){
		        	if(checkAjaxRequestValidity(bool)){
		        		if(bool=="true"){
			        		curWin$.alertInfo("新文件名称已经存在,请重新命名文件。",{onOk: function(){$("#epXsmc").focus()},parent:dg});
							result=false;
			        	}else{
			 				result=true;
			        	}
		        	}
		        }
		    });
			return result;
		}
		function submitForm() {
			if(!textLenIsOverstep("epXsmc",40)){
				curWin$.alertInfo("请填写文件名称,不得超出40字节(20个汉字)!<br \/><font color='red'>注:文件名以复件+数字结尾的文件是系统自动重命名的重复文件!</font>",{onOk:function(){$("#epXsmc").focus()},parent:dg});
				return false;
			}
			if(!checkMc()){
				return false;
			}
			curWin$.processInfo("信息正在提交,请稍候...",{parent:dg});
			$("#contentForm").submit();
		}
		function cancel() {
			dg.cancel();
		}
		//]]>
	</script>
  </body>
</html>