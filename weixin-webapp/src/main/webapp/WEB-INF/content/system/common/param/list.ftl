<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>系统管理-参数管理</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
  </head>
  <body>
	<div class="main">
		<div class="path">
			<label>当前位置:</label>首页<span>&gt;</span>系统管理<span>&gt;</span><strong>参数管理</strong>
		</div>
		<div class="lpage uli">
			<form action="system/common/param/list.shtml" method="post">
				<div class="tBox">
					<ul>
						<li>
							<label>关键字：</label>
				            <input name="vo.keyword" type="text" style="width:200px;" value="<@s.property value='vo.keyword'/>"/>
							<select name="vo.keywordType">
								<option value="1"<@s.if test="vo.keywordType==1"> selected="selected"</@s.if>>英文名称</option>
								<option value="2"<@s.if test="vo.keywordType==2"> selected="selected"</@s.if>>中文名称</option>
								<option value="3"<@s.if test="vo.keywordType==3"> selected="selected"</@s.if>>参数值</option>
								<option value="4"<@s.if test="vo.keywordType==4"> selected="selected"</@s.if>>备注</option>
							</select>
				        </li>
				        <li class="but">
							<input type="submit" value="搜索" class="mr10" />
							<input type="reset" value="重置" />
						</li>
				    </ul>
					<div class="clear"></div>
				</div>
			</form>
			<div class="tabBox">
				<div class="tabli">
					<form id="listForm" method="post" action="">
						<table>
							<tr>
								<th>英文名称</th>
								<th>中文名称</th>
								<th>参数值</th>
								<th width="52">数据类型</th>
								<th width="60">允许编辑</th>
								<th>备注</th>
								<th width="30">操作</th>
							</tr>
							<@s.iterator value="pager.pageList" status="index">
								<tr>
									<td><@s.property value="PARAM_YWMC" /></td>
									<td><@s.property value="PARAM_ZWMC" /></td>
									<td><@s.property value="PARAM_CSZ" /></td>
									<td><@s.property value="@com.juncsoft.portal.common.util.CodeUtil@ENUM.getZdz('104',PARAM_SJLX)" /></td>
									<td><@s.property value="@com.juncsoft.portal.common.util.CodeUtil@ENUM.getZdz('105',PARAM_YXBJ)" /></td>
									<td><@s.property value="PARAM_BZ" /></td>
									<td class="od">
										<@s.if test="PARAM_YXBJ==1">
											<a href="javascript:;" onclick="edit('<@s.property value="PARAM_ID" />');return false;" title="编辑">编辑</a>
										</@s.if>
									</td>
								</tr>
							</@s.iterator>
						</table>
						<input type="hidden" name="url" value="<@s.property value='pagerUrl' />" />
					</form>
					<#include "../../../common/pagination.ftl" />
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
	<script type="text/javascript" src="${basePath}resource/plugin/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		function edit(id){
			var title = "编辑";
			var url = "system/common/param/edit.shtml?param.paramId="+id+"&url=<@s.property value='pagerUrl' />";
			$.pageDialog(url,title,{width:580,height:380});
		}
		//]]>
	</script>
  </body>
</html>