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
		String nextPage = ""; // forward 경로를 담기 위한 변수
		request.setCharacterEncoding("utf-8"); // 다른 페이지로부터 요청(request)받을 때의 인코딩 방식
		response.setContentType("text/html; charset=utf-8"); // 다른 페이지에 응답(response) 보낼때의 charset
		String action = request.getPathInfo(); // servlet 매핑 주소인 "~/test" 뒤의 정보
		System.out.println("action : " + action);

		try { /* 동작 MODE */
			// equals 는 null 일때 null 익셉션 발생 -> try catch 발생함으로, action != null 처리
			if (action != null) {

				HttpSession session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				
				switch (action) {
				case "/explanationsTest.do": { // <시험해설>
					LogVO logVo = testService.viewNewestQuizLog(id,"Y");
					
					/* 선택한 시험 문제 가져오기 */
					List<ArrayList<QuizVO>> quizList = testService.testQuizList(logVo); // 시험문제 리스트 서비스에 요청
					
					request.setAttribute("logVo", logVo);
					request.setAttribute("quizList", quizList);
					nextPage = "/Category/Test/testExplanations.jsp";
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <시험해설>

				case "/resultTest.do": { // <시험결과>
					String submit = request.getParameter("submit"); 
					System.out.println(submit);
					
					/* submit 여부를 Y로 변경 */
					String log_seq = null;
					if("Y".equals(submit)) {
						log_seq = request.getParameter("log_seq");
						testService.QuizLogSubmit(id, log_seq);
					}
					
					/* 최신 시험기록 (제출) */
					LogVO logVo = testService.viewNewestQuizLog(id,"Y");

					/* 선택한 시험 문제 가져오기 */
					List<ArrayList<QuizVO>> quizList = testService.testQuizList(logVo); // 시험문제 리스트 서비스에 요청
					
					/* 정답 채점하기 & 저장 */
					if("Y".equals(submit)) {
						String[] tmpCurrent = new String[quizList.size()];
						
						int cnt=0;
						ArrayList<int[]> tmpList = logVo.getTest_answer(); // 채점을 위한 답안 복사
						for(int s=0; s<quizList.size(); s++) { // 과목 개수 만큼 반복
							int sCurrent = 0; // 과목별 맞은 횟수 카운팅
							for(int sq=0; sq<quizList.get(s).size(); sq++) { // 과목별 문제 수 만큼 반복
								testService.updateQuizCnt(quizList.get(s).get(sq).getQuiz_seq()); // 해당 문제의 푼 회수 증가 (오답률 계산용)
								if(quizList.get(s).get(sq).getQuiz_current() == tmpList.get(cnt)[1]) { // 정답 비교 - 맞음
									tmpList.get(cnt++)[2] = 1; // 맞춤 저장
									sCurrent++; // 카운팅
								} else { // 정답 비교 - 틀림
									tmpList.get(cnt++)[2] = 0; // 틀림 저장
									testService.updateQuizWrong(quizList.get(s).get(sq).getQuiz_seq()); // 해당 문제의 틀린 회수 증가 (오답률 계산용)
								} // end of 정답 비교
							} // end of 과목별 문제 수 만큼 반복
							tmpCurrent[s] = String.valueOf(sCurrent); // 해당 과목에 맞은 개수 추가
						} // end of 과목 개수 만큼 반복
						

						/* 채점 결과 저장하기 */
						logVo.setSubjects_current(tmpCurrent); // 맞은 개수 logVO 객체에 저장
						logVo.setTest_answer(tmpList); // 채점 결과 logVO 객체에 저장
						testService.saveResultLog(logVo, log_seq); // 채점 결과 DB 저장
					} // end of 정답 채점하기 & 저장
					
					request.setAttribute("logVo", logVo);
					request.setAttribute("quizList", quizList); // 시험문제 set
					nextPage = "/Category/Test/testResult.jsp";
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <시험 결과>

				case "/takeTest.do": { // <시험풀기>

					/* 최신 시험기록 (미제출) */
					LogVO logVo = testService.viewNewestQuizLog(id,"N");
					String answer_string = Conversion.combineAnswer(logVo.getTest_answer());

					/* 선택한 시험 문제 가져오기 */
					List<ArrayList<QuizVO>> quizList = testService.testQuizList(logVo); // 시험문제 리스트 서비스에 요청

					/* 시험풀기 화면으로 */
					request.setAttribute("answer_string", answer_string);
					request.setAttribute("logVo", logVo);
					request.setAttribute("quizList", quizList);
					nextPage = "/Category/Test/testTake.jsp";
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <시험풀기>
				
				case "/createLog.do": { // <기록생성>	
					
					/* 데이터 받기 */
					String license_name = request.getParameter("license_name"); // 자격증 이름
					String license_abbreviation = request.getParameter("license_abbreviation"); // 자격증 약어
					String year = request.getParameter("year"); // 년도 (해당 시험의 년월일)
					String[] subjects_name = request.getParameterValues("subject_name"); // 과목들 이름
					String[] subjects_range = request.getParameterValues("subject_range"); // 과목들 범위
					String[] subjects_number = request.getParameterValues("subject_number"); // 과목들 문제수
					String log_time = request.getParameter("timer"); // 시험 시간
					System.out.println("year getParam:"+year);
							
					/* 기록 생성 (새로 선택한 시험) */
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

					/* 시험풀기 화면으로 */
					nextPage = "takeTest.do";
					response.sendRedirect(nextPage); // 새로고침 문제 방지 redirect
					break;
				} // end of <기록생성>
				
				case "/selectTest.do": {// <시험선택>
					
					/* 미제출인 시험 기록 삭제 */
					testService.deleteTestQuizLog(id); 

					/* 자격증 목록 */
					List<LicenseVO> licensesList = testService.viewLicense();

					/* 시험선택 화면으로 */
					request.setAttribute("licensesList", licensesList); // 시험문제 set
					nextPage = "/Category/Test/testSelect.jsp";
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <시험선택>
				
				case "/checkLog.do": default: { // <기록체크>
					
					/* 최신 시험기록 (미제출) */
					LogVO logVo = testService.viewNewestQuizLog(id,"N");
										
					/* 시험기록(미제출) 존재 여부 - 화면 이동 */
					if (logVo != null) { // 풀지 않은 시험 기록이 존재 할 때 => 기록확인
						request.setAttribute("logVo", logVo);
						nextPage = "/Category/Test/logCheck.jsp";
					} else { // 풀지 않은 시험 기록이 존재 하지 않을 때 => 시험선택
						nextPage = "/test/selectTest.do";
					}
					
					RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
					dispatch.forward(request, response);
					break;
				} // end of <기록체크>

				} // end of switch
			} // end of if


		} catch (Exception e) {
			e.printStackTrace();
		}

	} // end of doHandle()

}
