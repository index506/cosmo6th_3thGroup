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
		String nextPage = ""; // forward 경로를 담기 위한 변수
		request.setCharacterEncoding("utf-8"); // 다른 페이지로부터 요청(request)받을 때의 인코딩 방식
		response.setContentType("text/html; charset=utf-8"); // 다른 페이지에 응답(response) 보낼때의 charset
		String action = request.getPathInfo(); // 서블릿 등의 경로
		System.out.println("action : "+action);
		
		try { /* 동작 MODE */
			// equals 는 null  일때 null 익셉션 발생 -> try catch 발생함으로, action != null 처리
			if(action != null) {
				switch(action) {
					case "/explanationsTest.do" : { // < 4. 시험 해설 >
						nextPage = "/Category/Test/testExplanations.jsp";
						break;
					}
					case "/resultTest.do" :  { // < 3. 시험결과 >
						
						String timer = request.getParameter("timer"); // 자격증
						
						nextPage = "/Category/Test/testResult.jsp";
						break;
					}
					case "/takeTest.do" : { // < 2. 시험풀기 >
						List<TestVO> quizList = new ArrayList<TestVO>();
						
						/* 데이터 받기 */
						String license = request.getParameter("license"); // 자격증
						String year = request.getParameter("year"); // 년도 (해당 시험의 년월일)						
						String[] subjectsName = request.getParameterValues("subjects"); // 과목들 이름
						
						/* 선택한 시험 문제 가져오기 */
						quizList = testService.testQuizList(license, year, subjectsName); // 시험문제 리스트 서비스에 요청
						
						/* 시험풀기 화면으로 */
						request.setAttribute("quizList", quizList);	// 시험문제 set
						nextPage = "/Category/Test/testTake.jsp";
						break;
					}
					case "/selectTest.do" : default : { // < 1. 시험선택 >
						List<LicenseVO> licensesList  = testService.viewLicense();
						
						/* 시험선택 화면으로 */
						request.setAttribute("licensesList", licensesList);	// 시험문제 set
						nextPage = "/Category/Test/testSelect.jsp";
						break;
					}
					
				}
			}
	
			/* nextPage 경로로 포워드(요청받은 A URL 주소를 보여준 채 B로 페이지만 이동) - MVC 패턴에서 주로 사용됨 */
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response); 
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}

}
