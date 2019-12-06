package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.LicenseVO;
import dto.LogVO;
import dto.QuizVO;
import service.TestService;
import util.Conversion;

/**
 * Servlet implementation class TestController
 */
@WebServlet("/test/*")
public class TestController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
	TestService testService;

	public void init(ServletConfig config) throws ServletException {
		testService = new TestService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = ""; // forward ��θ� ��� ���� ����
		request.setCharacterEncoding("utf-8"); // �ٸ� �������κ��� ��û(request)���� ���� ���ڵ� ���
		response.setContentType("text/html; charset=utf-8"); // �ٸ� �������� ����(response) �������� charset
		String action = request.getPathInfo(); // servlet ���� �ּ��� "~/test" ���� ����
		System.out.println("action : " + action);

		try { /* ���� MODE */
			// equals �� null �϶� null �ͼ��� �߻� -> try catch �߻�������, action != null ó��
			if (action != null) {

				HttpSession session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				
				switch (action) {
				case "/explanationsTest.do": { // <�����ؼ�>
					LogVO logVo = testService.viewNewestQuizLog(id,"Y");
					
					/* ������ ���� ���� �������� */
					List<ArrayList<QuizVO>> quizList = testService.testQuizList(logVo); // ���蹮�� ����Ʈ ���񽺿� ��û
					
					request.setAttribute("logVo", logVo);
					request.setAttribute("quizList", quizList);
					nextPage = "/Category/Test/testExplanations.jsp";
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <�����ؼ�>

				case "/resultTest.do": { // <������>
					String submit = request.getParameter("submit"); 
					System.out.println(submit);
					
					/* submit ���θ� Y�� ���� */
					String log_seq = null;
					if("Y".equals(submit)) {
						log_seq = request.getParameter("log_seq");
						testService.QuizLogSubmit(id, log_seq);
					}
					
					/* �ֽ� ������ (����) */
					LogVO logVo = testService.viewNewestQuizLog(id,"Y");

					/* ������ ���� ���� �������� */
					List<ArrayList<QuizVO>> quizList = testService.testQuizList(logVo); // ���蹮�� ����Ʈ ���񽺿� ��û
					
					/* ���� ä���ϱ� & ���� */
					if("Y".equals(submit)) {
						String[] tmpCurrent = new String[quizList.size()];
						
						int cnt=0;
						ArrayList<int[]> tmpList = logVo.getTest_answer(); // ä���� ���� ��� ����
						for(int s=0; s<quizList.size(); s++) { // ���� ���� ��ŭ �ݺ�
							int sCurrent = 0; // ���� ���� Ƚ�� ī����
							for(int sq=0; sq<quizList.get(s).size(); sq++) { // ���� ���� �� ��ŭ �ݺ�
								testService.updateQuizCnt(quizList.get(s).get(sq).getQuiz_seq()); // �ش� ������ Ǭ ȸ�� ���� (����� ����)
								if(quizList.get(s).get(sq).getQuiz_current() == tmpList.get(cnt)[1]) { // ���� �� - ����
									tmpList.get(cnt++)[2] = 1; // ���� ����
									sCurrent++; // ī����
								} else { // ���� �� - Ʋ��
									tmpList.get(cnt++)[2] = 0; // Ʋ�� ����
									testService.updateQuizWrong(quizList.get(s).get(sq).getQuiz_seq()); // �ش� ������ Ʋ�� ȸ�� ���� (����� ����)
								} // end of ���� ��
							} // end of ���� ���� �� ��ŭ �ݺ�
							tmpCurrent[s] = String.valueOf(sCurrent); // �ش� ���� ���� ���� �߰�
						} // end of ���� ���� ��ŭ �ݺ�
						

						/* ä�� ��� �����ϱ� */
						logVo.setSubjects_current(tmpCurrent); // ���� ���� logVO ��ü�� ����
						logVo.setTest_answer(tmpList); // ä�� ��� logVO ��ü�� ����
						testService.saveResultLog(logVo, log_seq); // ä�� ��� DB ����
					} // end of ���� ä���ϱ� & ����
					
					request.setAttribute("logVo", logVo);
					request.setAttribute("quizList", quizList); // ���蹮�� set
					nextPage = "/Category/Test/testResult.jsp";
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <���� ���>

				case "/takeTest.do": { // <����Ǯ��>

					/* �ֽ� ������ (������) */
					LogVO logVo = testService.viewNewestQuizLog(id,"N");
					String answer_string = Conversion.combineAnswer(logVo.getTest_answer());

					/* ������ ���� ���� �������� */
					List<ArrayList<QuizVO>> quizList = testService.testQuizList(logVo); // ���蹮�� ����Ʈ ���񽺿� ��û

					/* ����Ǯ�� ȭ������ */
					request.setAttribute("answer_string", answer_string);
					request.setAttribute("logVo", logVo);
					request.setAttribute("quizList", quizList);
					nextPage = "/Category/Test/testTake.jsp";
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <����Ǯ��>
				
				case "/createLog.do": { // <��ϻ���>	
					
					/* ������ �ޱ� */
					String license_name = request.getParameter("license_name"); // �ڰ��� �̸�
					String license_abbreviation = request.getParameter("license_abbreviation"); // �ڰ��� ���
					String year = request.getParameter("year"); // �⵵ (�ش� ������ �����)
					String[] subjects_name = request.getParameterValues("subject_name"); // ����� �̸�
					String[] subjects_range = request.getParameterValues("subject_range"); // ����� ����
					String[] subjects_number = request.getParameterValues("subject_number"); // ����� ������
					String log_time = request.getParameter("timer"); // ���� �ð�
					System.out.println("year getParam:"+year);
							
					/* ��� ���� (���� ������ ����) */
					LogVO logVo = new LogVO();
					logVo.setLicense_name(license_name);
					logVo.setLicense_abbreviation(license_abbreviation);
					logVo.setYear_date(Conversion.year(year));
					logVo.setSubjects_name(subjects_name);
					logVo.setSubjects_range(subjects_range);
					logVo.setSubjects_number(subjects_number);
					logVo.setLog_time(log_time);
					logVo.setId(id);
					testService.createTestQuizLog(logVo);

					/* ����Ǯ�� ȭ������ */
					nextPage = "takeTest.do";
					response.sendRedirect(nextPage); // ���ΰ�ħ ���� ���� redirect
					break;
				} // end of <��ϻ���>
				
				case "/selectTest.do": {// <���輱��>
					
					/* �������� ���� ��� ���� */
					testService.deleteTestQuizLog(id); 

					/* �ڰ��� ��� */
					List<LicenseVO> licensesList = testService.viewLicense();

					/* ���輱�� ȭ������ */
					request.setAttribute("licensesList", licensesList); // ���蹮�� set
					nextPage = "/Category/Test/testSelect.jsp";
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <���輱��>
				
				case "/checkLog.do": default: { // <���üũ>
					
					/* �ֽ� ������ (������) */
					LogVO logVo = testService.viewNewestQuizLog(id,"N");
										
					/* ������(������) ���� ���� - ȭ�� �̵� */
					if (logVo != null) { // Ǯ�� ���� ���� ����� ���� �� �� => ���Ȯ��
						request.setAttribute("logVo", logVo);
						nextPage = "/Category/Test/logCheck.jsp";
					} else { // Ǯ�� ���� ���� ����� ���� ���� ���� �� => ���輱��
						nextPage = "/test/selectTest.do";
					}
					
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <���üũ>

				} // end of switch
			} // end of if


		} catch (Exception e) {
			e.printStackTrace();
		}

	} // end of doHandle()

}
