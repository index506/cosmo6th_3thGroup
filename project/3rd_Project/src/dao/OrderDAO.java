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
import dto.OrderVO;


// Alt + Shift + R : 동일변수명 전체 변경


public class OrderDAO {
	
	OrderVO orderVO;
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;

	public OrderDAO() {
			
		orderVO = new OrderVO();
		
		try {
			
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
	}

	public OrderVO selectPrice(String id) {
		// TODO Auto-generated method stub
		
		System.out.println("OrderDAO selectPrice()");
		
		try {

			con = dataFactory.getConnection();
			
			String query = "select sum(price*quantity) price,sum(salePrice*quantity) salePrice "
					+ "from cart where id = ? and result = 1";
			// update 쿼리문을 query 변수에 저장
			
			pstmt = con.prepareStatement(query); 
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			orderVO.setPrice(rs.getInt("price"));
			orderVO.setAllPrice(rs.getInt("salePrice"));
			
			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderVO;
	}

	public void addOrderList(OrderVO orderVO, ArrayList<CartVO> cartList) {
		// TODO Auto-generated method stub
		
		System.out.println("OrderDAO addOrderList()");

		String id = orderVO.getId();
		String orderName = orderVO.getOrderName();
		String phoneNumber = orderVO.getPhoneNumber();
		String address = orderVO.getAddress();
		String shippingDemand = orderVO.getShippingDemand();
		String depositBank = orderVO.getDepositBank();
		String depositNumber = orderVO.getDepositNumber();
		int allPrice = orderVO.getAllPrice();
		
		
		try {
			
			con = dataFactory.getConnection();
			
			int oseq = selectOseq();
			
			for(CartVO cartVO:cartList) {
				
				String query = "insert into orderList(id,ordername,phonenumber,address,shippingdemand,depositbank,"
						+ "depositnumber,allprice,imgurl,publisher,title,quantity,oseq) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, orderName);
				pstmt.setString(3, phoneNumber);
				pstmt.setString(4, address);
				pstmt.setString(5, shippingDemand);
				pstmt.setString(6, depositBank);
				pstmt.setString(7, depositNumber);
				pstmt.setInt(8, cartVO.getQuantity()*cartVO.getSalePrice());
				pstmt.setString(9, cartVO.getImgUrl()); //imgurl
				pstmt.setString(10, cartVO.getPublisher()); //publisher
				pstmt.setString(11, cartVO.getTitle()); //title
				pstmt.setInt(12, cartVO.getQuantity()); //quantity
				pstmt.setInt(13, oseq); //oseq
				
				pstmt.executeUpdate();
			}
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private int selectOseq() {
		// TODO Auto-generated method stub
		
		System.out.println("OrderDAO selectOseq()");
		
		int oseq = 0;
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "select orderlist_seq.nextval oseq from dual";
			
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
				oseq = rs.getInt("oseq");

			pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return oseq;
	}

}


