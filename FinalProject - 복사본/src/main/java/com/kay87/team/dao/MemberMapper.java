package com.kay87.team.dao;

import com.kay87.team.vo.MemberInfo;

public interface MemberMapper {
	public int joinMember(MemberInfo member);

	public String getCheckedId(String userid);

	public MemberInfo login(MemberInfo member);

}
