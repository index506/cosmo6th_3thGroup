package book;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


// Alt + Shift + R : ���Ϻ����� ��ü ����


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

	public ArrayList<CartVO> viewCartLists() { // ��ٱ��� ����Ʈ List ��ü ��ȯ �޼ҵ�
		
		ArrayList<CartVO> cartLists = new ArrayList<CartVO>(); 
		
	 /* List : �޸𸮰� ����ϴ� �� ����ؼ� �߰� �� �� �ֵ��� ���� �ڷ��� Ŭ�����̴�.
		 	      �迭�� �Ѱ�� ���� ������� ������, �������� �ڷ����� ������ �����ϴ� ��Ȳ�̶�� List�� ����ϴ� ���� �����ϴ�. */
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "select title, price, salePrice, quantity, amountPrice "
					+"from cart "
					+"where id = ?"; // ���ǿ��� id�� ������ �ش� id�� �ش��ϴ� ��ٱ��� ��ϵ��� �����ϴ� query  

			String id = "lee2"; // ���ǿ��� ������ id�� ����
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
				
				CartVO cartVO = new CartVO(title,price,salePrice,quantity,amountPrice); // ������ 
				
				cartLists.add(cartVO);
			}
			
			rs.close();
			pstmt.close();
			con.close();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return cartLists;
	}

	
	public void updateQuantity(String title, int quantity, int salePrice) { // ��ٱ��� ��� ������Ʈ �޼���(����,����,���ΰ�)

		System.out.println("updateQuantity");
		
		int amountPrice = quantity*salePrice;
		
		try {

			con = dataFactory.getConnection();
			String query = "update cart_table set quantity=?, amountprice=? where title=?";
			// update �������� query ������ ����
			
			System.out.println(query);
			
			pstmt = con.prepareStatement(query); 
			pstmt.setInt(1, quantity);
			pstmt.setInt(2, amountPrice);
			pstmt.setString(3, title);
			
			pstmt.executeUpdate();
			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
	}

	
	public void addList(CartVO cartVO) { // ��ٱ��� ��� �߰� �޼���
		
		System.out.println("addList() ء������");	
		
		String id = cartVO.getId();
		String title = cartVO.getTitle();
		int price = cartVO.getPrice();
		int salePrice = cartVO.getSalePrice();
		int quantity = cartVO.getQuantity();
		int amountprice = cartVO.getAmountPrice();
		String imgUrl = cartVO.getImgUrl();
		
		System.out.println("======= addList() confirmList =======");
		System.out.println("id : " + id);
		System.out.println("title : " + title);
		System.out.println("price : " + price);
		System.out.println("salePrice : " + salePrice);
		System.out.println("quantity : " + quantity);
		System.out.println("salePrice*quantity : " + salePrice*quantity);
		System.out.println("imgUrl : " + imgUrl);
		
		try {
			con = dataFactory.getConnection();
			
			String query = "insert into cart values (?,?,?,?,?,?,?)";
			System.out.println(query);
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setInt(3, price);
			pstmt.setInt(4, salePrice);
			pstmt.setInt(5, quantity);
			pstmt.setInt(6, amountprice);
			pstmt.setString(7, imgUrl);
			
			pstmt.executeQuery();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delList(String title) { //��ٱ��� ��� ����

		System.out.println("delList");
		
		try {
			con = dataFactory.getConnection();
			
			String query = "delete from cart_table where title = ?"; // title���� �ش��ϴ� �����͸� �����ϴ� query
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title); // �Ķ������ ������ ������ title�� �ش��ϴ� ���� set
			pstmt.executeQuery(); // ������ ����
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean confirmList(String id, String title) {
		
		System.out.println("confirmList() ء������");
		
		boolean result = true;
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "select title from cart where title = ? and id = ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, id);
			
			ResultSet rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				
				System.out.println("result = false;");
				result = false;
			}
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}

