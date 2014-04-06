<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>信息被锁定</title>
  </head>
  <body>
  	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<!-- lhgdialog -->
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
  	<script type="text/javascript">
  		//<![CDATA[
  		$(function(){
  			var dg=null;
			if(frameElement){
				dg=frameElement.lhgDG;
			}
  			$.errorInfo("您当前操纵的信息被锁定,操纵失败!", {onOk: function(){window.history.back()}, parent: dg});
  		});
  		//]]>
  	</script>
  </body>
</html>