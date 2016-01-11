<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="/public/scripts/core/user/user.js"></script>

<%--
<html>
<head>
    <title></title>
    <script type="text/javascript" src="/public/scripts/jquery-1.8.0.min.js"></script>
    <script>
        function check(){
            var flag=true;
            var old=$("#oldpassword").val();
            var num=$("#password1").val().length;
            var pass=$("#password1").val();
            var pass2=$("#password2").val();
            var num1=$("#password1").val().length;
            var num2=$("#password2").val().length;
           // if(num1!=num2||num1<6||num2<6||num1>18||num2>18||pass!=pass2){
            if(old==""||pass==""||num==0||pass==0){
                flag = false;
                alert("密码不能为空")
            }else {
                if (pass != pass2 || num1 != num2) {
                    $("#password1").val('');
                    $("#password2").val('');
                    flag = false;
                    alert("新密码和确认密码不一致，请重新输入")
                }
                else {
                    flag = true;
                }
                if(flag){
                    $.ajax({
                        type: "post",// 指定是post还是get
                        //data:"username="+username+"&userpass="+userpass,//发送到服务器的数据
                        data: "oldpassword=" + old + "&newpassword=" + pass,
                        url: "./modifypassword",//发送请求的地址
                        dataType: "json",
                        success: function (data) {
                            if (data.success == true) {
                                alert("密码修改成功");
                                window.close();
                            }
                            else {
                                alert("修改失败，请确认原密码正确");
                            }
                        }
                    });
            }
            }

        }
    </script>
</head>
<body style="margin: 0px auto">
<div style="align: center;position: relative;width: 100%;margin:0px auto; ">
    <table style="margin: 0px auto">
<form action="./modifypassword"  class="form" method="post" id="change_user_password_form">
    <tr>
        <td>
        <span style="width: 45px">原始密码：</span>
        <input name="oldpassword" id="oldpassword"  style="width: 160px" type="password">
        </td>
    </tr>
    <tr>
        <td>
        <span style="width: 45px;padding-left: 15px">新密码：</span>
        <input name="password1" id="password1" style="width: 160px"  type="password" placeholder="密码必须 6-18 位字母或数字">
        </td>
    </tr>
    <tr>
        <td>
        <span style="width: 45px">确认密码：</span>
        <input name="password2"  id= "password2" style="width: 160px"  type="password"   >
    </td>
    </tr>
    <tr>
        <td>
    <input type="button"  style="width:100px;height: 30px;margin-left: 30%;padding-top: 2px;background-color: #080808;color: white" value="确认修改" onclick="check()">
        </td>
    </tr>
</form>
    </table>
</div>
</body>
</html>--%>
<form  class="form" method="post" <%--action="admin/user/modifypassword"--%> id="change_user_password_form">
    <fieldset><legend>修改密码</legend>
    <p>
        <span>原始密码：</span>
        <input name="oldpassword"  id="oldpassword" class="easyui-validatebox" type="password"  required="required">
    </p>
    <p>
        <span>新密码：</span>
        <input name="newpassword" id="newpassword" type="password"  class="easyui-validatebox"   placeholder="密码必须 6-16 位字母或数字" data-options="required:true,validType:['length[6,16]'],invalidMessage:'密码长度必须为6-16个字符并且必须唯一'" >
    </p>
    <p>
        <span>确认密码：</span>
        <input name="repassword" id="repassword"  type="password"  class="easyui-validatebox"  required="required" placeholder="两次输入必须一致" validType="equals['#newpassword']">
    </p>
    </fieldset>
   <p style="text-align: center;width: 100%;padding-top: 10px;">
        <button  onclick="modifyPassword()"  type="button" class="btn btn-mini btn-primary">提交</button>
    </p>
</form>
