<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>系统管理-栏目管理</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
    <style type="text/css">
	<!--
	.bgyellow{ background:#FFF8C7;}
	-->
	</style>
  </head>
  <body>
	<div class="main">
		<div class="path">
			<label>当前位置:</label>首页<span>&gt;</span>系统管理<span>&gt;</span><strong>栏目管理</strong>
		</div>
		<div class="lpage uli">
			<div class="tBox">
				<ul>
					<li class="but">
						<input type="button" onclick="add(0);" value="添加根栏目" />
						<input type="button" onclick="showAllChildren();" value="展开所有子栏目" />
						<input type="button" onclick="hideAllChildren();" value="关闭所有子栏目" />
					</li>
			    </ul>
				<div class="clear"></div>
			</div>
			<div class="tabBox">
				<div class="tabli">
					<form id="listForm" method="post" action="">
						<table class="tree">
							<thead>
								<tr>
									<th>栏目名称</th>
									<th width="70">添加时间</th>
									<th width="30">内置</th>
									<th width="100">内容展示方式</th>
									<th width="100">重写URL</th>
									<th width="140">操作</th>
									<th width="52">显示顺序</th>
								</tr>
							</thead>
							<@s.iterator value="@com.juncsoft.portal.common.util.SectionUtil@ENUM.getAllList()" var="r">
								<@s.set name="hasSon" value="#r.children!=null&&#r.children.size()>0" />
								<tbody class="expandable" id="root_<@s.property value='#r.seId' />">
									<tr>
										<td>
											<input name="ids" type="hidden" value="<@s.property value='seId'/>" />
											<div class="l">
												<@s.if test="#hasSon">
													<div class="first" onclick="showChildren(this);"></div>
												</@s.if>
												<@s.else>
													<div class="node"></div>
												</@s.else>
												<@s.property value='seMc' />
											</div>
										</td>
										<td><@s.date name="seCjrq" format="yyyy-MM-dd" /></td>
										<td><@s.property value='(seSfnz==0)?"否":"是"' /></td>
										<td><@s.property value="@com.juncsoft.portal.common.util.CodeUtil@ENUM.getZdz('107',seNrzsfs)" /></td>
										<td><@s.property value='seUrl' /></td>
										<td class="od">
											<a href="javascript:;" onclick="add('<@s.property value="#r.seId" />');return false;" title="添加子栏目">添加子栏目</a>
											<a href="javascript:;" onclick="edit('<@s.property value="#r.seId" />');return false;" title="编辑">编辑</a>
											<@s.if test="seSfnz==0">
												<a href="javascript:;" onclick="deleteAll('<@s.property value="#r.seId" />');return false;" title="删除">删除</a>
											</@s.if>
										</td>
										<td><input type="text" style="width:50px;"  name="xssx" value="<@s.property value='seXssx' />" /></td>
									</tr>
								</tbody>
								<@s.if test="#hasSon">
									<@s.iterator value="#r.children" var="s">
										<@s.set name="hasGrandSon" value="#s.children!=null&&#s.children.size()>0" />
										<tbody class="expandable" style="display: none;" id="son_<@s.property value='#s.seId' />_root_<@s.property value='#r.seId' />">
											<tr>
												<td>
													<input name="ids" type="hidden" value="<@s.property value='seId'/>" />
													<div class="l">
														<div class="line"></div>
														<@s.if test="#hasGrandSon">
															<div class="first" onclick="showChildren(this);"></div>
														</@s.if>
														<@s.else>
															<div class="node"></div>
														</@s.else>
														<@s.property value='seMc' />
													</div>
												</td>
												<td><@s.date name="seCjrq" format="yyyy-MM-dd" /></td>
												<td><@s.property value='(seSfnz==0)?"否":"是"' /></td>
												<td><@s.property value="@com.juncsoft.portal.common.util.CodeUtil@ENUM.getZdz('107',seNrzsfs)" /></td>
												<td><@s.property value='seUrl' /></td>
												<td class="od">
													<a href="javascript:;" onclick="add('<@s.property value="#s.seId" />');return false;" title="添加子栏目">添加子栏目</a>
													<a href="javascript:;" onclick="edit('<@s.property value="#s.seId" />');return false;" title="编辑">编辑</a>
													<@s.if test="seSfnz==0">
														<a href="javascript:;" onclick="deleteAll('<@s.property value="#s.seId" />');return false;" title="删除">删除</a>
													</@s.if>
												</td>
												<td><input type="text" style="width:50px;"  name="xssx" value="<@s.property value='seXssx' />" /></td>
											</tr>
										</tbody>
										<@s.if test="#hasGrandSon">
											<tbody style="display: none;" id="grandSon_<@s.property value='#s.seId' />_root_<@s.property value='#r.seId' />">
												<@s.iterator value="#s.children" var="gs">
													<tr>
														<td><input name="ids" type="hidden" value="<@s.property value='seId'/>" /><div class="l"><div class="line"></div><div class="line"></div><div class="node"></div><@s.property value='seMc' /></div></td>
														<td><@s.date name="seCjrq" format="yyyy-MM-dd" /></td>
														<td><@s.property value='(seSfnz==0)?"否":"是"' /></td>
														<td><@s.property value="@com.juncsoft.portal.common.util.CodeUtil@ENUM.getZdz('107',seNrzsfs)" /></td>
														<td><@s.property value='seUrl' /></td>
														<td class="od">
															<a href="javascript:;" onclick="edit('<@s.property value="#gs.seId" />');return false;" title="编辑">编辑</a>
															<@s.if test="seSfnz==0">
																<a href="javascript:;" onclick="deleteAll('<@s.property value="#gs.seId" />');return false;" title="删除">删除</a>
															</@s.if>
														</td>
														<td><input type="text" style="width:50px;"  name="xssx" value="<@s.property value='seXssx' />" /></td>
													</tr>
												</@s.iterator>
											</tbody>
										</@s.if>
									</@s.iterator>
								</@s.if>
							</@s.iterator>
						</table>
					</form>
					<div class="but" style="margin-top: 5px;">
						<input name="" style="float:right;margin-right: 0px;" type="button" onclick="saveOrder();" value="确认排序" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id="handleForm" action="" method="post">
		<input type="hidden" id="handleId" name="section.seId" />
		<input type="hidden" name="url" value="<@s.property value='url' />" />
	</form>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<script type="text/javascript" src="resource/common/js/ajaxInterceptor.js"></script>
    <script type="text/javascript" src="resource/plugin/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		var class_open="collapsable";
		var class_close="expandable";
		$(function(){
			var dom = $(".tabli tr");
			dom.mouseover(function(){
				$(".tabli tr").removeClass("bgyellow");
				$(this).addClass("bgyellow");
			}).mouseout(function(){
				$(this).removeClass("bgyellow");
			});
		});
		function hideAllChildren(){
			$(".tree tbody").attr("class",class_close);
			$("[id*=_root_]").hide();
		}
		function showAllChildren(){
			$(".tree tbody").attr("class",class_open).show();
		}
		function showChildren(obj){
			var root=$(obj).parent().parent().parent().parent();
			var son=root.next();
			var rootId=root.attr("id");
			var isRoot=rootId.indexOf("root_")==0;
			if(!son[0]){
				if(root.attr("class")==class_close){
					root.attr("class",class_open);
				}else{
					root.attr("class",class_close);
				}
			}else{
				if(son.is(":hidden")){
					if (isRoot){
						$("[id^=son_][id$=_"+rootId+"]").show();
						$("[id^=son_][id$=_"+rootId+"]").attr("class",class_close);
					}else{
						var isSon=root.attr("id").indexOf("son_")==0;
						if(isSon){
							son.show();
							son.attr("class",class_open);
						}
					}
					root.attr("class",class_open);
				}else{
					if (isRoot){
						$("[id$=_"+rootId+"]").hide();
						$("[id$=_"+rootId+"]").attr("class",class_close);
					}else{
						var isSon=root.attr("id").indexOf("son_")==0;
						if(isSon){
							son.hide();
							son.attr("class",class_close);
						}
					}
					root.attr("class",class_close);
				}
			}
		}
		function add(pid){
			var url = "system/common/section/add.shtml?section.sePid="+pid+"&url=<@s.property value='url' />";
			var title="添加";
			$.pageDialog(url,title,{width:580,height:420});
		}
		function edit(id){
			var url = "system/common/section/edit.shtml?section.seId="+id+"&url=<@s.property value='url' />";
			var title="编辑";
			$.pageDialog(url,title,{width:580,height:420});
		}
		function deleteAll(id){
			var msg="确定要删除该栏目吗?<br /><font color='red'><b>注：该操作将删除相关的子栏目！</b></font>";
			$.confirmInfo(msg, {onOk: function(){
				$.processInfo("\u4fe1\u606f\u5904\u7406\u4e2d..........");
				$("#handleForm").attr("action","system/common/section/delete.shtml");
				$("#handleId").val(id);
				$("#handleForm").submit();
			}});
		}
		function saveOrderResponse(responseText, statusText, xhr, $form) {
	   		if(checkAjaxRequestValidity(responseText)){
				if(responseText == "success"){
			    	$.successInfo("排序成功!",{onOk:function(){
			    		window.location.reload();
			    	}});
			    }else{
			    	$.errorInfo("信息提交失败!");
			    }
			}
		}
		function saveOrder(){
			var options = {
		        success: saveOrderResponse
		    };
			$.processInfo("信息正在提交,请稍候...");
			$("#listForm").attr("action","system/common/section/saveOrder.shtml").ajaxSubmit(options);
			return false;
		}
		//]]>
	</script>
  </body>
</html>