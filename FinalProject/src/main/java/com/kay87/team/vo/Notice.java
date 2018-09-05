package com.kay87.team.vo;

public class Notice {
	private int noticeNum;
	private String id;
	private String writeBoardDate;
	private String updateBoardDate;
	private String title;
	private String content;
	private int hitcount;
	public Notice(int noticeNum, String id, String writeBoardDate, String updateBoardDate, String title, String content,
			int hitcount) {
		super();
		this.noticeNum = noticeNum;
		this.id = id;
		this.writeBoardDate = writeBoardDate;
		this.updateBoardDate = updateBoardDate;
		this.title = title;
		this.content = content;
		this.hitcount = hitcount;
	}
	public Notice() {
		super();
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
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
		return "Notice [noticeNum=" + noticeNum + ", id=" + id + ", writeBoardDate=" + writeBoardDate
				+ ", updateBoardDate=" + updateBoardDate + ", title=" + title + ", content=" + content + ", hitcount="
				+ hitcount + "]";
	}
	
	
}
