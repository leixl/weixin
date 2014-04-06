<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>移动</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/popup.css" type="text/css" />
  </head>
  
  <body>
	<div class="llp">
		<ul>
			<li>
				<b>文件移动到:&nbsp;</b>
				<select id="folderSelect">
					<option value="">请选择</option>
				</select>
			</li>
		</ul>
	</div>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
    <script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		var dg = frameElement.lhgDG;
		var curWin=dg.curWin;
		var curWin$=curWin.$;
		dg.addBtn( 'cancel', '取消', cancel );
		dg.addBtn( 'ok', '确定', submitForm );
		$(function(){
			$.ajax({
	            type: "POST",
	            dataType: "json",
	            url: "system/editor/picture/folder/listOptions.shtml",
	            success:function(data){
					if(checkAjaxRequestValidity(data)){
						var elements=$("#folderSelect");
						elements.attr("length",1);
		            	$.each(data, function(i,obj){
		            		var text=obj.epfMc;
		            		var value=obj.epfId;
						    elements.append("<option value='"+value+"'>"+text+"<\/option>");
						});
					}
	            }
	        });
		});
		
		function submitForm() {
			if($("#folderSelect").val()==""){
				curWin$.alertInfo("请选择文件夹!", {onOk: function(){$("#folderSelect").focus()}, parent: dg});
				return false;
			}
			curWin.updateMove($("#folderSelect").val(),dg);
		}
		function cancel() {
			dg.cancel();
		}
		//]]>
	</script>
  </body>
</html>