<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>网页已过期</title>
  </head>
  
  <body>
  	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<!-- lhgdialog -->
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
  	<script type="text/javascript">
  		//<![CDATA[
  		var dg=null;
		if(frameElement){
			dg=frameElement.lhgDG;
		}
  		function back() {
  			window.history.go(-1);
  		}
  		$(function(){
  			$.errorInfo("网页已过期！点击“确定”返回原页面！<br \/><b style='color:red;'>注：返回原页面后请您刷新原页面重试！<\/b>", {onOk: back, parent: dg});
  		});
 		//]]>
  	</script>
  </body>
</html>
