package ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.LogVO;
import service.TestService;


/**
 * Servlet implementation class answerAjaxServlet
 */
@WebServlet("/answer")
public class AnswersAjaxServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
	TestService testService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswersAjaxServlet() {
    	testService = new TestService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		LogVO logVo = new LogVO();
		String answer_string = request.getParameter("answer_string");
		String log_time = request.getParameter("log_time");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		
		
		//String id = "test1";
		
		testService.UpdateLogById(answer_string, log_time, id);
		
	}

}
