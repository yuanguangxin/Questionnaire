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
</head>
<body>
<div class="content" style="padding:10px;cursor:pointer;width:774px;margin: 0 auto">
    <c:forEach items="${requestScope.allQuestions}" var="question">
        <input type="hidden" value="${question.id}"/>
        <div class="will_blue" style="width:100%;overflow: auto;">
                ${question.questionFormat}
        </div>
        <c:choose>
            <c:when test="${question.sex==1}">
                <span style="font-size: 13px">*for Man only</span>
            </c:when>
            <c:when test="${question.sex==2}">
                <span style="font-size: 13px">*for Woman only</span>
            </c:when>
        </c:choose>
        <br/>
        <br/>
    </c:forEach>
</div>
</body>
</html>
