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


// Alt + Shift + R : 동일변수명 전체 변경


public class OrderDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;

	public OrderDAO() {
		
		try {
			
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}

	public List selectCartList() { // 장바구니 리스트 List 객체 반환 메소드
		
		List cartLists = new ArrayList(); // 장바구니 목록을 저장하기 위한 List 생성
	 /* List : 메모리가 허용하는 한 계속해서 추가 할 수 있도록 만든 자료형 클래스이다.
		 	      배열의 한계로 인해 만들어진 것으로, 동적으로 자료형의 갯수가 가변하는 상황이라면 List를 사용하는 것이 유리하다. */
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "select title, price, salePrice, quantity, amountPrice "
					+"from cart_table "
					+"where id = ?"; // 세션에서 id를 가져와 해당 id에 해당하는 장바구니 목록들을 선택하는 query  
			
			System.out.println(query); 

			String id = "세션에서 가져온 아이디"; // 세션에서 가져온 id를 저장
			pstmt = con.prepareStatement(query); 
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery(); 
			            // pstmt.getResultSet() : query 결과의 자료를 rs 변수에 테이블 구조로 저장한다.
			
			while(rs.next()) { 
			   // rs.next() : ResultSet 테이블 rs에 자료가 존재하면 true, 존재하지 않으면 false 반환
				
				String title = rs.getString("title");
				int price = rs.getInt("price");
				int salePrice = rs.getInt("salePrice");
				int quantity = rs.getInt("quantity");
				int amountPrice = rs.getInt("amountPrice");
				
				
				      // .add(cartList) : 선택한 장바구니 목록 cartList를 리스트 cartLists에 저장 
				
			}
			
			rs.close();
			pstmt.close();
			con.close();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return cartLists;
	}

	
	public void updateQuantity(String title, int quantity, int salePrice) { // 장바구니 목록 업데이트 메서드(제목,수량,할인가)

		System.out.println("updateQuantity");
		
		int amountPrice = quantity*salePrice;
		
		try {

			con = dataFactory.getConnection();
			String query = "update cart_table set quantity=?, amountprice=? where title=?";
			// update 쿼리문을 query 변수에 저장
			
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
	

	public void insertList(CartVO cartList) { // 장바구니 목록 추가 메서드
		
		System.out.println("insertList");	
		
		String id = cartList.getId();
		String title = cartList.getTitle();
		int price = cartList.getPrice();
		int salePrice = cartList.getSalePrice();
		int quantity = cartList.getQuantity();
		int amountPrice = cartList.getAmountPrice();
		String imgUrl = cartList.getImgUrl();
		
		try {
			con = dataFactory.getConnection();
			
			String query = "insert into t_board values (?,?,?,?,?,?,?)";
			System.out.println(query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setInt(3, price);
			pstmt.setInt(4, salePrice);
			pstmt.setInt(5, quantity);
			pstmt.setInt(6, amountPrice);
			pstmt.setString(7, imgUrl);
			
			pstmt.executeQuery();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delList(String title) {

		System.out.println("delList");
		
		try {
			con = dataFactory.getConnection();
			
			String query = "delete from cart_table where title = ?"; // title명에 해당하는 데이터를 삭제하는 query
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title); // 파라미터의 값으로 가져온 title에 해당하는 값을 set
			pstmt.executeQuery(); // 쿼리문 실행
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
}


