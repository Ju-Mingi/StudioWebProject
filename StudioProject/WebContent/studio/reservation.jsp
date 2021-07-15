<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reservation.css"
	type="text/css" />
<%
String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>

<body>
	<%@ include file="/header/header.jsp"%>

	<div style="overflow: auto;"></div>
	<br>
	<br>
	<br>
	<br>
	<div class="container">


		<form name="reserv_form" class="reserv_form" action="reservProcess.jsp"
			method="post">
			<div id="form_title" ; style="float: left; height: 20px">예약</div>
			<br>
			<div style="float: right">
				<c:set value="<%=Date%>" var="today" />
				<!-- 변수 명에 값을 할당-->

				<input type="date" id="reserv_date" min="${today}">
				<!-- today의 값을 가져오기 위한 객체 -->

			</div>
			<br>
			<br>
			<hr>
			<div style="height: 200px;">
				<div style="float: left;" class="time_check">
					<label for="check1"><span></span>10:00 ~ 12:00</label> <input
						type="radio" id="check1" name="check" />
					<br><br>

						<label for="check2"><span></span>12:00 ~ 14:00</label> <input
							type="radio" id="check2" name="check" />
					<br><br>

						<label for="check3">14:00 ~ 16:00<span></span></label> <input
							type="radio" id="check3" name="check" />
					<br><br>
						<label for="check4"><span></span>16:00 ~ 18:00</label> <input
							type="radio" id="check4" name="check" />
				</div>

			</div>
			<br>
			※코로나 거리두기 4단계 격상으로 인해 18:00까지만 운영됩니다. <br>

			<div id="form_title" style="float: left; height: 20px;">예약자 정보</div>
			<br>
			<br>
			<br>
			<hr>

			<table>
				<tr>
					<td style="text-align: center; width: 200px;">예약자 이름</td>
					<td><input type="text" id="reserv_name" name="reserv_name"
						maxlength="10" /></td>
				</tr>
				<br>
				<tr>
					<td id="title">연락처</td>
					<td><input id="reserv_phone" type="text" size="3"
						name="reserv_phone_1" maxlength="3" placeholder="010"
						pattern="[0]{1}[1]{1}[0-9]{1}" /> <input id="reserv_phone"
						type="text" size="4" name="reserv_phone_2" maxlength="4"
						placeholder="1234" pattern="[0-9]{3,4}" /> <input
						id="reserv_phone" type="text" size="4" name="reserv_phone_3"
						maxlength="4" placeholder="5678" pattern="[0-9]{4}" /></td>
				</tr>
			</table>
			<br> <br>
			<div id="form_title" style="float: left; height: 20px">결제 금액</div>
			<br>
			<br>
			<br>
			<hr>
			<br>
			<table>
				<tr>
					<td style="text-align: center; width: 200px;">상품 금액</td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td style="text-align: center; width: 200px;">최종 결제 금액</td>
				</tr>

			</table>
			<br> <br> <input id="reservation_submit" type="submit"
				value="결제" />
		</form>
	</div>
</body>
</html>