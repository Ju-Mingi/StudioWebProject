<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.test.dao.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
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
	margin-top: -5px;
}

nav {
	background-color: rgb(211, 211, 255);
	height: 50px;
	padding: 5px;
	display: block;
	width: 100%;
}

nav ul {
	float: left;
	margin-top: 10px;
}

nav li {
	display: inline-block;
	padding: 3px 20px;
}
</style>
</head>
<body>
	<%
	Object userCheck = session.getAttribute("loginUser");
	/* String userdata = String.valueOf(id); //Object 를 String 으로 받는 법
	out.println(userdata); */
	%>
	<header>
		<nav>
			<ul>
				<a href="${pageContext.request.contextPath}/index.jsp"><img
					src="${pageContext.request.contextPath}/img/iwperson_logo.png"
					width="40px" height="40px">IWPERSON</a>
				<li><a href="/StudioProject/studio/search.jsp">사진관 찾기</a></li>
				<!-- <li><a href="studio/studio_registration.jsp">사진관 등록</a></li> -->
				<%
				if (userCheck == null) {
					out.println("<li><a href = \"/StudioProject/join.do\">회원가입</a></li>");
					out.println("<li><a href = \"/StudioProject/login.do\">로그인</a></li>");
				}else{
					out.println("<li><a href=\"/StudioProject/studio/studio_registration.jsp\" onclick=\"alert('사업자 회원만 등록 가능합니다.')\">사진관 등록</a></li>");
					out.println("<li><a href = \"/StudioProject/memberUpdate.do\">마이페이지</a></li>");
					out.println("<li><a href = \"/StudioProject/logout.do\">로그아웃</a></li>");
				}
				%>
				<li>반가워요! ${loginUser.name}</li>
			</ul>
		</nav>
	</header>
	<script type="text/javascript">
		/* 실시간 상담 가능 기능 */
		var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
		(function() {
			var s1 = document.createElement("script"), s0 = document
					.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/609632a5185beb22b30b4590/1f55bbm6p';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
	</script>
</body>
</html>