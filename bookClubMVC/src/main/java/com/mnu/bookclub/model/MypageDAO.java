package com.mnu.bookclub.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mnu.bookclub.util.DBManager;

public class MypageDAO {
	private MypageDAO(){}
	public static MypageDAO mypage = new MypageDAO();
	public static MypageDAO getInstance() {
		return mypage;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//아이디 조회 메소드
	public int idcheck(String userid) {
		int count=0;
		String sql="select count(*)from tbl_user where userid=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}
	//회원 등록 메소드
	public int userSignup(UserDTO uDTO) {
		int row = 0;
		String sql="insert into tbl_user(userid,name,pass,tel,num) values(?,?,?,?,?)";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, uDTO.getUserid());
			pstmt.setString(2, uDTO.getName());
			pstmt.setString(3, uDTO.getPass());
			pstmt.setString(4, uDTO.getTel());
			pstmt.setString(5, uDTO.getNum());
			row=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}
	//로그인 메소드
	public UserDTO login(String userid, String pass) {
		UserDTO user = null;
		String sql="select * from tbl_user where userid=? and pass=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,pass);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				user = new UserDTO();
				user.setName(rs.getString("name"));
				user.setNum(rs.getString("num"));
				user.setTel(rs.getString("tel"));
				user.setUserid(rs.getString("userid"));
				user.setApproved(rs.getInt("approved"));
				user.setRole(rs.getString("role"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return user;
	}
	//로그인 메소드
	public UserDTO login(String userid) {
		UserDTO user = null;
		String sql="select * from tbl_user where userid=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				user = new UserDTO();
				user.setName(rs.getString("name"));
				user.setNum(rs.getString("num"));
				user.setTel(rs.getString("tel"));
				user.setUserid(rs.getString("userid"));
				user.setApproved(rs.getInt("approved"));
				user.setRole(rs.getString("role"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return user;
	}

	//회원정보 수정
	public int usermodify(UserDTO mDTO) {
		int row =0;
		String sql="update tbl_user set num=?,tel=? where userid=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mDTO.getNum());
			pstmt.setString(2, mDTO.getTel());
			pstmt.setString(3, mDTO.getUserid());
			row=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}

	// 승인대기 회원조회 
	public List<UserDTO> getPendingUsers() {
		List<UserDTO> list = new ArrayList<>();
		String sql = "select * from tbl_user where approved = 0";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserDTO u = new UserDTO();
				u.setUserid(rs.getString("userid"));
				u.setName(rs.getString("name"));
				u.setNum(rs.getString("num"));
				u.setTel(rs.getString("tel"));
				list.add(u);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	// 회원가입 승인 처리 
	public int approve(String userid) {
		int row = 0;
		String sql = "update tbl_user set approved = 1 where userid = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}

}
