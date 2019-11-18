package test.common;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import test.testSelect.LicenseVO;
import test.testSelect.SubjectVO;

public class TestService {
	TestDAO testDAO;
	
	public TestService() {
		testDAO = new TestDAO();
	}
	
	public List<TestVO> testQuizList (String license_abbreviation, String year_d, String[] subjectsName) { // 가교 역할
		System.out.println("Service testQuizList");
		 // DAO(모델)에서 데이터 호출
		List<TestVO> quizList = testDAO.selectTestQuiz(license_abbreviation, year_d, subjectsName);
		return quizList;
	}
	
	public List<LicenseVO> viewLicense ()  {
		System.out.println("Service viewLicense");
		List<LicenseVO> licensesList  = testDAO.selectAllLicenses();
		System.out.println("viewLicense");
		for(int i=0; i<licensesList.size(); i++) {
			System.out.print(i+" : ");
			System.out.println(licensesList.get(i).getLicense_name() + " "+licensesList.get(i).getLicense_abbreviation());
		}
		System.out.println();
		return licensesList;
	}
	
	public List<Date> viewYears (String license_name)  {
		System.out.println("Service viewYears");
		List<Date> yearsList  = testDAO.selectYearsByLicense(license_name);
		return yearsList;
	}
	
	public SubjectVO viewSubjects (String license_name, String year_date)  {
		SubjectVO subjectsList = testDAO.selectSubjectsByYear(license_name, year_date);
		System.out.println("Service viewSubjects");
		return subjectsList;
	}

}
