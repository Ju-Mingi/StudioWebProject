<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%!
//선언부는 첫 방문자에 의해서 단 한번 수행합니다.
	Connection conn = null;
	ResultSet rs = null;
	String sql = null;
	PreparedStatement stmt = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
//request.setCharacterEncoding("UTF-8");
String savepath = request.getServletContext().getRealPath("uploadimg"); // 파일 업로드 위치
int sizelimit = 1024*1024*15;

MultipartRequest multi = new MultipartRequest(request, savepath, sizelimit, "UTF-8", new DefaultFileRenamePolicy());

String studio_name = multi.getParameter("studio_name");	// 사진관 이름 - studio_name

String enter_BN_arr[] = multi.getParameterValues("ent_num");	// 사업자 번호 - enter_bn
String ent_num="";	// DB에 입력되는 변수
for(String enter_BNS:enter_BN_arr){
	ent_num += enter_BNS;
}

String studio_number_arr[] = multi.getParameterValues("studio_number");	// 사진관 전화번호 - studio_number
String studio_phone= "";	//DB에 저장하는 변수
for(String studio_number:studio_number_arr){
	studio_phone += studio_number;
}

String studio_address_main = multi.getParameter("studio_address");
String studio_address_detail = multi.getParameter("studio_address_detail");	// 주소 - 
String studio_address = studio_address_main +" "+ studio_address_detail;	// DB 입력 변수


String product1_name = multi.getParameter("product1_name");
String product1_price = multi.getParameter("product1_price");

String product2_name = multi.getParameter("product2_name");
String product2_price = multi.getParameter("product2_price");

String product3_name = multi.getParameter("product3_name");
String product3_price = multi.getParameter("product3_price");

String product4_name = multi.getParameter("product4_name");
String product4_price = multi.getParameter("product4_price");

String product5_name = multi.getParameter("product5_name");
String product5_price = multi.getParameter("product5_price");

String studio_img = multi.getFilesystemName("img");

String studio_content = multi.getParameter("studio_content");
%>
<%
	try{
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		Connection conn = ds.getConnection();
		sql = "insert into studio values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, ent_num);
		stmt.setString(2, studio_name);
		stmt.setString(3, studio_phone);
		stmt.setString(4, studio_address);
		stmt.setString(5, product1_name);
		stmt.setString(6, product1_price);
		stmt.setString(7, product2_name);
		stmt.setString(8, product2_price);
		stmt.setString(9, product3_name);
		stmt.setString(10, product3_price);
		stmt.setString(11, product4_name);
		stmt.setString(12, product4_price);
		stmt.setString(13, product5_name);
		stmt.setString(14, product5_price);
		stmt.setString(15, studio_img);
		stmt.setString(16, studio_content);
		stmt.setString(17, "5");
		rs = stmt.executeQuery();
		
		
		//rs = stmt.executeQuery("select * from studio");
		//while(rs.next()){
		//	out.print("<br>enter bn:"+rs.getString("enter_bn")+"   name:"+rs.getString("studio_name"));
		//}

		out.print("<script>alert('사진관 등록이 완료되었습니다.'); history.go(-2)</script>");
		
		
	} catch( Exception e){
		e.printStackTrace();
		out.print("<script>alert('사진관 등록에 실패했습니다.'); history.go(-1)</script>");
	}finally{
		if(rs != null)rs.close();
		if(stmt != null)stmt.close();
		if(conn != null)conn.close();
	}
%>
</body>
</html>