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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import service.TestService;

/**
 * Servlet implementation class yearsAjaxServlet
 */
@WebServlet("/years")
public class YearsAjaxServlet extends HttpServlet {
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
		System.out.println("yearsAjaxServlet.java - doGet()");

		/* 데이터 받기 */
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		String license_name = request.getParameter("license_name");
		System.out.println(license_name);
		
		/* 선택한 자격증으로 기출문제(년도) 목록 DB에서 호출 */
		List<Date> yearsList  = testService.viewYears(license_name);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		JSONObject totalObject = new JSONObject();		
			JSONArray yearsArray = new JSONArray();
				JSONObject yearInfo = null;
		
		for(int i=0; i<yearsList.size(); i++) {
			yearInfo = new JSONObject();
			String year = sdf.format(yearsList.get(i));
			yearInfo.put("year_date", year);
			yearsArray.add(yearInfo);
		}
		
		totalObject.put("years", yearsArray); // Object 타입으로 겉 포장하기

		String jsonInfo = totalObject.toJSONString(); // 전송을 위해 String 형태로 파싱
		writer.print(jsonInfo); // 전송
	}

}
