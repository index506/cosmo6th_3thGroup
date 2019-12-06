package service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import dao.InfoDAO;
import dao.LogDAO;
import dao.QuizDAO;
import dto.LicenseVO;
import dto.LogVO;
import dto.QuizVO;
import dto.SubjectVO;

public class TestService {
	/* 멤버변수 */
	InfoDAO infoDAO;
	LogDAO logDAO;
	QuizDAO quizDAO;

	/* 생성자 */
	public TestService() { 
		infoDAO = new InfoDAO();
		quizDAO = new QuizDAO();
		logDAO = new LogDAO();
	}
	
	/* 메소드 */
	public List<LicenseVO> viewLicense ()  {
		System.out.println("TestService.java - viewLicense()");
		List<LicenseVO> licensesList  = infoDAO.selectAllLicenses();
		return licensesList;
	}
	
	public List<Date> viewYears (String license_name)  {
		System.out.println("TestService.java - viewYears()");
		List<Date> yearsList  = infoDAO.selectYearsByLicense(license_name);
		return yearsList;
	}
	
	public SubjectVO viewSubjects (String license_name, String year_date)  {
		System.out.println("TestService.java - viewSubjects()");
		SubjectVO subjectsList = infoDAO.selectSubjectsByYear(license_name, year_date);
		return subjectsList;
	}
	
	public List<ArrayList<QuizVO>> testQuizList (LogVO logVo) {
		System.out.println("TestService.java - testQuizList()");
		List<ArrayList<QuizVO>> quizList = quizDAO.selectTestQuiz(logVo);
		return quizList;
	}
	
	public LogVO viewNewestQuizLog(String id, String submityn) {
		System.out.println("TestService.java - viewNewestQuizLog()");
		LogVO logVo = logDAO.selectLogById(id, submityn);
		return logVo;
	}

	public void createTestQuizLog(LogVO logVo) {
		System.out.println("TestService.java - createTestQuizLog()");
		logDAO.InsertLogByTestInfo(logVo);
	}
	
	public void UpdateLogById(String answer_string, String log_time, String id) {
		// TODO Auto-generated method stub
		System.out.println("TestService.java - UpdateLogById()");
		logDAO.UpdateLogById(answer_string, log_time, id);
	}

	public void deleteTestQuizLog(String id) {
		// TODO Auto-generated method stub
		System.out.println("TestService.java - deleteTestQuizLog()");
		logDAO.deleteLogById(id);
	}

	public void QuizLogSubmit(String id, String log_seq) {
		// TODO Auto-generated method stub
		System.out.println("TestService.java - QuizLogSubmit()");
		logDAO.updateLogByIdSeq(id, log_seq);
	}

	public void saveResultLog(LogVO logVo, String log_seq) {
		System.out.println("TestService.java - saveResultLog()");
		logDAO.updateLogResult(logVo, log_seq);
	}
	
	public void updateQuizCnt(int quiz_seq) {
		// TODO Auto-generated method stub
		quizDAO.updateQuizCnt(quiz_seq);
	}

	public void updateQuizWrong(int quiz_seq) {
		// TODO Auto-generated method stub
		System.out.println("updateQuizWrongRate.java - saveResultLog()");
		quizDAO.updateQuizWrong(quiz_seq);
	}


}
