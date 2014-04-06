<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>登录跳转</title>
  </head>  
  <body>
	<script type="text/javascript">
		//<![CDATA[
		var url="${basePath}member/";
		if(top){
			top.location.href=url;
		}else if(parent){
			parent.location.href=url;
		}else{
			window.location.href=url;
		}
  		//]]>
  	</script>
  </body>
</html>
