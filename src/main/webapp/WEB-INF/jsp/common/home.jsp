<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<html  lang="en-au">
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
</head>
<body class="easyui-layout" style="width: 100%;height: 100%;" data-options="fit:true">
<div region="north" border="false" class="app-header">
    <div class="app-header-menu">
        <div style="background: #7fc5ef;height:55px;text-align: center;top:18px;font-size: xx-large;margin: 0px auto">  <span style="font-size: xx-large;font-weight: bold;margin: 0px auto;position: relative;top:12%">管理平台</span>
           <%-- <a href="admin/user/modifypassword" style="float:right;position: relative;right:26px;top:2px;font-size: 16px;text-decoration: none" target="_blank">修改密码</a>
          --%>

            <div style="position:absolute;top: 4px;right: 2%;text-align: center;float:left;">
                <li style="list-style-type:none;float:left;">
                    <a href="javascript:void(0)"  style="position: relative;/*right:40px;top:2px;*/font-size: 14px;text-decoration: none;text-align: center" data-options="plain:true"
                       onclick="customerShowDialog({url:'admin/user/modifypassword',id:'change_user_password_form',title:'修改密码',width:620,height:260});">修改密码</a>
                    <span style="padding-left: 4px;padding-right: 4px">|</span>
                </li>
                <li style="list-style-type:none;float:left;">
                    <a href="logout" style="font-size:14px;position: relative;/*right:26px;top:18px;*/text-align: center;text-decoration: none" data-options="plain:true">退出</a>
                </li>
            </div>
            <div style="position:absolute;bottom: 4px;right: 2%;text-align: center;float:left;">
                <span style="float: left;font-size: 14px"> 您好 <font color="#f0f8ff" size=""> ${username}</font></span>
            </div>
      <%--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"
           onclick="modifyPassword()">修改密码</a>--%>
    </div>

</div>
</div>
<div region="west" title="导航栏" class="easyui-default" style="width: 240px;background: #f8f8f8;padding-left: 10px;"
     data-options="tools:'#main-tree-tools'">
    <ul class="easyui-tree" id="main_menu" style="padding-top: 15px;"
        data-options="url:'admin/rolemenu/load',method:'get',animate:true,cache:false,lines:false">
    </ul>
    <div id="main-tree-tools">
        <a href="javascript:void(0)" class="icon-arrow-in" title="展开全部" onclick="mainTreeExpandAll()"></a>
        <a href="javascript:void(0)" class="icon-arrow-out" title="收缩全部" onclick="mainTreeUnExpandAll()"></a>
    </div>
</div>
<div region="center" border="false" style="padding-left:5px;" >
    <div class="easyui-tabs" id="main_tab" fit="true">
        <div title="欢迎" iconCls='icon-home' style="width: 100%;">
        </div>
    </div>
</div>
<div region="south" style="height: 28px;text-align: center;background: #e0ecff;"
     border="false">
</div>
<div id="change_user_password_dialog" >

</div>
<div class="easyui-dialog" id="hos_user_info_dialog" data-options="
    noheader:true,
    width: 800,
    height: 500,
    closed:false,
    cache:false,
    border:false,
    maximized:true,
    closed:true,
    modal: true"
>

</div>
<div id="sys_loading_dialog" class="easyui-dialog" data-options="noheader:true,modal:true,closed:true"
     style="width: 200px;height:48px;padding: 2px;">
    <span style="line-height: 30px;text-indent:5px;vertical-align: middle;display: block;float: left;">在拼命加载中……</span>
</div>
<script type="text/javascript">
        function showMessager(content) {
            $.messager.show({
                title: '提示',
                msg: content,
                timeout: 2000,
                showType: 'fade',
                style: {
                    right: '',
                    top: document.body.scrollTop + document.documentElement.scrollTop,
                    bottom: ''
                }
            })
        }
</script>
    
</body>
</html>