<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Admin Index</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/admin.css">
	<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
	<div class="left-menu">
		<div>Admin System</div>
		<div class="tab">
			<div><a style="text-decoration: none;color: inherit" target="_blank" href="add_question.jsp">题目录入</a></div>
			<div>题目管理</div>
			<div>问卷生成</div>
			<div>打印调查结果</div>
			<div>管理员管理</div>
		</div>
	</div>
	<div class="right-menu">
		<div style="border-bottom: 1px solid #ccc;margin-bottom: 20px">
			<div class="count">
				<div>${sessionScope.admin.username} &nbsp;&nbsp;<a style="cursor: pointer" href="/quit.action">退出</a></div>
			</div>
		</div>
		<div>
			<iframe src="welcome.html" frameborder="0"></iframe>
		</div>
	</div>
	<div class="footer">
		Copyright © 2016, admin.com
	</div>
</body>
<script>
	$(function(){
		if(${sessionScope.admin.username eq null}){
			window.location.href="login.html";
		}
	});
	$(function(){
		$(".tab div").click(function(){
			var content = $(this).html();
			if(content == "题目管理"){
				$("iframe").prop("src","/questionManage.action");
			}else if(content == "问卷生成"){
//				$("iframe").prop("src","/createQuestionnaire.action");
				$("iframe").prop("src","/selectSurvey.action");
			}else if(content == "打印调查结果") {
				$("iframe").prop("src","/getAllResult.action");
			}else if(content=="管理员管理"){
				$("iframe").prop("src","/getAllAdmin.action");
			}
		})
	})
</script>
</html>