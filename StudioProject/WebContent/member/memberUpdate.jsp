<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

body {
	margin:0;
}

.nav-container {
	display: flex;
	flex-direction: row;
	width: 100%;
	margin: 0;
	padding: 0;
	background-color: rgb(211, 211, 255);
	list-style-type: none;
	border-bottom:1px solid black;
}

.nav-item {
	padding: 15px;
	cursor: pointer;
	font-weight:650;

}

.nav-icon{
	height:50px; width:50px; background-color:white;
	border-right:1px solid black;
}
</style>
<title>회원정보 수정</title>
<body>
	<nav>
		<ul class="nav-container">
			<img class = "nav-icon" src="../img/iwperson_logo.png">
			<li class="nav-item">IWperson</li>
			<li class="nav-item">사진관 찾기</li>
			<li class="nav-item">사진관 추천</li>
			<li class="nav-item">공지사항</li>
			<li class="nav-item">이벤트</li>
		</ul>
	</nav>

	<section>
		<p>본문</p>
	</section>
</body>