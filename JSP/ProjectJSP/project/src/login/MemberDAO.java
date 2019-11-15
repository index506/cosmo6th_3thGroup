package login;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

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
	public boolean isExisted(MemberVO memberVO) {
		boolean result = false;
		String id = memberVO.getId();
		String pwd = memberVO.getPwd();
		try {
			System.out.println("DB에 회원이 있는지 확인해볼게");
			con = dataFactory.getConnection();
			String query = "select decode(count(*),1,'true','false') as result from member where id=? and pwd=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));
			System.out.println("result="+result);
			
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public MemberVO FindID(MemberVO memberVO) {
		System.out.println("MemberDAO에서 FindID로 들어왔어 ");
	    Connection con = null;//지역변수로 생성해서 사용한다. 
	    PreparedStatement pstmt = null;		   
	    ResultSet rs = null;
	   
	    String name = memberVO.getName();//여기서 압축한것을 푼다.
	    String email = memberVO.getEmail();
	    try {
		   con = dataFactory.getConnection();
		   String sql ="select id, assignDate from member where name=?";
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, name);
		   //pstmt.setString(2, email);
		   	   
		   rs = pstmt.executeQuery();	
		   
		   //rs.next() 커서를 다음행으로 지칭 
		   if(rs.next()) {//트루일때 다음 행이 있을때 
			   memberVO.setId(rs.getString("id"));//rs에 담긴 값을 겟스트링으로 아이디를 가져온다.
			   memberVO.setAssignDate(rs.getDate("assignDate"));
			   System.out.println(rs.getString("id"));
		   }	   
		   rs.close();
		   pstmt.close();
		   con.close();		   		   
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberVO;
						
	}
	public boolean FindPWD(MemberVO memberVO) {
		// TODO Auto-generated method stub
		System.out.println("MemberDAO에서 FindPWD로 들어왔어 ");
		boolean result = false;
		Connection con = null;
	    PreparedStatement pstmt = null;	
	    ResultSet rs = null;
		   
	    String user_id = memberVO.getId();
	    try {
		   con = dataFactory.getConnection();
		   String sql ="select decode(count(*),1,'true','false') as result from member where id=?";
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, user_id);		   		   	   
		   rs = pstmt.executeQuery();	
		   rs.next();
		   result = Boolean.parseBoolean(rs.getString("result"));
		   System.out.println("result="+result);
		   
		   rs.close();
		   pstmt.close();
		   con.close();		   		   
		}catch(Exception e) {
			e.printStackTrace();
		}
	    
		return result;
	}
}






