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
	public int withDrawalMember(String mid);
	public int getMemberCount();
	public Member findId(Member member);
	public Member findPw(Member member);
	public Cart cartList(Member member);
	public void minusMemberPoint(Member member);
	public void plusMemberPoint(Member member);
}
