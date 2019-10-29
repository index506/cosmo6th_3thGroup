package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemverController
 */
@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	//private static final long serialVersionUID = 1L;

	MemberVO memberVO;
	MemberService memberService;
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		memberVO = new MemberVO();
		memberService = new MemberService(); 
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request,response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nextPage=null;
		request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    String action = request.getPathInfo();
	    System.out.println("action :"+action);
	    
	    try { 
		    if(action!=null && action.equals("/addMember.do")) {
		    	System.out.println("signup.do");
		    	
		    	String email1 = request.getParameter("email1");
		    	String email2 = request.getParameter("email2");
		    	String tel1 = request.getParameter("tel1");
		    	String tel2 = request.getParameter("tel2");
		    	String tel3 = request.getParameter("tel3");
		    	String phone1 = request.getParameter("phone1");
		    	String phone2 = request.getParameter("phone2");
		    	String phone3 = request.getParameter("phone3");
		    	
		    	String id = request.getParameter("id");
		    	String pwd = request.getParameter("pwd");
		    	String name = request.getParameter("name");
		    	String email = email1 + "@" + email2;
		    	String address = request.getParameter("address");
		    	String tel = tel1+tel2+tel3;
		    	String phone = phone1+phone2+phone3;
		    	memberVO.setId(id);
		    	memberVO.setPwd(pwd);
		    	memberVO.setName(name);
		    	memberVO.setEmail(email);
		    	memberVO.setAddress(address);
		    	memberVO.setTel(tel);
		    	memberVO.setPhone(phone);
		    	memberService.addMember(memberVO);
		    	nextPage = "/index.jsp";
		    }else if(action.equals("login.do")){
		    	
		    }else {
		    	System.out.println("else");
		    	nextPage = "/index.jsp";
	    	}
		    RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		    dispatch.forward(request, response);
		    
		    
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
}
