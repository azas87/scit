package com.kay87.team.dao;

import java.util.ArrayList;

import com.kay87.team.vo.Hobby;

public interface HobbyMapper {
	public int InsertHobby(Hobby hb);
	public ArrayList<Hobby> SelectAllHobby();
	public int DeleteAllHobby();
	/*public Hobby SelectOneMember(Hobby mb);
	public Hobby SelectOneMemberCheck(Hobby mb);
	public List<Hobby> SelectAllMember(Hobby mb);*/
}
