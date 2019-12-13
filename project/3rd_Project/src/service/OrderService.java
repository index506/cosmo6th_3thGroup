package service;

import java.util.ArrayList;

import dao.OrderDAO;
import dto.CartVO;
import dto.OrderVO;

public class OrderService {

	OrderDAO orderDAO;
	OrderVO orderVO;

	public OrderService() {
		// TODO Auto-generated constructor stub
		orderDAO = new OrderDAO();
		orderVO = new OrderVO();
	}
	
	public void addOrderList(OrderVO orderVO, ArrayList<CartVO> cartList) { //�ֹ������� order���̺� Insert
		orderDAO.addOrderList(orderVO,cartList);
	}

	public OrderVO selectPrice(String id) {
		// TODO Auto-generated method stub
		orderVO = orderDAO.selectPrice(id);
		
		return orderVO;
	}

}