package com.mnu.bookclub.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mnu.bookclub.util.DBManager;

public class ReviewDAO {
	private ReviewDAO() {}
	public static ReviewDAO review = new ReviewDAO();
	public static ReviewDAO getInstance() {
		return review;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 리뷰 등록
	public int reviewWrite(int k_idx, String userid, String name, int rate, String reviewText) {
		int row = 0;
		String sql = "insert into tbl_review(r_idx, k_idx, userid, name, rate, review, book, author) "
				+ "select tbl_review_r_idx.nextval, b.k_idx, ?, ?, ?, ?, b.book, b.author "
				+ "from tbl_book b "
				+ "where b.k_idx = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, name);
			pstmt.setInt(3, rate);
			pstmt.setString(4, reviewText);
			pstmt.setInt(5, k_idx);
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return row;
	}

	// 이미 이 책에 리뷰를 남겼는지 확인 (중복 방지)
	public boolean hasReviewed(int k_idx, String userid) {
		boolean exists = false;
		String sql = "select count(*) from tbl_review where k_idx = ? and userid = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, k_idx);
			pstmt.setString(2, userid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				exists = rs.getInt(1) > 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return exists;
	}

	// 평균 별점
	public double getAvgRate(int k_idx) {
		double avg = 0;
		String sql = "select avg(rate) from tbl_review where k_idx = ?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, k_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				avg = rs.getDouble(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return avg;
	}

	// 리뷰 개수
	public int getReviewCount(int k_idx) {
		int count = 0;
		String sql = "select count(*) from tbl_review where k_idx = ?";
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

	// 특정 책(k_idx)의 한줄평 목록 (도서 상세 화면용)
	public List<ReviewDTO> getReviewList(int k_idx) {
		List<ReviewDTO> list = new ArrayList<>();
		String sql = "select * from tbl_review where k_idx = ? order by r_idx desc";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, k_idx);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ReviewDTO rDTO = new ReviewDTO();
				rDTO.setR_idx(rs.getInt("r_idx"));
				rDTO.setK_idx(rs.getInt("k_idx"));
				rDTO.setUserid(rs.getString("userid"));
				rDTO.setName(rs.getString("name"));
				rDTO.setRate(rs.getInt("rate"));
				rDTO.setReview(rs.getString("review"));
				rDTO.setBook(rs.getString("book"));
				rDTO.setAuthor(rs.getString("author"));
				list.add(rDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

}
