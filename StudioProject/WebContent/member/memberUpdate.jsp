<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body>
	<script type="text/javascript">
		window.history.forward(1);
	</script>
	<%@ include file="/header/header.jsp"%>
	<form method="post"
		action="${pageContext.request.contextPath }/memberUpdate.do"
		name="updateform">
		<center>
			<table
				style="border-radius: 10px; border-spacing: 5px 50px; background-color: rgb(211, 211, 255); width: 500px; height: 500px; margin-top: 50px; padding-left: 55px;">
				<tr>
					<th>회원정보 수정</th>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" readonly="readonly"
						value="${loginUser.name }"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" readonly="readonly"
						value="${loginUser.id }"></td>
				</tr>
				<tr>
					<td>암호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value=""></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" value=""></td>
				</tr>
				<tr>
					<td><input style="margin-left:70px;" type="submit" value="확인" size = 10
						onclick="return joinCheck()"></td>
					<td><input style="margin-left:100px;" type="reset" value="취소" size = 10></td>
				</tr>
			</table>
		</center>
	</form>
</body>