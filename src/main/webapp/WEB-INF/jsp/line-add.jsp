<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/ajaxfileupload.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="lineAddForm" class="lineForm" method="post">
        <table cellpadding="5" id="table">
            <tr>
                <td>路线标题:</td>
                <td><input class="easyui-textbox" type="text" name="title" style="width: 280px;"></input></td>
                <td></td>
            </tr>
            <%--<tr>
                <td >图片1:
                    <td><input class="easyui-filebox" name="img1"  style="width: 280px;"  data-options="prompt:'Choose a file...'"></td>
                </td>
            </tr>
            <tr>
                <td >图片2:
                <td><input class="easyui-filebox" name="img2"  style="width: 280px;" data-options="prompt:'Choose a file...'"></td>
                </td>
            </tr>--%>

            <tr>
                <td>价格:</td>
                <td><input class="easyui-numberbox" type="number" name="price" data-options="min:1,max:99999999,precision:0" /></td>
                <td></td>
            </tr>

            <tr>
                <td>行程开始时间:</td>
                <td><input class="easyui-datetimebox" name="createTime"
                           data-options="required:true,showSeconds:true" value="3/4/2010 2:3" style="width:150px">  </td>
                <td></td>
            </tr>
            <tr>
                <td>行程介绍:</td>
                <td><input class="easyui-textbox" type="text" name="title" data-options="multiline:true"  style="height: 100px; width: 280px"></input></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    大banner  :
                </td>
                <td >
                   <input class="" name="img"  style="width: 280px;" type="file" id="bigBanner"><input type="button" onclick="javascript:upload(this)" id="uploadBigBanner" value="上传"/>
                </td>
                <td>
                    <img style="display: block" id="uploadBigBannerImg" width="100px" src=""/>
                </td>
            </tr>
            <tr>
                <td>
                    小banner1:
                </td>
                <td >
                    <input class="" name="img"  style="width: 280px;" type="file" id="smallBanner1"><input type="button" onclick="javascript:upload(this)" id="uploadSmallBanner1" value="上传"/>
                </td>
                <td>
                    <img style="display: block" id="uploadSmallBanner1Img" width="100px" src=""/>
                </td>
            </tr>
            <tr>
                <td>
                    小banner2:
                </td>
                <td >
                    <input class="" name="img" id="smallBanner2" style="width: 280px;" type="file"><input type="button" onclick="javascript:upload(this)" id="uoloadSmallBanner2" value="上传"/>
                </td>
                <td>
                    <img style="display: block" id="uoloadSmallBanner2Img" width="100px" src=""/>
                </td>
            </tr>
            <tr>
                <td>
                    其他图片:
                </td>
                <td >
                    <input class="" name="img" id="other"  style="width: 280px;" type="file">
                    <input type="button" id="uploadOther" onclick="javascript:upload(this)" value="上传"/>
                </td>
                <td>
                    <img id="uploadOtherImg" name="otherImg" style="" width="100px" src=""/>
                </td>
                <td></td>
            </tr>
        </table>
    </form>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
    </div>
</div>
<script type="text/javascript">
    var lineAddEditor ;
    //页面初始化完毕后执行此方法
    $(function(){
        //创建富文本编辑器
        lineAddEditor = KindEditor.create("#lineAddForm [name=content]", TT.kingEditorParams)
    });
    //提交表单
    function submitForm(){
        //有效性验证
        if(!$('#lineAddForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }
        lineAddEditor.sync();
        //ajax的post方式提交表单
        //$("#lineAddForm").serialize()将表单序列号为key-value形式的字符串
        $.post("/article/add",$("#lineAddForm").serialize(), function(data){
            if(data.status == "success"){
                $.messager.alert('提示','新增文章成功!');
                $('#lineAddForm').form('reset');
                lineAddEditor.html('');
            }
        });
    }

    function clearForm(){
        $('#lineAddForm').form('reset');
        lineAddEditor.html('');
    }

    function deleteOtherImgTr(obj){
        removeElement(obj.parentNode.parentNode);
    }
    function removeElement(_element){
        var _parentElement = _element.parentNode;
        if(_parentElement){
            _parentElement.removeChild(_element);
        }
    }

    function appendOtherImgTr(){
        var otherImgs = document.getElementsByName("otherImg");
        var id = otherImgs[otherImgs.length - 1].getAttribute("id");
        var num = 1;
        if(id != "uploadOtherImg"){
            var end = id.length-3;
            num = parseInt(id.substr(11,end)) + 1;
        }
        var tr = '<tr><td>其他图片:</td><td ><input class="" name="img" id="other'+num+'"  style="width: 280px;" type="file">'+
            '<input type="button" id="uoloadOther'+num+'" onclick="javascript:upload(this)" value="上传"/>' +
            '</td><td><img name="otherImg" id="uoloadOther'+num+'Img" style="" width="100px" src=""/>'+
            '</td></tr>';
        $("#table").append(tr);
    }
    function upload(obj){
        var idStr = '';
        var p = obj.parentNode.children;
        for(var i =0;i<p.length;i++) {
            if(p[i] !== obj){
                idStr = p[i].getAttribute("id");
            }
        }
        if (document.getElementById(idStr).value.length <= 0) {
            alert("请先选择需要上传的文件");
            return false;
        }
        $.ajaxFileUpload({
            url:"/file/upload",
            type:'post',
            secureuri: false,
            fileElementId : idStr,
            contentType: false,
            processData: false,
            dataType: 'json',
            success:function(data){
                if(data.status == 'success'){
                    var imgIdStr = obj.getAttribute("id") + 'Img';
                    console.log(data.data);
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
