package com.mnu.bookclub.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mnu.bookclub.util.DBManager;

public class NoticeDAO {
	private NoticeDAO() {}
	public static NoticeDAO notice = new NoticeDAO();
	public static NoticeDAO getInstance() {
		return notice;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 공지 등록 메소드
	public int noticeWrite(NoticeDTO nDTO) {
		int row = 0;
		String sql = "insert into tbl_notice(n_idx, subject, contents, userid, name) "
				+ "values(tbl_notice_n_idx.nextval, ?, ?, ?, ?)";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nDTO.getSubject());
			pstmt.setString(2, nDTO.getContents());
			pstmt.setString(3, nDTO.getUserid());
			pstmt.setString(4, nDTO.getName());
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}

	// 상세 조회 : 조회수 1 증가 후 데이터 반환
	public NoticeDTO noticeView(int n_idx) {
		NoticeDTO nDTO = new NoticeDTO();

		String updateSql = "update tbl_notice set readcnt = readcnt + 1 where n_idx = ?";
		String selectSql = "select * from tbl_notice where n_idx = ?";

		try {
			conn = DBManager.getConnection();

			pstmt = conn.prepareStatement(updateSql);
			pstmt.setInt(1, n_idx);
			pstmt.executeUpdate();
			pstmt.close();

			pstmt = conn.prepareStatement(selectSql);
			pstmt.setInt(1, n_idx);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				nDTO.setN_idx(rs.getInt("n_idx"));
				nDTO.setSubject(rs.getString("subject"));
				nDTO.setContents(rs.getString("contents"));
				nDTO.setUserid(rs.getString("userid"));
				nDTO.setName(rs.getString("name"));
				nDTO.setReadcnt(rs.getInt("readcnt"));
				// DB에 등록일 컬럼이 있다면 컬럼명에 맞춰 주석을 해제하세요.
				// nDTO.setRegdate(rs.getString("regdate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return nDTO;
	}
	//list
	public List<NoticeDTO> noticeList(){
		List<NoticeDTO> nList = new ArrayList();
		String sql="select * from tbl_notice order by regdate desc";
		
		try {
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setN_idx(rs.getInt("n_idx"));
				dto.setName(rs.getString("name"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				nList.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return nList;
	}
	//수정
	public int noticeModify(NoticeDTO nDTO) {
		int row=0;
		String sql="update tbl_notice set subject=?,contents=? where n_idx=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nDTO.getSubject());
			pstmt.setString(2, nDTO.getContents());
			
			row=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}
	//삭제
	public int noticeDelete(int n_idx) {
		int row=0;
		String sql="delete from tbl_notice where n_idx=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, n_idx);
			
			row=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}

	
}
