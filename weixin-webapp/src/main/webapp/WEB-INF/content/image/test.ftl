<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<link rel="shortcut icon" type="image/ico" href="${basePath}favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>
 <body>
<div class="subNav">当前位置： &gt图片上传</span></div>
<div class="mainContent">
	<form name="marketForm" id="marketForm" method="post" action="image/save.shtml" enctype="multipart/form-data">
        <li>
        	<label>商品图片：</label>
            <input type="file" name="file" id="file" />
       
        	上传文件夹<input type="text" name="destFileId">
        	文件名           <input type="text" name="fileFileName">
        	<input type="submit" value="上传"  class="subOper" />
        </li>
    
    </form>
    <form name="marketForm" id="marketForm" method="post" action="image/saveByUrl.shtml" enctype="multipart/form-data">
        <li>
        	<label>商品图片：</label>
           
       		图片源路径<input type="text" name="url">
        	上传文件夹<input type="text" name="destFileId">
        	文件名<input type="text" name="fileFileName">
        	<input type="submit" value="上传"  class="subOper" />
        </li>
   
    </form>
    <form name="marketForm" id="marketForm" method="post" action="image/delete.shtml" enctype="multipart/form-data">
        <li>
       		 文件夹<input type="text" name="destFileId">
        	要删除文件名<input type="text" name="fileFileName">
            <input type="submit"  value="删除" class="subOper" />
        </li>
   
    </form>
    <form name="marketForm" id="marketForm" method="post" action="image/deleteAll.shtml" enctype="multipart/form-data">
        <li>
        	需要删除的文件夹<input type="text" name="destFileId">
        	<input type="submit"  value="删除全部" class="subOper" />
        </li>
   
    </form>
     <form name="marketForm" id="marketForm" method="post" action="image/copy.shtml" enctype="multipart/form-data">
        <li>
        	从文件夹<input type="text" name="srcFileId">
        	复制到文件夹<input type="text" name="destFileId">
        	<input type="submit"  value="复制" class="subOper" />
        </li>
   
    </form>
</body>
