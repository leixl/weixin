<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>编辑器-图片管理</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/default.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/fu.css" type="text/css" />
  </head>
  
  <body>
    <div class="main">
		<div class="path">
			<label>当前位置: </label>编辑器<span>&gt;</span>
			<a href="system/editor/picture/folder/list.shtml">图片管理</a><span>&gt;</span>
			<strong>图片上传</strong>
		</div>
		<div class="rm ib_add">
			<div class="con">
				<div class="addbi">
					<div class="waBox pic_m">
						<div class="toobar">
							<a href="javascript:;" onclick="window.location.reload();return false;" class="rb" title="刷新">刷新</a>
							<div>
								<a href="javascript:;" onclick="managePicture();return false;" class="button" title="管理图片">管理图片</a>
								<a href="javascript:;" onclick="addFolder();return false;" class="button thickbox" title="新建文件夹">新建文件夹</a>
							</div>
						</div>
					</div>
					<div class="tabBox">
						<div class="con">
							<div id="tab1" class="tab_con tabli uppic">
								<div class="clew">
									<ul>
										<li>只支持<span class="red">gif、jpeg、jpg、bmp、png</span>格式图片。</li>
										<li>单次上传，最多可上传<span class="red">30张</span>，单张最大<span class="red">2MB</span>，按住Ctrl或Shift键可同时选择多张。</li>
									</ul>
								</div>
								<div class="spc">
									<label>
										选择图片文件夹：
									</label>
									<select id="folderSelect">
										<option value="">请选择</option>
									</select>
								</div>
								<table id="system_editor_picture_target">
									<tr>
										<th>文件名</th>
										<th class="w80">文件大小</th>
										<th>状态</th>
										<th class="w60">操作</th>
									</tr>
								</table>
								<div class="tb">
									<ul class="sd">
										<li>
											<label>上传百分比：</label>
											<span id="tdPercentUploaded"></span>
										</li>
										<li>
											<label>等待上传：</label>
											<span id="system_editor_picture_targetCount">0</span>个
										</li>
										<li>
											<label>上传成功：</label>
											<span id="system_editor_picture_targetSuccessUploadCount">0</span>个
										</li>
									</ul>
									<ul class="pm">
										<li>
											<label>已经传输：</label>
											<span id="tdSizeUploaded"></span>
										</li>
										<li>
											<label>传输速度：</label>
											<span id="tdCurrentSpeed"></span>
										</li>
										<li>
											<label>已用时间：</label>
											<span id="tdTimeElapsed"></span>
										</li>
										<li>
											<label>剩余时间：</label>
											<span id="tdTimeRemaining"></span>
										</li>
									</ul>
									<div class="but4">
										<a href="javascript:;" title="添加图片"><span id="system_editor_picture"></span>
										</a>
										<a id="btnClear" href="javascript:;" title="清空图片">清空图片</a>
										<a href="javascript:;" onclick="startUpload();return false;" title="开始上传">开始上传</a>
										<a id="btnCancel" href="javascript:;" title="取消上传">取消上传</a>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
	<script type="text/javascript" src="resource/plugin/SWFUpload/swfupload.js"></script>
	<script type="text/javascript" src="resource/plugin/SWFUpload/swfupload.swfobject.js"></script>
	<script type="text/javascript" src="resource/plugin/SWFUpload/swfupload.speed.js"></script>
	<script type="text/javascript" src="resource/plugin/SWFUpload/swfupload.fileUtil.js"></script>
	<script type="text/javascript" src="resource/plugin/SWFUpload/swfupload.queue.js"></script>
	<script type="text/javascript" src="resource/common/js/swfupload.handler.queue.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		function loadFolderOptions(){
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
		}
		$(function(){
			loadFolderOptions();
		});
		function addFolder(){
			var url="<@s.property value='url' />";
			var page="system/editor/picture/folder/add.shtml?url="+url;
			$.pageDialog(page, "新建文件夹", {width: 380, height: 120});
		}
		var swfu_Files;
		$(function(){
			var settings_Files = {
				flash_url : "${basePath}resource/plugin/SWFUpload/swfupload.swf",
				upload_url : "${basePath}system/editor/picture/upload.shtml;jsessionid=<@s.property value='session.id' />",
				use_query_string : true,
				file_post_name : "fileOptions.file",
				file_size_limit : "2 MB",
				file_types : "*.gif;*.jpeg;*.jpg;*.bmp;*.png;",
				file_types_description : "图片",
				file_upload_limit : 30,
				file_queue_limit : 0,
				debug : false,
				auto_upload : false,
				button_placeholder_id : "system_editor_picture",
				button_width : 75,
				button_height : 25,
				button_text : '添加图片',
				button_text_top_padding : 3,
				button_text_left_padding : 10,
				button_cursor : SWFUpload.CURSOR.HAND,
				button_action : SWFUpload.BUTTON_ACTION.SELECT_FILES,
				swfupload_loaded_handler : queueSWFLoaded,
				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : queueFileDialogComplete,
				upload_start_handler : queueFileUploadStart,
				upload_progress_handler : queueFileUploadProgress,
				upload_error_handler : queueFileuploadError,
				upload_success_handler : queueFileUploadSuccess,
				upload_complete_handler : queueFileUploadComplete,
				queue_complete_handler : queueComplete,
				swfupload_pre_load_handler : queueSWFPreLoad,
				swfupload_load_failed_handler : queueSWFLoadFailed,
				custom_settings : {
					cancelButtonId : "btnCancel",
					clearButtonId : "btnClear",
					myFileListTarget : "system_editor_picture_target",
					tdPercentUploaded : "tdPercentUploaded",//上传百分比显示区域id
					tdCurrentSpeed : "tdCurrentSpeed",//传输速度显示区域id
					tdSizeUploaded : "tdSizeUploaded",//已经传输显示区域id
					tdTimeElapsed : "tdTimeElapsed",//已用时间显示区域id
					tdTimeRemaining : "tdTimeRemaining",//剩余时间显示区域id
					targetProcessClassName : "blue",
					targetErrorClassName : "red",
					targetSuccessClassName : "green",
					targetSuccessInnerHTML : "上传成功"
				}
			};
			swfu_Files = new SWFUpload(settings_Files);
		});
		function startUpload(){
			var destEpfId=$("#folderSelect").val();
			if(destEpfId==""){
				$.alertInfo("请选择图片文件夹", {onOk: function(){$("#folderSelect").focus()}});
			}else{
				swfu_Files.addPostParam("destEpfId", destEpfId);
				swfu_Files.startUpload();
			}
		}
		function managePicture(){
			var folderSelect=$("#folderSelect").val();
			if(folderSelect==""){
				var url="${basePath}system/editor/picture/folder/list.shtml";
				window.location.href=url;
			}else{
				var url="${basePath}system/editor/picture/list.shtml";
				var epfMc=$("#folderSelect").find("option:selected").text();
				url+="?vo.epfId="+folderSelect+"&epfMc="+encodeURIComponent(epfMc);
				window.location.href=url;
			}
		}
		//]]>
	</script>
  </body>
</html>