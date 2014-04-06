<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
<@s.if test="seId!=null">
	<@s.set name="seId" value="seId" />
	<@s.set name="topSection" value="@com.juncsoft.portal.common.util.SectionUtil@ENUM.getTop(#seId)" />
</@s.if>
<@s.set name="defaultKeyword" value="'请输入搜索关键字'"/>
<form action="article/list.shtml"
	 onsubmit="var defKeyword='<@s.property value="#defaultKeyword" />';var dom=document.getElementById('keyword');if(dom.value==''||dom.value==defKeyword){alert(defKeyword);dom.focus();return false;}return true;">
	<div id="header">
		<div class="logo"></div>
		<div class="right">
			<div class="home">
				<a href="javascript:;" onclick="addFavorite();return false;">加入收藏</a>|<a href="javascript:;" onclick="setHomePage(this);return false;">设为首页</a>
			</div>
			<div class="serch">
				<input id="keyword" name="vo.keyword" value="<@s.property value='(vo==null||vo.keyword==null||vo.keyword.equals(""))?#defaultKeyword:vo.keyword' />"
				 onfocus="if(this.value=='<@s.property value="#defaultKeyword" />')this.value='';"
				 onblur="if(!value)value='<@s.property value="#defaultKeyword" />';"
				  title="<@s.property value='#defaultKeyword' />" class="inp" type="text" />
				<input value="&nbsp;" class="but" title="搜索" type="submit" />
			</div>
		</div>
	</div>
</form>
<div id="nav">
	<a href="${basePath}"<@s.if test="!search&&(#seId==null||#seId=='')"> class="hovimg"</@s.if>>首页</a>
	<@s.iterator value="@com.juncsoft.portal.common.util.SectionUtil@ENUM.getTopList()">
		<a href="<@s.property value='seUrl' />"<@s.if test="#topSection.seId==seId"> class="hovimg"</@s.if>><@s.property value='seMc' /></a>
	</@s.iterator>
</div>
<script type="text/javascript">
	//<![CDATA[
	function addFavorite(){var url=window.location;var title=document.title;try{window.external.addFavorite(url,title)}catch(e){try{window.sidebar.addPanel(title,url,"")}catch(e){alert("浏览器不支持此操作，请您使用Ctrl+D进行添加！")}}}function setHomePage(obj){var url=window.location;try{obj.style.behavior='url(#default#homepage)';obj.setHomePage(url)}catch(e){if(window.netscape){try{netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect")}catch(e){alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。")}var prefs=Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);prefs.setCharPref('browser.startup.homepage',url)}else{alert("浏览器不支持此操作，请您手动在浏览器设置中设置主页！")}}}
	//]]>
</script>