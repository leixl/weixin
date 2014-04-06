CKEDITOR.editorConfig = function( config ){
	/**
	 * ckeditor 的自动拼写检查功能(通过与svn.spellchecker.net网站交互完成)，
	 * 使得ckeditor的装载非常的慢，有时显得录入反应相当的慢。拼写检查对于中文是多余了，所以可以把此功能屏蔽掉。
	 */
	config.disableNativeSpellChecker = false ;
    config.scayt_autoStartup = false;
    //去除CKEditor自动添加的<p></p>
    config.enterMode = CKEDITOR.ENTER_BR;
	config.shiftEnterMode = CKEDITOR.ENTER_P;
    //启用图片和flash上传
	/**
	config.filebrowserBrowseUrl = '浏览的URL';  
	config.filebrowserImageBrowseUrl = 'common/image.html';  
	config.filebrowserFlashBrowseUrl = 'Flash浏览的URL';  
	config.filebrowserUploadUrl = '上传的URL';  
	config.filebrowserImageUploadUrl = 'Image上传的URL';  
	config.filebrowserFlashUploadUrl = 'Flash上传的URL';  */
    //增加字体
    config.font_names = '宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;'+ config.font_names;
	config.uiColor = '#AADC6E';// 背景颜色 
	config.language = 'zh-cn'; // 配置语言
	config.width = 'auto'; // 宽度
	config.height = '300px'; // 高度
	config.skin = 'kama';//界面v2,kama,office2003
	config.uiColor = '#F0F0EE';
	config.toolbar = 'normal';// 工具栏风格Full,Basic
	config.toolbar_Full=[
		//源码			保存	      新建		预览				模板
		['Source','-','Save','NewPage','Preview','-','Templates'],
		//剪切       复制	粘贴		粘贴为无文本格式    从MS Word粘贴      打印           拼写检查                        即时拼写检查
    	['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
    	//撤销         重做                  查找		替换				全选			清除格式
   		['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
   		//表单	      复选框	            单选按钮        单行文本            多行文本           列表/菜单	   按钮		图像域			隐藏域
    	['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
    	'/',
    	//加粗、	  倾斜、		下划线、		删除线、		下标、			上标
    	['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
    	//编号列表		项目列表			减少缩进量     增加缩进量       块引用
    	['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
    	//左对齐			居中				右对齐			两端对齐
    	['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
    	//插入/编辑超链接  取消超链接   插入/编辑锚点链接
	    ['Link','Unlink','Anchor'],
	    //图像	 flash视频   表格         插入水平线                    表情符          插入特殊符号       插入分页符
	    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
	    '/',
	    //样式              格式             //字体     字体大小
	    ['Styles','Format','Font','FontSize'],
	    //文本颜色           背景颜色
	    ['TextColor','BGColor'],
	    //全屏                     自定义背景颜色   显示区块
	    ['Maximize', 'UIColor', 'ShowBlocks']
	];
	config.toolbar_normal=[
		['Font','FontSize'],['Cut','Copy','Paste','-','Undo', 'Redo'],['Bold','Italic','Underline','Strike'],
		'/',
		['JustifyLeft','JustifyCenter','JustifyRight'],['TextColor','BGColor'],['NumberedList','BulletedList','Subscript','Superscript'],
		['Link','Unlink'],['Image','Smiley'],['Maximize','Preview']
	];
	config.toolbar_article=[
		['Font','FontSize'],['Cut','Copy','Paste','-','Undo', 'Redo'],['Bold','Italic','Underline','Strike'],
		'/',
		['JustifyLeft','JustifyCenter','JustifyRight'],['TextColor','BGColor'],['NumberedList','BulletedList','Subscript','Superscript'],
		['Link','Unlink'],['Image','Flash','PageBreak'],['Source','Maximize','Preview']
	];
};
CKEDITOR.on('instanceReady', function( ev ){
     with (ev.editor.dataProcessor.writer) {
       setRules("p",  {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("h1", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("h2", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("h3", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("h4", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("h5", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("div", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("table", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("tr", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("td", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("iframe", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("li", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("ul", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
       setRules("ol", {indent : false, breakBeforeOpen : false, breakAfterOpen : false, breakBeforeClose : false, breakAfterClose : false} );
     }
})