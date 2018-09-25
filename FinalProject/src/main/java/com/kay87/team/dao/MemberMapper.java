package com.kay87.team.dao;

import java.util.List;

import com.kay87.team.vo.MemberInfo;
import com.kay87.team.vo.SellerInfo;
import com.kay87.team.vo.WishList;

public interface MemberMapper {

	public int joinMember(MemberInfo member);

	public String getCheckedId(String userid);

	public MemberInfo login(MemberInfo member);

	public List<SellerInfo> getSellerInfo(String sellerId);

	public int cancel(MemberInfo member);

	public MemberInfo checkingEmail(MemberInfo member);

	public void reenterance(MemberInfo member);

	public void setWishList(WishList w);

	public int getwishListCount(String id);

	public List<WishList> getWishList(String id);

	public int deleteWishList(WishList w);

	public WishList checkWishList(WishList w);

	public void updateUserFirst(String id);

	public MemberInfo getUserInfo(String userid);

}
