package com.mnu.bookclub.model;

public class BookDTO {
	int k_idx;
	String book;
	String Author;
	String synopsis;
	String topic1;
	String topic2;
	String topic3;
	int count1;
	int count2;
	int count3;
	String subject;   // 투표 마감 후 확정된 이번 주 토론주제

	// 아래 세 필드는 tbl_book 컬럼이 아니라, 도서 목록/상세 화면에 표시하기 위해
	// TalkDAO/ReviewDAO 조회 결과를 서비스에서 계산해 담아두는 값이다.
	int talkCount;
	double avgRate;
	int reviewCount;



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
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getTopic1() {
		return topic1;
	}
	public void setTopic1(String topic1) {
		this.topic1 = topic1;
	}
	public String getTopic2() {
		return topic2;
	}
	public void setTopic2(String topic2) {
		this.topic2 = topic2;
	}
	public String getTopic3() {
		return topic3;
	}
	public void setTopic3(String topic3) {
		this.topic3 = topic3;
	}
	public int getCount1() {
		return count1;
	}
	public void setCount1(int count1) {
		this.count1 = count1;
	}
	public int getCount2() {
		return count2;
	}
	public void setCount2(int count2) {
		this.count2 = count2;
	}
	public int getCount3() {
		return count3;
	}
	public void setCount3(int count3) {
		this.count3 = count3;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getTalkCount() {
		return talkCount;
	}
	public void setTalkCount(int talkCount) {
		this.talkCount = talkCount;
	}
	public double getAvgRate() {
		return avgRate;
	}
	public void setAvgRate(double avgRate) {
		this.avgRate = avgRate;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

}
