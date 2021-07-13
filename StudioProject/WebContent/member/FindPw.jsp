<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Findpw.css">

<body>

<font>비밀번호 찾기</font>
<div class="div1">

  <form  name="log"action = "${pageContext.request.contextPath }/FindPw.do" method="post" >
  

  <div style="padding: 20px 20px;">
  아이디 입력해주세요: <input type="text" name="id" >
 </div>
 
  <div style="padding: 20px 20px;">
  비밀번호 찾기 힌트 선택: <select id = "questions"style="width:300px" name="question" >
                            <option value="">문제 선택</option>
                            <option value="01">나의 보물 1호는?</option>
                            <option value="02">가장 기억에 남는 선생님 성함은?</option>
                            <option value="03">태어난 곳은?</option>
                            <option value="04">가장 좋아하는 스포츠 팀은?</option>
                            <option value="05">가장 기억에 남는 날짜는?</option>
                            <option value="06">성인이 되고 나서 가장 먼저 취득한 자격증은?</option>
                            <option value="07">자신의 장래희망은?</option>
                       
                        </select>
                     </div>
   &nbsp;&nbsp;&nbsp;&nbsp;답: <input type="text" name ="answer" style="border: 1px" class="ans">
   <input type="submit" name="answer1" value="확인"  >
   <input type="button" value ="홈" onclick="location.href='/StudioProject/login.do'">
   
 
   </form>
   </div>  
</body>
</html>