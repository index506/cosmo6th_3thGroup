package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CartVO;


// ����Ű (Alt + Shift + R) : ���Ϻ����� ��ü ����

public class CartDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;

	public CartDAO() {
		
		try {
			
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	public ArrayList<CartVO> selectCartList(String id) { // ��ٱ��� ����Ʈ List ��ü ��ȯ �޼ҵ�
		
		ArrayList<CartVO> cartList = new ArrayList<CartVO>(); 
		
	 /* List : �޸𸮰� ����ϴ� �� ����ؼ� �߰� �� �� �ֵ��� ���� �ڷ��� Ŭ�����̴�.
		 	      �迭�� �Ѱ�� ���� ������� ������, �������� �ڷ����� ������ �����ϴ� ��Ȳ�̶�� List�� ����ϴ� ���� �����ϴ�. */
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "select * from cart where id = ? and result = 1";

			pstmt = con.prepareStatement(query); 
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery(); 
			            // pstmt.getResultSet() : query ����� �ڷḦ rs ������ ���̺� ������ �����Ѵ�.
			
			while(rs.next()) { 
			   // rs.next() : ResultSet ���̺� rs�� �ڷᰡ �����ϸ� true, �������� ������ false ��ȯ
				
				String title = rs.getString("title");
				int price = rs.getInt("price");
				int salePrice = rs.getInt("salePrice");
				int quantity = rs.getInt("quantity");
				int amountPrice = rs.getInt("amountPrice");
				String imgUrl = rs.getString("imgurl");
				int cseq = rs.getInt("cseq");
				String publisher = rs.getString("publisher");
				
				CartVO cartVO = new CartVO(title,price,salePrice,quantity,amountPrice,cseq,imgUrl,publisher); // ������ 
				cartList.add(cartVO);
			}
			
			rs.close();
			pstmt.close();
			con.close();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return cartList;
	}

	
	public void updateList(int cseq, int quantity, int salePrice) { // ��ٱ��� ��� ������Ʈ �޼���(����,����,���ΰ�)

		System.out.println("CartDAO updateList()");
		
		int amountPrice = quantity*salePrice;
		
		try {

			con = dataFactory.getConnection();
			String query = "update cart set quantity=?, amountprice=? where cseq=?";
			// update �������� query ������ ����
			
			pstmt = con.prepareStatement(query); 
			pstmt.setInt(1, quantity);
			pstmt.setInt(2, amountPrice);
			pstmt.setInt(3, cseq);
			
			pstmt.executeUpdate();
			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addList(CartVO cartVO) { // ��ٱ��� ��� �߰� �޼���
		
		System.out.println("CartDAO addList()");	
		
		String id = cartVO.getId();
		String title = cartVO.getTitle();
		int price = cartVO.getPrice();
		int salePrice = cartVO.getSalePrice();
		int quantity = cartVO.getQuantity();
		int amountprice = cartVO.getAmountPrice();
		String imgUrl = cartVO.getImgUrl();
		String publisher = cartVO.getPublisher();
		int bseq = cartVO.getBseq();
		
		/*
		System.out.println("id : " + id);
		System.out.println("title : " + title);
		System.out.println("price : " + price);
		System.out.println("salePrice : " + salePrice);
		System.out.println("quantity : " + quantity);
		System.out.println("salePrice*quantity : " + salePrice*quantity);
		System.out.println("imgUrl : " + imgUrl);
		*/
		
		try {
			con = dataFactory.getConnection();
			
			String query = "insert into cart (id,title,price,salePrice,quantity,amountprice,imgUrl,cseq,publisher,bseq) "
					+ "values (?,?,?,?,?,?,?,cart_seq.nextval,?,?)";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, Integer.toString(price));
			pstmt.setInt(4, salePrice);
			pstmt.setInt(5, quantity);
			pstmt.setInt(6, amountprice);
			pstmt.setString(7, imgUrl);
			pstmt.setString(8, publisher);
			pstmt.setInt(9, bseq);
			
			pstmt.executeQuery();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteList(int cseq) { //��ٱ��� ��� ����

		System.out.println("CartDAO deleteList()");
		
		try {
			con = dataFactory.getConnection();
			
			String query = "delete from cart where cseq = ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cseq); 
			pstmt.executeQuery(); // ������ ����
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean confirmList(String id, int bseq) {
		
		System.out.println("CartDAO confirmList()");
		
		boolean result = true;
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "select * from cart where bseq = ? and id = ? and result = 1";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bseq);
			pstmt.setString(2, id);
			
			ResultSet rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				
				result = false;
			}
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public void resultChange(String id) {
		// TODO Auto-generated method stub
		
		System.out.println("CartDAO resultChange()");
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "update cart set result = 2 where id = ? and result = 1";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}


