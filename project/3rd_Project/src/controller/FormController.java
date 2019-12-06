/* 작성자 : 정철욱
 */

package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/form/*")
public class FormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		request.setCharacterEncoding("utf-8");
	    String action = request.getPathInfo();//경로 정보를 담을 action 선언 
	    System.out.println("action :"+action);//action에 담긴 값 확인
	    String nextPage = null;
	    try {
	    	if(action!=null && action.equals("/login_form.do")) { // 로그인 화면 이동
	    		nextPage = "/Category/Member/login_main.jsp";
	    	}else if(action.equals("/find_id_form.do")) { // 아이디 찾기 화면 이동
	    		nextPage = "/Category/Member/find_id.jsp";
	    	}else if(action.equals("/find_pwd_form.do")) { // 비밀번호 찾기 화면 이동
	    		nextPage = "/Category/Member/find_pwd.jsp";
	    	}else if(action.equals("/member_withdrawal_form.do")) { // 회원 탈퇴 이동
	    		nextPage = "/Category/Member/membership_Withdrawal.jsp";	
	    	}else if(action.equals("/reset_pwd_form.do")) { // 비밀번호 변경 화면 이동
	    		nextPage = "/Category/Member/reset_pwd.jsp";
	    	}else if(action.equals("/signup_form.do")){	//회원가입 이동
	    		nextPage = "/Category/Member/signup.jsp";
	    	}else if(action.equals("/memberModify_form.do")) { // 회원가입 수정 이동
	    		nextPage = "/Category/Member/MemberModify.jsp";
	    	}else if(action.equals("/pps_form.do")) { //개인정보보호방침 이동
	    		nextPage = "/Category/Service/privacyPolicyStatement.jsp";
	    	}else if(action.equals("/accessTerms_form.do")) { // 이용약관 이동
	    		nextPage = "/Category/Service/accessTerms.jsp";
	    	}else if(action.equals("/sitemap_form.do")) { // 사이트맵 이동
	    		nextPage = "/Category/Service/sitemap.jsp";
	    	}
			System.out.println("다음페이지 : "+nextPage);
	    	RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
	        dispatch.forward(request, response);
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
}
