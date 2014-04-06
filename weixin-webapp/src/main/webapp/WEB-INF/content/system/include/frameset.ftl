<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title><@s.property value="@com.juncsoft.portal.common.util.ParamUtil@ENUM.getCszByYwmc('PARAM_APP_TITLE')" /></title>
  </head>
  <frameset id="index" rows="60px,*">
	<noframes>
	    <body>Your browser does not handle frames!</body>
	</noframes>
	<frame id="header" name="header" src="system/header.shtml" scrolling="no" noresize="noresize" frameborder="0" />
	<frameset id="mainframeset" cols="170px,*" style="border: 0px;">
	   <frame id="menu" name="menu" src="system/left.shtml" frameborder="0" scrolling="auto" />
	   <frame id="main" name="main" src="system/main.shtml" frameborder="0"/>
	</frameset>
  </frameset>
</html>