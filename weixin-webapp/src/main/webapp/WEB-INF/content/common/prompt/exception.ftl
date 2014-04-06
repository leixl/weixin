<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>您要的页面好像没找到哦！</title>
  </head>  
  <body>
	<table border="0" cellpadding="0" cellspacing="0" style="width: 100%;height: 100%;">
		<tr>
		    <td align="center" valign="top">
		       <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;height: 100%;">
		           <tr>
		              <td align="center" style="width: 100%;height: 80px;">
		                  <img src="resource/common/images/error.gif" border="0" align="middle" alt="" />服务器异常，请稍后重试！
		              </td>
		           </tr>
		           <tr>
		              <td height="30" align="center">
		                  <a href="javascript:;" onclick="window.history.go(-1);return false;">返回</a>&nbsp; &nbsp; 
		                  <a href="javascript:;" onclick="showContent();return false;"><@s.property value="(exceptionStack!=null)?'查看详细信息':''" /></a>
		              </td>
		           </tr>
		           <tr>
		              <td align="left" valign="top">
		                  <div style="display:none;" id="errorMessage">
		                  	<pre><@s.property value="exceptionStack" /></pre>
		                  </div>
		              </td>
		           </tr>
		       </table>
		    </td>
		</tr>
	</table>
	<script type="text/javascript">
		//<![CDATA[
		function showContent(){
			var errorMessage = document.getElementById("errorMessage");
			errorMessage.style.display = (errorMessage.style.display == "block") ? "none" : "block";
		}
		//]]>
	</script>
  </body>
</html>