package com.mnu.bookclub.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mnu.bookclub.util.DBManager;

public class BoardDAO {
	private BoardDAO() {}
	public static BoardDAO board = new BoardDAO();
	public static BoardDAO getInstance() {
		return board;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 공지 등록 메소드
	public int boardWrite(BoardDTO bDTO) {
		int row = 0;
		String sql = "insert into tbl_board(b_idx, subject, contents, userid, name) "
				+ "values(tbl_board_b_idx.nextval, ?, ?, ?, ?)";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bDTO.getSubject());
			pstmt.setString(2, bDTO.getContents());
			pstmt.setString(3, bDTO.getUserid());
			pstmt.setString(4, bDTO.getName());
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}
	//조회수
	public void readCount(int b_idx) {
		String sql="update tbl_board set readcnt=readcnt+1 where b_idx=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}

	// view
	public BoardDTO boardView(int b_idx) {
		BoardDTO bDTO = new BoardDTO();

		String sql = "select * from tbl_board where b_idx = ?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				bDTO.setB_idx(rs.getInt("b_idx"));
				bDTO.setSubject(rs.getString("subject"));
				bDTO.setContents(rs.getString("contents"));
				bDTO.setUserid(rs.getString("userid"));
				bDTO.setName(rs.getString("name"));
				bDTO.setReadcnt(rs.getInt("readcnt"));
				bDTO.setRegdate(rs.getString("regdate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bDTO;
	}
	//list
	public List<BoardDTO> boardList(){
		List<BoardDTO> bList = new ArrayList();
		String sql="select * from tbl_board order by regdate desc";
		
		try {
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setB_idx(rs.getInt("b_idx"));
				dto.setName(rs.getString("name"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				bList.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bList;
	}
	//수정
	public int boardModify(BoardDTO bDTO) {
		int row=0;
		String sql="update tbl_board set subject=?,contents=? where b_idx=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bDTO.getSubject());
			pstmt.setString(2, bDTO.getContents());
			
			row=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}
	//삭제
	public int boardDelete(int b_idx) {
		int row=0;
		String sql="delete from tbl_board where b_idx=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			
			row=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}

	
}
