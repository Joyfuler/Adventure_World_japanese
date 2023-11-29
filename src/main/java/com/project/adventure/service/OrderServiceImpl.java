package com.project.adventure.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.CartDao;
import com.project.adventure.repository.MemberDao;
import com.project.adventure.repository.OrderDao;
import com.project.adventure.repository.Order_DetailDao;
import com.project.adventure.repository.ReviewDao;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Cart;
import com.project.adventure.vo.Member;
import com.project.adventure.vo.Order;
import com.project.adventure.vo.Order_Detail;
import com.project.adventure.vo.Review;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private CartDao cartDao;
	@Autowired
	private Order_DetailDao order_DetailDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private ReviewDao reviewDao;
	@Override
	public void orderDetail(Order order, HttpSession session) {
		// order_list 테이블추가		
		orderDao.ordersInfoInsert(order);
		ArrayList<Integer> cids = (ArrayList<Integer>) session.getAttribute("cids");
		int totalPrice = 0;
		for (Integer cid : cids) {
			// cart에 있는 내용을 기반으로 orderDetail에 추가
			Cart cart = cartDao.getDetailCart(cid);
			System.out.println("★ cart-> orderDetail : " + cart);
			order_DetailDao.orderDetailInsert(cart);			
			cartDao.deleteCart(cid);
			totalPrice += cart.getPrice1() + cart.getPrice2();
		}
		// 구매한 금액의 10%만큼 다시 포인트를 증가시켜 주어야 함.
		Member member = new Member();
		member.setMid(order.getMid());
		member.setMpoint((int)(totalPrice*0.1));
		memberDao.plusMemberPoint(member);
		member = memberDao.getMemberInfo(order.getMid());
		// 바뀐 포인트까지 세션에 수정
		session.setAttribute("member", member);
		session.removeAttribute("cids");
		
	}
	@Override
	public List<Order_Detail> orderList(HttpSession session) {
		String mid = null;
		Member member = (Member)session.getAttribute("member");
		if (member != null) {
			mid = member.getMid();
		}		
		return order_DetailDao.orderList(mid);		
	}
	@Override
	public int priceTotal(int oid) {
		return order_DetailDao.priceTotal(oid);
	}
	@Override
	public List<Order_Detail> orderList(Order_Detail order_Detail, String pageNum) {
		Paging paging = new Paging(order_DetailDao.totCnt(order_Detail), pageNum, 5, 5);
		order_Detail.setStartRow(paging.getStartRow());
		order_Detail.setEndRow(paging.getEndRow());
		return order_DetailDao.orderList(order_Detail);

	}
	@Override
	public int totCnt(Order_Detail order_Detail) {
		return order_DetailDao.totCnt(order_Detail);
	}
	@Override
	public int deleteOrder(int[] oid) {
		int result = 0;
		for(int id : oid) {			
			result += order_DetailDao.deleteOrder(id);
			orderDao.deleteOrder(id);
		}
		return result;
	}
	@Override
	public List<Order_Detail> reviewSelect(HttpSession session) {
		String mid = null;
		Member member = (Member)session.getAttribute("member");
		if(member!=null) {
			mid = member.getMid();
		}
		return order_DetailDao.reviewSelect(mid);
	}
	@Override
	public Order_Detail selectedTicketInfo(int rid) {
		Review selectedReview = reviewDao.getReviewContent(rid);
		int odid = selectedReview.getOdid();
		return order_DetailDao.selectedTicketInfo(odid);
	}
}
