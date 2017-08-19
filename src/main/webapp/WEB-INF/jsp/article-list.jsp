<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="itemList" title="文章列表" 
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/article/queryAll',method:'get',pageSize:30,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',width:60">文章ID</th>
            <th data-options="field:'title',width:200">文章标题</th>
            <th data-options="field:'articleType',width:100">文章类别</th>
            <th data-options="field:'content',width:100">文章内容</th>
            <th data-options="field:'status',width:100">状态</th>
            <th data-options="field:'sort',width:100">排序</th>
            <th data-options="field:'createTime',width:100">创建时间</th>
            <th data-options="field:'updateTime',width:100">更新时间</th>
        </tr>
    </thead>
</table>
<div id="itemEditWindow" class="easyui-window" title="编辑文章" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/article-edit'" style="width:80%;height:80%;padding:10px;">
</div>
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
        	$(".tree-title:contains('新增文章')").parent().click();
        }
    },{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','必须选择一个文章才能编辑!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一个文章!');
        		return ;
        	}
            $("#itemEditWindow").window({
                onLoad :function(){
                    //回显数据
                    var data = $("#itemList").datagrid("getSelections")[0];
                    $("#itemeEditForm").form("load",data);

                    alert(data.sort+"-----------"+data.articleType);
                    itemEditEditor.html(data.content);
                    TAOTAO.init({
                        "title" : data.title,
                        "articleType" : data.articleType,
                        "sort": data.sort,
                        fun:function(node){
                            TAOTAO.changeItemParam(node, "itemeEditForm");
                        }
                    });
                }
            }).window("open");

        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中文章!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除ID为 '+ids+' 的文章吗？',function(r){
        	    if (r){
        	    	var params = {"id":ids};
                	$.post("/article/delete",params, function(data){
            			if(data.status == "success"){
            				$.messager.alert('提示','删除文章成功!',undefined,function(){
            					$("#itemList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    }];
</script>