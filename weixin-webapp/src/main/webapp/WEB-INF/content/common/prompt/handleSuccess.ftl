<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>操作提示</title>
  </head>
  <body>
  	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<!-- lhgcore  -->
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		var dg=null;
		if(frameElement){
			dg=frameElement.lhgDG;
		}
		var url="";
		url='<@s.property value="@com.juncsoft.framework.util.cipher.CipherUtil@decrypt(url)" escape="false" />';
		var reloadDialog='<@s.property value="reloadDialog" />';
		if(url!=""){
  			if(url.indexOf("&amp;")!=-1){
  				url=url.replace(new RegExp("&amp;","g"),"&");
  			}
	   	}
	   	/**for url is null*/
	   	function urlIsNull(){
	   		if(dg){
	   			dg.cancel();
	   		}else{
	   			window.history.go(-1);
	   		}
	   	}
	   	/**for dialog*/
		function dgLocationReload(){
		   	if(url!=""){
	   			if(dg){
	   				if(dg.parent){
		   				dg.parent.dgWin.location=url;
		   				dg.cancel();
	   				}else if(dg.dgWin&&reloadDialog=="true"){
	   					dg.dgWin.location.href=url;
	   				}else if(dg.curWin){
	   					dg.curWin.location=url;
	   				}
	   			}
		   	}else{
				urlIsNull();
		   	}
		}
		/**for normal page*/
		function updatePageLocation(){
			if(url!=""){
				window.location.href=url;
			}else{
				urlIsNull();
			}
		}
		$(function(){
			var msg="操作成功,点击确定继续下一步操作！";
			if(dg){
				$.successInfo(msg, {onOk: dgLocationReload, parent: dg});
			}else{
				$.successInfo(msg, {onOk: updatePageLocation, parent: dg});
			}
		});
		//]]>
  	</script>
  </body>
</html>