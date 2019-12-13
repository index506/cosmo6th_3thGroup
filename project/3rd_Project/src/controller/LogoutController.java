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
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout/*")
public class LogoutController extends HttpServlet {
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
	    response.setContentType("text/html;charset=utf-8");
	    String action = request.getPathInfo();//��� ������ ���� action ���� 
	    System.out.println("action :"+action);//action�� ��� �� Ȯ��
	    String nextPage ="/index.jsp";
	    try {
      		if(action!=null && action.equals("/logout.do")) {
      			HttpSession session = request.getSession();
          		session.invalidate();
          		System.out.println("�α׾ƿ� �Ϸ�!");
    	    	System.out.println("���������� :"+nextPage);
      		}
	    	RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
	        dispatch.forward(request, response);
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}

}