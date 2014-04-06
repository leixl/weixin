<form id="searchPictureForm" action="system/editor/picture/list.shtml" method="post" style="display: none;">
	<div class="tBox">
		<ul>
			<li>
				<label>文件夹：</label>
				<select id="folderSelect" name="vo.epfId" onchange="setEpfMc();">
					<option value="">所有文件夹</option>
				</select>
			</li>
			<li class="lineli">				
				<label>文件类型：</label>
				<@s.set name="voPictExt" value="', '+vo.picExt+','"></@s.set>
				<input name="vo.picExt" type="checkbox" value="jpg" style="float: none;" <@s.if test="#voPictExt!=null&&#voPictExt.indexOf(', jpg,')>-1">checked="checked"</@s.if> />&nbsp;jpg
				<input name="vo.picExt" type="checkbox" value="jpeg" style="float: none;" <@s.if test="#voPictExt!=null&&#voPictExt.indexOf(', jpeg,')>-1">checked="checked"</@s.if> />&nbsp;jpeg
				<input name="vo.picExt" type="checkbox" value="gif" style="float: none;" <@s.if test="#voPictExt!=null&&#voPictExt.indexOf(', gif,')>-1">checked="checked"</@s.if> />&nbsp;gif
				<input name="vo.picExt" type="checkbox" value="png" style="float: none;" <@s.if test="#voPictExt!=null&&#voPictExt.indexOf(', png,')>-1">checked="checked"</@s.if> />&nbsp;png
				<input name="vo.picExt" type="checkbox" value="bmp" style="float: none;" <@s.if test="#voPictExt!=null&&#voPictExt.indexOf(', bmp,')>-1">checked="checked"</@s.if> />&nbsp;bmp
				<span class="close" onclick="searchPicture();" style="right: 8px;">&nbsp;</span>
			</li>
			<li>
				<label>关键字：</label>
	            <input type="text" name="vo.keyword" value="<@s.property value='vo.keyword' />" style="width:200px;" />
				<select name="vo.keywordType">
					<option value="1"<@s.if test="vo.keywordType==1"> selected="selected"</@s.if>>图片名称</option>
				</select>
	        </li>
	        <li class="lineli">
	        	<label>更新时间：</label>
	            <input name="vo.beginTime" type="text" class="Wdate" readonly="readonly"
	             	onclick="WdatePicker()" value="<@s.date name='vo.beginTime' format='yyyy-MM-dd'/>" />
	            <cite>至</cite>
	            <input name="vo.endTime" type="text" class="Wdate" readonly="readonly"
	             	onclick="WdatePicker()" value="<@s.date name='vo.endTime' format='yyyy-MM-dd'/>" />
	        </li>
	        <li>
	        	<label>指定文件大小：</label>
	        	<input type="text" name="vo.minPicSize" value="<@s.property value='vo.minPicSize' />"
	        	 onkeyup="value=value.replace(/[^\d]/g,'');" onblur="value=value.replace(/[^\d]/g,'');" /><cite>至</cite>
	       		<input type="text" name="vo.maxPicSize" value="<@s.property value='vo.maxPicSize' />"
	       		 onkeyup="value=value.replace(/[^\d]/g,'');" onblur="value=value.replace(/[^\d]/g,'');" maxlength="10" /><cite>KB（不填为不限）</cite>
	      		</li>
	        <li class="but">
				<input type="submit" class="mr10" value="搜索" />
				<input type="reset" value="重置" />
			</li>
	    </ul>
		<div class="clear"></div>
		<input id="pictureEpfMc" type="hidden" name="epfMc" value="<@s.property value='epfMc' />" />
		<input id="pictureOrderType" type="hidden" name="vo.orderType" value="<@s.property value='vo.orderType' />" />
		<input id="pictureViewType" type="hidden" name="vo.viewType" value="<@s.property value='vo.viewType' />" />
	</div>
</form>
<script type="text/javascript">
	//<![CDATA[
	function searchPicture(){
		$("#searchPictureForm").toggle(500);
	}
	function setEpfMc(){
		var dom=$("#folderSelect").find("option:selected");
		var epfMc="";
		if(dom.val()!=""){
			epfMc=dom.text()
		}
		$("#pictureEpfMc").val(epfMc);
	}
	$(function(){
		$.ajax({
            type: "POST",
            dataType: "json",
            url: "system/editor/picture/folder/listOptions.shtml",
            success:function(data){
				if(checkAjaxRequestValidity(data)){
					var selectedValue="<@s.property value='vo.epfId' />";
					var elements=$("#folderSelect");
					elements.attr("length",1);
	            	$.each(data, function(i,obj){
	            		var text=obj.epfMc;
	            		var value=obj.epfId;
					    var selectedHtml=(value==selectedValue)?' selected="selected"':"";
	        			elements.append("<option value='"+value+"'"+selectedHtml+">"+text+"<\/option>");
					});
				}
            }
        });
	});
	//]]>
</script>