<@s.set name="UPLOAD_TYPE_ARTICLE" value="@com.juncsoft.portal.common.util.ImageConstants@UPLOAD_TYPE_ARTICLE" />
<div class="product">
	<@s.iterator value="pager.pageList">
	<ul>
		<li class="jt">
			<div class="pic">
				<a href="article/<@s.property value='AT_ID' />/"><img src="<@s.property value='@com.juncsoft.portal.common.util.ImagePathUtil@ENUM.getImageURL(#UPLOAD_TYPE_ARTICLE, AT_ID, "", AT_TPMC)' />" alt="" /><b class="fill">&nbsp;</b></a>
			</div>
		</li>
		<li class="txt">
      		<h1><@s.property value="AT_MC" /></h1>
			<p class="pp"><@s.property value="AT_NRZY" /></p>
           	<p><a href="article/<@s.property value='AT_ID' />/"><img src="resource/images/view.gif" alt="" /></a></p>
       	</li>
	</ul>
	</@s.iterator>
	<#include "../../../common/pagination.ftl" />
</div>
<!--[if lt IE 7]>
<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
<script type="text/javascript" src="resource/plugin/jquery/jquery.autosize.js"></script>
<script type="text/javascript">
	//<![CDATA[
	$(function(){
		$(".pic img").autosize();
	});
	//]]>
</script>
<![endif]-->