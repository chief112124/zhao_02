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
				<td>文章分类:</td>
				<td><input class="easyui-textbox" type="text" name="sort"  /></td>
			</tr>
			<tr>
				<td>封面图:</td>
				<td>
					<input name="img" style="width: 200px">
					<input id="articleImage" type="file" name="file" onchange="upload(this)" />

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


    function upload(obj){
        var file =obj.value;
        if(!/.(gif|jpg|jpeg|png|GIF|JPG|png)$/.test(file)){
            alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
            return false;
        }else{
            var image = new Image();
            image.src = file;
            var height = image.height;
            var width = image.width;
            var filesize = image.filesize;
            if(width!=635 && height!=386 ){
                alert('请上传635*386像素的图片');
                return false;
            }
        }

        $.ajaxFileUpload({
            url:"/file/upload",
            type:'post',
            secureuri: false,
            contentType: false,
            fileElementId:'articleImage',
            processData: false,
            dataType: 'json',
            success:function(data){
                if(data.status == 'success'){
                    var imgIdStr = obj.getAttribute("id") + 'Img';
//                    document.getElementById(imgIdStr).src = data.data;
                    document.getElementById(imgIdStr).src = "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4267222417,1017407570&fm=200&gp=0.jpg";
                    if(document.getElementById(imgIdStr).name == "otherImg"){
                        var objTr = document.getElementById(idStr).parentNode.parentNode;
                        $(objTr).append('<td><input type="button" onclick="javascript:deleteOtherImgTr(this)" id="deleteOtherImg" value="删除"/></td>');
                        appendOtherImgTr();
                    }
                }
            }
        })
    }
</script>
