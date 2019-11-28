package login;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	public boolean isExisted(MemberVO memberVO) {//login
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
			   System.out.println(rs.getString("ID"));
		   }	   
		   rs.close();
		   pstmt.close();
		   con.close();		   		   
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberVO;
						
	}
	public String FindPWD(String user_id) {//비밀번호 찾기 find_pwd.jsp
		// TODO Auto-generated method stub
		System.out.println("MemberDAO에서 FindPWD로 들어왔어 ");
		String result = null;
		Connection con = null;
	    PreparedStatement pstmt = null;	
	    ResultSet rs = null;
		   
	    try {
		   con = dataFactory.getConnection();
		   //String sql ="select decode(count(*),1,'true','false') as result from member where id=?";
		   String sql ="select * from member where id=?";
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, user_id);		   		   	   
		   rs = pstmt.executeQuery();
		   if(rs.next()) {
			   result = rs.getString("id");
			   System.out.println("result="+result);
		   }		   		   
		   
		   rs.close();
		   pstmt.close();
		   con.close();		   		   
		}catch(SQLException e) {
			e.printStackTrace();
		}
	    
		return result;
	}
	public boolean pwdConfirm(MemberVO memberVO) {//회원탈퇴 전 비밀번호 확인하기 
		// TODO Auto-generated method stub
		System.out.println("MemberDAO에서 pwdConfirm로 들어왔어 ");
		String sql ="select * from member where id=?";
		boolean result=false;
		Connection con = null;
	    PreparedStatement pstmt = null;	
	    ResultSet rs = null;
	    
	    String user_id = memberVO.getId();
	    String user_pwd = memberVO.getPwd();
	    
	    System.out.println(user_pwd);
	    try {
		   con = dataFactory.getConnection();		   		   
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, user_id);		   		   	   
		   rs = pstmt.executeQuery();
		   
		   if(rs.next()) {
			   memberVO.setPwd(rs.getString("pwd"));
			   System.out.println(rs.getString("pwd"));
			   memberVO.setId(rs.getString("id"));
		   }		   		   
		   
		   rs.close();
		   pstmt.close();
		   con.close();		   		   
		}catch(SQLException e) {
			e.printStackTrace();
		}
	    
		
		return result;
	}
	public MemberVO resetPWD(MemberVO memberVO) {//비밀번호 재설정하기 
		// TODO Auto-generated method stub
		System.out.println("MemberDAO에서 resetPWD로 들어왔어 ");
		String sql ="update member set pwd=? where id=?";
		
		Connection con = null;
	    PreparedStatement pstmt = null;	
	    
	    String user_id = memberVO.getId();
	    String user_pwd = memberVO.getPwd();
	    System.out.println(user_id +" and "+ user_pwd);
		try {
		   con = dataFactory.getConnection();		   		   
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, user_pwd);	
		   pstmt.setString(2, user_id);
		   pstmt.executeUpdate();
		   System.out.println("비밀번호변경했다.");
		   
		   con.close();
		   pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return memberVO;
	}
	public void memberOut(String user_id) {// 회원탈퇴하기 
		// TODO Auto-generated method stub
		System.out.println("DB의 회원 삭제하기");
		String sql ="delete from member where id=?";		
		Connection con = null;
	    PreparedStatement pstmt = null;	
	    
	    try {
	    	con = dataFactory.getConnection();		   		   
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, user_id);
	    	pstmt.executeUpdate();
	    	System.out.println("삭제했다.");
	    	
		   con.close();
		   pstmt.close();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
}






