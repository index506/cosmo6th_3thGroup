package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dto.SubjectVO;
import service.TestService;

/**
 * Servlet implementation class subjectsAjaxServlet
 */
@WebServlet("/subjects")
public class SubjectsAjaxServlet extends HttpServlet {
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
		System.out.println("subjectsAjaxServlet.java - doGet");
		
		/*  설정 */
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		/* 데이터 받아오기 */
		String license_name = request.getParameter("license_name");
		String year_date = request.getParameter("year_date");
		System.out.println(license_name);
		System.out.println(year_date);
		
		SubjectVO subjectVO = testService.viewSubjects(license_name, year_date);
		System.out.println(subjectVO);		
		
		String subject_names = subjectVO.getSubject_names();
		String subject_ranges = subjectVO.getSubject_ranges();
		String subject_numbers = subjectVO.getSubject_numbers();
		int subject_total = subjectVO.getSubject_total(); // 과목 수
		String subject_time = subjectVO.getSubject_time(); // 시험시간
		
		JSONObject totalObject = new JSONObject();
			JSONObject subjectInfo = new JSONObject(); // 과목 정보를 담는 객체

		subjectInfo.put("subject_names", subject_names);
		subjectInfo.put("subject_ranges",subject_ranges);
		subjectInfo.put("subject_numbers",subject_numbers);
		subjectInfo.put("subject_total", subject_total);
		subjectInfo.put("subject_time", subject_time);
				
		totalObject = new JSONObject();
		totalObject.put("subject", subjectInfo); // Object 타입으로 겉 포장하기

		String jsonInfo = totalObject.toJSONString(); // 전송을 위해 String 형태로 파싱
		System.out.println(totalObject);
		writer.print(jsonInfo); // 전송*/
		
	}
}
