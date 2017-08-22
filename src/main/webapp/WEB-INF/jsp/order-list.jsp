<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="orderList" title="订单列表"
       data-options="singleSelect:true,collapsible:true,pagination:true,toolbar:tbOrder">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:60">订单ID</th>
        <th data-options="field:'lineId',width:200">路线名称</th>
        <th data-options="field:'adultNum',width:100">成人数量</th>
        <th data-options="field:'childNum',width:100">儿童数量</th>
        <th data-options="field:'phone',width:100">联系电话</th>
        <th data-options="field:'price',width:100">预定时单价</th>
        <th data-options="field:'status',width:100">预定时单价</th>
        <th data-options="field:'totalPrice',width:100">预定时总价</th>
        <th data-options="field:'phone',width:100">联系电话</th>
        <th data-options="field:'createTime',width:130,align:'center',formatter:TAOTAO.formatDateTime">预定时间</th>
        <th data-options="field:'note',width:100">备注</th>


<%--
        <th data-options="field:'price',width:70,align:'right',formatter:TAOTAO.formatPrice">订单内容</th>
        <th data-options="field:'status',width:60,align:'center',formatter:TAOTAO.formatItemStatus">状态</th>
        <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
        <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>--%>
    </tr>
    </thead>
</table>

<div id="tbOrder" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
        <div id="addOrder" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</div>
        <div id="deletOrder" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</div>
            开始时间: <input id="fromDate" class="easyui-datebox" style="width:120px">
            截止时间: <input id="endDate" class="easyui-datebox" style="width:120px">
            <a id="orderSearch" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
    </div>

</div>

<script>

    /*默认加载全部的数据*/
    $('#orderList').datagrid(
        {
            method:'get',
            pageSize : 5,//默认选择的分页是每页5行数据
            pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
            pageNumber: 1,
            nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
            striped : true,//设置为true将交替显示行背景。
            pagination : true,//分页
            rownumbers : true,//行数
            url:'/order/queryAll',
            loadMsg:'数据加载中......',
        }
    );

    function getSelectionsIds(){
        var orderList = $("#orderList");
        var sels = orderList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }


    $(function () {
        $('#addOrder').bind('click', function () {
            $(".tree-title:contains('新增订单')").parent().click();
        });

        $('#deletOrder').bind('click', function () {
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中订单!');
                return ;
            }
            $.messager.confirm('确认','确定删除ID为 '+ids+' 的订单吗？',function(r){
                if (r){
                    var params = {"id":ids};
                    $.post("/order/deleteOrderById",params, function(data){
                        if(data.status == "success"){
                            $.messager.alert('提示','删除订单成功!',undefined,function(){
                                $("#orderList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        });

        $('#orderSearch').bind('click', function () {
            var beginTime = $('#fromDate').datebox('getValue');
            var endTime = $('#endDate').datebox('getValue');

            $('#orderList').datagrid(
                {
                    method:'get',
                    pageSize : 5,//默认选择的分页是每页5行数据
                    pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
                    pageNumber: 1,
                    nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
                    striped : true,//设置为true将交替显示行背景。
                    pagination : true,//分页
                    rownumbers : true,//行数
                    url:'/order/queryOrderByTime?beginTime='+beginTime+'&endTime='+endTime,
                    loadMsg:'数据加载中......',
                }
            );

        })
    });
</script>