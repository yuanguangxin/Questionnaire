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
        .blue{
            border: 2px solid rgb(112,172,233);
            -webkit-box-shadow:0 0 3px 3px rgb(112,172,233);
            -moz-box-shadow:0 0 3px 3px rgb(112,172,233);
            box-shadow:0 0 10px 3px rgb(112,172,233);
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
    <button style="float: right" class="btn btn-success">确认生成</button>
</div>
<script>
    var questions = document.getElementsByClassName("question");
    for(let i=0;i<questions.length;i++){
        var height = questions[i].style.height.split("px")[0];
        questions[i].parentNode.style.height = (parseInt(height)+3)+"px";
    }
    $(".will_blue").on("click",function () {
        if($(this).hasClass("blue")){
            $(this).removeClass("blue");
        } else {
            $(this).addClass("blue");
        }
    });
</script>
</body>
</html>
