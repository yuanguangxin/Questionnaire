<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <title>Admin Manage</title>
    <style>
        body{
            margin:0 ;
            font-family: "Microsoft YaHei";
        }
        a{
            color: #000;
        }
        a:hover{
            color: #000;
            text-decoration: none;
        }
        .content{
            width: 90%;
            margin:10px auto;
        }
        .page>div{
            height: 40px;
            line-height: 40px;
            text-align: center;
            font-size: 14px;
            float: left;
            padding-left: 10px;
        }
        .del:hover{
            color: #39ac6a;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="content">
    <table class="table">
        <caption><h4>
            <b style="display: inline-block;">管理员管理</b>
            <center>
                <b style="display: inline-block;">
                    <form action="/getSelectAdmin.action" method="post">
                        <input type="text" value="${requestScope.message}" name="message"/>
                        <input class="btn" type="submit" value="搜索"/>
                    </form>
                </b>
            </center>
        </h4></caption>
        <th>
            <tr>
                <td>账户</td>
                <td>密码</td>
                <td>操作</td>
            </tr>
        </th>

        <c:forEach items="${requestScope.admins}" var="admin">
            <tr>
                <td>${admin.username}</td>
                <td>${admin.password}</td>
                <td>
                    <a class="del" value="${admin.id}">删除</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <form action="/addAdmin.action" target="_parent" method="post">
                <td><input type="text" name="username"/></td>
                <td><input type="text" name="password"/></td>
                <td>
                    <input type="submit" class="btn" id="add" value="确认添加"/>
                </td>
            </form>
        </tr>
    </table>
</div>
</body>
<script>
    $(function(){
        if(${sessionScope.admin.username eq null}){
            window.location.href="login.html";
        }
    });
    $(function(){
        $(".del").click(function(){
            var a=$(this).attr("value");
            $(this).parents("tr").hide("normal");
            $.post("/deleteAdmin.action",{delId:a},function(data,textStatus){
            })
        });
    })
</script>
</html>