package com.kay87.team.vo;

public class QnA {
	private int qnaNum;
	private String id;
	private String writeBoardDate;
	private String updateBoardDate;
	private String title;
	private String content;
	private int hitcount;
	public QnA(int qnaNum, String id, String writeBoardDate, String updateBoardDate, String title, String content,
			int hitcount) {
		super();
		this.qnaNum = qnaNum;
		this.id = id;
		this.writeBoardDate = writeBoardDate;
		this.updateBoardDate = updateBoardDate;
		this.title = title;
		this.content = content;
		this.hitcount = hitcount;
	}
	public QnA() {
		super();
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWriteBoardDate() {
		return writeBoardDate;
	}
	public void setWriteBoardDate(String writeBoardDate) {
		this.writeBoardDate = writeBoardDate;
	}
	public String getUpdateBoardDate() {
		return updateBoardDate;
	}
	public void setUpdateBoardDate(String updateBoardDate) {
		this.updateBoardDate = updateBoardDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	@Override
	public String toString() {
		return "QnA [qnaNum=" + qnaNum + ", id=" + id + ", writeBoardDate=" + writeBoardDate + ", updateBoardDate="
				+ updateBoardDate + ", title=" + title + ", content=" + content + ", hitcount=" + hitcount + "]";
	}
	
	

}
