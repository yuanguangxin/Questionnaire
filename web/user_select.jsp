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
<h3 class="h3" style="margin: 20px">请选择调查问卷:</h3>
<c:forEach items="${requestScope.surveys}" var="survey">
    <div class="survey col-lg-4 col-md-4 col-xs-4" value="${survey.id}">
        <table class="table">
            <tr>
                <td style="border: none">名称:${survey.name}</td>
            </tr>
        </table>
    </div>
</c:forEach>
<script>;
    $(".survey").on("click",function () {
        var sid = $(this).attr("value");
        window.location.href = "/checkStatus.action?surveyId="+sid;
    });
</script>
</body>
</html>
