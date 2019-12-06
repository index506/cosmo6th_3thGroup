package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BookVO;

public class BookDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public BookDAO() {
		// TODO Auto-generated constructor stub
		try {
			
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
	}

	public ArrayList<BookVO> selectBookList() { // DB에 저장되어있는 교재 목록을 반환하는 메소드
		// TODO Auto-generated method stub
		
		System.out.println("BookDAO selectBookList()");
		
		ArrayList<BookVO> bookList = new ArrayList<BookVO>();
		
		try {
			
			con = dataFactory.getConnection();
			
			String query = "select * from book";
			
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String title = rs.getString("title");
				int price = rs.getInt("price");
				int salePrice = rs.getInt("salePrice");
				String imgURL = rs.getString("imgurl");
				String publisher = rs.getString("publisher");
				Date writeDate = rs.getDate("writeDate");
				int bseq = rs.getInt("bseq");
				
				BookVO bookVO = new BookVO(title,price,salePrice,imgURL,publisher,writeDate,bseq);
				bookList.add(bookVO);
				
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bookList;
	}

}
