package com.kay87.team.vo;

public class QnAreply {
	private int replyNum;
	private int qnaNum;
	private String id;
	private String replyContent;
	private String replyRegdate;
	public QnAreply(int replyNum, int qnaNum, String id, String replyContent, String replyRegdate) {
		super();
		this.replyNum = replyNum;
		this.qnaNum = qnaNum;
		this.id = id;
		this.replyContent = replyContent;
		this.replyRegdate = replyRegdate;
	}
	public QnAreply() {
		super();
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
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
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyRegdate() {
		return replyRegdate;
	}
	public void setReplyRegdate(String replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	@Override
	public String toString() {
		return "QnAreply [replyNum=" + replyNum + ", qnaNum=" + qnaNum + ", id=" + id + ", replyContent=" + replyContent
				+ ", replyRegdate=" + replyRegdate + "]";
	}
	
	

}
