<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>登录提示</title>
  </head>  
  <body>
  	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<!-- lhgcore  -->
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		var dg=null;
		if(frameElement){
			dg=frameElement.lhgDG;
		}
		function toLogin(){
			var url="${basePath}system/";
			if(top){
				top.location.href=url;
			}else if(parent){
				parent.location.href=url;
			}else{
				window.location.href=url;
			}
		}
  		$(function(){
	  		$.alertInfo('无效的登录，请您登录之后进行操作！', {onOk: toLogin, parent: dg});
	  		setTimeout(toLogin, 3000);
  		});
  		//]]>
  	</script>
  </body>
</html>