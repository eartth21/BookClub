package com.mnu.bookclub.model;

public class ReviewDTO {
	int r_idx;
	int k_idx;      // tbl_book 참조 FK
	String userid;  // 중복 리뷰 방지용
	String name;
	int rate;
	String review;
	String book;
	String author;

	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public int getK_idx() {
		return k_idx;
	}
	public void setK_idx(int k_idx) {
		this.k_idx = k_idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

}
