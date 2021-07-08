<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_style.css" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
<div id="header" role="banner">
	<div id="gnb" class>
		<div class="list_nav">
			<div class="logo_area">
				<a href="index.jsp"><img width="120px" height="120px" src="${pageContext.request.contextPath}/images/logo.png"></a>
			</div>
		</div>
		<div class="gnb_inner">
			<div class="group_nav">
				<ul class="list_nav normal">
					<li class="nav_item">
					<a href="search.jsp" class="nav">사진관 찾기</a>
					</li>
					<li class="nav_item">
					<a href="#" class="nav">사진관 추천</a>
					</li>
					<li class="nav_item">
					<a href="notices.jsp" class="nav">공지사항</a>
					</li>
					<li class="nav_item">
					<a href="events.jsp" class="nav">이벤트</a>
					</li>
				</ul>

			<div id="search" class="list_nav search_area">
				<form id="sform" name="sform" action="#" method="get" role="search">
				<fieldset>
					<div id="search_win" class="search_window">
							<input id="query" name="query" size="16px" type="text" title="검색어 입력"
								maxlength="255" class="input_text" tabindex="1" accesskey="s"
								style="ime-mode: active;" autocomplete="off"
								placeholder="검색하기"
								onclick="document.getElementById('fbm').value=1;" value=""
								data-atcmp-element="">
					</div>
					<button id="nav_item search_btn" class="btn_submit" type="submit" title="검색" tabindex="3" onclick="#">검색</button> 
				</fieldset>
				</form>
			</div>
		
				<ul class="list_nav user_option">
					<li class="nav_item">
					<a href="mycart.jsp" class="nav">장바구니</a>
					</li>
					<li class="nav_item">
					<a href="log.jsp" class="nav">로그인</a>
					</li>
					<li class="nav_item">
					<a href="signup.jsp" class="nav">회원가입</a>
					</li>
					<li class="nav_item">
					<a href="mypage.jsp" class="nav">마이페이지</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<hr style="clear:left;">
</div>

</body>
</html>