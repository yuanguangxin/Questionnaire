<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/add_question.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .del{
            position: absolute;
            top: 0px;
            right: 10px;
            font-size: 16px;
        }
        .del:hover{
            transform: rotate(180deg);
            transition: .5s;
        }
    </style>
</head>
<body>
<div class="content" style="padding:10px;cursor:pointer;width:774px;margin: 0 auto">
    <c:forEach items="${requestScope.allQuestions}" var="question">
        <div class="will_blue" style="width:100%;overflow: auto;">
                ${question.questionFormat}
        </div>
        <br/>
        <br/>
    </c:forEach>
</div>
<script>
    var questions = document.getElementsByClassName("question");
    var s = "<div class='del'>x</div>";
    for(let i=0;i<questions.length;i++){
        var height = questions[i].style.height.split("px")[0];
        questions[i].parentNode.style.height = (parseInt(height)+3)+"px";
        questions[i].innerHTML+=s;
    }
</script>
</body>
</html>
