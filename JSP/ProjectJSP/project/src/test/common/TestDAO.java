package test.common;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import test.testSelect.LicenseVO;
import test.testSelect.SubjectVO;

public class TestDAO { // MVC : 모델
	
	private Connection con; // DB 커넥션 참조 변수
	private PreparedStatement pstmt; // 
	private DataSource dataFactory; 
	
	public TestDAO() {
		try {
			// 커넥션 풀
			// Context 인터페이스 타입으로 InitialContext 객체 생성 (커넥션 풀에 접근을 위한 JNDI 서비스)
			Context ctx = new InitialContext();
						
			// lookup(): 등록된 naming 서비스로부터 자원을 찾고자할 때 사용하는 메서드
			//"java:comp/env" 에 해당하는 객체를 찾아서 envContext에 삽입
			Context envContext = (Context)ctx.lookup("java:/comp/env"); 
			
			//"jdbc/orcl"에 해당하는 객체를 찾아서 dataFactory에 삽입
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e){
			e.printStackTrace();
			System.out.println("DB 연결 실패");
		}
	}
		
	/* 자격증 목록 가져오기 */
	public List<LicenseVO> selectAllLicenses() {
		// TODO Auto-generated method stub
		System.out.println("TestDAO.java - selectAllLicenses");
		List<LicenseVO> licensesList = new ArrayList<LicenseVO>();
		
		try {
			LicenseVO licenseVO = null;
			
			con = dataFactory.getConnection();
			String sql = "SELECT license_name, license_abbreviation";
			sql += " FROM test_license";
			System.out.println(sql); // 쿼리문 확인을 위한 print
			pstmt = con.prepareStatement(sql); // pstmt에 쿼리문 담기
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery(); // select 쿼리 실행, 그 결과를 rs에 저장
			System.out.println(rs);
			
			int count=0;
			while(rs.next()) { // 다음 튜플로 커서 이동, 다음 위치에 튜플이 존재 하면 true, 없으면 false
				/* DB 결과값 각 변수에 저장 */
				licenseVO = new LicenseVO(); 
				String license_name = rs.getString("license_name");
				String license_abbreviation = rs.getString("license_abbreviation");
				System.out.println(++count+"번째  "+license_name+"  "+license_abbreviation);
				
				/* VO 객체에 DB 결과 set */
				licenseVO.setLicense_name(license_name);
				licenseVO.setLicense_abbreviation(license_abbreviation);
				licensesList.add(licenseVO);
			}
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			rs.close();
			pstmt.close();
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("selectAllLicenses");
		for(int i=0; i<licensesList.size(); i++) {
			System.out.print(i+" : ");
			System.out.println(licensesList.get(i).getLicense_name() + " "+licensesList.get(i).getLicense_abbreviation());
		}
		System.out.println();
		
		return licensesList;
	} // selectAllLicenses()
	
	/* 자격증에 해당하는 년도(기출문제) 목록 가져오기 */
	public List<Date> selectYearsByLicense(String license_name) {
		// TODO Auto-generated method stub
		System.out.println("TestDAO.java - selectYearsByLicense()");
		List<Date> yearsList = new ArrayList<Date>();
		
		try {	
			con = dataFactory.getConnection(); // 커넥션 풀
			String sql = "SELECT year_date";
			sql += " FROM test_year";
			sql += " WHERE license_name=?";
			System.out.println(sql); // 쿼리문 확인을 위한 print
			pstmt = con.prepareStatement(sql); // pstmt에 쿼리문 담기
			pstmt.setString(1, license_name); // 첫번째 ?에 삽입
			ResultSet rs = pstmt.executeQuery(); // select 쿼리 실행, 그 결과를 rs에 저장
			
			while(rs.next()) { // 다음 튜플로 커서 이동, 다음 위치에 튜플이 존재 하면 true, 없으면 false
				/* DB 결과값 각 변수에 저장 */
				Date year_date = rs.getDate("year_date");
				yearsList.add(year_date);
			}
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			rs.close();
			pstmt.close();
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return yearsList;
	} // selectYearsByLicense()
	
	
	/* 년도에 해당하는 과목 목록 가져오기 */
	public SubjectVO selectSubjectsByYear(String license_name ,String year_d) {
		// TODO Auto-generated method stub
		System.out.println("TestDAO.java - selectSubjectsByYear()");
		SubjectVO subjectVO = null;
		
		/*날짜 변환*/
		year_d = year_d.replace("년 ", "-");
		year_d = year_d.replace("월 ", "-");
		year_d = year_d.replace("일", "");
		Date year_date = Date.valueOf(year_d); // Date 타입으로 변환
		System.out.println(year_date);
		
		try {	
			con = dataFactory.getConnection(); // 커넥션 풀
			
			String sql = "SELECT subject_names, subject_quiznums, subject_total, subject_time";
			sql += " FROM test_subject";
			sql += " WHERE license_name=?";
			sql += " AND subject_revision IN(";
				sql += " SELECT MAX(subject_revision) FROM test_subject";
				sql += " WHERE license_name=?";
				sql += " AND subject_revision < ?";
			sql += ")";
			System.out.println(sql); // 쿼리문 확인을 위한 print
			pstmt = con.prepareStatement(sql); // pstmt에 쿼리문 담기
			pstmt.setString(1, license_name); // 첫번째 ?에 삽입
			pstmt.setString(2, license_name); // 첫번째 ?에 삽입
			pstmt.setDate(3, year_date); // 첫번째 ?에 삽입
			ResultSet rs = pstmt.executeQuery(); // select 쿼리 실행, 그 결과를 rs에 저장
			
			int count=0;
			while(rs.next()) { // 다음 튜플로 커서 이동, 다음 위치에 튜플이 존재 하면 true, 없으면 false
				/* DB 결과값 각 변수에 저장 */
				System.out.print(++count+"---");
				String subject_names = rs.getString("subject_names");
				System.out.print(subject_names+"---");
				String subject_quiznums = rs.getString("subject_quiznums");
				System.out.print(subject_quiznums+"---");
				int subject_total = rs.getInt("subject_total");
				System.out.print(subject_total+"---");
				int subject_time = rs.getInt("subject_time");
				System.out.println(subject_time);
				
				/* 객체에 결과값 담기 */
				subjectVO= new SubjectVO();
				subjectVO.setSubject_names(subject_names);
				subjectVO.setSubject_quiznums(subject_quiznums);
				subjectVO.setSubject_total(subject_total);
				subjectVO.setSubject_time(subject_time);
				
			}
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			rs.close();
			pstmt.close();
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return subjectVO;
	}	// selectAllSubjects()
	
	/* 시험문제 가져오기 */
	public List selectTestQuiz(String license_abbreviation ,String year_d, String[] subjectsName) {
		System.out.println("TestDAO.java - selectTestQuiz()");
		
		TestVO quiz = null; // return을 위한 TestVO 변수
		List quizList = new ArrayList<TestVO>(); // TestVO 객체를 바인딩 하기 위한 ArrayList
		
		/*날짜 변환*/
		year_d = year_d.replace("년 ", "-");
		year_d = year_d.replace("월 ", "-");
		year_d = year_d.replace("일", "");
		Date year_date = Date.valueOf(year_d); // Date 타입으로 변환
		System.out.println(year_date);
		
		try {
			//getConnection메서드를 이용해서 커넥션 풀로 부터 커넥션 객체를 얻어내어 con변수에 저장
			con = dataFactory.getConnection();
		
			int len = subjectsName.length; // 과목 수
			
			String sql = "SELECT *";
			sql += " FROM TEST_QUIZ";
			sql += " WHERE license_abbreviation=?  AND year_date=?";
			sql += " AND test_subject in (";
			for(int i=0; i<len; i++) { // 과목 수 만큼 반복
				sql += "'"+subjectsName[i]+"'";
				if(i != len-1) sql += ",";
				else  sql += ")";
			}
			
			System.out.println(sql); // 쿼리문 print
			pstmt = con.prepareStatement(sql); // 쿼리문 담기
			pstmt.setString(1, license_abbreviation);
			pstmt.setDate(2, year_date);
			ResultSet rs = pstmt.executeQuery(); // select 쿼리 실행, 그 후 결과를 rs에 저장, ** (sql) 있는지 주의
			
			while(rs.next()) {
				
				/* 쿼리 결과문의 값들을 각 변수에 담기 */
				int test_num = rs.getInt("test_num");
				int test_quiz_num = rs.getInt("test_quiz_num");
				String test_title = rs.getString("test_title");
				String test_imageIs = rs.getString("test_imageIs");
				String test_1 = rs.getString("test_1");
				String test_2 = rs.getString("test_2");
				String test_3 = rs.getString("test_3");
				String test_4 = rs.getString("test_4");
				int test_current = rs.getInt("test_current");
			    int test_cnt_wrong = rs.getInt("test_cnt_wrong");
			    int test_cnt_take = rs.getInt("test_cnt_take");
			    String test_explanation = rs.getString("test_explanation");
			    String test_subject = rs.getString("test_subject");
				
				String test_imageSrc = null;
				if(test_imageIs!=null) {
					test_imageSrc = license_abbreviation+"_"+year_d+"/"+test_quiz_num+".png";
					System.out.println(test_imageSrc);
				}
				
				/* 객체에 넣기 */
				quiz = new TestVO();
				quiz.setTest_num(test_num);
				quiz.setTest_quiz_num(test_quiz_num);
				quiz.setTest_title(test_title);
				quiz.setTest_imageSrc(test_imageSrc);
				quiz.setTest_1(test_1);
				quiz.setTest_2(test_2);
				quiz.setTest_3(test_3);
				quiz.setTest_4(test_4);		
				quiz.setTest_current(test_current);
				quiz.setTest_cnt_wrong(test_cnt_wrong);
				quiz.setTest_cnt_take(test_cnt_take);
				quiz.setTest_explanation(test_explanation);
				quiz.setLicense_abbreviation(license_abbreviation);
				quiz.setYear_date(year_date);
				
				quizList.add(quiz); // testQuizList에 testQuiz 객체 추가 (반복하면서 하나식 추가)
			}

			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}

		return quizList;
	} // selectTestQuiz()

	
}