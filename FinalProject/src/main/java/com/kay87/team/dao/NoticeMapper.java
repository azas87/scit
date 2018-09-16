package com.kay87.team.dao;

import java.util.List;

import com.kay87.team.vo.Notice;
import com.kay87.team.vo.QnA;
import com.kay87.team.vo.QnAreply;

public interface NoticeMapper {

	public void writeBoard(Notice notice);

	public List<Notice> getNoticeList();

	public void hitBoardCount(Notice notice);

	public Notice getBoard(int parseInt);

	public void updateNotice(Notice notice);


}
