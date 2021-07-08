package com.test.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.dao.MemberDAO;
import com.test.dto.MemberVO;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String url ="";
		MemberVO member = null;
		
		// MemberDAO 객체 생성
		MemberDAO mDao = MemberDAO.getInstance();
		
		int result = mDao.userCheck(id, pw); 	// LoginForm 의 id,pw 파라미터값을 가져온 id,pw 변수를 매개변수로 유저 여부 체크
												// 유저가 존재하지 않으면 -1 반환
		
		switch(result) {
		case 1: // id , pw 일치 , 사용자 정보 가져오기
			member = mDao.getUser(id);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", member); // getUser 메소드를 사용하여 DB에서 가져온 유저 정보
			url = "main.jsp";
			break;
		
		case 0:
			request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
			url = "member/loginForm.jsp";
			break;
			
		case -1:
			request.setAttribute("message", "존재하지 않는 회원입니다.");
			url = "member/loginForm.jsp";
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
