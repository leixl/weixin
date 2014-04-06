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
  <body>
    <div class="main">
		<div class="path"><label>当前位置: </label>编辑器<span>&gt;</span><strong>图片管理</strong></div>
		<div class="lpage uli">
			<form id="folderSearchForm" action="system/editor/picture/folder/list.shtml" method="post">
				<input id="folderOrderType" type="hidden" name="vo.orderType" value="<@s.property value='vo.orderType' />" />
				<input id="folderViewType" type="hidden" name="vo.viewType" value="<@s.property value='vo.viewType' />" />
			</form>
			<div class="waBox pic_m">
				<div class="toobar">
					<a href="javascript:;" onclick="deleteAll();return false;" class="del" title="删除">删除</a>
					<a href="javascript:;" onclick="move();return false;" class="mt thickbox" title="移动到">移动到</a>
					<a href="javascript:;" onclick="copy();return false;" class="ct thickbox" title="复制到">复制到</a>
					<@s.if test="vo.viewType==1">
						<a href="javascript:;" onclick="changeViewType(0);return false;" class="tb" title="缩略图">缩略图</a>
					</@s.if>
					<@s.else>
						<a href="javascript:;" onclick="changeViewType(1);return false;" class="tb1" title="列表">列表</a>
					</@s.else>
					<a href="javascript:;" onclick="searchPicture();return false;" class="sh" title="搜索图片">搜索</a>
					<a href="javascript:;" onclick="window.location.reload();return false;" class="rb" title="刷新">刷新</a>
					<div>
						<a href="system/editor/picture/add.shtml" class="button" title="上传图片">上传图片</a>
						<a href="javascript:;" onclick="add();return false;" class="button thickbox" title="新建文件夹">新建文件夹</a>
					</div>
				</div>
				<#include "../include/search.ftl" />
				<div class="pm_f">
					<ul>
						<li><input id="selectAll" type="checkbox" onclick="checkedAll('ids',this);" class="checkbox" /><label>全选</label></li>
						<li>
							<label>排序</label>
							<select onchange="changeOrderType(this.value)">
								<option value="">默认排序</option>
								<option value="1"<@s.if test="vo.orderType==1"> selected="selected"</@s.if>>更新时间从新到旧</option>
								<option value="2"<@s.if test="vo.orderType==2"> selected="selected"</@s.if>>更新时间从旧到新</option>
							</select>
						</li>
						<li style="float: right;">
							<@s.set name="pageHrefNumber" value="0" />
							<#include "../../../../common/pagination.ftl" />
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
									<th>文件夹名称</th>
									<th width="80">所有者</th>
									<th width="130">更新时间</th>
									<th width="140">操作</th>
								</tr>
								<@s.iterator value="pager.pageList" status="index">
									<tr>
										<td><input id="ids_<@s.property value='#index.index' />" name="ids"
										 type="checkbox" value="<@s.property value='EPF_ID'/>" /></td>
										<td><span class="fl">&nbsp;</span></td>
										<td class="tit">
											<a href="javascript:;"
											 onclick="listPicture('<@s.property value="EPF_ID" />','<@s.property value="EPF_MC" />');return false;"
											  title="点击查看文件夹图片"><@s.property value="EPF_MC" /></a>
											  (<@s.property value="fileCount" />个文件)
										</td>
										<td><@s.property value="UR_YHM" /></td>
										<td><@s.date name="EPF_GXSJ" format="yyyy-MM-dd HH:mm:ss" /></td>
										<td class="od">
											<a href="javascript:;"
											 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');move();return false;"
											  title="移动">移动</a>
											<a href="javascript:;"
											 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');copy();return false;"
											  title="复制">复制</a>
											<a href="javascript:;"
											 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');edit('<@s.property value="EPF_ID" />');return false;"
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
									<@s.set name="facePicURL" value="@com.juncsoft.portal.common.util.ImagePathUtil@ENUM.getImageURL(#UPLOAD_TYPE_EDITOR_PICTURE, facePicId, '', facePicName)" />
									<li class="tm_box">
										<p class="pic">
											<a href="javascript:;"
											 onclick="listPicture('<@s.property value="EPF_ID" />','<@s.property value="EPF_MC" />');return false;"
											  title="点击查看文件夹图片"><img src="<@s.property value='#facePicURL' />"
											   alt="<@s.property value='EPF_MC' />" /><b class="fill">&nbsp;</b></a>
										</p>
										<ul>
											<li>
												<input id="ids_<@s.property value='#index.index' />" name="ids"
												 type="checkbox" value="<@s.property value='EPF_ID'/>" />
												<a href="javascript:;"
												 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');move();return false;"
												  title="移动">移</a>
												<a href="javascript:;"
												 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');copy();return false;"
												  title="复制">复</a>
												<a href="javascript:;"
												 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');edit('<@s.property value="EPF_ID" />');return false;"
												  title="改名">改</a>
												<a href="javascript:;"
												 onclick="checkedOne('ids','ids_<@s.property value="#index.index"/>');deleteAll();return false;"
												  title="删除">删</a>
											</li>
											<li><@s.property value="fileCount" />个文件</li>
											<li title="<@s.property value='EPF_MC' />"><@s.property value='EPF_MC' /></li>
											<li><@s.date name="EPF_GXSJ" format="yyyy-MM-dd HH:mm:ss" /></li>
										</ul>
									</li>
								</@s.iterator>
							</ul>
						</div>
					</@s.else>
					<input type="hidden" id="destId" name="destId" value="0" />
					<input type="hidden" name="url" value="<@s.property value='pagerUrl' />" />
				</form>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
	<script type="text/javascript" src="resource/common/js/checkedAll.js"></script>
	<script type="text/javascript" src="${basePath}resource/plugin/My97DatePicker/WdatePicker.js"></script>
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
					$.pageDialog("system/editor/picture/folder/move.shtml", "移动到文件夹", {width: 400, height: 120});
				}
			}
			function copy(){
				if(leastValidate()){
					$.pageDialog("system/editor/picture/folder/copy.shtml", "复制到文件夹", {width: 400, height: 120});
				}
			}
			function updateMove(destId,parent){
				$("#destId").val(destId);
				submitAllChecked("listForm", "ids", "确定要执行文件夹移动操作吗?", "system/editor/picture/folder/updateMove.shtml", parent);
			}
			function updateCopy(destId,parent){
				$("#destId").val(destId);
				submitAllChecked("listForm", "ids", "确定要执行文件复制操作吗?", "system/editor/picture/folder/updateCopy.shtml", parent);
			}
			function deleteAll(){
				if(leastValidate()){
					submitAllChecked("listForm", "ids", "确定要删除这些文件夹吗?<br \/><b><font color='red'>注:该操作不可恢复,将删除文件夹的同时删除文件夹下的所有文件,请您谨慎操作!<\/font><\/b>", "system/editor/picture/folder/delete.shtml");
				}
			}
			function edit(epfId){
				if(leastValidate()){
					var url="<@s.property value='pagerUrl' />";
					var page="system/editor/picture/folder/edit.shtml?folder.epfId="+epfId+"&url="+url;
					$.pageDialog(page, "文件夹改名", {width: 350, height: 120});
				}
			}
			function listPicture(epfId, epfMc){
				window.location.href = "${basePath}system/editor/picture/list.shtml?vo.epfId="+epfId+"&epfMc="+encodeURIComponent(epfMc);
			}
			function changeOrderType(orderType) {
				$("#folderOrderType").val(orderType);
				$("#folderSearchForm").submit();
			}
			function changeViewType(viewType) {
				$("#folderViewType").val(viewType);
				$("#folderSearchForm").submit();
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