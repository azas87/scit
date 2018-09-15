package com.kay87.team.dao;

import java.util.List;

import com.kay87.team.vo.QnA;
import com.kay87.team.vo.QnAreply;

public interface BoardMapper {

	public List<QnA> getQnaList();

	public void writeBoard(QnA qna);

	public QnA getBoard(int qnaNum);

	public void hitBoardCount(QnA qna);

	public void deleteQna(int qnaNum);

	public void updateQna(QnA qna);

	public void insertReply(QnAreply qnAreply);

	public List<QnAreply> getReplyList(int i);


}
