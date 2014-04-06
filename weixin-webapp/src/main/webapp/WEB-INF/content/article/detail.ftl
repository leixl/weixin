<@s.if test="!search">
	<@s.if test="atId!=null">
		<@s.set name="title" value="article.AT_MC" />
	</@s.if>
	<@s.else>
		<@s.set name="title" value="@com.juncsoft.portal.common.util.SectionUtil@ENUM.get(seId).seMc" />
	</@s.else>
</@s.if>
<@s.else>
	<@s.set name="title" value="vo.keyword+' 搜索结果'" />
</@s.else>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@s.property value='#title' />_<@s.property value="@com.juncsoft.portal.common.util.ParamUtil@ENUM.getCszByYwmc('PARAM_APP_TITLE')" /></title>
	<link href="resource/css/styles.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
    <div id="topbg">
	  	<#include "../include/header.ftl" />
	  	<div id="about">
		  	<#include "include/left.ftl" />
		  	<div class="aright">
		  		<#include "include/path.ftl" />
		  		<#include "include/content/${seNrzsfs}.ftl" />
		    </div>
		</div>
    	<#include "../include/footer.ftl" />
	</div>
  </body>
</html>