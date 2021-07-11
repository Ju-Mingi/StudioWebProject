<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 0px;
	margin: 0px;
}

a {
	text-decoration: none;
	font-weight:bold;
	color: black;
}


img {
	float: left;
	margin-left: 20px;
	margin-top: 5px;
}

nav {
	background-color: rgb(211, 211, 255);
	height: 50px;
	padding: 5px;
	display: block;
	width: 100%;
}

nav ul {
	float: right;
	margin-top: 10px;
}

nav li {
	display: inline-block;
	padding: 0px 10px;
}
</style>
</head>
<body>
<%Object id = session.getAttribute("loginUser");%>
	<header>
		<nav>
			<ul>
				<img src="${pageContext.request.contextPath}/img/iwperson_logo.png" width="40px" height="40px" style="margin-right:1000px;">
				<li><a href="#">사진관 찾기</a></li>
				<li><a href="studio/studio_registration.jsp">사진관 등록</a></li>
				<%
				if (id == null) {
					out.println("<li><a href = 'join.do'>회원가입</a></li>");
					out.println("<li><a href = 'login.do'>로그인</a></li>");
				} else {
					out.println(
					"<li><a href = 'MemberUpdate.do'>마이페이지</a></li>");
					out.println(
					"<li><a href = 'logout.do'>로그아웃</a></li>");
				}
				%>
			</ul>
		</nav>
	</header>

</body>
</html>