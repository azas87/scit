package com.kay87.team.dao;

import java.util.List;

import com.kay87.team.vo.MemberInfo;
import com.kay87.team.vo.SellerInfo;

public interface MemberMapper {

	public int joinMember(MemberInfo member);

	public String getCheckedId(String userid);

	public MemberInfo login(MemberInfo member);

	public List<SellerInfo> getSellerInfo(String sellerId);

	public void cancel(String userid);

}
