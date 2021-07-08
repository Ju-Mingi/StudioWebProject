<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "com.test.dao.MemberDAO" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 테이블 접근 여부</title>
</head>
<body>

<%
	// DB 연동 시도
	try{
		MemberDAO mDao = MemberDAO.getInstance();
		Connection conn = mDao.getConnection();
		out.print("커넥션 풀 연동 성공");
	}catch(Exception e){
		e.printStackTrace();
		out.print("연동에 실패하였습니다.");
	}
%>
</body>
</html>