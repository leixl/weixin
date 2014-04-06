<@s.set name="emptyValue" value="''" />
<option value="">请选择</option>
<@s.iterator value="@com.juncsoft.portal.common.util.SectionUtil@ENUM.getAllList()" var="r">
	<@s.set name="hasSon" value="#r.children!=null&&#r.children.size()>0" />
	<option value="<@s.property value='(!#parent2Empty)?seId:!#hasSon?seId:#emptyValue' />"<@s.if test="#sectionValue==seId"> selected="selected"</@s.if>><@s.if test="#hasSon">⊿&nbsp;&nbsp;</@s.if><@s.else>┆┈</@s.else><@s.property value="seMc" /></option>
	<@s.if test="#hasSon">
		<@s.iterator value="#r.children" var="s">
			<@s.set name="hasGrandSon" value="#s.children!=null&&#s.children.size()>0" />
			<option value="<@s.property value='(!#parent2Empty)?seId:(!#hasGrandSon)?seId:#emptyValue' />"<@s.if test="#sectionValue==seId"> selected="selected"</@s.if>>┆&nbsp;&nbsp;&nbsp;&nbsp;<@s.if test="#hasGrandSon">⊿&nbsp;&nbsp;</@s.if><@s.else>┆┈</@s.else><@s.property value="seMc" /></option>
			<@s.if test="#hasGrandSon">
				<@s.iterator value="#s.children" var="gs">
					<option value="<@s.property value="seId" />"<@s.if test="#sectionValue==seId"> selected="selected"</@s.if>>┆&nbsp;&nbsp;&nbsp;&nbsp;┆&nbsp;&nbsp;&nbsp;&nbsp;┆┈<@s.property value="seMc" /></option>
				</@s.iterator>
			</@s.if>
		</@s.iterator>
	</@s.if>
</@s.iterator>