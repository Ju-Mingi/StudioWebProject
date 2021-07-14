package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.dao.MemberDAO;
import com.test.dto.MemberVO;

/**
 * Servlet implementation class FindPwServlet
 */
@WebServlet("/FindPw.do")
public class FindPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/FindPw.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		// 제어 해주는 역할
		
		MemberDAO mDao =MemberDAO.getInstance();
		
		
		request.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		String answer = request.getParameter("answer");
		String question = request.getParameter("question");
		String result = mDao.FindPw(id, question, answer);
		
		PrintWriter out =response.getWriter();
	
		out.println("<script>");
		out.println("alert('비밀번호는 "+result+"');");
		out.println("location.href ='member/loginForm.jsp';");
		out.println("</script>");
	}

}
