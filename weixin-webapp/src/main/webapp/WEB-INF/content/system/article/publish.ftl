<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>资讯管理-文章管理</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/default.css" type="text/css" />
  </head>
  <@s.set name="UPLOAD_TYPE_ARTICLE" value="@com.juncsoft.portal.common.util.ImageConstants@UPLOAD_TYPE_ARTICLE" />
  <body>
	<div class="main addadmin">
		<div class="path"><label>当前位置: </label>首页<span>&gt;</span>资讯管理<span>&gt;</span><strong>文章管理</strong></div>
		<div class="lpage">
			<@s.set name="isAdd" value="(article==null||article.atId==null)?true:false"></@s.set>
			<form id="contentForm" action="system/article/save.shtml" method="post">
				<div class="forms">
					<div class="ftit">
						<h4><@s.property value="(#isAdd)?'添加':'编辑'" /></h4>
						<em>加<span class="red">*</span>为必填信息</em>
					</div>
					<ul>
						<li class="fc">
							<label>
								<span class="red">*</span>所属栏目：
							</label>
							<div class="emg">
								<select id="seId" name="article.seId" style="width: auto;">
									<@s.set name="sectionValue" value="article.seId" />
									<@s.set name="parent2Empty" value="true" />
									<#include "../common/section/include/options.ftl" />
								</select>
							</div>
							<div id="seIdTip" class="tip"></div>
						</li>
						<li class="fc">
							<label>
								<span class="red">*</span>文章名称：
							</label>
							<div class="emg">
								<input id="atMc" name="article.atMc" value="<@s.property value='article.atMc' />" type="text" class="w300" />
							</div>
							<div id="atMcTip" class="tip"></div>
						</li>
						<li class="upic">
							<label>配图上传：</label>
							<div id="pictureUploadPicSpan" class="upBox" style="display: none;">
								<div class="sp">
									<ul>
										<li><a href="javascript:;" title="选择图片" class="but2"><span id="pictureFile"></span></a></li>
										<li id="pictureFile_target"></li>
										<li class="red"><div class="tip"></div></li>
									</ul>
								</div>
								<p class="grey">最佳展示尺寸为：<span class="red">209*152</span>像素，支持<span class="red">gif、jpeg、jpg、bmp、png</span>格式，图片大小请限定在<span class="red">100K</span>以内。</p>
							</div>
							<div id="pictureViewPicSpan" class="upBox" style="display: none;">
								<div class="picBox">
									<div class="pic">
										<img src="<@s.property value='@com.juncsoft.portal.common.util.ImagePathUtil@ENUM.getImageURL(#UPLOAD_TYPE_ARTICLE, article.atId, "", article.atTpmc)' />" alt="" /><b class="fill">&nbsp;</b>
									</div>
								</div>
								<span onclick="deletePicture();return false;" class="close" title="删除">&nbsp;</span>
							</div>
						</li>
						<li class="fc">
							<label>
								文章作者：
							</label>
							<div class="emg">
								<input id="atZz" name="article.atZz" value="<@s.property value='article.atZz' />" type="text" class="w300" />
							</div>
							<div id="atZzTip" class="tip"></div>
						</li>
						<li class="fc">
							<label>
								内容摘要：
							</label>
							<div class="emg">
								<textarea id="atNrzy" name="article.atNrzy" rows="0" cols="0"
								 style="height:150px;" class="w300"><@s.property value='article.atNrzy' /></textarea>
							</div>
							<div id="atNrzyTip" class="tip"></div>
						</li>
						<li class="edi">
							<label>
								<span class="red">*</span>文章内容：
							</label>
							<div class="ediBox">
								<div class="wt">
									<textarea id="atNr" name="article.atNr" rows="0" cols="0"><@s.property value='article.atNr' /></textarea>
									<div id="atNrTip" class="tip"></div>
								</div>
							</div>
						</li>
						<li class="fc">
							<label><span class="red">*</span>发布时间：</label>
							<div class="emg">
								<input id="atFbrq" name="article.atFbrq" type="text" class="w200 Wdate"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" value="<@s.date name='(article!=null&&article.atFbrq!=null)?article.atFbrq:new java.util.Date()' format='yyyy-MM-dd HH:mm:ss'/>" />
							</div>
							<div id="atFbrqTip" class="tip"></div>
						</li>
						<li class="fc">
							<label><span class="red">*</span>发布状态：</label>
							<div class="lBox">
								<@s.iterator value="@com.juncsoft.portal.common.util.CodeUtil@ENUM.getOptionListByLxm('106')" status="index">
						  			<label>
										<input name="article.atFbzt" type="radio" value="<@s.property value='codeZdm' />"
										 id="atFbzt<@s.property value='#index.index' />"<@s.if test="(#index.index==0&&(article==null||article.atFbzt==null))||article.atFbzt==codeZdm"> checked="checked"</@s.if> />
										<cite><@s.property value="codeZdz" /></cite>
									</label>
					  			</@s.iterator>
							</div>
							<div id="atFbztTip" class="tip"></div>
						</li>
						<li class="but">
							<label>&nbsp;</label>
							<input type="submit" class="ibut" value="确认" />
							<input type="reset" class="ibut" value="重填" />
						</li>
					</ul>
				</div>
				<@s.if test="!#isAdd">
					<input type="hidden" name="article.atId" value="<@s.property value='article.atId' />" />
				</@s.if>
				<@s.token></@s.token>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<script type="text/javascript" src="${basePath}resource/plugin/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${basePath}resource/plugin/ckeditor/adapters/jquery.js"></script>
    <script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
    <script type="text/javascript" src="resource/plugin/SWFUpload/swfupload.js"></script>
	<script type="text/javascript" src="resource/plugin/SWFUpload/swfupload.swfobject.js"></script>
	<script type="text/javascript" src="resource/plugin/SWFUpload/swfupload.speed.js"></script>
	<script type="text/javascript" src="resource/plugin/SWFUpload/swfupload.fileUtil.js"></script>
	<script type="text/javascript" src="resource/plugin/SWFUpload/swfupload.queue.js"></script>
	<script type="text/javascript" src="resource/common/js/swfupload.handler.file.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/validate/formValidator.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/validate/formValidatorRegex.js"></script>
  	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
	<script type="text/javascript" src="${basePath}resource/plugin/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
		//<![CDATA[
		var isAdd = "<@s.property value='#isAdd' />";
		$(function(){
			$("#atNr").ckeditor({
				toolbar:'article',
				width:"598px",
				height:"280px",
				filebrowserImageBrowseUrl:"${basePath}system/editor/picture/index.shtml"
			});
		});
		$(function(){
			$.formValidator.initConfig({formID:"contentForm",errorFocus:true,onSuccess:checkSubmitForm});
			if(isAdd == "true"){
				var seIdValidMsg="该栏目只允许发布一篇文章，并且已经发布过文章，您可以去编辑该文章！";
				$("#seId").formValidator({onShow:"",onFocus:"请选择"}).inputValidator({min:1})
				.functionValidator({fun:function(val){
					if(val == ""){return "文章不能发布到父栏目"}
				}}).ajaxValidator({
					type:"post",
					async:true,
					url:"system/article/getExistIdBySeId.shtml",
					success:function(existId){
						if(checkAjaxRequestValidity(existId)){
							if(existId=="null"||existId==""){
								return true;
							}else {
								var url="<@s.property value='url' />";
								var editURL="system/article/edit.shtml?article.atId="+existId+"&url="+url;
								$.confirmInfo("<font color='red'><b>"+seIdValidMsg+"<\/b><\/font>",{okText:"去编辑",onOk:function(){
									window.location.href="${basePath}"+editURL;
								}})
								return seIdValidMsg+"<a href='"+editURL+"'>去编辑<\/a>";
							}
						}
					},
					onWait:"正在检查栏目文章唯一性，请稍后……"
				});
			}else{
				$("#seId").formValidator({onShow:"",onFocus:"请选择"}).inputValidator({min:1})
				.functionValidator({fun:function(val){
					if(val == ""){return "文章不能发布到父栏目"}
				}});
			}
			$("#atMc").formValidator({onShow:"",onFocus:"长度最多100个字符"}).inputValidator({max:100});
			$("#atZz").formValidator({empty:true,onShow:"",onFocus:"长度最多50个字符"}).inputValidator({max:50});
			$("#atNrzy").formValidator({empty:true,onShow:"",onFocus:"长度最多400个字符"}).inputValidator({max:400});
			$("#atNr").formValidator({onShow:"",onFocus:"请填写文章内容"})
			.functionValidator({
				fun:function(val,elem){
					var editor=CKEDITOR.instances.atNr;
					var data=editor.getData();
					if($.trim(data)==""){
						editor.focusManager.focus();
						return false;
					}
				}
			});
			$("#atFbrq").formValidator({onShow:"",onFocus:"请填写发布时间"}).inputValidator({max:19});
			$(":radio[name='article.atFbzt']").formValidator({tipID:"atFbztTip",onShow:"",onFocus:"请选择"}).inputValidator({min:1,max:1});
		});
		var swfu_pictureFile;
		$(function() {
			var tpmc="<@s.property value='article.atTpmc' />";
			if(tpmc!=null&&tpmc!=""){
				$("#pictureViewPicSpan").show();
				$("#pictureUploadPicSpan").hide();
			}else{
				$("#pictureUploadPicSpan").show();
				$("#pictureViewPicSpan").hide();
			}
			
			var settings_pictureFile = {
				flash_url : "${basePath}resource/plugin/SWFUpload/swfupload.swf",
				upload_url : "${basePath}system/article/uploadPicture.shtml;jsessionid=<@s.property value='session.id' />",
				use_query_string : true,
				file_post_name : "fileOptions.file",
				file_size_limit : "100 KB",
				file_types : "*.gif;*.jpeg;*.jpg;*.bmp;*.png;",
				file_types_description : "图片",
				debug : false,
				auto_upload : false,
				button_placeholder_id : "pictureFile",
				button_width : 50,
				button_height : 22,
				button_text : '浏览',
				button_text_top_padding : 3,
				button_text_left_padding : 10,
				button_cursor : SWFUpload.CURSOR.HAND,
				button_action : SWFUpload.BUTTON_ACTION.SELECT_FILE,
				file_queued_handler : fileBrowsed,
				file_queue_error_handler : fileBrowseError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : fileUploadStart,
				upload_progress_handler : fileUploadProgress,
				upload_error_handler : fileUploadError,
				upload_success_handler : fileUploadSuccess,
				upload_complete_handler : fileUploadComplete,
				queue_complete_handler : fileComplete,
				swfupload_pre_load_handler : fileSWFPreLoad,
				swfupload_load_failed_handler : fileSWFLoadFailed,
				custom_settings : {
					myFileListTarget : "pictureFile_target",
					targetErrorClassName : "red",
					targetSuccessClassName : "green",
					targetSuccessInnerHTML : "上传成功",
					onCompleteFunction : startUpload
				}
			};
			swfu_pictureFile = new SWFUpload(settings_pictureFile);
		});
		function deletePicture() {
			$.confirmInfo("确定要删除配图吗？",{onOk:function(){
				var atId="<@s.property value='article.atId' />";
				$.ajax({
			         type: "POST",
			         url: "system/article/deletePicture.shtml",
			         data: {"article.atId":atId},
			         success:function(result){
			         	if(checkAjaxRequestValidity(result)){
			         		if(result=="success"){
			         			$("#pictureUploadPicSpan").show();
								$("#pictureViewPicSpan").hide();
			         		}else{
			         			$.errorInfo("删除图片失败!");
			         		}
			         	}
			         }
			    });
			}});
		}
		function startUpload() {
	   		var pictureFile = null;
	    	try{pictureFile = swfu_pictureFile.getFile();}catch(e){}
	   		if(pictureFile!=null){
	   			swfu_pictureFile.startUpload();
	   		}else{
	   			var url = "<@s.property value='url' />";
		    	if(url != null && url != ""){
		    		window.location.href="${basePath}common/prompt/handleSuccess.shtml?url="+url;
		    	}else{
			    	$.successInfo("操作成功!",{onOk:function(){
			    		window.location.reload();
			    	}});
			    }
	   		}
		}
		function showResponse(responseText, statusText, xhr, $form) {
    		if(checkAjaxRequestValidity(responseText)){
			    if(responseText && responseText != null){
			    	$.processInfo("信息提交完毕,正在上传附件...");
			    	var pictureFile = null;
			    	try{pictureFile = swfu_pictureFile.getFile();}catch(e){}
			    	if(pictureFile!=null){
			    		swfu_pictureFile.addPostParam("article.atId", responseText);
			    	}
			    	$("#hidBrandId").val(responseText);
			    	startUpload();
			    }else{
			    	$.errorInfo("信息提交失败!");
			    }
			}
		}
		function checkSubmitForm(){
			var options = {
		        success:       showResponse
		    };
			$.processInfo("信息正在提交,请稍候...");
			$("#contentForm").ajaxSubmit(options);
			return false;
  		}
		//]]>
	</script>
	<!--[if lt IE 7]>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.autosize.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		$(function(){
			$(".pic img").autosize();
		});
		//]]>
	</script>
	<![endif]-->
  </body>
</html>