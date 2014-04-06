<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>发布</title>
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
    	<form id="contentForm" action="system/editor/picture/folder/save.shtml" method="post">
	        <ul>
	        	<li>
		        	<label>文件夹名称:</label>
		        	<input id="epfMc" name="folder.epfMc"
		        	 value="<@s.property value='folder.epfMc' />" size="40" maxlength="100" type="text" />
	        	</li>
	        </ul>
	        <input type="hidden" name="url" value="<@s.property value='url' />" />
	        <input type="hidden" id="epfId" name="folder.epfId" value="<@s.property value='folder.epfId' />" />
        	<@s.token></@s.token>
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
			var epfId="<@s.property value='folder.epfId' />";
			var oldepfMc="<@s.property value='folder.epfMc' />";
			var epfMc=$("#epfMc").val().trim();
			if((epfId!=null&&epfId>0)&&oldepfMc.trim()==epfMc){
		    	return true;
		    }
			var result=false;
			$.ajax({
		        type: "POST",
		        url: "system/editor/picture/folder/getExistByMc.shtml",
		        data: {"folder.epfMc":epfMc},
		        async: false,
		        success:function(bool){
		        	if(checkAjaxRequestValidity(bool)){
		        		if(bool=="true"){
							curWin$.alertInfo("新文件夹名称已经存在,请重新命名文件夹。",{onOk:function(){$("#epfMc").focus()},parent:dg});
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
			if(!textLenIsOverstep("epfMc",50)){
				curWin$.alertInfo("请填写文件夹名称,不得超出50字节(25个汉字)!",{onOk: function(){$("#epfMc").focus()},parent:dg});
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