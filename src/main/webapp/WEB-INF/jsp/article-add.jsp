<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="itemAddForm" class="itemForm" method="post">
	    <table cellpadding="5">
	        <tr>
	            <td>文章标题:</td>
	            <td><input class="easyui-textbox" type="text" name="title" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>文章类型:</td>
				<td>
					<select id="cc" class="easyui-combobox" name="articletype">
						<option value="1">情感</option>
						<option value="2">军事</option>
						<option value="3">历史</option>
						<option value="4">搞笑</option>
						<option value="5">社会</option>
					</select>

				</td>	        </tr>
	        <tr>
	            <td>文章分类:</td>
	            <td><input class="easyui-textbox" type="text" name="sort" data-options="min:1,max:99999999,precision:2" />
	            </td>
	        </tr>
			<tr>
				<td>封面图:</td>
				<td><input id="articleImage" type="file" name="file" onchange="upload(this)" />
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
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	var itemAddEditor ;
	//页面初始化完毕后执行此方法
	$(function(){
		//创建富文本编辑器
		itemAddEditor = KindEditor.create("#itemAddForm [name=content]", TT.kingEditorParams)
	});
	//提交表单
	function submitForm(){
		//有效性验证
		if(!$('#itemAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		itemAddEditor.sync();
		//ajax的post方式提交表单
		//$("#itemAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("/article/add",$("#itemAddForm").serialize(), function(data){
			if(data.status == "success"){
				$.messager.alert('提示','新增文章成功!');
                $('#itemAddForm').form('reset');
                itemAddEditor.html('');
			}
		});
	}
	
	function clearForm(){
		$('#itemAddForm').form('reset');
		itemAddEditor.html('');
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
