<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="orderAddForm" class="orderForm" method="post">
        <table cellpadding="5">
            <tr>
                <td>请选择路线:</td>
                <td>
                    <select id="lineId" class="easyui-combobox" name="lineId">
                        <option value="1">路线一</option>
                        <option value="2">路线二</option>
                        <option value="3">路线三</option>
                    </select>

                </td>	        </tr>
                <tr>
                    <td>预定时单价:</td>
                    <td><input class="easyui-numberbox" type="text" name="price" data-options="min:1,max:99999999,precision:2" />
                        <input type="hidden" name="price"/>
                    </td>
                </tr>

                <tr>
                    <td>预定时总价:</td>
                    <td><input class="easyui-numberbox" type="text" name="totalPrice" data-options="min:1,max:99999999,precision:2" />
                        <input type="hidden" name="totalprice"/>
                    </td>
                </tr>
            <tr>
                <td>成人数量:</td>
                <td><input class="easyui-numberbox" type="number" name="adultNum" data-options="min:1,max:99999999,precision:0" /></td>
            </tr>

                <tr>
                    <td>儿童数量:</td>
                    <td><input class="easyui-numberbox" type="number" name="childNum" data-options="min:1,max:99999999,precision:0" /></td>
                </tr>
                <tr>
                    <td>联系电话:</td>
                    <td><input class="easyui-textbox" type="text" name="phone"></input></td>
                </tr>

                <tr>
                    <td>预定时间:</td>
                    <td><input class="easyui-datetimebox" name="createTime"
                               data-options="required:true,showSeconds:false" value="3/4/2010 2:3" style="width:150px">  </td>
                </tr>

            <tr>
                <td>备注:</td>
                <td>
                    <textarea style="width:800px;height:300px;visibility:hidden;" name="note"></textarea>
                </td>
            </tr>

        </table>
        <input type="hidden" name="itemParams"/>
    </form>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
    </div>
</div>
<script type="text/javascript">
    var orderAddEditor ;
    //页面初始化完毕后执行此方法
    $(function(){
        //创建富文本编辑器
        orderAddEditor = KindEditor.create("#orderAddForm [name=note]", TT.kingEditorParams)
    });
    //提交表单
    function submitForm(){
        //有效性验证
        if(!$('#orderAddForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }
        $.post("/order/add",$("#orderAddForm").serialize(), function(data){
            if(data.status == "success"){
                $.messager.alert('提示','新增文章成功!');
            } else {
                $.messager.alert('提示', '新增文章失败!')
            }
        });
    }

    function clearForm(){
        $('#orderAddForm').form('reset');
        orderAddEditor.html('');
    }
</script>
