package com.project.adventure.repository;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Cart;
import com.project.adventure.vo.Member;

@Mapper
public interface MemberDao {
	public Member getMemberInfo(String mid);
	public int midConfirm(String mid);
	public int memailConfirm(String emamil);
	public int joinMember(Member member);
	public int modifyMember(Member member);
	public int withDrawalMember(Member member);
	public int getMemberCount();
	public Cart cartList(Member member);
}
