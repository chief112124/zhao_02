<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="easyui-datagrid" id="dayList"
        toolbar="#daytb"
>
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:200">日程ID</th>
        <th data-options="field:'lineName',width:200">路线名称</th>
        <th data-options="field:'dayNum',width:100">行程第几天</th>
        <th data-options="field:'title',width:100">标题</th>
        <th data-options="field:'meal',width:100">餐</th>
        <th data-options="field:'hotel',width:100">宿</th>
        <th data-options="field:'createTime',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建时间</th>
    </tr>
    </thead>
</table>

<div id="daytb" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
        <div id="addday" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增日程</div>
        <div id="editday" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</div>
        <div id="deletday" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</div>
        路线名称: <input id ='lineIdInList' class="easyui-combobox" name="lineId" style="width:280px">

        <a id="daySearch" class="easyui-linkbutton" iconCls="icon-search">搜索</a>


    </div>
</div>
<div id="dayEditWindow" class="easyui-window" title="编辑日程" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/day-edit'" style="width:80%;height:80%;padding:10px;">
</div>
<script>

    /*默认加载全部的数据*/
    $('#dayList').datagrid(
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
            title:"日程列表",
            url:'/lineDay/getAllDays',
            loadMsg:'数据加载中......',
        }
    );
    $.ajax({
        type: "GET",
        url: "/line/lineIdAndTitles",
        dataType: "json",
        success: function(json) {
            $('#lineIdInList').combobox({
                data: json.rows,
                valueField: 'id',
                textField: 'text'
            });
        }
    });
/*
    function getSelectionsIds(){
        var dayList = $("#dayList");
        var sels = dayList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }*/


    function getSelectionsIds(){
        var dayList = $("#dayList");
        var sels = dayList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }

    $(function () {

        /*新增日程*/
        $('#addday').bind('click', function () {
            $(".tree-title:contains('新增日程')").parent().click();
        });

        /*编辑日程*/
        $('#editday').bind('click', function () {
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','必须选择一个日程才能编辑!');
                return ;
            }
            if(ids.indexOf(',') > 0){
                $.messager.alert('提示','只能选择一个日程!');
                return ;
            }
            $("#dayEditWindow").window({
                onLoad :function(){
                    //回显数据
                    var data = $("#dayList").datagrid("getSelections")[0];
                    $("#dayEditForm").form("load",data);
                    travelEditEditor.html(data.travel);
                    lightPointEditEditor.html(data.linghtPoint);
                }
            }).window("open");
        });

        /*删除日程*/
        $('#deletday').bind('click', function () {
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中日程!');
                return ;
            }
            $.messager.confirm('确认','确定删除ID为 '+ids+' 的日程吗？',function(r){
                if (r){
                    var params = {"id":ids};
                    $.post("/lineDay/delete",params, function(data){
                        if(data.status == "success"){
                            $.messager.alert('提示','删除日程成功!',undefined,function(){
                                $("#dayList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        });


        $('#daySearch').bind('click', function () {
           var selectValue =  $('#lineIdInList').combobox('getValue');
            $('#dayList').datagrid(
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
                    url:'/lineDay/getDaysByLineId?lineId='+selectValue,
                    loadMsg:'数据加载中......',
                }
            );
        })
    })

</script>
