package com.mnu.bookclub.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mnu.bookclub.util.DBManager;

public class ArchiveDAO {

	private ArchiveDAO() {}
	public static ArchiveDAO archive = new ArchiveDAO();
	public static ArchiveDAO genInstance() {
		return archive;
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	
	//리스트
	public List<TalkDTO> talkList(){
		List<TalkDTO> tList = new ArrayList<>();
		String sql="select * from tbl_talk order by t_regdate desc";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TalkDTO tDTO = new TalkDTO();
				tDTO.setT_idx(rs.getInt("t_idx"));
				tDTO.setK_idx(rs.getInt("k_idx"));
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
	//조회수
	public void readCount(int t_idx) {
		String sql="update tbl_talk set readcnt=readcnt+1 where t_idx=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, t_idx);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}

	// 토론일지 상세보기 
	public TalkDTO talkView(int t_idx) {
		TalkDTO tDTO = new TalkDTO();
		String sql = "select * from tbl_talk where t_idx = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, t_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				tDTO.setT_idx(rs.getInt("t_idx"));
				tDTO.setK_idx(rs.getInt("k_idx"));
				tDTO.setBook(rs.getString("book"));
				tDTO.setAuthor(rs.getString("author"));
				tDTO.setName(rs.getString("name"));
				tDTO.setSubject(rs.getString("subject"));
				tDTO.setOpinion(rs.getString("opinion"));
				tDTO.setThought(rs.getString("thought"));
				tDTO.setT_regdate(rs.getString("t_regdate"));
				tDTO.setNum(rs.getString("num"));
				tDTO.setReadcnt(rs.getInt("readcnt"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return tDTO;
	}
	
}
