package com.mnu.bookclub.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mnu.bookclub.util.DBManager;

public class BookDAO {
	private BookDAO() {}
	public static BookDAO book = new BookDAO();
	public static BookDAO getInstance(){
		return book;
	}
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	// 등록메소드
	public int bookWrite(BookDTO kDTO) {
		int row=0;
		String sql="insert into tbl_book(k_idx,book,author,synopsis,topic1,topic2,topic3,count1,count2,count3) "
				+ "values(tbl_book_k_idx.nextval,?,?,?,?,?,?,0,0,0) ";
		try {
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, kDTO.getBook());
			pstmt.setString(2, kDTO.getAuthor());
			pstmt.setString(3, kDTO.getSynopsis());
			pstmt.setString(4, kDTO.getTopic1());
			pstmt.setString(5, kDTO.getTopic2());
			pstmt.setString(6, kDTO.getTopic3());
			
			row=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}
	//금주의 책 
	public BookDTO weeklyBook() {
		BookDTO kDTO = new BookDTO();
		String sql="SELECT * FROM tbl_book \n"
				+ "ORDER BY k_idx DESC \n"
				+ "FETCH FIRST 1 ROWS ONLY";
		try {
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				kDTO.setK_idx(rs.getInt("k_idx"));
				kDTO.setBook(rs.getString("book"));
				kDTO.setAuthor(rs.getString("author"));
				kDTO.setSynopsis(rs.getString("synopsis"));
				kDTO.setTopic1(rs.getString("topic1"));
				kDTO.setTopic2(rs.getString("topic2"));
				kDTO.setTopic3(rs.getString("topic3"));
				kDTO.setCount1(rs.getInt("count1"));
				kDTO.setCount2(rs.getInt("count2"));
				kDTO.setCount3(rs.getInt("count3"));
				kDTO.setSubject(rs.getString("subject"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return kDTO;
	}
	//투표
	public void vote(int k_idx, String choice){
	    String column = "count" + choice;   
	    String sql = "UPDATE tbl_book SET " + column + " = " + column + " + 1 WHERE k_idx = ?";
	    try {
	    	conn=DBManager.getConnection();
	    	pstmt=conn.prepareStatement(sql);
	    	pstmt.setInt(1, k_idx);
	    	pstmt.executeUpdate();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }finally {
	    	DBManager.close(conn, pstmt);
	    }
	}
	//투표주제 선정
	public boolean finalizeTopic(int k_idx){
		int row = 0;
		String sql = "UPDATE tbl_book "
				+ "SET subject = CASE GREATEST(count1, count2, count3) "
				+ "                WHEN count1 THEN topic1 "
				+ "                WHEN count2 THEN topic2 "
				+ "                ELSE topic3 "
				+ "              END "
				+ "WHERE k_idx = ? AND subject IS NULL";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, k_idx);
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row > 0;
	}

	// 도서 목록
	public List<BookDTO> bookList(){
		List<BookDTO> list = new ArrayList<>();
		String sql = "select * from tbl_book order by k_idx desc";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BookDTO kDTO = new BookDTO();
				kDTO.setK_idx(rs.getInt("k_idx"));
				kDTO.setBook(rs.getString("book"));
				kDTO.setAuthor(rs.getString("author"));
				kDTO.setSynopsis(rs.getString("synopsis"));
				kDTO.setSubject(rs.getString("subject"));
				list.add(kDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	// 도서 목록 검색
	public List<BookDTO> bookSearch(String type, String keyword){
		List<BookDTO> list = new ArrayList<>();
		String column = "author".equals(type) ? "author" : "book";
		String sql = "select * from tbl_book where " + column + " like ? order by k_idx desc";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			while(rs.next()){
				BookDTO kDTO = new BookDTO();
				kDTO.setK_idx(rs.getInt("k_idx"));
				kDTO.setBook(rs.getString("book"));
				kDTO.setAuthor(rs.getString("author"));
				kDTO.setSynopsis(rs.getString("synopsis"));
				kDTO.setSubject(rs.getString("subject"));
				list.add(kDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	// 도서 조회
	public BookDTO bookDetail(int k_idx){
		BookDTO kDTO = new BookDTO();
		String sql = "select * from tbl_book where k_idx = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, k_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				kDTO.setK_idx(rs.getInt("k_idx"));
				kDTO.setBook(rs.getString("book"));
				kDTO.setAuthor(rs.getString("author"));
				kDTO.setSynopsis(rs.getString("synopsis"));
				kDTO.setSubject(rs.getString("subject"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return kDTO;
	}
	
}
