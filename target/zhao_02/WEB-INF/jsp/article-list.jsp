<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="easyui-datagrid" id="itemList"
        toolbar="#tb"
>
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:60">文章ID</th>
        <th data-options="field:'title',width:200">文章标题</th>
        <th data-options="field:'typeStr',width:100">文章类别</th>
        <th data-options="field:'content',width:100">文章内容</th>
        <th data-options="field:'img',width:50,align:'center',formatter:TAOTAO.formatUrl">图片</th>
        <th data-options="field:'status',width:100">状态</th>
        <th data-options="field:'sort',width:100">排序</th>
        <th data-options="field:'createTime',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建时间</th>
        <th data-options="field:'updateTime',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新时间</th>

    </tr>
    </thead>
</table>

<div id="tb" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
        <div id="addArticle" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</div>
        <div id="editArticle" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</div>
        <div id="deletArticle" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</div>
        <div id="detailArticle" class="easyui-linkbutton" iconCls="icon-tip" plain="true">详情</div>

        文章类型:
            <select id="articleType" class="easyui-combobox" style="width:100px">
                <option value="0">全部</option>
                <option value="1">情感</option>
                <option value="2">军事</option>
                <option value="3">历史</option>
                <option value="4">搞笑</option>
                <option value="5">社会</option>
            </select>
            <a id="doSearch" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
    </div>
</div>
<div id="itemEditWindow" class="easyui-window" title="编辑文章" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/article-edit'" style="width:80%;height:80%;padding:10px;">
</div>

<div id="itemDetailWindow" class="easyui-window" title="文章详情" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/article-detail'" style="width:80%;height:80%;padding:10px;">
</div>
<script>

    /*默认加载全部的数据*/
    $('#itemList').datagrid(
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
            title:"文章列表",
            url:'/article/queryAll',
            loadMsg:'数据加载中......',
        }
    );

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

    $(function () {

        /*新增文章*/
        $('#addArticle').bind('click', function () {
            $(".tree-title:contains('新增文章')").parent().click();
        });

        /*编辑文章*/
        $('#editArticle').bind('click', function () {
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
        });

        /*删除文章*/
        $('#deletArticle').bind('click', function () {
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
        });

        $('#detailArticle').bind('click', function () {
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','必须选择一个文章才能查看详情!');
                return ;
            }
            if(ids.indexOf(',') > 0){
                $.messager.alert('提示','只能选择一个文章!');
                return ;
            }

            $("#itemDetailWindow").window({
                onLoad :function(){
                    //回显数据
                    var data = $("#itemList").datagrid("getSelections")[0];
                    $("#itemDetailForm").form("load",data);
                    itemDetailEditor.html(data.content);
                    TAOTAO.init({
                        "title" : data.title,
                        "articleType" : data.articleType,
                        "sort": data.sort,
                        fun:function(node){
                            TAOTAO.changeItemParam(node, "itemDetailForm");
                        }
                    });
                }
            }).window("open");

        });


        $('#doSearch').bind('click', function () {
           var selectValue =  $('#articleType').combobox('getValue');

            $('#itemList').datagrid(
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
                    url:'/article/queryArticleByType?articleType='+selectValue,
                    loadMsg:'数据加载中......',
                }
            );

        })
    })

</script>
<%--




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
    },{
        text:'搜索：<input id="ss" class="easyui-searchbox" style="width:300px" data-options="searcher:qq,prompt:\'Please Input Value',menu:'#mm\'"></input> <div id="mm" style="width:120px"> <div data-options="name:\'all\',iconCls:\'icon-ok\'">All News</div> <div data-options="name:\'sports\'">Sports News</div></div>',
        iconCls:'icon-search',
        handler:function(){
        }
    }

    ];
</script>--%>
