<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>资讯管理-文章管理</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
  </head>
  <body>
	<div class="main">
		<div class="path">
			<label>当前位置:</label>首页<span>&gt;</span>资讯管理<span>&gt;</span><strong>文章管理</strong>
		</div>
		<div class="lpage uli">
			<form action="system/article/list.shtml" method="post">
				<div class="tBox">
					<ul>
						<li class="but lineli">
							<input type="button" onclick="add();" value="添加" />
						</li>
						<li>
							<label>所属栏目：</label>
							<select onchange="this.form.submit();" name="vo.seId" style="width: auto;">
								<@s.set name="sectionValue" value="vo.seId" />
								<#include "../common/section/include/options.ftl" />
							</select>
						</li>
						<li>
							<label>发布状态：</label>
				          	<select onchange="this.form.submit();" name="vo.fbzt">
				          		<option value="">所有</option>
				          		<@s.iterator value="@com.juncsoft.portal.common.util.CodeUtil@ENUM.getOptionListByLxm('106')">
						  			<option value="<@s.property value='codeZdm' />"<@s.if test="vo.fbzt==codeZdm"> selected="selected"</@s.if>><@s.property value="codeZdz" /></option>
					  			</@s.iterator>
							</select>
						</li>
						<li>
							<label>排序类型：</label>
				          	<select onchange="this.form.submit();" name="vo.orderType">
				          		<option value="">默认</option>
				          		<option value="1"<@s.if test="vo.orderType==1"> selected="selected"</@s.if>>点击数从高到低</option>
				          		<option value="2"<@s.if test="vo.orderType==2"> selected="selected"</@s.if>>点击数从低到高</option>
				          		<option value="3"<@s.if test="vo.orderType==3"> selected="selected"</@s.if>>发布日期从新到旧</option>
				          		<option value="4"<@s.if test="vo.orderType==4"> selected="selected"</@s.if>>发布日期从旧到新</option>
							</select>
						</li>
					</ul>
					<div class="lineli clear"></div>
					<ul>
						<li>
							<label>关键字：</label>
				            <input type="text" name="vo.keyword" value="<@s.property value='vo.keyword' />" style="width: 200px;" />
							<select name="vo.keywordType">
								<option value="1"<@s.if test="vo.keywordType==1"> selected="selected"</@s.if>>文章名称</option>
								<option value="2"<@s.if test="vo.keywordType==2"> selected="selected"</@s.if>>发布人</option>
							</select>
				        </li>
				        <li>
				        	<label>发布日期：</label>
				            <input name="vo.beginTime" type="text" class="Wdate" readonly="readonly"
				             	onclick="WdatePicker()" value="<@s.date name='vo.beginTime' format='yyyy-MM-dd'/>" />
				            <cite>至</cite>
				            <input name="vo.endTime" type="text" class="Wdate" readonly="readonly"
				             	onclick="WdatePicker()" value="<@s.date name='vo.endTime' format='yyyy-MM-dd'/>" />
				        </li>
				        <li class="but">
							<input type="submit" class="mr10" value="搜索" />
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
								<th width="36" class="w25"></th>
								<th>文章名称</th>
								<th width="160">所属栏目</th>
								<th width="50">点击数</th>
								<th width="120">发布日期</th>
								<th>发布人</th>
								<th width="60">发布状态</th>
								<th width="68">操作</th>
							</tr>
							<@s.iterator value="pager.pageList" status="index">
								<tr>
									<td><input id="ids_<@s.property value='#index.index' />" name="ids" type="checkbox" value="<@s.property value='AT_ID'/>" /></td>
									<td><a href="<@s.property value='@com.juncsoft.portal.article.util.ArticleUtil@ENUM.getURL(AT_ID,SE_ID)' />" target="_blank"><@s.property value="AT_MC" /></a></td>
									<td><@s.property value="SE_MC" /></td>
									<td><@s.property value="ATS_DJS" /></td>
									<td><@s.date name="AT_FBRQ" format="yyyy-MM-dd HH:mm:ss" /></td>
									<td><@s.property value="AT_FBR" /></td>
									<td><@s.property value="@com.juncsoft.portal.common.util.CodeUtil@ENUM.getZdz('106',AT_FBZT)" /></td>
									<td class="od">
										<a href="javascript:;" onclick="edit('<@s.property value="AT_ID" />');return false;" title="编辑">编辑</a>
										<a href="javascript:;" onclick="checkedOne('ids','ids_<@s.property value="#index.index" />');deleteAll();return false;" title="删除">删除</a>
									</td>
								</tr>
							</@s.iterator>
						</table>
						<input type="hidden" name="url" value="<@s.property value='pagerUrl' />" />
					</form>
					<div class="tBar">
						<ul class="tbl">
							<li class="as">
								<input type="checkbox" onclick="checkedAll('ids',this);" /><cite>全选</cite>
							</li>
							<li class="but">
							  <input type="button" onclick="deleteAll();" value="删除" />
							</li>
						</ul>
					</div>
					<#include "../../common/pagination.ftl" />
				</div>
			</div>
		</div>
	</div>
	<form id="handleForm" action="" method="post">
		<input type="hidden" id="handleId" name="article.atId" />
		<input type="hidden" name="url" value="<@s.property value='pagerUrl' />" />
	</form>
	<script type="text/javascript" src="resource/plugin/jquery/jquery.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.js"></script>
	<script type="text/javascript" src="resource/plugin/jquery/lhgdialog/lhgdialog.ui.js"></script>
	<script type="text/javascript" src="resource/common/js/checkedAll.js"></script>
	<script type="text/javascript" src="${basePath}resource/plugin/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		function add(){
			$("#handleForm").attr("action","system/article/add.shtml");
			$("#handleId").val("");
			$("#handleForm").submit();
		}
		function edit(id){
			$("#handleForm").attr("action","system/article/edit.shtml");
			$("#handleId").val(id);
			$("#handleForm").attr("method","get");
			$("#handleForm").submit();
		}
		function deleteAll(){
			submitAllChecked("listForm", "ids", "确定要删除这些文章吗?", "system/article/delete.shtml");
		}
		//]]>
	</script>
  </body>
</html>