package com.kay87.team.dao;

import java.util.List;

import com.kay87.team.vo.QnA;

public interface BoardMapper {

	public List<QnA> getQnaList();

	public void writeBoard(QnA qna);


}
