package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.test.dto.MemberVO;

public class MemberDAO {
	private MemberDAO() {

	}

	// 인스턴스 생성
	private static MemberDAO instance = new MemberDAO();

	// 인스턴스 얻기
	public static MemberDAO getInstance() {
		return instance;
	}

	// DB 접속 메소드
	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/myoracle"); // oracle 계정정보 가져오기
		conn = ds.getConnection();
		return conn;
	}

	// 아이디 비밀번호를 입력받아 유저 체크 메소드
	public int userCheck(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = -1;

		String sql = "select cust_id, cust_pw from member where cust_id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("cust_pw") != null && pw.equals(rs.getString("cust_pw"))) {
					result = 1;
				} else {
					result = 0;
				}

			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return result;

	}

	// 매개변수에 입력된 ID를 이용하여 DB에서 사용자 정보를 조회하여 반환하는 메소드
	public MemberVO getUser(String id) {
		MemberVO mVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from member where cust_id = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mVo = new MemberVO();
				mVo.setId(rs.getString("cust_id"));
				mVo.setPassword(rs.getString("cust_pw"));
				mVo.setName(rs.getString("cust_name"));
				mVo.setGender(rs.getString("cust_gender"));
				mVo.setPhone(rs.getString("cust_phone"));
				mVo.setEmail(rs.getString("cust_email"));
				mVo.setAddress(rs.getString("cust_address"));
				mVo.setBirthday(rs.getString("cust_birthday"));
				mVo.setQuestion(rs.getString("cust_question"));
				mVo.setAnswer(rs.getString("cust_answer"));
				mVo.setEnt_name(rs.getString("ent_name"));
				mVo.setEnt_num(rs.getString("ent_num"));
				mVo.setEnt_phone(rs.getString("ent_phone"));
				mVo.setEnt_address(rs.getString("ent_address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return mVo;
	}
	

	// 회원 정보 추가 메소드
	public int insertMember(MemberVO mVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = 0;

		String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getId());
			pstmt.setString(2, mVo.getPassword());
			pstmt.setString(3, mVo.getName());
			pstmt.setString(4, mVo.getGender());
			pstmt.setString(5, mVo.getPhone());
			pstmt.setString(6, mVo.getEmail());
			pstmt.setString(7, mVo.getAddress());
			pstmt.setString(8, mVo.getBirthday());
			pstmt.setString(9, mVo.getQuestion());
			pstmt.setString(10, mVo.getAnswer());
			pstmt.setString(11, mVo.getEnt_name());
			pstmt.setString(12, mVo.getEnt_num());
			pstmt.setString(13, mVo.getEnt_phone());
			pstmt.setString(14, mVo.getEnt_address());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// id 존재 여부 확인 메소드
	public int confirmID(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;

		String sql = "select cust_pw from member where cust_id=?";

		try {
			conn = getConnection(); // DB 연결 시도
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) { // 조회 결과가 있으면 id가 존재한다는 의미
				result = 1;
			} else {
				// 조회한 결과가 값이 없으므로 id가 존재하지 않음.
				result = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public String FindPw(String id, String question, String answer) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pw = null;
		try {
			String sql = "select *  from member where cust_id =? and cust_answer =? and cust_question =? ";

			// 쿼리문을 간결하게 쓰기 위해 사용되는
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, answer);
			pstmt.setString(3, question);
			// 쿼리 실행 준비
			rs = pstmt.executeQuery();
			if (rs.next() == true) {
				pw = rs.getString("cust_pw");

			} else {
				pw = "일치하는 정보가 없습니다.";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pw;

	}
	
	public int updateMember(MemberVO mVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;

		String sql = "update member set cust_pw = ?, cust_email = ?, cust_phone = ? where cust_id = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getPassword());
			pstmt.setString(2, mVo.getEmail());
			pstmt.setString(3, mVo.getPhone());
			pstmt.setString(4, mVo.getId());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

}
