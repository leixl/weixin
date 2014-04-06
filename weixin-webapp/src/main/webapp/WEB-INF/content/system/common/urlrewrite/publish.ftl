<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>系统管理-URL重写配置</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/default.css" type="text/css" />
  </head>
  <@s.set name="UPLOAD_TYPE_ARTICLE" value="@com.juncsoft.portal.common.util.ImageConstants@UPLOAD_TYPE_ARTICLE" />
  <@s.set name="editMsg" value="'注：修改将在项目reload或restart后生效'" />
  <body>
	<div class="main addadmin">
		<div class="path"><label>当前位置: </label>首页<span>&gt;</span>系统管理<span>&gt;</span><strong>URL重写配置</strong></div>
		<div class="lpage">
			<form id="contentForm" action="system/common/urlrewrite/save.shtml" method="post">
				<div class="forms">
					<div class="ftit">
						<h4>编辑</h4>
						<em><span class="red"><b><@s.property value="#editMsg" /></b></span></em>
					</div>
					<ul>
						<li class="fc">
							<div>
								<textarea id="content" name="content" rows="0" cols="0" wrap="off"
								 style="width: 100%; height: 400px; font: 'Courier New',Courier,monospace;f"><@s.property value='content' /></textarea>
							</div>
						</li>
						<li class="but">
							<label>&nbsp;</label>
							<input type="submit" class="ibut" value="确认" />
							<input type="reset" class="ibut" value="重填" />
						</li>
					</ul>
				</div>
				<@s.token></@s.token>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
    <script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/jquery.form.js"></script>
  	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
    <script type="text/javascript">
		//<![CDATA[
		function showResponse(responseText, statusText, xhr, $form) {
    		if(checkAjaxRequestValidity(responseText)){
			    if(responseText&&responseText=="success"){
			    	$.successInfo("操作成功!<br /><font color='red'><b><@s.property value='#editMsg' /><\/b><\/font>",{onOk:function(){
			    		window.location.reload();
			    	}});
			    }else{
			    	$.errorInfo("信息提交失败!");
			    }
			}
		}
		$(function(){
			var options={
		        success:       showResponse
		    };
			$("#contentForm").submit(function(){
				$.processInfo("信息正在提交,请稍候...");
		        $(this).ajaxSubmit(options); 
		        return false; 
		    });
		});
	</script>
  </body>
</html>