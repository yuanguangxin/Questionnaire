<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .create{
            margin: 20px;
        }
        .survey{
            width: 280px;
            height: 160px;
            background: #fff;
            border: 1px solid #ccc;
            margin: 20px;
            padding: 20px;
        }
        .survey:hover{
            transition: .5s;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="create">
    新建调查问卷: <input type="text" id="name" placeholder="问卷名称"/> <button class="btn add">确定</button>
</div>
<c:forEach items="${requestScope.surveys}" var="survey">
    <div class="survey col-lg-4 col-md-4 col-xs-4">
        <table class="table">
            <tr>
                <td style="border: none">名称:${survey.name}</td>
            </tr>
            <tr>
                <c:choose>
                    <c:when test="${survey.status==0}">
                        <td style="border: none">状态:未发布</td>
                    </c:when>
                    <c:when test="${survey.status==1}">
                        <td style="border: none">状态:已发布</td>
                    </c:when>
                </c:choose>
            </tr>
        </table>
        <button class="btn del" value="${survey.id}">删除</button>
    </div>
</c:forEach>
<script>
    $(".add").on("click",function () {
        var a = $("#name").val();
        window.location = "/addSurvey.action?name="+a;
    });
    $(".del").on("click",function () {
        var id = $(this).attr("value").toString();
        $(this).parent().hide(300);
        $.post("/deleteSurvey.action",{id:id},function (data,textStatus) {
        });
    });
    $(".survey").on("click",function () {
        var sid = $(this).children().last().attr("value");
        window.location.href = "/createQuestionnaire.action?id="+sid;
    });
</script>
</body>
</html>
