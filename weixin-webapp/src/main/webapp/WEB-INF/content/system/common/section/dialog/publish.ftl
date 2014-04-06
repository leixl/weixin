<@s.set name="isAdd" value="(section==null||section.seId==null)?true:false"></@s.set>
<@s.set name="title" value="(#isAdd)?'添加':'编辑'"></@s.set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@s.property value="#title" /></title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
	<link rel="stylesheet" href="resource/system/css/default.css" type="text/css" />
  </head>
  
  <body>
	<div class="main">
		<form id="contentForm" action="system/common/section/save.shtml" method="post">
			<div class="forms">
				<div class="ftit">
					<h4><@s.property value="#title" /></h4>
					<em>加<span class="red">*</span>为必填信息</em>
				</div>
				<ul>
					<li class="fc">
						<label><span class="red">*</span>栏目名称：</label>
						<div class="emg">
							<input id="seMc" name="section.seMc" value="<@s.property value='section.seMc' />" type="text" class="w200" />
						</div>
						<div id="seMcTip" class="tip"></div>
					</li>
					<li class="fc">
						<label><span class="red">*</span>内容展示方式：</label>
						<div class="lBox">
							<@s.iterator value="@com.juncsoft.portal.common.util.CodeUtil@ENUM.getOptionListByLxm('107')" status="index">
					  			<label>
									<input name="section.seNrzsfs" type="radio" value="<@s.property value='codeZdm' />"
									 id="seNrzsfs<@s.property value='#index.index' />"<@s.if test="section.seNrzsfs==codeZdm"> checked="checked"</@s.if> />
									<cite><@s.property value="codeZdz" /></cite>
								</label>
				  			</@s.iterator>
						</div>
						<div id="seNrzsfsTip" class="tip"></div>
					</li>
					<li class="fc">
						<label>重写URL：</label>
						<div class="emg">
							<input id="seUrl" name="section.seUrl" value="<@s.property value='section.seUrl' />" type="text" class="w200" />
						</div>
						<div id="seUrlTip" class="tip"></div>
					</li>
					<li class="fc">
						<label>显示顺序：</label>
						<div class="emg">
							<input id="seXssx" name="section.seXssx" value="<@s.property value='section.seXssx' />" type="text" class="w200" />
						</div>
						<div id="seXssxTip" class="tip"></div>
					</li>
					<li class="fc">
						<label>备注：</label>
						<div class="emg">
				    		<textarea id="seBz" name="section.seBz" rows="" class="w300"
							  style="height:120px;"><@s.property value="section.seBz" /></textarea>
						</div>
					</li>
					<li class="fc">
						<label>&nbsp;</label>
						<div id="seBzTip" class="tip"></div>
					</li>
				</ul>
			</div>
			<@s.if test="!#isAdd">
				<input type="hidden" name="section.seId" value="<@s.property value='section.seId' />" />
			</@s.if>
			<@s.else>
				<input type="hidden" name="section.sePid" value="<@s.property value='section.sePid' />" />
			</@s.else>
			<input type="hidden" name="url" value="<@s.property value='url' />" />
		</form>
	</div>
	<input type="hidden" id="hidOldSeMc" value="<@s.property value='section.seMc' />" />
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
    <script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/validate/formValidator.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/validate/formValidatorRegex.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		var dg = frameElement.lhgDG;
		var curWin=dg.curWin;
		dg.addBtn( 'no', '取消', cancel);
		dg.addBtn( 'submit', '确定', checkSubmitForm);
		function cancel(){
			dg.cancel();
		}
		$(function(){
			$.formValidator.initConfig({errorFocus:true});
			var seMc = $("#hidOldSeMc").val();
			$("#seMc").formValidator({onShow:"",onFocus:"长度最多50个字符"})
			.inputValidator({max:50})
			.ajaxValidator({
				type:"post",
				async:true,
				data:{"section.sePid":"<@s.property value='section.sePid' />"},
				url:"system/common/section/getExistByMc.shtml",
				success:function(data){
					if(checkAjaxRequestValidity(data)){
						if($.trim($("#seMc").val())==$.trim(seMc)){
							return true;
						}else{
							if(data=="false"){
								return true;
							}else {
								return false;
							}
						}
					}
				},
				onError:"栏目名称已存在，请更换",
				onWait:"正在检查栏目名称唯一性，请稍后……"
			});
			$(":radio[name='section.seNrzsfs']").formValidator({tipID:"seNrzsfsTip",onShow:"",onFocus:"请选择"}).inputValidator({min:1,max:1});
			$("#seUrl").formValidator({empty:true,onShow:"SEO优化项，用于设置伪静态URL",onFocus:"长度最多200个字符"}).inputValidator({max:200});
			$("#seXssx").formValidator({empty:true,onShow:"",onFocus:"请输入正整数"})
			.inputValidator({max:10}).regexValidator({regExp:"intege1",dataType:"enum"});
			$("#seBz").formValidator({empty:true,onShow:"",onFocus:"长度最多255个字符"}).inputValidator({max:255});
		});
		function checkSubmitForm(){
			var commonSuccess=$.formValidator.pageIsValid("1");
			if(commonSuccess==true){
				curWin.$.processInfo("信息正在提交,请稍候...",{parent:dg});
				$("#contentForm").submit();
			}
			return false;
		}
		//]]>
	</script>
  </body>
</html>