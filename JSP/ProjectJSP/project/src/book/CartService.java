package book;

import java.util.List;

public class CartService {

	CartDAO cartDAO;

	public CartService() {
		// TODO Auto-generated constructor stub
		cartDAO = new CartDAO();
	}
	
	public List<CartVO> selectCartLists(){ // 장바구니의 리스트 전체를 반환하는 메소드
		
		List<CartVO> cartLists = cartDAO.selectCartLists();
		
		return cartLists;
	}
	
	public void delList(String title) {
		cartDAO.delList(title);
	}
	
	public void addList(CartVO cartList) {
		cartDAO.addList(cartList);
	}
	
	public boolean confirmList(String id,String title) { // 장바구니에 교재가 이미 존재하는지 확인하는 메소드
		
		boolean result = cartDAO.confirmList(id,title);
		
		return result;
	}
	
	public void updateQuantity(String title, int quantity, int salePrice) {
		cartDAO.updateQuantity(title,quantity,salePrice);
	}
	
}
