<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>加载flash异常</title>
  </head>
  <body>
	<div id="divAlternateContent" style="display: ;">
		<ul>
			<li class="tg" style="color: red;">
				提示：上传界面加载失败，您可以尝试以下操作
			</li>
			<li>
				1.刷新上传页面,重新加载上传组件。
			</li>
			<li>
				2.下载更新您的flash组件。组件下载地址：
				<a href="http://get.adobe.com/cn/flashplayer/" target="_blank" class="rs" style="color: blue;" title="下载组件">下载组件</a>
			</li>
		</ul>
	</div>
	<script type="text/javascript">
		//<![CDATA[
		var dg = frameElement.lhgDG;
		dg.addBtn('no', '关闭', close);
		function close(){
			dg.cancel();
		}
		//]]>
    </script>
  </body>
</html>