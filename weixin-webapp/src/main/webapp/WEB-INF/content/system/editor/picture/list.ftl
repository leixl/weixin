<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>编辑器-图片管理</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/default.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/fu.css" type="text/css" />
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
  </head>
  <@s.set name="UPLOAD_TYPE_EDITOR_PICTURE" value="@com.juncsoft.portal.common.util.ImageConstants@UPLOAD_TYPE_EDITOR_PICTURE" />
  <@s.set name="epcMcIsEmpty" value="epfMc==null||epfMc.equals('')" />
  <body>
    <div class="main">
		<div class="path">
			<label>当前位置: </label>编辑器<span>&gt;</span><a href="system/editor/picture/folder/list.shtml">图片管理</a><span>&gt;</span>
			<strong><@s.if test="#epcMcIsEmpty">所有文件夹</@s.if><@s.else><@s.property value="epfMc" /></@s.else></strong>
		</div>
		<div class="lpage uli">
			<div class="waBox pic_m">
				<div class="toobar">
					<a href="javascript:;" onclick="deleteAll();return false;" class="del" title="删除">删除</a>
					<a href="javascript:;" onclick="move();return false;" class="mt thickbox" title="移动到">移动到</a>
					<a href="javascript:;" onclick="copy();return false;" class="ct thickbox" title="复制到">复制到</a>
					<a id="copyLink" href="javascript:;" class="el" title="外链">外链</a>
					<@s.if test="vo.viewType==1">
						<a href="javascript:;" onclick="changeViewType(0);return false;" class="tb" title="缩略图">缩略图</a>
					</@s.if>
					<@s.else>
						<a href="javascript:;" onclick="changeViewType(1);return false;" class="tb1" title="列表">列表</a>
					</@s.else>
					<a href="javascript:;" onclick="searchPicture();return false;" class="sh" title="搜索图片">搜索</a>
					<a href="javascript:;" onclick="window.location.reload();return false;" class="rb" title="刷新">刷新</a>
					<div>
						<a href="system/editor/picture/add.shtml?vo.epfId=<@s.property value='vo.epfId' />" class="button" title="上传图片">上传图片</a>
						<a href="javascript:;" onclick="add();return false;" class="button thickbox" title="新建文件夹">新建文件夹</a>
					</div>
					<div id="linkDiv" class="el_box">
						<ul>
							<li><a href="javascript:;" onclick="copyLink();return false;" title="批量复制链接">批量复制链接</a></li>
							<li><a href="javascript:;" onclick="copyImage();return false;" title="批量复制图片">批量复制图片</a></li>
						</ul>
					</div>
				</div>
				<#include "include/search.ftl" />
				<div class="pm_f">
					<ul>
						<li>
				       		<label><input id="selectAll" type="checkbox" onclick="checkedAll('ids',this);" />全选</label>
				       	</li>
						<li>
							<label>排序：</label>
				          	<select onchange="changeOrderType(this.value)">
								<option value="">默认排序</option>
								<option value="1"<@s.if test="vo.orderType==1"> selected="selected"</@s.if>>更新时间从新到旧</option>
								<option value="2"<@s.if test="vo.orderType==2"> selected="selected"</@s.if>>更新时间从旧到新</option>
								<option value="3"<@s.if test="vo.orderType==3"> selected="selected"</@s.if>>文件从大到小</option>
								<option value="4"<@s.if test="vo.orderType==4"> selected="selected"</@s.if>>文件从小到大</option>
							</select>
				       	</li>
				       	<li style="float: right;">
							<@s.set name="pageHrefNumber" value="0" />
							<#include "../../../common/pagination.ftl" />
						</li>
					</ul>
				</div>
				<form id="listForm" method="post" action="">
					<@s.if test="vo.viewType==1">
						<div class="tabli">
							<table>
								<tr>
									<th class="w25">&nbsp;</th>
									<th width="25">类</th>
									<@s.if test="#epcMcIsEmpty">
										<th>文件夹名称</th>
									</@s.if>
									<th>文件名称</th>
									<th width="80">大小</th>
									<th width="80">所有者</th>
									<th width="80">更新时间</th>
									<th width="60">外链操作</th>
									<th width="70">操作</th>
								</tr>
								<@s.iterator value="pager.pageList" status="index">
									<tr>
										<td>
											<@s.set name="picURL" value="@com.juncsoft.portal.common.util.ImagePathUtil@ENUM.getImageURL(#UPLOAD_TYPE_EDITOR_PICTURE, EP_ID, '', EP_MC)" />
											<input type="hidden" id="bigImageURL_<@s.property value='EP_ID'/>" value="<@s.property value='#picURL' />" />
											<input id="ids_<@s.property value='#index.index' />" name="ids" type="checkbox" value="<@s.property value='EP_ID'/>" />
										</td>
										<td>
											<@s.set name="picExt" value="(EP_MC!=null)?EP_MC.substring(EP_MC.lastIndexOf('.') + 1):''" />
											<@s.if test="#picExt.equalsIgnoreCase('jpg')">
												<span class="ico_p2">&nbsp;</span>
											</@s.if>
											<@s.elseif test="#picExt.equalsIgnoreCase('jpeg')">
												<span class="ico_p3">&nbsp;</span>
											</@s.elseif>
											<@s.elseif test="#picExt.equalsIgnoreCase('gif')">
												<span class="ico_p1">&nbsp;</span>
											</@s.elseif>
											<@s.elseif test="#picExt.equalsIgnoreCase('png')">
												<span class="ico_p5">&nbsp;</span>
											</@s.elseif>
											<@s.elseif test="#picExt.equalsIgnoreCase('bmp')">
												<span class="ico_p4">&nbsp;</span>
											</@s.elseif>
										</td>
										<@s.if test="#epcMcIsEmpty">
											<td class="tit"><@s.property value="EPF_MC" /></td>
										</@s.if>
										<td class="tit">
											<a href="javascript:;"
												onclick="usePicture('<@s.property value="#picURL" />');return false;"
												 title="点击使用图片">
												<@s.property value="EP_XSMC" />
											</a>
										</td>
										<td><@s.property value="@com.juncsoft.framework.util.file.FileSizeUtil@getFormatFileSize_KB(EP_WJDX)" />KB</td>
										<td><@s.property value="UR_YHM" /></td>
										<td><@s.date name="EP_GXSJ" format="yyyy-MM-dd HH:mm:ss" /></td>
										<td>
											<a href="javascript:;"
											 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');copyLink();return false;"
											  title="复制链接">复制链接</a><br/>
											<a href="javascript:;"
											 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');copyImage();return false;"
											  title="复制图片">复制图片</a>
										</td>
										<td class="od">
											<a href="javascript:;"
											 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');move();return false;"
											  title="移动">移动</a>
											<a href="javascript:;"
											 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');copy();return false;"
											  title="复制">复制</a>
											<a href="javascript:;" onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');edit('<@s.property value="EPF_ID" />','<@s.property value="EP_ID" />');return false;"
											 title="改名">改名</a>
											<a href="javascript:;"
											 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');deleteAll();return false;"
											  title="删除">删除</a>
										</td>
									</tr>
								</@s.iterator>
							</table>
						</div>
					</@s.if>
					<@s.else>
						<div class="tm_li tm_li_f">
							<ul>
								<@s.iterator value="pager.pageList" status="index">
									<@s.set name="picURL" value="@com.juncsoft.portal.common.util.ImagePathUtil@ENUM.getImageURL(#UPLOAD_TYPE_EDITOR_PICTURE, EP_ID, '', EP_MC)" />
									<input type="hidden" id="bigImageURL_<@s.property value='EP_ID'/>" value="<@s.property value='#picURL' />" />
									<li class="tm_box">
										<p class="pic">
											<a href="javascript:;"
											 onclick="usePicture('<@s.property value="#picURL" />');return false;"
											  title="点击使用图片"><img src="<@s.property value='#picURL' />"
											   alt="<@s.property value='EP_XSMC' />" /><b class="fill">&nbsp;</b></a>
										</p>
										<ul>
											<li>
												<input id="ids_<@s.property value='#index.index' />" name="ids" type="checkbox" value="<@s.property value='EP_ID'/>" />
												<a href="javascript:;"
												 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');copyLink();return false;"
												  title="复制链接">链</a>
												<a href="javascript:;"
												 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');copyImage();return false;"
												  title="复制图片">图</a>
												<a href="javascript:;"
												 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');move();return false;"
												  title="移动">移</a>
												<a href="javascript:;"
												 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');copy();return false;"
												  title="复制">复</a>
												<a href="javascript:;"
												 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');edit('<@s.property value="EPF_ID" />','<@s.property value="EP_ID" />');return false;"
												  title="改名">改</a>
												<a href="javascript:;"
												 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');deleteAll();return false;"
												  title="删除">删</a>
											</li>
											<li title="<@s.property value='EP_XSMC' />"><@s.property value='EP_XSMC' /></li>
											<@s.if test="#epcMcIsEmpty">
												<li><@s.property value='EPF_MC' /></li>
											</@s.if>
											<li><@s.property value="@com.juncsoft.framework.util.file.FileSizeUtil@getFormatFileSize_KB(EP_WJDX)" />KB&nbsp;<@s.date name="EP_GXSJ" format="yyyy-MM-dd" /></li>
										</ul>
									</li>
								</@s.iterator>
							</ul>
						</div>
					</@s.else>
					<input type="hidden" id="destEpfId" name="destEpfId" value="0" />
					<input type="hidden" name="url" value="<@s.property value='pagerUrl' />" />
				</form>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
	<script type="text/javascript" src="resource/common/js/checkedAll.js"></script>
	<script type="text/javascript" src="resource/system/js/editor/picture.clipboard.js"></script>
	<script type="text/javascript" src="${basePath}resource/plugin/My97DatePicker/WdatePicker.js"></script>
	<!--[if lt IE 7]>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.bgiframe.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		$(function(){
			$("#linkDiv").bgiframe();
		});
		//]]>
	</script>
	<![endif]-->
	<script type="text/javascript">
		//<![CDATA[
			function leastValidate(){
				return validateLeastChecked("ids");
			}
			function add(){
				var url="<@s.property value='pagerUrl' />";
				var page="system/editor/picture/folder/add.shtml?url="+url;
				$.pageDialog(page, "新建文件夹", {width: 380, height: 120});
			}
			function move(){
				if(leastValidate()){
					$.pageDialog("system/editor/picture/move.shtml", "移动到文件夹", {width: 400, height: 120});
				}
			}
			function copy(){
				if(leastValidate()){
					$.pageDialog("system/editor/picture/copy.shtml", "复制到文件夹", {width: 400, height: 120});
				}
			}
			function updateMove(destEpfId,parent){
				$("#destEpfId").val(destEpfId);
				submitAllChecked("listForm", "ids", "确定要执行文件夹移动操作吗?", "system/editor/picture/updateMove.shtml", parent);
			}
			function updateCopy(destEpfId,parent){
				$("#destEpfId").val(destEpfId);
				submitAllChecked("listForm", "ids", "确定要执行文件复制操作吗?", "system/editor/picture/updateCopy.shtml", parent);
			}
			function deleteAll(){
				if(leastValidate()){
					submitAllChecked("listForm", "ids", "确定要删除这些文件吗?<br \/><b><font color='red'>注:该操作不可恢复,请您谨慎操作!<\/font><\/b>", "system/editor/picture/delete.shtml");
				}
			}
			function edit(epfId,id){
				if(leastValidate()){
					var url="<@s.property value='pagerUrl' />";
					var page="system/editor/picture/edit.shtml?picture.epfId="+epfId+"&picture.epId="+id+"&url="+url;
					$.pageDialog(page, "文件改名", {width: 350, height: 120});
				}
			}
			function changeOrderType(orderType) {
				$("#pictureOrderType").val(orderType);
				$("#searchPictureForm").submit();
			}
			function changeViewType(viewType) {
				$("#pictureViewType").val(viewType);
				$("#searchPictureForm").submit();
			}
			$(function(){
				$("#copyLink").bind("mouseover",function(){
					$("#linkDiv").show();
				}).bind("mouseout",function(){
					$("#linkDiv").hide();
				});
				$("#linkDiv").bind("mouseover",function(){
					$(this).show();
				}).bind("mouseout",function(){
					$(this).hide();
				});
			});
			function usePicture(picUrl){
				var iframe=window.parent.parent;
				var ckWindow;
				if(iframe.opener){
					ckWindow=iframe.opener['CKEDITOR']
				}
				if(ckWindow){
					var get=function(j,k){var l=new RegExp('(?:[?&]|&amp;)'+j+'=([^&]+)','i'),m=(k||window).location.search.match(l);return m&&m.length>1?m[1]:null;};
					var funcNum=get('CKEditorFuncNum',iframe);
					ckWindow.tools.callFunction(funcNum, picUrl);
					iframe.close();
				}else{
					window.location.href=picUrl;
				}
			}
		//]]>
	</script>
	<!--[if lt IE 7]>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.autosize.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		$(function(){
			$(".tm_box .pic img").autosize();
		});
		//]]>
	</script>
	<![endif]-->
  </body>
</html>