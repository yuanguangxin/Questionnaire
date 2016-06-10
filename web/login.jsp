<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <style>
        body {
            margin: 0;
            background: url("img/login.jpg");
            background-size: 100% 100%;
            background-attachment: fixed;
            font-family: '微软雅黑', 'microsoft yahei', 宋体, Tahoma, Verdana, Arial, Helvetica, sans-serif;
        }

        .login {
            width: 300px;
            height: 300px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -150px;
            margin-top: -150px;
        }

        input {
            border: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="back"></div>
    <div class="login">
        <table class="table">
            <form action="index.jsp" method="post">
                <caption>
                    <center><h5>管理员登录</h5></center>
                </caption>
                <tr>
                    <td>用户名</td>
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <center>
                            <input type="button" class="btn btn-primary" value="立即登录">
                        </center>
                    </td>
                </tr>
            </form>
        </table>
    </div>
</div>
<script>
    var login = document.getElementsByTagName("input")[2];
    login.onclick = function(){
        var username = document.getElementsByTagName("input")[0].value;
        var password = document.getElementsByTagName("input")[1].value;
        $.post("<%=path%>/login.action",{username:username,password:password},function(text,dataStatus){
            if(text=="wrong"){
                alert("Wrong Account！");
            }else{
                document.getElementsByTagName("form")[0].submit();
            }
        });
    }
</script>
</body>
</html>