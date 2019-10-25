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
		    if(action!=null && action.equals("/signup.do")) {
		    	System.out.println("signup.do");
		    	nextPage = "/index.jsp";
		    	
		    	
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
