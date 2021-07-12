<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.banner_main{
width:1000px;
height:171px;
position: relative;
margin: 0 auto;
}
ul.imgs{
padding:0;
margin:0;
list-style:none;
}

ul.imgs li{
position: absolute;
padding:0;
margin:0;
}
#searchbox{
border-top: 1px solid black;
border-collapse: collapse;
width: 100%;
height: 100%;
}
#searchbox th, #searchbox td{
border-bottom: 1px solid black;
padding: 10px;

}
</style>
<% 
		request.setCharacterEncoding("UTF-8"); // 인코딩 형식
		
		String region = request.getParameter("region");
		
		int price = Integer.parseInt(request.getParameter("price"));
		
		int star = Integer.parseInt(request.getParameter("star"));
%>
</head>
<body>
<%@ include file="/header/header.jsp" %>
<div style="overflow:auto;">
</div>
<div id="container" style="margin-top: 150px;">
<div id="contents" style="height: 100%; width:80%">
	<div class="sub_banner" style="position:absolute; width:1000px; margin-left:-500px; left:50%;">
	<%
		String sql = "select * from studio where studio_address like '%"+region+"%' and product1_price < ? and studio_star >= ?";
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		Connection conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, price);
		pstmt.setInt(2, star);
		ResultSet rs = pstmt.executeQuery();
		try {
			for (int i = 0; i < 5; i++) {
				if (rs.next() == false){
					if(i==0){
						out.println("<script>alert('검색 내역이 없습니다.');window.history.back();</script>");
					}
					break;
				}
				out.println("<a href='detailpage.jsp?ent_num="+rs.getString("ent_num")+"'>");
				out.println(
				"<div class='banner' style='width:1000px; height:300px; border:1px solid black; display: block; margin-top:20px; margin-right:90px;'>");
				try{
					String imgpath = ".\\uploadimg\\";
					out.println("<ul class='imgs'>");
					out.println("<li>");
					out.println("<table>");
					out.println("<tr>");
					out.println("<td rowspan='4'><img src='" + imgpath + rs.getString("studio_img")
					+ "' width='450px' height='300px'/></td>");
					out.println("<td><h3>" + rs.getString("studio_name") + "</h3></td>");
					out.println("</tr>");
					out.println("<tr>");
					out.println("<td>" + rs.getString("studio_address") + "</td>");
					out.println("</tr>");
					out.println("<tr>");
					out.println("<td>" + rs.getString("studio_phone") + "</td>");
					out.println("</tr>");
					out.println("<tr>");
					out.println("<td>" + rs.getString("product1_name") + rs.getString("product1_price") + "</td>");
					out.println("</tr>");
					out.println("</table>");
					out.println("</li>");
					out.println("</ul>");
					out.println("</div></a>");
				}catch(Exception e){
				e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)	rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		%>

	</div>
</div>
<div id="footer" style="position:absolute; margin-top:350px;">
footer
</div>
</body>
</html>