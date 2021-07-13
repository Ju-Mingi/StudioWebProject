<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
<style>

.banner_main{
width:1000px;
height:175px;
position: relative;
margin: 0 auto;
border-radius: 10px;
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
border-collapse: collapse;
width: 100%;
height: 100%;
}
#searchbox th, #searchbox td{
padding: 10px;

}
</style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/header/header.jsp" %>
<div style="overflow:auto;">
</div>
<div id="container" style="margin-top: 50px;">
<div class="banner_main" style="border:10px solid rgb(211,211,255); margin-top:10px">
	<form action="search_act.jsp" method="post">
		<table id="searchbox">
			<tr>
				<th rowspan="2">지역</th>
					<td ><input type="radio" name="region" value="서울" checked="checked">서울</td>
					<td ><input type="radio" name="region" value="경기">경기</td>
					<td ><input type="radio" name="region" value="강원">강원</td>
					<td ><input type="radio" name="region" value="인천">인천</td>
					<td rowspan="2" align="center"><input type="submit" value="검색" style="width:150px;height:50px"></td>
			</tr>
			<tr>
				<td ><input type="radio" name="region" value="전라">전라</td>
				<td ><input type="radio" name="region" value="경상">경상</td>
				<td ><input type="radio" name="region" value="제주">제주</td>
				<td ><input type="radio" name="region" value="충청">충청</td>
			</tr>
			<tr>
				<th>가격</th>
				<td ><input type="radio" name="price" value="20000" checked="checked">20,000원 미만</td>
				<td ><input type="radio" name="price" value="50000">50,000원 미만</td>
				<td ><input type="radio" name="price" value ="70000">70,000원 미만</td>
				<td ><input type="radio" name="price" value="100000">100,000원 미만</td>
				<td ><input type="radio" name="price" value="150000">150,000원 미만</td>
			</tr>
			<tr>
				<th>평점</th>
				<td  style="color:purple; font-weight:bold;" ><input type="radio" name="star" value="1">★☆☆☆☆</td>
				<td  style="color:purple; font-weight:bold;"><input type="radio" name="star" value="2">★★☆☆☆</td>
				<td  style="color:purple; font-weight:bold;"><input type="radio" name="star" value="3">★★★☆☆</td>
				<td  style="color:purple; font-weight:bold;"><input type="radio" name="star" value="4">★★★★☆</td>
				<td  style="color:purple; font-weight:bold;"><input type="radio" name="star" value="5" checked="checked">★★★★★</td>
			</tr>
		</table>
	</form>
</div>
<div id="contents" style="height: 100%; width:80%">
	<div class="sub_banner" style="position:absolute; width:1000px; margin-left:-510px; left:50%; ">
		
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
				out.println("<a href='detailpage.jsp?ent_num="+rs.getString("ent_num")+"'>");
				out.println(
				"<div class='banner' style='width:1000px; height:300px; border:10px solid rgb(211,211,255); border-radius:10px; display: block; margin-top:20px; padding-top:10px; padding-bottom:5px; margin-right:90px;'>");
				//try{
				String imgpath = "..\\uploadimg\\";
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
</body>
</html>