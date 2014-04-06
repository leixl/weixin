<div class="detail">
	<ul class="list">
		<@s.if test="!search">
			<@s.iterator value="pager.pageList">
			<li>
				<em>[<@s.date name="AT_FBRQ" format="yyyy-MM-dd" />]</em>
				<a href="article/<@s.property value='AT_ID' />/"><@s.property value="AT_MC" /></a>
			</li>
			</@s.iterator>
		</@s.if>
		<@s.else>
			<@s.iterator value="pager.pageList">
			<li>
				<em>[<@s.date name="AT_FBRQ" format="yyyy-MM-dd" />]</em>
				<a href="<@s.property value='@com.juncsoft.portal.article.util.ArticleUtil@ENUM.getURL(AT_ID,SE_ID)' />"><@s.property value="AT_MC" /></a>
			</li>
			</@s.iterator>
		</@s.else>
	</ul>
	<#include "../../../common/pagination.ftl" />
</div>