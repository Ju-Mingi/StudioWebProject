<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
<script type="text/javascript" src = "${pageContext.request.contextPath }/script/join.js"></script>
</head>
<body>
	<h3>아이디 중복확인</h3>
	<form method="get" action="${pageContext.request.contextPath }/idCheck.do" name="frm">
		<table>
			<tr>
				<td><label for="id">아이디</label></td>
				<td><input type="text" maxlength="12" name="id" id="id" value="${id }"></td>
				<td><input style="margin-left:72px" type="submit" value="중복 체크"></td>
			</tr>
			<tr>
				<td colspan="3">
					<c:choose>
						<c:when test="${result == 1 }">${id }는 사용중인 아이디입니다.</c:when>
						<c:when test="${result == -1 }">${id }는 사용가능한 아이디입니다.<input style="margin-left:10px"type="button" value="적용" onclick="applyId()"></c:when>
						<c:otherwise></c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</form>
</body>
</html>