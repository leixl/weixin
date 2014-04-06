<@s.set name="isArticleDetail" value="atId!=null" />
<p>
	当前位置： 
	<@s.if test="!search">
		<a href="${basePath}">首页</a> &gt; 
		<@s.if test="#isArticleDetail||#sonSection!=null"><a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(#topSection)' />"><@s.property value="#topSection.seMc" /></a></@s.if>
		<@s.else>
			<@s.property value="#topSection.seMc" />
		</@s.else>
		<@s.if test="#sonSection!=null"> &gt; 
			<@s.if test="#isArticleDetail||#grandSection!=null"><a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(#sonSection)' />"><@s.property value="#sonSection.seMc" /></a></@s.if>
			<@s.else>
				<@s.property value="#sonSection.seMc" />
			</@s.else>
		</@s.if>
		<@s.if test="#grandSection!=null"> &gt; 
			<@s.if test="#isArticleDetail"><a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(#grandSection)' />"><@s.property value="#grandSection.seMc" /></a></@s.if>
			<@s.else>
				<@s.property value="#grandSection.seMc" />
			</@s.else>
		</@s.if>
		<@s.if test="#isArticleDetail"> &gt; 详情</@s.if>
	</@s.if>
	<@s.else>
		搜索结果
	</@s.else>
</p>