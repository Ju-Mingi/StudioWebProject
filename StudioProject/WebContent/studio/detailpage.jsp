<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>

<style media="screen">
#top {
	text-align: center;
	border: 3px solid gray;
	background-color: gray;
	pardding: 0px;
	margin-top: 130px;
	margin-left: 290px;
	margin-right: 290px;
	witdh: 0px;
	color: black;
}

.much {
	margin-top: 50px;
}

.much_name {
	text-align: center;
	border-botom: 3px solid gray;
}

.introduce {
	border: 3px solid gray;
	margin-top: 50px;
	width: 600px;
	margin-left: 100px;
}

.day {
	text-align: center;
	margin-top: 50px;
}

.textname {
	text-align: center;
}

#click {
	width: 120px;
	height: 40px;
	background-color: #808080;
	color: white;
	font-size: 16px;
	font-weight: bold;
	border-radius: 20px;
	top: 50%;
	left: 50%;
	margin-bottom: 30px;
}

button:hover {
	cursor: pointer;
}

.picture_much {
	margin-right: 10px;
}

#but {
	text-align: center;
	margin-top: 50px;
}

#main {
	display: flex;
	justify-content: center;
}

#text {
	text-align: center;
	border: 3px solid gray;
	margin-top: 50px;
	margin-right: 500px;
	margin-left: 500px;
}
</style>
</head>
<body>

	<%
	//String ent_num = request.getParameter("ent_num"); //받아오기
	String ent_num = "123";
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

	Context initContext = new InitialContext();
	Context envContext = (Context) initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, ent_num);
	ResultSet rs = pstmt.executeQuery();
	if (rs.next() == false) {
		out.println("<script>alert('잘못된 사진관입니다.');window.history.back();</script>");
	} else {

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
		studio_img = rs.getString("studio_img");
		studio_content = rs.getString("studio_content");
		studio_star = rs.getString("star");
	}
	%>

	<div id="top">
		<h1>
			<%
			out.print(studio_name);
			%>
		</h1>
		<h3>
			<%
			out.print(studio_address);
			%><h3>
				<h3>
					<%
					out.print(studio_phone);
					%><h3>
	</div>

	<div id="main">
		<div class="much">
			<img src="<%out.print("/uploadimg/");%><%out.print(studio_img);%>"
				alt="샘플이미지">
		</div>
		<div class="introduce">
			<div class="much_name">
				<h2>
					가격
					<h2>
			</div>
			<div class=picture_much>
				<ul>
					<li>
						<%
						out.print(product1_name);
						%> : <%
						out.print(product1_price);
						%>
					</li>
					<br>
					<li>
						<%
						out.print(product2_name);
						%> : <%
						out.print(product2_price);
						%>
					</li>
					<br>
					<li>
						<%
						out.print(product3_name);
						%> : <%
						out.print(product3_price);
						%>
					</li>
					<br>
					<li>
						<%
						out.print(product4_name);
						%> : <%
						out.print(product4_price);
						%>
					</li>
					<br>
					<li>
						<%
						out.print(product5_name);
						%> : <%
						out.print(product5_price);
						%>
					</li>
					<br>
				</ul>
			</div>
		</div>
	</div>

	<div id="text">
		<div class="text_name">
			<h2>소개</h2>
			<p>
				<%
				out.print(studio_content);
				%>
			</p>
		</div>

	</div>


	<div id="but">
		<a href="reservation.jsp?ent_num=<%out.print(ent_num);%>">
			<button id="click" type="button" name="button_click">예약하기</button>
		</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button id="click" type="button" name="button_click">장바구니</button>
	</div>

</body>
</html>