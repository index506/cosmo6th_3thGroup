package service;

import java.util.ArrayList;

import dao.CartDAO;
import dto.CartVO;

public class CartService {

	CartDAO cartDAO;

	public CartService() {
		// TODO Auto-generated constructor stub
		cartDAO = new CartDAO();
	}
	
	public ArrayList<CartVO> selectCartList(String id){ // ��ٱ����� ����Ʈ ��ü�� ��ȯ�ϴ� �޼ҵ�
		
		ArrayList<CartVO> cartList = cartDAO.selectCartList(id);
		
		return cartList;
	}
	
	public void deleteList(int cseq) {
		cartDAO.deleteList(cseq);
	}
	
	public void addList(CartVO cartVO) {
		cartDAO.addList(cartVO);
	}
	
	public boolean confirmList(String id, int bseq) { // ��ٱ��Ͽ� ���簡 �̹� �����ϴ��� Ȯ���ϴ� �޼ҵ�
		
		boolean result = cartDAO.confirmList(id,bseq);
		
		return result;
	}
	
	public void updateList(int cseq, int quantity, int salePrice) {
		cartDAO.updateList(cseq,quantity,salePrice);
	}

	public void resultChange(String id) {
		// TODO Auto-generated method stub
		cartDAO.resultChange(id);
	}
	
}