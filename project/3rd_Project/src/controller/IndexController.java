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
		String nextPage = ""; // forward 경로를 담기 위한 변수
		request.setCharacterEncoding("utf-8"); // 다른 페이지로부터 요청(request)받을 때의 인코딩 방식
		response.setContentType("text/html; charset=utf-8"); // 다른 페이지에 응답(response) 보낼때의 charset
		String action = request.getPathInfo(); // servlet 매핑 주소인 "~/test" 뒤의 정보 (servlet 경로나 ~.do)
		System.out.println("action : " + action);
		

		try { /* 동작 MODE */
			if (action != null) { // equals 계열은 null 일때 null 익셉션 발생 -> try catch 발생함으로, action != null 처리
				switch (action) {
				case "/index": default: { // <index>
					
					nextPage = "/index.jsp";
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <커뮤니티 게시글 목록>

				} // end of switch
			} // end of if

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // end of doHandle()

}
