package com.mnu.bookclub.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mnu.bookclub.util.DBManager;

public class TalkDAO {
	private TalkDAO() {}
	public static TalkDAO talk = new TalkDAO();
	public static TalkDAO getInstance() {
		return talk;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 토론일지 등록
	public int talkWrite(String opinion, String thought, String name, String num) {
		int row = 0;
		String sql = "insert into tbl_talk(t_idx, k_idx, book, author, subject, opinion, thought, name, num, t_regdate) "
				+ "select tbl_talk_t_idx.nextval, b.k_idx, b.book, b.author, b.subject, ?, ?, ?, ?, sysdate "
				+ "from tbl_book b "
				+ "where b.k_idx = (select max(k_idx) from tbl_book)";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, opinion);
			pstmt.setString(2, thought);
			pstmt.setString(3, name);
			pstmt.setString(4, num);
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}

	// 특정 책의 토론일지 개수
	public int getTalkCount(int k_idx){
		int count = 0;
		String sql = "select count(*) from tbl_talk where k_idx = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, k_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}

	//토론일지 목록 
	public List<TalkDTO> getTalkListByBook(int k_idx){
		List<TalkDTO> tList = new ArrayList<>();
		String sql = "select * from tbl_talk where k_idx = ? order by t_regdate desc";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, k_idx);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TalkDTO tDTO = new TalkDTO();
				tDTO.setT_idx(rs.getInt("t_idx"));
				tDTO.setBook(rs.getString("book"));
				tDTO.setAuthor(rs.getString("author"));
				tDTO.setName(rs.getString("name"));
				tDTO.setSubject(rs.getString("subject"));
				tDTO.setOpinion(rs.getString("opinion"));
				tDTO.setThought(rs.getString("thought"));
				tDTO.setT_regdate(rs.getString("t_regdate"));
				tDTO.setNum(rs.getString("num"));
				tDTO.setReadcnt(rs.getInt("readcnt"));
				tList.add(tDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return tList;
	}

}
