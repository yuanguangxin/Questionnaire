<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .shows:hover{
            background: #ccc;
            transition: .5s;
            cursor: pointer;
        }
    </style>
</head>
<body>
<center><h1>Report</h1></center>
<input type="text" style="margin-left: 5px" placeholder="输入姓名" id="name"/> <button type="button" id="name_sub" style="cursor: pointer;outline: none;" class="btn">搜索</button>
<table class="table">
    <tr>
        <td style="border:none">姓名</td>
        <td style="border:none">性别</td>
        <td style="border: none">(索引,答案)</td>
    </tr>
    <c:forEach items="${requestScope.results}" var="result" varStatus="st">
        <tr class="shows">
            <input type="hidden" value="${result.id}"/>
            <td>${requestScope.snames[st.index]}</td>
            <td>
                <c:choose>
                    <c:when test="${result.sex==1}">男</c:when>
                    <c:when test="${result.sex==2}">女</c:when>
                </c:choose>
            </td>
            <c:forEach items="${requestScope.answerString}" varStatus="st1" var="answers">
                <c:if test="${st.index==st1.index}">
                    <c:forEach items="${answers}" var="answer">
                        <td>
                            ${answer}
                        </td>
                    </c:forEach>
                </c:if>
            </c:forEach>
        </tr>
    </c:forEach>
</table>
<div class="form-group" style="margin-left: 5px">
    <a style="color: #000;" href="/printSurvey.action">
        <button type="button" id="create_table" style="cursor: pointer;outline: none;" class="btn btn-group-sm">
            导出为Excel表格
        </button>
    </a>
</div>
<script>
    $(function () {
        $(".shows").on("click",function () {
            var val = $(this).children().first().val();
            window.parent.location.href = "/getCurrentResult.action?id="+val;
        });
        $("#name_sub").on("click",function () {
           var a = $("#name").val();
            location.href = "/findResult.action?name="+a;
        });
    });
</script>
</body>
</html>
