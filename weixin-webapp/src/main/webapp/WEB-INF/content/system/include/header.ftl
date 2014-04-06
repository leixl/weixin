<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>系统头部</title>
	<style type="text/css">
	body, ul,li,ol, p, h1{ list-style:none; margin:0; padding:0; font-size:12px;}
	.header{ height:56px; border-bottom:4px solid #1C5DB6; background:url(resource/system/images/header_bg.jpg) repeat-x;}
	.header h1{ width:260px; height:56px; float:left; text-indent:-9999px; overflow:hidden; background:url(resource/system/images/header_left.jpg) no-repeat;}
	.header .uifo{ height:56px; line-height:70px; overflow:hidden; float:left; padding-left:20px;}
	.header .uifo li{ float:left; font-size:14px; color:#FFF; margin-right:20px;}
	.header .uifo li a{ color:#FFF; text-decoration:none;}
	.header .uifo li a:hover{ color:#f60;}
	.header .tr{ width:268px; height:56px; float:right; background:url(resource/system/images/header_right.jpg) no-repeat;}
	</style>
  </head>
  
  <body>
	<div class="header">
		<h1>用户内容管理系统1.0</h1>
		<div class="uifo">
			<ul>
				<li><label>当前用户：</label><@s.property value="#session['systemUser'].urYhm" /></li>
				<li><a href="javascript:;" onclick="if(confirm('确实要退出系统吗？')){top.location.href='${basePath}user/login/logout.shtml';};return false;" title="退出系">退出系统</a></li>
			</ul>
		</div>
		<div class="tr"></div>
	</div>
  </body>
</html>