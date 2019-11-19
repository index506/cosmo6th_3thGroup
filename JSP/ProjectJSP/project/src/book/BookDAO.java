package book;

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

	public ArrayList<BookVO> selectBookLists() { // DB에 저장되어있는 교재 목록을 반환하는 메소드
		// TODO Auto-generated method stub
		
		ArrayList<BookVO> bookLists = new ArrayList<BookVO>();
		
		try {
			
			System.out.println("BoardDAO selectBookLists() 立ち入り");
			
			con = dataFactory.getConnection();
			
			String query = "select * from book";
			System.out.println("BookDAO query : " + query);
			
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			/* stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query); */
			
			while(rs.next()) {
				
				System.out.println("BoardDAO while(rs.next()) 立ち入り");
				
				System.out.println("=========== 교재목록 ===========");
				String title = rs.getString("title");
				int price = rs.getInt("price");
				int salePrice = rs.getInt("salePrice");
				String imgURL = rs.getString("imgurl");
				String publisher = rs.getString("publisher");
				Date writeDate = rs.getDate("writeDate");
				
				System.out.println(title);
				System.out.println(price);
				System.out.println(salePrice);
				System.out.println(imgURL);
				System.out.println(publisher);
				System.out.println(writeDate);
				
				BookVO bookList = new BookVO(title,price,salePrice,imgURL,publisher,writeDate);
				bookLists.add(bookList);
				
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bookLists;
	}

}
