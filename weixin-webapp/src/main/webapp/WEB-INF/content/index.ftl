<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><@s.property value="@com.juncsoft.portal.common.util.ParamUtil@ENUM.getCszByYwmc('PARAM_APP_TITLE')" /></title>
	<link href="resource/css/styles.css" rel="stylesheet" type="text/css" />
  </head>
  <@s.set name="UPLOAD_TYPE_ARTICLE" value="@com.juncsoft.portal.common.util.ImageConstants@UPLOAD_TYPE_ARTICLE" />
  <body>
	<div id="topbg">
	  	<#include "include/header.ftl" />
		<div id="focus">
			<ul>
				<li><a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(1)' />"><img src="resource/images/banner/banner1.jpg" alt=""></img></a></li>
			   	<li><a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(2)' />"><img src="resource/images/banner/banner2.jpg" alt=""></img></a></li> 
			   	<li><a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(3)' />"><img src="resource/images/banner/banner3.jpg" alt=""></img></a></li>
			</ul>
		</div>
	  	<div id="gd">
	  		<a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(13)' />">发展历程</a>
	  		<a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(14)' />">公司文化</a>
	  		<a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(15)' />">荣誉与资质</a>
	  		<a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(5)' />">联系我们</a>
	  	</div>
		<div id="box">
			<div class="bleft">
				<h1><a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(11)' />">详情 >></a>公司简介</h1>
		    	<div class="picBox">
					<div class="pic">
						<img src="<@s.property value='@com.juncsoft.portal.common.util.ImagePathUtil@ENUM.getImageURL(#UPLOAD_TYPE_ARTICLE, article.AT_ID, "", article.AT_TPMC)' />" alt="" /><b class="fill">&nbsp;</b>
		     		</div>
		     	</div>
		     	<p><@s.property value="article.AT_NRZY" /></p>
			</div>
		    <div class="bright">
		    	<div class="mar">
		        	<a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(4)' />" class="more">更多 >></a><h1>动态新闻</h1>
			        <ul>
			        	<@s.iterator value="articleList">
			        	<li>
			        		<em>[<@s.date name="AT_FBRQ" format='yyyy-MM-dd' />]</em>
			        		<a href="article/<@s.property value='AT_ID' />/" title="<@s.property value='AT_MC' />"><@s.property value="@com.juncsoft.framework.util.text.StringUtils@subChineseText(AT_MC,38,'...')" /></a>
			        	</li>
		  				</@s.iterator>
			        </ul>
				</div>
			</div>
		</div>
		<#include "include/footer.ftl" />
	</div>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		$(function(){
			var sWidth=$("#focus").width();
			var len=$("#focus ul li").length;
			var index=0;
			var picTimer;
			var btn="<div class='btnBg'><\/div><div class='btn'>";
			for(var i=0;i<len;i++){
				btn+="<span><\/span>";
			}
			btn+="<\/div><div class='preNext pre'><\/div><div class='preNext next'><\/div>";
			$("#focus").append(btn);
			$("#focus .btnBg").css("opacity",0);
			$("#focus .btn span").css("opacity",0.4).mouseenter(function(){
				index = $("#focus .btn span").index(this);
				showPics(index);
			}).eq(0).trigger("mouseenter");
			$("#focus .preNext").css("opacity",0).hover(function(){
				$(this).stop(true,false).animate({"opacity":"0.5"},300);
			},function(){
				$(this).stop(true,false).animate({"opacity":"0"},300);
			});
			$("#focus .pre").click(function(){
				index-=1;
				if(index==-1){index=len-1;}
				showPics(index);
			});
			$("#focus .next").click(function(){
				index+=1;
				if(index==len){index=0;}
				showPics(index);
			});
			$("#focus ul").css("width",sWidth*(len));
			$("#focus").hover(function(){
				clearInterval(picTimer);
			},function(){
				picTimer=setInterval(function(){
					showPics(index);
					index++;
					if(index==len){index=0;}
				},3000);
			}).trigger("mouseleave");
			function showPics(index){
				var nowLeft=-index*sWidth;
				$("#focus ul").stop(true,false).animate({"left":nowLeft},300);
				$("#focus .btn span").stop(true,false).animate({"opacity":"0.4"},300).eq(index).stop(true,false).animate({"opacity":"1"},300);
			}
		});
		//]]>
	</script>
	<!--[if lt IE 7]>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.autosize.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		$(function(){
			$(".pic img").autosize();
		});
		//]]>
	</script>
	<![endif]-->
  </body>
</html>