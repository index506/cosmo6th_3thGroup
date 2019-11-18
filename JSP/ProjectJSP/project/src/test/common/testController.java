package test.common;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.testSelect.LicenseVO;


/**
 * Servlet implementation class testController
 */
@WebServlet("/test/*")
public class testController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
	
	TestService testService;
	

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		testService = new TestService();
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

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		// TODO Auto-generated method stub
		String nextPage = ""; // forward ��θ� ��� ���� ����
		request.setCharacterEncoding("utf-8"); // �ٸ� �������κ��� ��û(request)���� ���� ���ڵ� ���
		response.setContentType("text/html; charset=utf-8"); // �ٸ� �������� ����(response) �������� charset
		String action = request.getPathInfo(); // ���� ���� ���
		System.out.println("action : "+action);
		
		try { /* ���� MODE */
			// equals �� null  �϶� null �ͼ��� �߻� -> try catch �߻�������, action != null ó��
			if(action != null) {
				switch(action) {
					case "/explanationsTest.do" : { // < 4. ���� �ؼ� >
						nextPage = "/Category/Test/testExplanations.jsp";
						break;
					}
					case "/resultTest.do" :  { // < 3. ������ >
						
						String timer = request.getParameter("timer"); // �ڰ���
						
						nextPage = "/Category/Test/testResult.jsp";
						break;
					}
					case "/takeTest.do" : { // < 2. ����Ǯ�� >
						List<TestVO> quizList = new ArrayList<TestVO>();
						
						/* ������ �ޱ� */
						String license = request.getParameter("license"); // �ڰ���
						String year = request.getParameter("year"); // �⵵ (�ش� ������ �����)						
						String[] subjectsName = request.getParameterValues("subjects"); // ����� �̸�
						
						/* ������ ���� ���� �������� */
						quizList = testService.testQuizList(license, year, subjectsName); // ���蹮�� ����Ʈ ���񽺿� ��û
						
						/* ����Ǯ�� ȭ������ */
						request.setAttribute("quizList", quizList);	// ���蹮�� set
						nextPage = "/Category/Test/testTake.jsp";
						break;
					}
					case "/selectTest.do" : default : { // < 1. ���輱�� >
						List<LicenseVO> licensesList  = testService.viewLicense();
						
						/* ���輱�� ȭ������ */
						request.setAttribute("licensesList", licensesList);	// ���蹮�� set
						nextPage = "/Category/Test/testSelect.jsp";
						break;
					}
					
				}
			}
	
			/* nextPage ��η� ������(��û���� A URL �ּҸ� ������ ä B�� �������� �̵�) - MVC ���Ͽ��� �ַ� ���� */
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response); 
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}

}
