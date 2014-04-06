<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<base href="${basePath}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>系统管理-用户管理</title>
    <link rel="stylesheet" href="resource/system/css/public.css" type="text/css" />
  </head>
  <body>
	<div class="main">
		<div class="path">
			<label>当前位置:</label>首页<span>&gt;</span>系统管理<span>&gt;</span><strong>用户管理</strong>
		</div>
		<div class="lpage uli">
			<form action="system/user/list.shtml" method="post">
				<div class="tBox">
					<ul>
						<li class="lineli but">
							<input type="button" onclick="add();" value="添加" />
						</li>
						<li>
							<label>关键字：</label>
				            <input name="vo.keyword" type="text" style="width:200px;" value="<@s.property value='vo.keyword'/>"/>
							<select name="vo.keywordType">
								<option value="1"<@s.if test="vo.keywordType==1"> selected="selected"</@s.if>>用户名</option>
								<option value="2"<@s.if test="vo.keywordType==2"> selected="selected"</@s.if>>姓名</option>
							</select>
				        </li>
				        <li>
				        	<label>最后登录时间：</label>
				            <input name="vo.beginTime" type="text" class="Wdate" readonly="readonly"
				             	onclick="WdatePicker()" value="<@s.date name='vo.beginTime' format='yyyy-MM-dd'/>" />
				            <cite>至</cite>
				            <input name="vo.endTime" type="text" class="Wdate" readonly="readonly"
				             	onclick="WdatePicker()" value="<@s.date name='vo.endTime' format='yyyy-MM-dd'/>" />
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
								<th class="w20"></th>
								<th>用户名</th>
								<th>姓名</th>
								<th width="120">最后登录时间</th>
								<th width="70">操作</th>
							</tr>
							<@s.iterator value="pager.pageList" status="index">
								<tr>
									<td><input id="ids_<@s.property value='#index.index' />" name="ids" type="checkbox" value="<@s.property value='UR_ID'/>" /></td>
									<td>
										<@s.property value="UR_YHM" />
									</td>
									<td>
										<@s.property value="UR_XM" />
									</td>
									<td>
										<@s.date name="UR_DLSJ" format="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td class="od">
										<a href="javascript:;" onclick="edit('<@s.property value="UR_ID" />');return false;" title="编辑">编辑</a>
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
		<input type="hidden" id="handleId" name="user.urId" />
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
			$("#handleForm").attr("action","system/user/add.shtml");
			$("#handleId").val("");
			$("#handleForm").submit();
		}
		function edit(id){
			$("#handleForm").attr("action","system/user/edit.shtml");
			$("#handleId").val(id);
			$("#handleForm").attr("method","get");
			$("#handleForm").submit();
		}
		function deleteAll(){
			submitAllChecked("listForm", "ids", "确定要删除这些用户吗?", "system/user/delete.shtml");
		}
		//]]>
	</script>
  </body>
</html>