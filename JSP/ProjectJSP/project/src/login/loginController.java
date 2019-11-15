package login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login/*")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub		
	}
	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
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
		doHandle(request, response);
	}
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();//경로 정보를 담을 action 선언 
	    System.out.println("action :"+action);//action에 담긴 값 확인	
	    String nextPage=null;
	    try {
	    	if(action!=null && action.equals("/loginCheck.do")) {//로그인하기
	    		System.out.println("loginCheck로 들어왔어");
	    		String user_id = request.getParameter("user_id");
	    		String user_pw = request.getParameter("user_pw");
	    		System.out.println("넘어온아이디="+user_id);
	    		MemberVO memberVO = new MemberVO();
	    		memberVO.setId(user_id);
	    		memberVO.setPwd(user_pw);
	    		MemberDAO dao = new MemberDAO();	
	    		boolean result = dao.isExisted(memberVO);
	    		
	    		if(result) {
	    			System.out.println("DB에 회원이 있어요true에요");
	    			//session에 정보 담기 
	    			HttpSession session = request.getSession();
	    			session.setAttribute("isLogon", true);
	    			session.setAttribute("login.id", user_id);
	    			session.setAttribute("login.pwd", user_pw);
	    			//값을 확인하기 위해 세션의 값을 출력
	    			String a = (String) session.getAttribute("login.id");
	    			String b = (String) session.getAttribute("login.pwd");
	    			String c = session.getId();	    			
	    			System.out.println("a="+a);
	    			System.out.println("b="+b);
	    			System.out.println("c="+c);
	    			
	    			nextPage = "/index.jsp";
	    		}else if(action.equals("/logout.do")){
	                HttpSession session = request.getSession();
	                session.invalidate();
	                nextPage ="/index.jsp";
	           } 		
	    		else {
	    			HttpSession session = request.getSession();
	    			System.out.println("DB에 회원정보가 없습니다.");
	    			session.setAttribute("isLogon", false);
	    			session.setAttribute("login.id", user_id);
	    			nextPage ="Category/Member/login_main.jsp";
	    		}	    		
	    		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			    dispatch.forward(request, response);
	    	}else if(action!=null && action.equals("/findid.do")) {//아이디 찾기 
	    		System.out.println("findid.do로 들어왔어");
	    		String name = request.getParameter("name");
	    		String email = request.getParameter("email");
	    		System.out.println("넘어온이름="+name);
	    		System.out.println("가져온 email="+email);
	    		MemberVO memberVO = new MemberVO();
	    		memberVO.setName(name);
	    		memberVO.setEmail(email);	    		
	    		MemberDAO dao = new MemberDAO();
	    		memberVO = dao.FindID(memberVO);	    			    		
	    		request.setAttribute("FindIDinfo", memberVO);	    			    		
	    		nextPage = "Category/Member/find_id2.jsp";	    		
	    		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			    dispatch.forward(request, response);
	    	}else if(action!=null && action.equals("/find_pwd.do")) {//비밀번호 찾기 
	    		System.out.println("find_pwd.do로 들어왔어");
	    		String user_id = request.getParameter("user_id");	    		
	    		System.out.println("넘어온ID="+user_id);	    		
	    		MemberVO memberVO = new MemberVO();
	    		memberVO.setName(user_id);	    			    		
	    		MemberDAO dao = new MemberDAO();
	    		boolean result = dao.FindPWD(memberVO);
	    		 
	    		if(result) {
	    			System.out.println("DB에 회원이 있어요true에요");
		    		nextPage = "Category/Member/find_pwd2.jsp";	 		    				    		
	    		}else {
	    			System.out.println("DB에 회원이 없어요false에요");
		    		nextPage = "Category/Member/find_pwd1.jsp";	
	    		}
	    		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			    dispatch.forward(request, response);    			    		

	    	}
	    	else if(action!=null && action.equals("/resetPWD.do")) {//비밀번호 재설정
	    		System.out.println("resetPWD로 들어왔어");
	    		
	    	}
		
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
}




