package com.test.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.dao.MemberDAO;
import com.test.dto.MemberVO;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JoinServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "member/joinForm.jsp";
		// 회원가입 화면을 표시한다.
		request.getRequestDispatcher(url).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birth");
		String email = request.getParameter("email_1") + "@" + request.getParameter("email_2");
		String phone = request.getParameter("phone_1") + request.getParameter("phone_2")
				+ request.getParameter("phone_3");
		String address = request.getParameter("address_street") + request.getParameter("address_detail");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String ent_name = request.getParameter("ent_name");
		String ent_num = request.getParameter("ent_num_1") + request.getParameter("ent_num_2")
				+ request.getParameter("ent_num_3") + request.getParameter("ent_num_4");
		String ent_phone = request.getParameter("ent_phone_1") + request.getParameter("ent_phone_2")
				+ request.getParameter("ent_phone_3");
		String ent_address = request.getParameter("ent_address_street") + request.getParameter("ent_address_detail");
		int result = 0;

		// DB 연결 Instance 얻기
		MemberDAO mDao = MemberDAO.getInstance();

		// joinForm 에서 가져온 파라미터 값을 MemberVO 에 담기
		MemberVO mVo = new MemberVO();
		mVo.setId(id);
		mVo.setPassword(password);
		mVo.setName(name);
		mVo.setGender(gender);
		mVo.setBirthday(birthday);
		mVo.setEmail(email);
		mVo.setPhone(phone);
		mVo.setAddress(address);
		mVo.setQuestion(question);
		mVo.setAnswer(answer);
		mVo.setEnt_name(ent_name);
		mVo.setEnt_num(ent_num);
		mVo.setEnt_phone(ent_phone);
		mVo.setEnt_address(ent_address);

		// DB에 접속하여 회원정보 추가 메서드 실행
		result = mDao.insertMember(mVo);
		if (result == 1) {
			// 회원정보 추가 성공 시 True , 세션(id)을 얻어옴
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}

		request.getRequestDispatcher("member/loginForm.jsp").forward(request, response);

	}

}
