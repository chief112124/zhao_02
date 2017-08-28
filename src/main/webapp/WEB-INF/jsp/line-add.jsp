<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/ajaxfileupload.js"></script>
<div style="padding:10px 10px 10px 10px">
    <%--<form id="lineAddForm" class="lineForm" method="post">--%>
        <table cellpadding="5" id="table">
            <tr>
                <td>路线标题:</td>
                <td><input class="" type="text" id="lineName" name="lineName" style="width: 280px;"></input></td>
                <td></td>
            </tr>

            <tr>
                <td>价格:</td>
                <td><input class="" type="number" id="price" name="price" data-options="min:1,max:99999999,precision:0" /></td>
                <td></td>
            </tr>

            <tr>
                <td>行程开始时间:</td>
                <td><input class="easyui-datetimebox" name="goTimeStamp" id="goTimeStamp"
                           data-options="required:true,showSeconds:true" value="3/4/2010 2:3" style="width:150px">  </td>
                <td></td>
            </tr>
            <tr>
                <td>行程介绍:</td>
                <td><textarea class="" id="lineContent" type="text" name="lineContent" data-options="multiline:true"  style="height: 100px; width: 280px"></textarea></td>
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
                    <input class="" name="img" id="smallBanner2" style="width: 280px;" type="file"><input type="button" onclick="javascript:upload(this)" id="uploadSmallBanner2" value="上传"/>
                </td>
                <td>
                    <img style="display: block" id="uploadSmallBanner2Img" width="100px" src=""/>
                </td>
            </tr>
            <tr>
                <td>
                    其他图片:
                </td>
                <td >
                    <input class="" name="img" id="other"  style="width: 280px;" type="file" multiple="multiple">
                    <input type="button" id="uploadOther" onclick="javascript:upload(this)" value="上传"/>
                </td>
                <td>
                    <img id="uploadOtherImg" name="otherImg" style="" width="100px" src=""/>
                </td>
            </tr>
        </table>
    <%--</form>--%>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
        <%--<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>--%>
    </div>
</div>
<script type="text/javascript">

    function submitForm(){
        /*//有效性验证
        if(!$('#lineAddForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }
        //ajax的post方式提交表单
        //$("#lineAddForm").serialize()将表单序列号为key-value形式的字符串
        $.post("/line/add",$("#lineAddForm").serialize(), function(data){
            if(data.status == "success"){
                $.messager.alert('提示','新增路线成功!');
                $('#lineAddForm').form('reset');
                lineAddEditor.html('');
            }
        });*/
        var uploadBigBannerImg = $("#uploadBigBannerImg").attr("src");
        var uploadSmallBanner1Img = $("#uploadSmallBanner1Img").attr("src");
        var uploadSmallBanner2Img = $("#uploadSmallBanner2Img").attr("src");
        var lineName = $("#lineName").val();
        var goTimeStamp = $("#goTimeStamp").val();
        var lineContent = $("#lineContent").val();
        var price = $("#price").val();
        if(uploadBigBannerImg == "" || uploadSmallBanner1Img == "" || uploadSmallBanner2Img == "" || lineName == "" || goTimeStamp == "" || lineContent == "" || price == "" ){
            alert("信息不全！")
            return;
        }
        var imgs = [];
        var imgsObject = document.getElementsByName("otherImg");
        for(var i=0;i<imgsObject.length-1;i++){
            imgs.push({imgType:3,url:imgsObject[i].src,status:0})
        }
        imgs.push({imgType:1,url:uploadBigBannerImg,status:0})
        imgs.push({imgType:2,url:uploadSmallBanner1Img,status:0})
        imgs.push({imgType:2,url:uploadSmallBanner2Img,status:0})
        var data = {lineName:lineName,lineContent:lineContent,goTimeStamp:goTimeStamp,price:price,lineImgs:imgs}
        $.ajax({
            url : "/line/add",
            type : "POST",
            contentType: "application/json;charset=utf-8",
            data : JSON.stringify(data),
            dataType : "json",
            success : function(result) {
            if (result.status == "success") {
                    alert("添加成功！");
                }
            },
            error:function(msg){
                $(".notice").html('Error:'+msg);
            }
        })
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
