package book;

import java.util.List;

public class OrderService {

	OrderDAO orderDAO;

	public OrderService() {
		// TODO Auto-generated constructor stub
		orderDAO = new OrderDAO();
	}
	
	public void addOrderList() { //�ֹ����� 
		orderDAO.insertList();
	}
	
	public List<OrderVO> selectCartLists(){
		
		List<CartVO>  = orderDAO.selectCartList();
		
		return cartLists;
	}
	
	
	
}
