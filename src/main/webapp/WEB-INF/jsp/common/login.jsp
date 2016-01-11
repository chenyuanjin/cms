<%--
  Created by IntelliJ IDEA.
  User: chenyj
  Date: 15/11/23
  Time: 下午2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理系统</title>
    <link href="<%=path%>/public/style/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="<%=path%>/public/scripts/jquery.js"></script>
    <script src="<%=path%>/public/scripts/cloud.js" type="text/javascript"></script>

    <script language="javascript">
        $(function(){
            $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            $(window).resize(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            })
        });
    </script>

</head>

<body style="background-color:#1c77ac; background-image:url(<%=path%>/public/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">


<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>


<div class="logintop">
    <span>欢迎登录后台管理系统</span>
    <ul>
       <%-- <li><a href="#">回首页</a></li>--%>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>

<div class="loginbody">

    <form action="j_spring_security_check" method="post"  id="login-form" >
    <span class="systemlogo"></span>

    <div class="loginbox">

        <ul>
            <li><input name="j_username" type="text" class="loginuser" placeholder="用户名" onclick="JavaScript:this.value=''"/></li>
            <li><input name="j_password" type="password" class="loginpwd" placeholder="密码" onclick="JavaScript:this.value=''"/></li>
            <li><input name="" type="submit" class="loginbtn" value="登录"   />
                <%--<label><input name="" type="checkbox" value="" checked="checked" />记住密码</label>--%>
                <label><a href="#">忘记密码？</a></label></li>
        </ul>

    </div>
    </form>
</div>

<div class="loginbm">版权所有  2015  <a href="#" target="_blank">xx科技</a> </div>

</body>

</html>

