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
				<td>排序:</td>
				<td><input class="easyui-numberbox" type="text" name="sort"  /></td>
			</tr>
			<tr>
				<td>封面图:</td>

				<td><img id="myimg" name="myimg" width='80' height='50'/>
					<input type="hidden" name="img" />
					<a href="javascript:void(0)" class="easyui-linkbutton oneImagePicUpload" id="articleBtn">图片上传</a><div style="color: #c9302c">请上传尺寸为635 * 386的图片 </div>
				</td>
			</tr>
			<tr>
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


    var int = self.setInterval("clock()",50);
    function clock(){
        var  imgsrc = $("input[name = 'img']").val();
        if(imgsrc != ''){
            window.clearInterval(int);
        }
        $("#myimg").attr("src", $("input[name = 'img']").val());

    }

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
	};

</script>
