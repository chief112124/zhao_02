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
					<select id="cc" class="easyui-combobox" name="articleType">
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

				</td>	        </tr>
	        <tr>
	            <td>文章分类:</td>
	            <td><input class="easyui-textbox" type="text" name="sort" data-options="min:1,max:99999999,precision:2" />
	            </td>
	        </tr>
<%--			<tr>
				<td>封面图:</td>
				<td><input id="articleImage" type="file" onchange="upload()" />
				</td>
			</tr>--%>


			<tr>
				<td>封面图:</td>
				<td>
					<input type="hidden" name="img" />
					<a href="javascript:void(0)" class="easyui-linkbutton oneImagePicUpload" id="articleBtn">图片上传</a>
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
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	var itemAddEditor ;
	//页面初始化完毕后执行此方法
	$(function(){
		//创建富文本编辑器
		itemAddEditor = KindEditor.create("#itemAddForm [name=content]", TT.kingEditorParams)
        TT.initArticlePicUpload();

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


    function upload(){
		var docObj = document.getElementById("articleImage");
		var files = document.getElementById("articleImage").value;


        alert("-------------------"+files);

        if (null == files || '' == files) {
            $.messager.alert('温馨提示','请上传图片封面信息。','info');
            return;
        }

    	if (docObj.files && docObj.files[0]) {
    	    var img = new Image;
    	    img.onload = function () {
				alert(img.height);
            }
            var width = img.width;
    	    var height = img.height;

		}

   /*     $.ajaxFileUpload({
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
        })*/
    }


    $("articleBtn").click(function(){
        var _self = $(this);
        KindEditor.editor(TT.kingEditorParams).loadPlugin('image', function() {
            this.plugin.imageDialog({
                showRemote : false,
                clickFn : function(url, title, width, height, border, align) {
                    var input = _self.siblings("input");
                    input.parent().find("image").remove();
                    input.val(url);
                    input.after("<a href='"+url+"' target='_blank'><img src='"+url+"' width='80' height='50'/></a>");
                    this.hideDialog();
                }
            });
        });
    });



</script>
