<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="itemList" title="订单列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/order/queryAll',method:'get',pageSize:30,toolbar:toolbar">
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
<%--
        <th data-options="field:'createTime',width:130,align:'center',formatter:TAOTAO.formatDateTime">预定时间</th>        <th data-options="field:'sellPoint',width:100">预定时总价</th>
--%>
        <th data-options="field:'note',width:100">备注</th>


<%--
        <th data-options="field:'price',width:70,align:'right',formatter:TAOTAO.formatPrice">订单内容</th>
        <th data-options="field:'status',width:60,align:'center',formatter:TAOTAO.formatItemStatus">状态</th>
        <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
        <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>--%>
    </tr>
    </thead>
</table>
<script>

    function getSelectionsIds(){
        var itemList = $("#itemList");
        var sels = itemList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }

    var toolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
            $(".tree-title:contains('新增订单')").parent().click();
        }
    },{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','必须选择一个订单才能编辑!');
                return ;
            }
            if(ids.indexOf(',') > 0){
                $.messager.alert('提示','只能选择一个订单!');
                return ;
            }

            $(".tree-title:contains('新增订单')").parent().click();

          /*  $("#itemEditWindow").window({
                onLoad :function(){
                    //回显数据
                    var data = $("#itemList").datagrid("getSelections")[0];
                    $("#itemeEditForm").form("load",data);
                    TAOTAO.init({
                        "pics" : data.image,
                        "cid" : data.cid,
                        fun:function(node){
                            TAOTAO.changeItemParam(node, "itemeEditForm");
                        }
                    });
                }
            }).window("open");*/
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中订单!');
                return ;
            }
            $.messager.confirm('确认','确定删除ID为 '+ids+' 的订单吗？',function(r){
                if (r){
                    var params = {"ids":ids};
                    $.post("/rest/item/delete",params, function(data){
                        if(data.status == 200){
                            $.messager.alert('提示','删除订单成功!',undefined,function(){
                                $("#itemList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    },'-',{
        text:'下架',
        iconCls:'icon-remove',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中订单!');
                return ;
            }
            $.messager.confirm('确认','确定下架ID为 '+ids+' 的订单吗？',function(r){
                if (r){
                    var params = {"ids":ids};
                    $.post("/rest/item/instock",params, function(data){
                        if(data.status == 200){
                            $.messager.alert('提示','下架订单成功!',undefined,function(){
                                $("#itemList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    },{
        text:'上架',
        iconCls:'icon-remove',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中订单!');
                return ;
            }
            $.messager.confirm('确认','确定上架ID为 '+ids+' 的订单吗？',function(r){
                if (r){
                    var params = {"ids":ids};
                    $.post("/rest/item/reshelf",params, function(data){
                        if(data.status == 200){
                            $.messager.alert('提示','上架订单成功!',undefined,function(){
                                $("#itemList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>