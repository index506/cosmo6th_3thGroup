/* �ۼ��� : ��ö��
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
	    String action = request.getPathInfo();//��� ������ ���� action ���� 
	    System.out.println("action :"+action);//action�� ��� �� Ȯ��
	    String nextPage = null;
	    try {
	    	if(action!=null && action.equals("/login_form.do")) { // �α��� ȭ�� �̵�
	    		nextPage = "/Category/Member/login_main.jsp";
	    	}else if(action.equals("/find_id_form.do")) { // ���̵� ã�� ȭ�� �̵�
	    		nextPage = "/Category/Member/find_id.jsp";
	    	}else if(action.equals("/find_pwd_form.do")) { // ��й�ȣ ã�� ȭ�� �̵�
	    		nextPage = "/Category/Member/find_pwd.jsp";
	    	}else if(action.equals("/member_withdrawal_form.do")) { // ȸ�� Ż�� �̵�
	    		nextPage = "/Category/Member/membership_Withdrawal.jsp";	
	    	}else if(action.equals("/reset_pwd_form.do")) { // ��й�ȣ ���� ȭ�� �̵�
	    		nextPage = "/Category/Member/reset_pwd.jsp";
	    	}else if(action.equals("/signup_form.do")){	//ȸ������ �̵�
	    		nextPage = "/Category/Member/signup.jsp";
	    	}else if(action.equals("/memberModify_form.do")) { // ȸ������ ���� �̵�
	    		nextPage = "/Category/Member/MemberModify.jsp";
	    	}else if(action.equals("/pps_form.do")) { //����������ȣ��ħ �̵�
	    		nextPage = "/Category/Service/privacyPolicyStatement.jsp";
	    	}else if(action.equals("/accessTerms_form.do")) { // �̿��� �̵�
	    		nextPage = "/Category/Service/accessTerms.jsp";
	    	}else if(action.equals("/sitemap_form.do")) { // ����Ʈ�� �̵�
	    		nextPage = "/Category/Service/sitemap.jsp";
	    	}
			System.out.println("���������� : "+nextPage);
	    	RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
	        dispatch.forward(request, response);
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
}