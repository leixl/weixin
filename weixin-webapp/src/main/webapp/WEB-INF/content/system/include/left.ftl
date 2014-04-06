<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>左侧菜单</title>
	<style type="text/css">
		<!--
		body, ul,li,ol, p, h2, td{ list-style:none; margin:0; padding:0; font-size:12px;}
		body{ background:url(resource/system/images/menu_bg.jpg) repeat-y;}
		.nav{ width:170px; text-align:center;}
		.nav h2{ width:160px; height:25px; margin:5px auto 8px; text-indent:-9999px; overflow:hidden; background:url(resource/system/images/nt.jpg) no-repeat;}
		.nav .menu_box{ width:150px; margin:0 auto;}
		.nav .menu_box p{ height:22px; line-height:22px; text-align:left; padding-left:20px; cursor:pointer; background:url(resource/system/images/menu_bt.jpg) no-repeat;}
		.nav .menu_box p a{ color:#000; text-decoration:none;}
		.nav .menu_body{ display:none; padding:3px 0;}
		.nav .menu_body a{ display:block; clear:both; height:22px; line-height:22px; text-align:left; padding-left:24px; text-decoration:none; color:#333; background:url(resource/system/images/menu_icon.gif) no-repeat 10px 6px;}
		.nav .menu_body a:hover{ color:#f60;}
		.nav .line{ margin-bottom:2px;}
		.nav .menu_body .nonce{ color:#FF0000;}
		.nav .ns{ padding:0; border:none;}
		-->
	</style>
  </head>
	
  <body>
	<div class="nav">
		<h2>管理菜单</h2>	
		<div class="menu_box">
			<div id="firstpane">
				<p class="menu_head">系统管理</p>
				<div class="menu_body">
					<a href="system/common/section/list.shtml" target="main" title="栏目管理">栏目管理</a>
					<a href="system/user/list.shtml" target="main" title="用户管理">用户管理</a>
					<a href="system/user/password/edit.shtml" target="main" title="修改密码">修改密码</a>
				</div>
				<div class="line"></div>
				<p class="menu_head">资讯管理</p>
				<div class="menu_body">
					<a href="system/article/list.shtml" target="main" title="文章管理">文章管理</a>
				</div>
				<div class="line"></div>
			</div>
		</div>
	</div>
	<script src="resource/plugin/jquery/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
		//<![CDATA[
		$(function(){
			$("#firstpane p.menu_head").click(function(){
				$(this).css({backgroundImage:"url(resource/system/images/menu_bt.jpg)"}).next("div.menu_body").slideToggle(100).siblings("div.menu_body").slideUp("slow");
		       	$(this).siblings(".menu_head").css({backgroundImage:"url(resource/system/images/menu_bt.jpg)"});		
			});
		});
		$.extend($.fn, {
			menuTree: function(o, callback) {
				// Default parameters
				if (!o) var o = {};
				o.data = this.html();
				if (o.menuEvent == undefined) o.menuEvent = 'click';
			}
		});
		$(function(){
			$('#firstpane').menuTree();	
			$.extend($.fn, {
				replaceClass : function(c1,c2){
					return this.filter('.' + c1).removeClass(c1).addClass(c2).end();
				}
			});
			$(".menu_body a").each(function(){
				$(this).click(function(){
					$(".menu_body a.nonce").replaceClass('nonce','child');
					$(this).replaceClass('child','nonce');						
				});        
			}); 
			$(".menu_body a").addClass("child");
		});
		//]]>
	</script>
  </body>
</html>
