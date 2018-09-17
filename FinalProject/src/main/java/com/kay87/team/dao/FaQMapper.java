package com.kay87.team.dao;

import java.util.List;

import com.kay87.team.vo.FAQ;

public interface FaQMapper {

	public List<FAQ> getfaqList();

	public void writeFaq(FAQ faq);

	public FAQ getBoard(int parseInt);

	public void hitBoardCount(FAQ faq);

	public void updatefaq(FAQ faq);

	public void deletefaq(int faqNum);


}
