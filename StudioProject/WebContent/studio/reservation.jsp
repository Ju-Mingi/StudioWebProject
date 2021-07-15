<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
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
<%
String ent_num = request.getParameter("ent_num");
//String ent_num = "123";
String sql = "select * from studio where ent_num = ?";

String studio_name = null;
String studio_phone = null;
String studio_address = null;
String product1_name = null;
String product1_price = null;
String product2_name = null;
String product2_price = null;
String product3_name = null;
String product3_price = null;
String product4_price = null;
String product4_name = null;
String product5_name = null;
String product5_price = null;
String studio_img = null;
String studio_content = null;
String studio_star = null;
int total_price= 0;

Context initContext = new InitialContext();
Context envContext = (Context) initContext.lookup("java:/comp/env");
DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
Connection conn = ds.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, ent_num);
ResultSet rs = pstmt.executeQuery();
try {
	if (rs.next()) {
		studio_name = rs.getString("studio_name");
		studio_phone = rs.getString("studio_phone");
		studio_address = rs.getString("studio_address");
		product1_name = rs.getString("product1_name");
		product1_price = rs.getString("product1_price");
		product2_name = rs.getString("product2_name");
		product2_price = rs.getString("product2_price");
		product3_name = rs.getString("product3_name");
		product3_price = rs.getString("product3_price");
		product4_name = rs.getString("product4_name");
		product4_price = rs.getString("product4_price");
		product5_name = rs.getString("product5_name");
		product5_price = rs.getString("product5_price");
	}

} catch (Exception e) {
	e.printStackTrace();
}
%>
<body>
	<%@ include file="/header/header.jsp"%>

	<div style="overflow: auto;"></div>
	<br>
	<br>
	<br>
	<br>
	<div class="container">


		<form name="reserv_form" class="reserv_form"
			action="reservProcess.jsp" method="post">
			<div id="form_title" ; style="float: left; height: 20px">예약</div>
			<br>
			<div style="float: right">
				<c:set value="<%=Date%>" var="today" />
				<!-- 변수 명에 값을 할당-->

				<input type="date" id="reserv_date" min="${today}">
				<!-- today의 값을 가져오기 위한 객체 -->

			</div>
			<br> <br>
			<hr>
			<div style="height: 200px;">
				<div style="float: left;" class="time_check">
					<label for="check1"><span></span>10:00 ~ 12:00</label> <input
						type="radio" id="check1" name="check" /> <br>
					<br> <label for="check2"><span></span>12:00 ~ 14:00</label> <input
						type="radio" id="check2" name="check" /> <br>
					<br> <label for="check3">14:00 ~ 16:00<span></span></label> <input
						type="radio" id="check3" name="check" /> <br>
					<br> <label for="check4"><span></span>16:00 ~ 18:00</label> <input
						type="radio" id="check4" name="check" />
				</div>
				<div style="height: 200px;">
					<div style="float: left; margin-left:50px; margin-top:3px;" class="price_check">
						<label for="price1"><span></span>
							<%
							out.println(product1_name + " " + product1_price);
							%></label> <input
							type="checkbox" id="price1" name="price" value="<%out.println(product1_price); %>" />
							
							 <br>
						<br> <label for="price2"><span></span>
							<%
							if (product2_name != null) {
								out.println(product2_name + " " + product2_price);
								out.println("<input type=\"checkbox\" id=\"price2\" name=\"price\">");
							}
							%></label>
						<br>
						<br> <label for="price3"><span></span>
							<%
							if (product3_name != null) {
								out.println(product3_name + " " + product3_price);
								out.println("<input type=\"checkbox\" id=\"price3\" name=\"price\" value=\""+product3_price+"\">");
							}
							%></label>
						<br>
						<br> <label for="price4"><span></span>
							<%
							if (product4_name != null) {
								out.println(product4_name + " " + product4_price);
								out.println("<input type=\"checkbox\" id=\"price4\" name=\"price\">");
							}
							%></label>
					</div>

				</div>
				<br> ※코로나 거리두기 4단계 격상으로 인해 18:00까지만 운영됩니다. <br>

				<div id="form_title" style="float: left; height: 20px;">예약자 정보</div>
				<br> <br> <br>
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
				<br> <br> <br>
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