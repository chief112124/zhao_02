<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="lineAddForm" class="lineForm" method="post">
        <table cellpadding="5">
            <tr>
                <td>路线标题:</td>
                <td><input class="easyui-textbox" type="text" name="title" style="width: 280px;"></input></td>
            </tr>
            <tr>
                <td >图片1:
                    <td><input class="easyui-filebox" name="img1"  style="width: 280px;"  data-options="prompt:'Choose a file...'"></td>
                </td>
            </tr>
            <tr>
                <td >图片2:
                <td><input class="easyui-filebox" name="img2"  style="width: 280px;" data-options="prompt:'Choose a file...'"></td>
                </td>
            </tr>

            <tr>
                <td>价格:</td>
                <td><input class="easyui-numberbox" type="number" name="price" data-options="min:1,max:99999999,precision:0" /></td>
            </tr>

            <tr>
                <td>行程开始时间:</td>
                <td><input class="easyui-datetimebox" name="createTime"
                           data-options="required:true,showSeconds:true" value="3/4/2010 2:3" style="width:150px">  </td>
            </tr>
            <tr>
                <td>行程介绍:</td>
                <td><input class="easyui-textbox" type="text" name="title" data-options="multiline:true"  style="height: 100px; width: 280px"></input></td>
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
</script>
