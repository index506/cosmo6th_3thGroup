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
		
		String id = "lee2";
		String orderName = orderVO.getOrderName();
		String phoneNumber = orderVO.getPhoneNumber();
		String address = orderVO.getAddress();
		String shippingDemand = orderVO.getShippingDemand();
		String depositBank = orderVO.getDepositBank();
		String depositNumber = orderVO.getDepositNumber();
		int allPrice = orderVO.getAllPrice();
		
		System.out.println();
		System.out.println("====orderDAO====");
		System.out.println("orderVO.getOrderName() : " + orderVO.getOrderName()); //OrderName
		System.out.println("orderVO.getPhoneNumber() : " + orderVO.getPhoneNumber()); //PhoneNumber
		System.out.println("orderVO.getAddress() : " + orderVO.getAddress()); //Address
		System.out.println("orderVO.getShippingDemand() : " + orderVO.getShippingDemand()); //ShippingDemand
		System.out.println("orderVO.getDepositBank() : " + orderVO.getDepositBank()); //DepositBank
		System.out.println("orderVO.getDepositNumber() : " + orderVO.getDepositNumber()); //DepositNumber
		System.out.println("orderVO.getAllPrice() : " + orderVO.getAllPrice()); //AllPrice
		System.out.println();
		
		try {
			
			con = dataFactory.getConnection();

			for(CartVO cartVO:cartList) {
				
				String query = "insert into orderList(id,ordername,phonenumber,address,shippingdemand,depositbank,"
						+ "depositnumber,allprice,imgurl,publisher,title,quantity) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, orderName);
				pstmt.setString(3, phoneNumber);
				pstmt.setString(4, address);
				pstmt.setString(5, shippingDemand);
				pstmt.setString(6, depositBank);
				pstmt.setString(7, depositNumber);
				pstmt.setInt(8, allPrice);
				pstmt.setString(9, cartVO.getImgUrl());
				pstmt.setString(10, cartVO.getPublisher());
				pstmt.setString(11, cartVO.getTitle());
				pstmt.setInt(12, cartVO.getQuantity());
				
				pstmt.executeUpdate();
			}
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}


