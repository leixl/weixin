<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>加载flash异常</title>
  </head>
  
  <body>
  	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<!-- lhgdialog -->
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
  	<script type="text/javascript">
  		//<![CDATA[
  		$(function(){
	  		var url="common/prompt/flashCheck.shtml";
	  		$.pageDialog(url, "加载flash异常", {
	  			id:"flashCheck",
	  			width:500, 
				height:200
	  		});
  		});
		//]]>
  	</script>
  </body>
</html>