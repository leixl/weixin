<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>权限不足</title>
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
		/**for dialog*/
		function dgLocationReload(){
			dg.cancel();
		}
		/**for normal page*/
		function updatePageLocation(){
			window.history.go(-1);
		}
		$(function(){
	  		var msg='权限不足，请与管理员联系!';
	  		if(dg){
				$.alertInfo(msg, {onOk: dgLocationReload, parent: dg});
			}else{
				$.alertInfo(msg, {onOk: updatePageLocation, parent: dg});
			}
	  	});
  		//]]>
  	</script>
  </body>
</html>