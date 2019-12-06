package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberVO;

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
	    Connection con = null;
	    PreparedStatement pstmt = null;		   
	    ResultSet rs = null;
	   
	    String name = memberVO.getName();
	    String email = memberVO.getEmail();
	    try {
		   con = dataFactory.getConnection();
		   String sql ="select id, assignDate from member where name=?";
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, name);
		   //pstmt.setString(2, email);
		   	   
		   rs = pstmt.executeQuery();	
		   
		   if(rs.next()) {
			   memberVO.setId(rs.getString("id"));
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
	public String FindPWD(String user_id) {
		// TODO Auto-generated method stub
		System.out.println("MemberDAO�뿉�꽌 FindPWD濡� �뱾�뼱�솕�뼱 ");
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
	public boolean pwdConfirm(MemberVO memberVO) {
		// TODO Auto-generated method stub
		System.out.println("MemberDAO�뿉�꽌 pwdConfirm濡� �뱾�뼱�솕�뼱 ");
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
	public MemberVO resetPWD(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
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
		   
		   con.close();
		   pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return memberVO;
	}
	public void memberOut(String user_id) {
		// TODO Auto-generated method stub
		String sql ="delete from member where id=?";		
		Connection con = null;
	    PreparedStatement pstmt = null;	
	    
	    try {
	    	con = dataFactory.getConnection();		   		   
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, user_id);
	    	pstmt.executeUpdate();
	    	
		   con.close();
		   pstmt.close();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
	
	// 작성자 : 정철욱
	// 내용 : 회원가입 메소드
	public void insertMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		String sql ="insert into member(id,pwd,name,email,address,tel,phone) values(?,?,?,?,?,?,?)";		
		Connection con = null;
	    PreparedStatement pstmt = null;	
	    
	    try {
	    	con = dataFactory.getConnection();		   		   
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, memberVO.getId());
	    	pstmt.setString(2, memberVO.getPwd());
	    	pstmt.setString(3, memberVO.getName());
	    	pstmt.setString(4, memberVO.getEmail());
	    	pstmt.setString(5, memberVO.getAddress());
	    	pstmt.setString(6, memberVO.getTel());
	    	pstmt.setString(7, memberVO.getPhone());
	    	pstmt.executeUpdate();
	    	pstmt.close();
	    	con.close();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
	
	// 작성자 : 정철욱
	// 내용 : 회원정보 수정 메소드
	public void updateMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		String sql ="update member set name=?,email=?,address=?,tel=?,phone=? where id=?";		
		Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	    	con = dataFactory.getConnection();		   		   
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, memberVO.getName());
	    	pstmt.setString(2, memberVO.getEmail());
	    	pstmt.setString(3, memberVO.getAddress());
	    	pstmt.setString(4, memberVO.getTel());
	    	pstmt.setString(5, memberVO.getPhone());
	    	pstmt.setString(6, memberVO.getId());
	    	pstmt.executeUpdate();
	    	
	    	pstmt.close();
	    	con.close();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
	
	
	public MemberVO selectMember(MemberVO memberVO) {//로그인한 회원정보 memberVO에 담기 
		// TODO Auto-generated method stub
		Connection con = null;
	    PreparedStatement pstmt = null;	
	    ResultSet rs = null;
		System.out.println("MemberDAO에서 selectMember로 들어왔어 ");
		String sql ="select * from member where id=?";
	    String user_id = memberVO.getId();
	    String user_pwd = memberVO.getPwd();
	    try {
	    	con = dataFactory.getConnection();		   		   
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, user_id);
	    	rs = pstmt.executeQuery();
		   if(rs.next()) {
			   memberVO.setId(rs.getString("id"));
			   memberVO.setPwd(rs.getString("pwd"));
			   System.out.println(rs.getString("pwd"));
			   memberVO.setName(rs.getString("name"));
			   memberVO.setEmail(rs.getString("email"));
			   memberVO.setAddress(rs.getString("address"));
			   memberVO.setTel(rs.getString("tel"));
			   memberVO.setPhone(rs.getString("phone"));
			   memberVO.setAssignDate(rs.getDate("assigndate"));
		   }
	    	
	    	rs.close();
		   con.close();
		   pstmt.close();
		   
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
		
		return memberVO;
	}
	
}






