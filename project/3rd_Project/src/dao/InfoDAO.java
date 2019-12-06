package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.LicenseVO;
import dto.SubjectVO;
import util.Conversion;

public class InfoDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource dataFactory; 
	
	public InfoDAO() {
		try {
			// 커넥션 풀
			// Context 인터페이스 타입으로 InitialContext 객체 생성 (커넥션 풀에 접근을 위한 JNDI 서비스)
			Context ctx = new InitialContext();
						
			// lookup(): 등록된 naming 서비스로부터 자원을 찾고자할 때 사용하는 메서드
			// "java:comp/env" 에 해당하는 객체를 찾아서 envContext에 삽입
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
		
		String sql = "SELECT license_name, license_abbreviation";
		sql += " FROM test_license";
		
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql); // pstmt에 쿼리문 담기
			rs = pstmt.executeQuery(); // select 쿼리 실행, 그 결과를 rs에 저
			
			while(rs.next()) { // 다음 튜플로 커서 이동, 다음 위치에 튜플이 존재 하면 true, 없으면 false
				/* DB 결과값 각 변수에 저장 */
				LicenseVO licenseVO = new LicenseVO(); 
				String license_name = rs.getString("license_name");
				String license_abbreviation = rs.getString("license_abbreviation");
				
				/* VO 객체에 DB 결과 set */
				licenseVO.setLicense_name(license_name);
				licenseVO.setLicense_abbreviation(license_abbreviation);
				licensesList.add(licenseVO);
			}
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
				
		return licensesList;
	} // selectAllLicenses()
	
	/* 자격증에 해당하는 년도(기출문제) 목록 가져오기 */
	public List<Date> selectYearsByLicense(String license_name) {
		// TODO Auto-generated method stub
		System.out.println("TestDAO.java - selectYearsByLicense()");
		List<Date> yearsList = new ArrayList<Date>();
		
		try {	
			conn = dataFactory.getConnection(); // 커넥션 풀
			String sql = "SELECT year_date";
			sql += " FROM test_year";
			sql += " WHERE license_name=?";
			System.out.println(sql); // 쿼리문 확인을 위한 print
			pstmt = conn.prepareStatement(sql); // pstmt에 쿼리문 담기
			pstmt.setString(1, license_name); // 첫번째 ?에 삽입
			rs = pstmt.executeQuery(); // select 쿼리 실행, 그 결과를 rs에 저장
			
			while(rs.next()) { // 다음 튜플로 커서 이동, 다음 위치에 튜플이 존재 하면 true, 없으면 false
				/* DB 결과값 각 변수에 저장 */
				Date year_date = rs.getDate("year_date");
				yearsList.add(year_date);
			}
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return yearsList;
	} // selectYearsByLicense()
	
	
	/* 년도에 해당하는 과목 목록 가져오기 */
	public SubjectVO selectSubjectsByYear(String license_name ,String year) {
		// TODO Auto-generated method stub
		System.out.println("TestDAO.java - selectSubjectsByYear()");
		SubjectVO subjectVO = null;
		
		/*날짜 변환*/
		Date year_date = Conversion.year(year);
		
		try {	
			conn = dataFactory.getConnection(); // 커넥션 풀
			
			String sql = "SELECT * FROM test_subject";
			sql += " WHERE license_name=?";
			sql += " AND subject_revision IN(";
				sql += " SELECT MAX(subject_revision) FROM test_subject";
				sql += " WHERE license_name=?";
				sql += " AND subject_revision < ?";
			sql += ")";
			System.out.println(sql); // 쿼리문 확인을 위한 print
			pstmt = conn.prepareStatement(sql); // pstmt에 쿼리문 담기
			pstmt.setString(1, license_name); // 첫번째 ?에 삽입
			pstmt.setString(2, license_name); // 두번째 ?에 삽입
			pstmt.setDate(3, year_date); // 세번째 ?에 삽입
			rs = pstmt.executeQuery(); // select 쿼리문 실행, 그 결과를 rs에 저장
			
			while(rs.next()) { // 다음 튜플로 커서 이동, 다음 위치에 튜플이 존재 하면 true, 없으면 false
				/* DB 결과값 각 변수에 저장 */
				String subject_names = rs.getString("subject_names");
				String subject_ranges = rs.getString("subject_ranges");
				String subject_numbers = rs.getString("subject_numbers");
				int subject_total = rs.getInt("subject_total");
				String subject_time = rs.getString("subject_time");
				
				System.out.println("rs.next:"+subject_numbers);
				
				/* 객체에 결과값 담기 */
				subjectVO= new SubjectVO();
				subjectVO.setSubject_names(subject_names);
				subjectVO.setSubject_ranges(subject_ranges);
				subjectVO.setSubject_numbers(subject_numbers);
				subjectVO.setSubject_total(subject_total);
				subjectVO.setSubject_time(subject_time);
				
				System.out.println(subjectVO.getSubject_numbers());
				
			}
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return subjectVO;
	}	// selectAllSubjects()
	
	
	

}
