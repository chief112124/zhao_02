<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="itemDetailForm" class="itemDetailForm" method="post">
		<input type="hidden" name="id"/>
		<table cellpadding="5">
			<tr>
				<td>文章标题:</td>
				<td><input class="easyui-textbox" type="text" name="title" style="width: 280px;" disabled="disabled"></input></td>
			</tr>
			<tr>
				<td>文章类型:</td>
				<td>
					<select id="cc" class="easyui-combobox" name="articleType" style="width:200px;" disabled="disabled">
						<option value="1">惠玩食宿行</option>
						<option value="2">行摄北非</option>
						<option value="3">贴心的话</option>
						<option value="4">关于我们</option>
						<option value="5">诚心</option>
						<option value="6">贴心</option>
						<option value="7">细心</option>
						<option value="8">信心</option>
						<option value="9">走心</option>
						<option value="10">底部广告</option>
					</select>

				</td>
			</tr>
			<tr>
				<td>文章分类:</td>
				<td><input class="easyui-textbox" type="text" name="sort"  disabled="disabled" /></td>
			</tr>

			<tr>
				<td>封面图:</td>
				<td><img id="myimg" width='80' height='50' disabled="disabled"/>
					<input type="hidden" name="img">
				</td>
			</tr>

			<tr>
				<td>文章内容:</td>
				<td>
					<textarea style="width:800px;height:300px;visibility:hidden;" name="content"></textarea>
				</td>
			</tr>
		</table>
	</form>
</div>
<script type="text/javascript">
	var itemDetailEditor ;
	$(function(){

     /*   var mydata = $("#itemDetailForm").form('getData');
		alert("=============="+mydata);*/

		//实例化编辑器
		itemDetailEditor = TAOTAO.createEditor("#itemDetailForm [name=content]");
		itemDetailEditor.readonly(true);
	});


    var int = self.setInterval("clock()",50);
    function clock(){
        var  imgsrc = $("input[name = 'img']").val();
        if(imgsrc != ''){
            window.clearInterval(int);
        }
        $("#myimg").attr("src", $("input[name = 'img']").val());

    }

</script>
