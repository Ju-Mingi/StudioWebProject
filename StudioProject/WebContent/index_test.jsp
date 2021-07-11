<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IWPERSON HOME</title>
</head>
<body>
	로그인 버튼
	<%
	Object id = session.getAttribute("loginUser");
	out.println(id);
	if (id == null)
		out.println("<img src =\"img/loginBtn.png\" onclick = \"location.href = 'login.do'\">");
	else {
		out.println("<br>로그인 유지 중입니다.");
		out.println("<img src =\"img/logoutBtn.png\" onclick = \"location.href = 'logout.do'\">");
	}
	%>

</body>
</html>