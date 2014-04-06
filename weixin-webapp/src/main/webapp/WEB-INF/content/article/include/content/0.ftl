<div class="detail">
	<ul class="title">
		<li>
			<h1><@s.property value="article.AT_MC" /></h1>
		</li>
		<@s.if test="atId!=null">
		<li class="info">
			<@s.if test="article.AT_ZZ!=null&&!article.AT_ZZ.equals('')">
			<span>作者：<@s.property value="article.AT_ZZ" />&nbsp;&nbsp;</span>
			</@s.if>
			<span>发布时间：<@s.date name="article.AT_FBRQ" format="yyyy-MM-dd" /></span>
		</li>
		</@s.if>
	</ul>
	<@s.if test="article.AT_NRZY!=null&&!article.AT_NRZY.equals('')">
	<p class="introduction"><@s.property value="article.AT_NRZY" /></p>
	</@s.if>
	<div class="content">
		<@s.property value="article.AT_NR" escape="false" />
	</div>
</div>
<script type="text/javascript">
   //<![CDATA[
	var xmlHttp;
	if(window.XMLHttpRequest){xmlHttp=new XMLHttpRequest();}else if(window.ActiveXObject){xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");}
	xmlHttp.open("GET", "article/stat/updateDjs.shtml?atId=<@s.property value='article.AT_ID' />");
	xmlHttp.send(null);
	//]]>
</script>