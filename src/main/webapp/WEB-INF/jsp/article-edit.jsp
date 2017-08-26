<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="itemeEditForm" class="itemForm" method="post">
		<input type="hidden" name="id"/>
		<table cellpadding="5">
			<tr>
				<td>文章标题:</td>
				<td><input class="easyui-textbox" type="text" name="title" style="width: 280px;"></input></td>
			</tr>
			<tr>
				<td>文章类型:</td>
				<td>
					<select id="cc" class="easyui-combobox" name="articleType" style="width:200px;">
						<option value="1">情感</option>
						<option value="2">军事</option>
						<option value="3">历史</option>
						<option value="4">搞笑</option>
						<option value="5">社会血</option>
					</select>

				</td>
			</tr>
				<td>文章分类:</td>
				<td><input class="easyui-textbox" type="text" name="sort"  /></td>
			</tr>
			<tr>
				<td>文章内容:</td>
				<td>
					<textarea style="width:800px;height:300px;visibility:hidden;" name="content"></textarea>
				</td>
			</tr>
		</table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	var itemEditEditor ;
	$(function(){
		//实例化编辑器
		itemEditEditor = TAOTAO.createEditor("#itemeEditForm [name=content]");
	});

	function submitForm(){
		if(!$('#itemeEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		itemEditEditor.sync();
		$.post("/article/update",$("#itemeEditForm").serialize(), function(data){
			if(data.status == "success"){
				$.messager.alert('提示','修改文章成功!','info',function(){
					$("#itemEditWindow").window('close');
					$("#itemList").datagrid("reload");
				});
			}
		});
	}
</script>
