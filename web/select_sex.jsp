<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .content{
            margin-top: -17%;
            width: 520px;
            position: absolute;
        }
        .sex{
            font-size: 60px;
            width: 250px;
            height: 250px;
            text-align: center;
            line-height: 250px;
            cursor: pointer;
            display: table-cell;
        }
        #male{
            float: left;
        }
        #female{
            float: right;
        }
        .blue{
            border: 2px solid rgb(112,172,233);
            -webkit-box-shadow:0 0 3px 3px rgb(112,172,233);
            -moz-box-shadow:0 0 3px 3px rgb(112,172,233);
            box-shadow:0 0 10px 3px rgb(112,172,233);
        }
        #span:hover{
            background: #fff;
            transition: .5s;
        }
    </style>
</head>
<body>
    <script>
        $(function(){
            if(${sessionScope.user.username eq null}){
                window.location.href="login.jsp";
            }
        })
    </script>
    <input type="hidden" id="sid" value="${requestScope.sid}">
    <div class="content">
        <div class="sex blue" value="2" id="male">♂</div>
        <div class="sex" value="1" id="female">♀</div>
        <button id="span"  type="button" style="position:absolute;left:50%;top:85%;margin-left:-95px;border:none;outline: none;" class="btn btn-default btn-lg">
            <span class="glyphicon glyphicon-log-in"></span> &nbsp;&nbsp;Start
        </button>
    </div>
    <script>
        $(".sex").on("click",function () {
            $(".sex").removeClass("blue");
            $(this).addClass("blue");
        });
        document.getElementsByTagName("button")[0].onclick = function () {
            var gender = document.getElementsByClassName("blue")[0].getAttribute("value");
            var sid = document.getElementById("sid").value;
            location.href = "/getSurveyBySex.action?sex="+gender+"&sid="+sid;
        }
    </script>
</body>
</html>