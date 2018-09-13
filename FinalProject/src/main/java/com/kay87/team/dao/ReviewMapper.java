package com.kay87.team.dao;

import java.util.List;

import com.kay87.team.vo.BestSeller;
import com.kay87.team.vo.Review;

public interface ReviewMapper {

	public int insertReview(Review review);

	public List<BestSeller> bestSeller();

	public List<BestSeller> seasonInfo(String season);
}
