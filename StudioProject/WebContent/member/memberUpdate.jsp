<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.info_list{
		text-align:center;
	}
</style>
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
				style="border-radius: 10px; border-spacing: 0px 40px; background-color: rgb(211, 211, 255); width: 400px; height: 300px; margin-top: 50px; padding-left: 25px;">
				<tr>
					<th style="background-color:white;">회원정보 수정</th>
				</tr>
				<tr>
					<td class="info_list">이름</td>
					<td><input type="text" name="name" readonly="readonly"
						value="${loginUser.name }"></td>
				</tr>
				<tr>
					<td class="info_list">아이디</td>
					<td><input type="text" name="id" readonly="readonly"
						value="${loginUser.id }"></td>
				</tr>
				<tr>
					<td class="info_list">암호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td class="info_list">이메일</td>
					<td><input type="email" name="email" value=""></td>
				</tr>
				<tr>
					<td class="info_list">전화번호</td>
					<td><input type="text" name="phone" value=""></td>
				</tr>
				<tr>
					<td><input style="margin-left:60px;" type="submit" value=" 확 인 " size = 10
						onclick="return joinCheck()"></td>
					<td><input style="margin-left:100px;" type="reset" value=" 취 소 " size = 10></td>
				</tr>
			</table>
		</center>
	</form>
</body>