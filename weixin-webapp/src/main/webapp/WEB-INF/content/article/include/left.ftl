<div class="aleft">
	<@s.if test="!search">
		<@s.set name="sePid" value="@com.juncsoft.portal.common.util.SectionUtil@ENUM.get(#seId).sePid" />
		<@s.set name="sonSection" value="" />
		<@s.set name="grandSection" value="" />
		<h1><@s.property value='#topSection.seMc' /></h1>
		<#-- 根栏目 -->
	   	<@s.iterator value="@com.juncsoft.portal.common.util.SectionUtil@ENUM.getAll(#topSection.seId)" var="r">
	    	<@s.set name="hasSon" value="#r.children!=null&&#r.children.size()>0" />
			<@s.if test="#hasSon">
	 			<#-- 子栏目 -->
	 			<@s.iterator value="#r.children" var="s">
	  			<@s.set name="hasGrandSon" value="#s.children!=null&&#s.children.size()>0" />
	  			<p><a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(#s)' />" title="<@s.property value='seMc' />"<@s.if test="#seId==seId||#sePid==seId"><@s.set name="sonSection" value="#s" /> class="hoimg"</@s.if>><@s.property value='seMc' /></a></p>
	  			<@s.if test="#hasGrandSon">
	      			<#-- 子子栏目 -->
					<ul>
	   				<@s.iterator value="#s.children" var="gs">
	   					<li><a href="<@s.property value='@com.juncsoft.portal.common.util.SectionUtil@ENUM.getURL(#gs)' />" title="<@s.property value='seMc' />"<@s.if test="#seId==seId"><@s.set name="grandSection" value="#gs" /> class="hvimg"</@s.if>><@s.property value='@com.juncsoft.framework.util.text.StringUtils@subChineseText(seMc,24,"")' /></a></li>
	   				</@s.iterator>
	   				</ul>
	      		</@s.if>
				</@s.iterator>
			</@s.if>
		</@s.iterator>
	</@s.if>
	<@s.else>
		<h1>搜索结果</h1>
	</@s.else>
</div>
