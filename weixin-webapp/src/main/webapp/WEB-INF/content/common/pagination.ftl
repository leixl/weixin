<#--in pager-->
<@s.set name="pager_path" value="pager.path" />
<@s.set name="pager_param" value="pager.param" />
<@s.set name="pager_count" value="pager.count" />
<@s.set name="pager_pageSize" value="pager.pageSize" />
<@s.set name="pager_pageTotal" value="pager.pageTotal" />
<#--in action-->
<@s.set name="pageSEOPrefix" value="pageSEOPrefix" />
<@s.set name="pageSEOExt" value="pageSEOExt" />
<@s.set name="pageSEOView" value="pageSEOView" />
<@s.set name="pageSearchView" value="pageSearchView" />
<#--init default-->
<@s.if test="#pageHrefNumber==null||#pageHrefNumber.equals('')">
	<@s.set name="pageHrefNumber" value="(#pageSEOView) ? 2 : 2" />
</@s.if>
<@s.if test="#pageSkin==null||#pageSkin.equals('')">
	<@s.set name="pageSkin" value="(#pageSEOView) ? 'default' : 'default'" />
</@s.if>
<@s.if test="#pageShowExplain==null||#pageShowExplain.equals('')">
	<@s.set name="pageShowExplain" value="(#pageSEOView) ? false : true" />
</@s.if>
<@s.if test="#pageShowSizeSetting==null||#pageShowSizeSetting.equals('')">
	<@s.set name="pageShowSizeSetting" value="false" />
</@s.if>
<@s.set name="pager_isAjaxGrid" value="(#pageAjaxGridId!=null&&!#pageAjaxGridId.equals('')) ? true : false" />
<@s.set name="pager_isHideHrefNumber" value="(#pageHrefNumber==0) ? true : false" />
<@s.set name="pager_clientId" value="@java.lang.System@currentTimeMillis()" />
<p id="pages_<@s.property value='#pager_clientId' />" class="pages_<@s.property value='#pageSkin' />">
	<input id="pageAjaxGridId_<@s.property value='#pager_clientId' />" value="<@s.property value='#pageAjaxGridId' />" type="hidden" />
	<input id="pager_path_<@s.property value='#pager_clientId' />" value="<@s.property value='#pager_path' />" type="hidden" />
	<input id="pager_param_<@s.property value='#pager_clientId' />" value="<@s.property value='#pager_param' />" type="hidden" />
	<input id="pageSEOView_<@s.property value='#pager_clientId' />" value="<@s.property value='#pageSEOView' />" type="hidden" />
	<input id="pageSearchView_<@s.property value='#pager_clientId' />" value="<@s.property value='#pageSearchView' />" type="hidden" />
	<input id="pageSEOPrefix_<@s.property value='#pager_clientId' />" value="<@s.property value='#pageSEOPrefix' />" type="hidden" />
	<input id="pageSEOExt_<@s.property value='#pager_clientId' />" value="<@s.property value='#pageSEOExt' />" type="hidden" />
	<script type="text/javascript">
		var pager_skin_cssId="pagerCss_<@s.property value='#pageSkin' />";
		var pager_skin_cssTag=document.getElementById(pager_skin_cssId);
	　　if(!pager_skin_cssTag){
			var css=document.createElement("link");
		　　css.href="resource/common/css/pager/<@s.property value='#pageSkin' />.css";
		　　css.rel="stylesheet";
		　　css.type="text/css";
		　　css.id=pager_skin_cssId;
			document.getElementsByTagName("head")[0].appendChild(css);
		}
		function pager_path_getFullURL(pager_clientId,page,pageSize){
			var pager_path=document.getElementById("pager_path_"+pager_clientId).value;
			var pager_param=document.getElementById("pager_param_"+pager_clientId).value;
			var pageSEOView=document.getElementById("pageSEOView_"+pager_clientId).value;
			var pageSearchView=document.getElementById("pageSearchView_"+pager_clientId).value;
			var pageSEOPrefix=document.getElementById("pageSEOPrefix_"+pager_clientId).value;
			var pageSEOExt=document.getElementById("pageSEOExt_"+pager_clientId).value;
			var url = "";
			if (pageSEOView == "true") {//SEO分页路径
				var fullURL = "";
				fullURL += pager_path;
				if (pageSearchView == "false") {// 前缀+页码+扩展
					if (page >= 2) { // 第二页开始加页码
						fullURL += pageSEOPrefix+page+pageSEOExt;
					}
				}else{// 仅当搜索的时候加参数
					var paramSign = (fullURL.indexOf("?") == -1) ? "?" : "&";
					fullURL += paramSign+"page="+page+pager_param;
				}
				url = fullURL;
			}else{//普通分页路径
				var paramSign = "";
				if (pager_param != null && pager_param != "") {
					paramSign = (pager_path.indexOf("?") == -1) ? "?" : "&"
					pager_path += paramSign;
					pager_path += pager_param.replace("&","");
				}
				if (page != 1) {
					paramSign = (pager_path.indexOf("?") == -1) ? "?" : "&";
					pager_path += paramSign;
					pager_path +="page="+page;
				}
				if (pageSize) {
					paramSign = (pager_path.indexOf("?") == -1) ? "?" : "&";
					pager_path += paramSign;
					pager_path +="pageSize="+pageSize;
				}
				url = pager_path;
			}
			return url.replace(new RegExp("&amp;","g"),"&");
		}
		function pager_jump_go(pager_clientId,page,pageSize) {
			var url = pager_path_getFullURL(pager_clientId,page,pageSize);
			var pageAjaxGridId=document.getElementById("pageAjaxGridId_"+pager_clientId).value;
			if(pageAjaxGridId!=""){
				pager_ajaxGrid_load(pageAjaxGridId,url);
			}else{
				window.location=url;
			}
		}
		function pager_ajaxGrid_load(pageAjaxGridId,url,data,method){
			$.ajax({
	            type: method || "GET",
	            url: url,
	            data: data,
	            success:function(result){
	            	if(checkAjaxRequestValidity(result)){
	            		$("#"+pageAjaxGridId+"").html(result);
	            	}
	            }
	        });
		}
		function pager_search(pageAjaxGridId,form){
			pager_ajaxGrid_load(pageAjaxGridId,form.action,$(form).serializeArray(),form.method);
			return false;
		}
	</script>
	<@s.set name="pager_hasData" value="#pager_count>0" />
	<#--over pageTotal-->
	<@s.if test="#pager_hasData && #pager_pageTotal >= 1 && page > #pager_pageTotal">
		<script type="text/javascript">
			pager_jump_go('<@s.property value="#pager_clientId" />',<@s.property value='#pager_pageTotal' />);
		</script>
	</@s.if>
	<@s.elseif test="#pager_hasData && page < 1">
		<script type="text/javascript">
			pager_jump_go('<@s.property value="#pager_clientId" />',1);
		</script>
	</@s.elseif>
	<#--no data-->
	<@s.elseif test="!#pager_hasData">
		<center><span style="align:center;">共找到符合条件的信息<font style="font-size: 15px;color: #ff0000;" > 0</font>条!</span></center>
	</@s.elseif>
	<@s.else>
		<#--init toolbar-->
		<@s.set name="pager_toolbar_begin" value="1" />
		<@s.set name="pager_toolbar_end" value="1" />
		<@s.if test="page < #pageHrefNumber + 1">
			<@s.set name="pager_toolbar_begin" value="1" />
			<@s.set name="pager_toolbar_end" value="#pageHrefNumber*2 + 1" />
		</@s.if>
		<@s.else>
			<#--after not enough-->
			<@s.if test="#pager_pageTotal - page < #pageHrefNumber">
				<#--get the difference-->
				<@s.set name="pager_toolbar_diff" value="(#pager_pageTotal - page) - #pageHrefNumber" />
				<#--get the pager_toolbar_begin and make up-->
				<@s.set name="pager_toolbar_begin" value="(page - #pageHrefNumber) + #pager_toolbar_diff" />
			</@s.if>
			<@s.else>
				<@s.set name="pager_toolbar_begin" value="page - #pageHrefNumber" />
			</@s.else>
			<@s.set name="pager_toolbar_end" value="page + #pageHrefNumber" />
		</@s.else>
		<@s.set name="pager_toolbar_listStr" value="''" />
		<#--front-->
		<@s.bean name="org.apache.struts2.util.Counter">
		   	<@s.param name="first" value="(#pager_toolbar_begin)>=1?#pager_toolbar_begin:1" />
		   	<@s.param name="last" value="page-1" />
		   	<@s.iterator id="bar">
		   	 	<@s.set name="pager_toolbar_listStr" value="#pager_toolbar_listStr+#bar+','" />
		   	</@s.iterator>
		</@s.bean>
		<#--current-->
		<@s.set name="pager_toolbar_listStr" value="#pager_toolbar_listStr+page+','" />
		<#--after-->
		<@s.bean name="org.apache.struts2.util.Counter">
		   	<@s.param name="first" value="page + 1" />
		   	<@s.param name="last" value="(#pager_toolbar_end>#pager_pageTotal)?#pager_pageTotal:(#pager_toolbar_end)" />
		   	<@s.iterator id="bar">
		   	 	<@s.set name="pager_toolbar_listStr" value="#pager_toolbar_listStr+#bar+','" />
		   	</@s.iterator>
		</@s.bean>
		<@s.set name="pager_toolbar_array" value="" />
		<@s.if test="#pager_toolbar_listStr!=null&&!#pager_toolbar_listStr.equals('')">
			<@s.set name="pager_toolbar_listStr" value="#pager_toolbar_listStr.substring(0, #pager_toolbar_listStr.length()-1)" />
			<@s.set name="pager_toolbar_array" value="#pager_toolbar_listStr.split(',')" />
		</@s.if>
		<@s.set name="pager_toolbar_array_length" value="#pager_toolbar_array.length" />
		<@s.set name="pager_toolbar_first" value="#pager_toolbar_array[0]" />
		<@s.set name="pager_toolbar_last" value="#pager_toolbar_array[#pager_toolbar_array_length-1]" />
		<@s.if test="#pager_toolbar_first > 1">
			<@s.if test="!#pager_isAjaxGrid">
				<a href="<@s.property value='@com.juncsoft.framework.util.web.PagerUtil@getFullURL(1, #pager_pageSize, #pager_path, #pager_param, #pageSEOView,
				 #pageSearchView, #pageSEOPrefix, #pageSEOExt, #pageShowSizeSetting)' />">首页</a>
				<a href="<@s.property value='@com.juncsoft.framework.util.web.PagerUtil@getFullURL(page-1, #pager_pageSize, #pager_path, #pager_param, #pageSEOView,
				 #pageSearchView, #pageSEOPrefix, #pageSEOExt, #pageShowSizeSetting)' />">上一页</a>
			</@s.if>
			<@s.else>
				<a href="javascript:;" onclick="pager_jump_go('<@s.property value="#pager_clientId" />',1);return false;">首页</a>
				<a href="javascript:;" onclick="pager_jump_go('<@s.property value="#pager_clientId" />',<@s.property value='page-1' />);return false;">上一页</a>
			</@s.else>
			<@s.if test="!#pager_isHideHrefNumber"><span>...</span></@s.if>
		</@s.if>
		<@s.if test="!#pager_isHideHrefNumber">
			<@s.bean name="org.apache.struts2.util.Counter">
				<@s.param name="first" value="0" />
				<@s.param name="last" value="#pager_toolbar_array_length-1" />
				<@s.iterator status="index">
					<@s.set name="pager_toolbar_current" value="#pager_toolbar_array[#index.index]" />
			      	<@s.if test="page == #pager_toolbar_current">
						<span class="current"><a href="javascript:;"><@s.property value="#pager_toolbar_current" /></a></span>
			      	</@s.if>
			      	<@s.else>
			          	<@s.if test="!#pager_isAjaxGrid">
			              	<a href="<@s.property value='@com.juncsoft.framework.util.web.PagerUtil@getFullURL(#pager_toolbar_current, #pager_pageSize, #pager_path, #pager_param, #pageSEOView,
			              	 #pageSearchView, #pageSEOPrefix, #pageSEOExt, #pageShowSizeSetting)' />"><@s.property value='#pager_toolbar_current' /></a>
			          	</@s.if>
			      	  	<@s.else>
			      	  	  	<a href="javascript:;" onclick="pager_jump_go('<@s.property value="#pager_clientId" />',<@s.property value='#pager_toolbar_current' />);return false;"><@s.property value='#pager_toolbar_current' /></a>
			      	  	</@s.else>
			      	</@s.else>
			   	</@s.iterator>
			</@s.bean>
		</@s.if>
		<@s.if test="#pager_toolbar_last < #pager_pageTotal">
			<@s.if test="!#pager_isHideHrefNumber"><span>...</span></@s.if>
				<@s.if test="!#pager_isAjaxGrid">
					<a href="<@s.property value='@com.juncsoft.framework.util.web.PagerUtil@getFullURL(page+1, #pager_pageSize, #pager_path, #pager_param, #pageSEOView, 
					#pageSearchView, #pageSEOPrefix, #pageSEOExt, #pageShowSizeSetting)' />">下一页</a>
				</@s.if>
	      	  	<@s.else>
					<a href="javascript:;" onclick="pager_jump_go('<@s.property value="#pager_clientId" />',<@s.property value='page+1' />);return false;">下一页</a>
				</@s.else>
		</@s.if>
		<#--not for SEO-->
		<@s.if test="#pageShowSizeSetting && !#pageSEOView">
			<span>每页
			<select onchange="pager_jump_go('<@s.property value="#pager_clientId" />',<@s.property value='page' />, this.value);">
				<option value="10"<@s.if test="#pager_pageSize==10"> selected="selected"</@s.if>>10</option>
				<option value="20"<@s.if test="#pager_pageSize==20"> selected="selected"</@s.if>>20</option>
				<option value="30"<@s.if test="#pager_pageSize==30"> selected="selected"</@s.if>>30</option>
				<option value="40"<@s.if test="#pager_pageSize==40"> selected="selected"</@s.if>>40</option>
				<option value="50"<@s.if test="#pager_pageSize==50"> selected="selected"</@s.if>>50</option>
			</select>
			条</span>
		</@s.if>
		<span>
		转到<input size="2" type="text" 
	    onkeyup="value=value.replace(/[^\d]/g,'');if (value><@s.property value='#pager_pageTotal' />) {value = '<@s.property value="page" />'}"
		onblur="if (value><@s.property value='#pager_pageTotal' />) {
					value='<@s.property value="page" />';
				}else if (!/^\+?[1-9][0-9]*$/.test(value)&amp;&amp;value != ''
				 || value.indexOf('+') != '-1'
				 || value == '') {
				 	value='<@s.property value="page" />';
				}" value="<@s.property value="page" />" />页
				<a href="javascript:;" onclick="var page=this.previousSibling.previousSibling.value;if (page!=<@s.property value='page' />) {pager_jump_go('<@s.property value="#pager_clientId" />',page);}return false;">跳转</a>
		</span>
		<@s.if test="#pageShowExplain">
			<span>共<@s.property value='#pager_count' />条,<@s.property value='page' />/<@s.property value='#pager_pageTotal' />页</span>
		</@s.if>
	</@s.else>
</p>