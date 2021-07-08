<%@ page import = "java.sql.Connection" %>
<%@ page import = "com.test.dao.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberDAO mDao = MemberDAO.getInstance();
	Connection conn = mDao.getConnection();
	out.println("dbcp 성공");
	%>
</body>
</html>