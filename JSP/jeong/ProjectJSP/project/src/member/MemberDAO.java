package member;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public MemberDAO() {
		// TODO Auto-generated constructor stub
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");         
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertMember(MemberVO memberVO) {
		System.out.println("insertMember");
   		String id = memberVO.getId();
   		String pwd = memberVO.getPwd();
   		String name = memberVO.getName();
    	String email = memberVO.getEmail();
    	String address = memberVO.getAddress();
    	String tel = memberVO.getTel();
    	String phone = memberVO.getPhone();
    	
   		try {
   			con = dataFactory.getConnection();
   			String query = "insert into Member(id,pwd,name,email,address,tel,phone) " 
   			+ "values(?,?,?,?,?,?,?)";
   			System.out.println(query);
   			pstmt = con.prepareStatement(query);
   			pstmt.setString(1, id);
  		   	pstmt.setString(2, pwd);
  		   	pstmt.setString(3, name);
  		   	pstmt.setString(4, email);
  		   	pstmt.setString(5, address);
  		   	pstmt.setString(6, tel);
  		   	pstmt.setString(7, phone);
  		   	pstmt.executeUpdate();
  		   	pstmt.close();
   			con.close();
   			System.out.println(tel);
   			System.out.println(phone);
 	   }catch(Exception e) {
 		   e.printStackTrace();
 	   }
	}
	  	
}