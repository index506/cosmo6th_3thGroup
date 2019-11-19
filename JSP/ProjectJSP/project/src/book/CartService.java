package book;

import java.util.ArrayList;

public class CartService {

	CartDAO cartDAO;

	public CartService() {
		// TODO Auto-generated constructor stub
		cartDAO = new CartDAO();
	}
	
	public ArrayList<CartVO> viewCartLists(){ // ��ٱ����� ����Ʈ ��ü�� ��ȯ�ϴ� �޼ҵ�
		
		ArrayList<CartVO> cartLists = cartDAO.viewCartLists();
		
		return cartLists;
	}
	
	public void delList(String title) {
		cartDAO.delList(title);
	}
	
	public void addList(CartVO cartVO) {
		cartDAO.addList(cartVO);
	}
	
	public boolean confirmList(String id,String title) { // ��ٱ��Ͽ� ���簡 �̹� �����ϴ��� Ȯ���ϴ� �޼ҵ�
		
		boolean result = cartDAO.confirmList(id,title);
		
		return result;
	}
	
	public void updateQuantity(String title, int quantity, int salePrice) {
		cartDAO.updateQuantity(title,quantity,salePrice);
	}
	
}