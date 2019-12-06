package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PostVO;

/**
 * Servlet implementation class CommonController
 */
@WebServlet("/index/*")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = ""; // forward ��θ� ��� ���� ����
		request.setCharacterEncoding("utf-8"); // �ٸ� �������κ��� ��û(request)���� ���� ���ڵ� ���
		response.setContentType("text/html; charset=utf-8"); // �ٸ� �������� ����(response) �������� charset
		String action = request.getPathInfo(); // servlet ���� �ּ��� "~/test" ���� ���� (servlet ��γ� ~.do)
		System.out.println("action : " + action);
		

		try { /* ���� MODE */
			if (action != null) { // equals �迭�� null �϶� null �ͼ��� �߻� -> try catch �߻�������, action != null ó��
				switch (action) {
				case "/index": default: { // <index>
					
					nextPage = "/index.jsp";
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <Ŀ�´�Ƽ �Խñ� ���>

				} // end of switch
			} // end of if

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // end of doHandle()

}
