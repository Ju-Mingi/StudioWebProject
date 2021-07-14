<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.banner_main {
	width: 1000px;
	height: 500px;
	position: relative;
	margin: 0 auto;
}

ul.imgs {
	padding: 0;
	margin: 0;
	list-style: none;
}

ul.imgs li {
	position: absolute;
	padding: 0;
	margin: 0;
}

#first_img {
	margin: 0;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/header/header.jsp"%>
	<div style="overflow: auto;"></div>
	<div id="container" style="margin-top: 50px;">
		<div class="banner_main"
			style="border: 20px solid rgb(211,211,255); border-radius:10px; margin-top: 10px">

			<ul id="imgholder" class="imgs">
				<li><a href="#"><img id="first_img"
						src="${pageContext.request.contextPath}/img/rolands-zilvinskis-cPxRBHechRc-unsplash.jpg"
						width="1000px" height="500px"> </a></li>
			</ul>

		</div>


	</div>
	<div class="sub_banner"
		style="position: absolute; width: 1000px; margin-left: -520px; left: 50%;">
		<%
		String sql = "select * from studio";
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		Connection conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		try {
			for (int i = 0; i < 5; i++) {

				if (rs.next() == false)
			break;
				out.println("<a href='studio/detailpage.jsp?ent_num=" + rs.getString("ent_num") + "'>");
				out.println(
				"<div class='banner' style='width:1000px; border-radius:10px; height:300px; border:20px solid rgb(211,211,255); display: block; margin-top:20px; padding-top:10px; padding-bottom:5px; margin-right:90px;'>");
				//try{
				String imgpath = ".\\uploadimg\\";
				out.println("<ul class='imgs'>");
				out.println("<li>");
				out.println("<table>");
				out.println("<tr>");
				out.println("<td rowspan='4'><img src='" + imgpath + rs.getString("studio_img")
				+ "' width='450px' height='300px'/></td>");
				out.println("<td style=\"padding-left:100px;\"><h3>" + rs.getString("studio_name") + "</h3></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td style=\"padding-left:100px;\">" + rs.getString("studio_address") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td style=\"padding-left:100px;\">" + rs.getString("studio_phone") + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td style=\"padding-left:100px;\">" + rs.getString("product1_name") +" "+ rs.getString("product1_price") + "</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</li>");
				out.println("</ul>");
				out.println("</div></a>");
				//}catch(Exception e){
				//e.printStackTrace();
				//}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
			rs.close();
				if (pstmt != null)
			pstmt.close();
				if (conn != null)
			conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		%>




	</div>
</body>
</html>