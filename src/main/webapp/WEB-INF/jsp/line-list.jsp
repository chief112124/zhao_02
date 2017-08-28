<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="easyui-datagrid" id="lineList"
        toolbar="#linetb"
>
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:60">路线ID</th>
        <th data-options="field:'lineName',width:200">标题</th>
        <th data-options="field:'lineContent',width:200">行程介绍</th>
        <th data-options="field:'price',width:100">单价</th>
        <th data-options="field:'goTimeStamp',width:130,align:'center',formatter:TAOTAO.formatDateTime">出行时间</th>

    </tr>
    </thead>
</table>

<div id="linetb" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
        <div id="addline" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增路线</div>
        <div id="editline" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</div>
        <div id="deletline" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</div>
        开始时间: <input id="fromDate" class="easyui-datebox" style="width:120px">
        截止时间: <input id="endDate" class="easyui-datebox" style="width:120px">
        <a id="lineSearch" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
    </div>
</div>
<div id="lineEditWindow" class="easyui-window" title="编辑路线" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/line-edit'" style="width:80%;height:80%;padding:10px;">
</div>
<script>

    /*默认加载全部的数据*/
    $('#lineList').datagrid(
        {
            singleSelect:true,
            collapsible:true,
            pagination:true,
            method:'get',
            pageSize : 5,//默认选择的分页是每页5行数据
            pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
            pageNumber: 1,
            nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
            striped : true,//设置为true将交替显示行背景。
            pagination : true,//分页
            rownumbers : true,//行数
            title:"路线列表",
            url:'/line/queryAll',
            loadMsg:'数据加载中......',
        }
    );

    function getSelectionsIds(){
        var lineList = $("#lineList");
        var sels = lineList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }

    $(function () {

        /*新增路线*/
        $('#addline').bind('click', function () {
            $(".tree-title:contains('新增路线')").parent().click();
        });

        /*编辑路线*/
        $('#editline').bind('click', function () {
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','必须选择一个路线才能编辑!');
                return ;
            }
            if(ids.indexOf(',') > 0){
                $.messager.alert('提示','只能选择一个路线!');
                return ;
            }
            $("#lineEditWindow").window({
                onLoad :function(){
                    //回显数据
//                    var data = $("#lineList").datagrid("getSelections")[0];*/
                    var data = {lineId:ids};
                    $("#lineEditForm").form("load",data);
                }
            }).window("open");
//            location.href("/line-edit.jsp?lineId=13")
        });

        /*删除路线*/
        $('#deletline').bind('click', function () {
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中路线!');
                return ;
            }
            $.messager.confirm('确认','确定删除ID为 '+ids+' 的路线吗？',function(r){
                if (r){
                    var params = {"id":ids};
                    $.post("/line/delete",params, function(data){
                        if(data.status == "success"){
                            $.messager.alert('提示','删除路线成功!',undefined,function(){
                                $("#lineList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        });


        $('#lineSearch').bind('click', function () {
            var beginTime = $('#fromDate').datebox('getValue');
            var endTime = $('#endDate').datebox('getValue');
            $('#lineList').datagrid(
                {
                    singleSelect:true,
                    collapsible:true,
                    pagination:true,
                    method:'get',
                    pageSize : 5,//默认选择的分页是每页5行数据
                    pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
                    nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
                    striped : true,//设置为true将交替显示行背景。
                    pagination : true,//分页
                    rownumbers : true,//行数
                    pageNumber: 1,
                    url:'/line/queryAllPage?beginTime='+beginTime+'&endTime='+endTime,
                    loadMsg:'数据加载中......',
                    //表单无记录提示
                    onLoadSuccess:function(data){
                        if (data.total<1){
                            $.messager.alert("提示","表单无数据!");
                        }
                    }
                }
            );

        })
    })

</script>




