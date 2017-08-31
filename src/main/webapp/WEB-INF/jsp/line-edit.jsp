<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/ajaxfileupload.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="lineEditForm" name="lineEditForm" class="lineForm" method="post">
        <input class="easyui-textbox" id="lineId" type="text" name="lineId" style="width: 280px;"/>
    </form>
    <table cellpadding="5" id="table">
        <tr>
            <td>路线标题:</td>
            <td><input class="" type="text" id="editLineName" name="editLineName" style="width: 280px;"></input></td>
            <td></td>
        </tr>

        <tr>
            <td>价格:</td>
            <td><input id="editPrice" class="" type="number" id="editPrice" name="editPrice" data-options="min:1,max:99999999,precision:0" /></td>
            <td></td>
        </tr>

        <tr>
            <td>行程开始时间:</td>
            <td><input class="" id="editGoTimeStamp" name="editGoTimeStamp"
                       data-options="required:true,showSeconds:true" value="3/4/2010 2:3" style="width:150px">  </td>
            <td></td>
        </tr>
 <%--       <tr>
            <td>行程介绍:</td>
            <td><textarea id="editLineContent" class="" type="text" name="editLineContent" data-options="multiline:true"  style="height: 100px; width: 280px"></textarea></td>
            <td></td>
        </tr>--%>


        <tr>
            <td>行程介绍:</td>
            <td>
                <textarea style="width:800px;height:300px;visibility:hidden;"  name="editLineContent" id="editLineContent"></textarea>
            </td>
        </tr>

        <tr>
            <td>
                大banner  :
            </td>
            <td >
                <input class="" name="img"  style="width: 280px;" type="file" id="editBigBanner">
                <input type="button" onclick="javascript:uploadEdit(this)" id="uploadEditBigBanner" value="上传"/>
            </td>
            <td>
                <img style="display: block" id="uploadEditBigBannerImg" width="100px" src=""/>
            </td>
        </tr>
        <tr>
            <td>
                小banner1:
            </td>
            <td >
                <input class="" name="img"  style="width: 280px;" type="file" id="editSmallBanner1">
                <input type="button" onclick="javascript:uploadEdit(this)" id="uploadEditSmallBanner1" value="上传"/>
            </td>
            <td>
                <img style="display: block" id="uploadEditSmallBanner1Img" width="100px" src=""/>
            </td>
        </tr>
        <tr>
            <td>
                小banner2:
            </td>
            <td >
                <input class="" name="img" id="editSmallBanner2" style="width: 280px;" type="file">
                <input type="button" onclick="javascript:uploadEdit(this)" id="uploadEditSmallBanner2" value="上传"/>
            </td>
            <td>
                <img style="display: block" id="uploadEditSmallBanner2Img" width="100px" src=""/>
            </td>
        </tr>
    </table>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
        <%--<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>--%>
    </div>
</div>
<script type="text/javascript">

    var lineEditEditor ;
    //页面初始化完毕后执行此方法
    $(function(){
        //创建富文本编辑器
        lineEditEditor = KindEditor.create("#editLineContent", TT.kingEditorParams)
    });


    var lineId = 0;
    var int = self.setInterval("clock()",50);
    function clock(){
        lineId = $("input[name = 'lineId']").val();
        if(lineId != ''){
            window.clearInterval(int);
        }
        getLineById(lineId);
    }

    function submitForm(){
        //有效性验证
        /*if(!$('#lineEditForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }
        //ajax的post方式提交表单
        //$("#lineEditForm").serialize()将表单序列号为key-value形式的字符串
        $.post("/line/update",$("#lineEditForm").serialize(), function(data){
            if(data.status == "success"){
                $.messager.alert('提示','新增路线成功!');
                $('#lineEditForm').form('reset');
            }
        });*/
        var uploadBigBannerImg = $("#uploadEditBigBannerImg").attr("src");
        var uploadSmallBanner1Img = $("#uploadEditSmallBanner1Img").attr("src");
        var uploadSmallBanner2Img = $("#uploadEditSmallBanner2Img").attr("src");
        var lineName = $("#editLineName").html(editLineContent);
        var goTimeStamp = $("#editGoTimeStamp").val();

        lineEditEditor.sync();
        var lineContent = lineEditEditor.html(editLineContent);
        var price = $("#editPrice").val();
        if(uploadBigBannerImg == "" || uploadSmallBanner1Img == "" || uploadSmallBanner2Img == "" || lineName == "" || goTimeStamp == "" || lineContent == "" || price == "" ){
            alert("信息不全！")
            return;
        }
        var imgs = [];
        var imgsObject = document.getElementsByName("otherImgEdit");
        for(var i=0;i<imgsObject.length-1;i++){
            imgs.push({imgType:3,url:imgsObject[i].src,status:0})
        }
        imgs.push({imgType:1,url:uploadBigBannerImg,status:0})
        imgs.push({imgType:2,url:uploadSmallBanner1Img,status:0})
        imgs.push({imgType:2,url:uploadSmallBanner2Img,status:0})
        var data = {id:lineId,lineName:lineName,lineContent:lineContent,goTimeStamp:goTimeStamp,price:price,lineImgs:imgs};
        console.log(data);
        $.ajax({
            url : "/line/update",
            type : "POST",
            contentType: "application/json;charset=utf-8",
            data : JSON.stringify(data),
            dataType : "json",
            success : function(result) {
                console.log(result);
                if (result.status == "success") {
                    alert("更新成功！");
                }
            },
            error:function(msg){
                alert("更新失败！")
            }
        })
    }

    function clearForm(){
        $('#lineEditForm').form('reset');
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
        var otherImgs = document.getElementsByName("otherImgEdit");
        var id = otherImgs[otherImgs.length - 1].getAttribute("id");
        var num = 1;
        if(id != "uploadOtherImg"){
            var end = id.length-3;
            alert(id);
            num = parseInt(id.substr(15,end)) + 1;
        }
        var tr = '<tr><td>其他图片:</td><td ><input class="" name="img" id="other'+num+'"  style="width: 280px;" type="file">'+
            '<input type="button" id="uploadEditOther'+num+'" onclick="javascript:uploadEdit(this)" value="上传"/>' +
            '</td><td><img name="otherImgEdit" id="uploadEditOther'+num+'Img" style="" width="100px" src=""/>'+
            '</td></tr>';
        $("#table").append(tr);
    }
    function uploadEdit(obj){
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
                    document.getElementById(imgIdStr).src = data.url;
//                    document.getElementById(imgIdStr).src = "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4267222417,1017407570&fm=200&gp=0.jpg";
                    if(document.getElementById(imgIdStr).name == "otherImgEdit"){
                        var objTr = document.getElementById(idStr).parentNode.parentNode;
                        $(objTr).append('<td><input type="button" onclick="javascript:deleteOtherImgTr(this)" id="deleteOtherImg" value="删除"/></td>');
                        appendOtherImgTr();
                    }
                }
            }
        })
    }

    function getLineById(lineId){
        $.ajax({
            url:"/line/queryOneById?id="+lineId,
            type:'post',
            async: false,
            contentType: 'application/json',
            dataType: 'json',
            success:function(data){
                if(data.status == 'success'){
                    initData(data.data);
                }
            }
        })
    }

    function initData(line) {
        $("#editLineName").val(line.lineName);

        $('#editLineContent').html(line.lineContent);
        //
        lineEditEditor.html(line.lineContent);
        lineEditEditor.sync();
        $("#editGoTimeStamp").val(new Date(line.goTimeStamp).Format("yyyy-MM-dd hh:mm:ss"));
        $("#editPrice").val(line.price);
        var flag = false;
        var j=0;
        for(var i=0;i<line.lineImgs.length;i++){
            if(line.lineImgs[i].imgType == 1){
                $("#uploadEditBigBannerImg").attr("src",line.lineImgs[i].url);
            }else if(line.lineImgs[i].imgType == 2){
                if(!flag){
                    $("#uploadEditSmallBanner1Img").attr("src",line.lineImgs[i].url);
                    flag = true;
                }else{
                    $("#uploadEditSmallBanner2Img").attr("src",line.lineImgs[i].url);
                }
            }else {
                var tr = '<tr><td>其他图片:</td><td ><input class="" name="img" id="other'+j+'"  style="width: 280px;" type="file">'+
                    '<input type="button" id="uploadEditOther'+j+'" onclick="javascript:uploadEdit(this)" value="上传"/>' +
                    '</td><td><img name="otherImgEdit" id="uploadEditOther'+j+'Img" style="" width="100px" src="'+line.lineImgs[i].url+'"/>'+
                    '</td><td><input type="button" onclick="javascript:deleteOtherImgTr(this)" id="" value="删除"/></td></tr>';
                $("#table").append(tr);
                j++;
            }
        }
        var endTr = '<tr><td>其他图片:</td><td ><input class="" name="img" id="other'+j+'"  style="width: 280px;" type="file">'+
            '<input type="button" id="uploadEditOther'+j+'" onclick="javascript:uploadEdit(this)" value="上传"/>' +
            '</td><td><img name="otherImgEdit" id="uploadEditOther'+j+'Img" style="" width="100px" src=""/>';
        $("#table").append(endTr);
    }

    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

</script>
