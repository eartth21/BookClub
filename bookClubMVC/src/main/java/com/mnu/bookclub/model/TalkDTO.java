package com.mnu.bookclub.model;
public class TalkDTO {

	int t_idx;
	int k_idx;   // tbl_book 참조 FK - 이 토론일지가 어느 책에 속하는지
	String book;
	String author;
	String name;
	String subject;
	String opinion;
	String thought;
	String t_regdate;
	String num;
	int readcnt;

	public int getT_idx() {
		return t_idx;
	}
	public void setT_idx(int t_idx) {
		this.t_idx = t_idx;
	}
	public int getK_idx() {
		return k_idx;
	}
	public void setK_idx(int k_idx) {
		this.k_idx = k_idx;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	public String getThought() {
		return thought;
	}
	public void setThought(String thought) {
		this.thought = thought;
	}
	public String getT_regdate() {
		return t_regdate;
	}
	public void setT_regdate(String t_regdate) {
		this.t_regdate = t_regdate;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

}
