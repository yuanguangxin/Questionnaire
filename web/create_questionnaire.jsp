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
<input id="survey" type="hidden" value="${requestScope.survey.questionId}">
<input id="surveyId" type="hidden" value="${requestScope.survey.id}">
<div class="content" style="padding:10px;cursor:pointer;width:774px;margin: 0 auto">
    <c:forEach items="${requestScope.allQuestions}" var="question">
        <input class="ques" type="hidden" value="${question.id}"/>
        <span></span>
        <div class="will_blue" style="width:100%;overflow: auto;">
                ${question.format}
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
    <button onclick="sort()" style="float: right" class="btn btn-success">确认生成</button>
    <button onclick="sort1()" style="float: right;margin-right: 10px" class="btn btn-success">保存</button>
</div>
<script>
    $(function(){
        if(${sessionScope.admin.username eq null}){
            window.location.href="login.html";
        }
    });
    var questions = document.getElementsByClassName("question");
    for(let i=0;i<questions.length;i++){
        var height = questions[i].style.height.split("px")[0];
        questions[i].parentNode.style.height = (parseInt(height)+3)+"px";
    }
    function getNum() {
        var a = document.getElementsByClassName("blue");
        return a.length;
    }

    var survey = document.getElementById("survey").value.split(",");
    var ques = document.getElementsByClassName("ques");
    var k=1;
    $(".will_blue").prev().html("插入到<input class='insert input' type='text' style='width: 30px;height: 20px;margin-left:5px;outline: none'; /><input style='width: 30px;height: 20px;margin-left:5px;' type='button' class='btn yes'/>");
    for(let i=0;i<survey.length;i++){
        for(let j=0;j<ques.length;j++){
            if(ques[j].value==survey[i]){
                $(ques[j]).next().html((k++)+".");
                $(ques[j]).next().next().addClass("blue");
                $(ques[j]).next().next().addClass("blue");
            }
        }
    }

    $(".will_blue").on("click",function () {
        if($(this).hasClass("blue")){
            $(this).removeClass("blue");
            var num = parseInt($(this).prev().html());
            var m = document.getElementsByTagName("span");
            for(let i=0;i<m.length;i++){
                if(parseInt(m[i].innerHTML)>num){
                    m[i].innerHTML = parseInt(m[i].innerHTML)-1;
                }
            }
            $(this).prev().html("插入到<input class='insert input' type='text' style='width: 30px;height: 20px;margin-left:5px;outline: none'; /><input style='width: 30px;height: 20px;margin-left:5px;' type='button' class='btn yes'/>");
        } else {
            $(this).addClass("blue");
            $(this).prev().html(getNum()+".");
        }
    });

    $("body").on("click",".yes",function () {
        let num = $(this).prev().val();
        if(num>getNum()+1||num<=0){
            alert("请输入正确的题号!");
            return;
        }
        $(this).parent().next().addClass("blue");
        var m = document.getElementsByTagName("span");
        for(let i=0;i<m.length;i++){
            if(parseInt(m[i].innerHTML)>=num){
                m[i].innerHTML = parseInt(m[i].innerHTML)+1;
            }
        }
        $(this).parent().html(num+".");
    });
    function sort() {
        var blue =document.getElementsByClassName("blue");
        var questionIds = [];
        for(let i=1;i<=blue.length;i++){
            for(let j=0;j<blue.length;j++){
                if($(blue[j]).prev().html()==i){
                    questionIds.push($(blue[j]).prev().prev().val());
                    break;
                }
            }
        }
        var s = questionIds.toString();
        var sid = document.getElementById("surveyId").value;
        $.post("/createSurvey.action",{id:sid,questionId:s},function (data,textStatus) {
            alert("生成成功.");
        });
    }
    function sort1() {
        var blue =document.getElementsByClassName("blue");
        var questionIds = [];
        for(let i=1;i<=blue.length;i++){
            for(let j=0;j<blue.length;j++){
                if($(blue[j]).prev().html()==i){
                    questionIds.push($(blue[j]).prev().prev().val());
                    break;
                }
            }
        }
        var s = questionIds.toString();
        var sid = document.getElementById("surveyId").value;
        $.post("/saveSurvey.action",{id:sid,questionId:s},function (data,textStatus) {
            alert("保存成功.");
        });
    }
</script>
</body>
</html>
