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

public class TestDAO { // MVC : ��
	
	private Connection con; // DB Ŀ�ؼ� ���� ����
	private PreparedStatement pstmt; // 
	private DataSource dataFactory; 
	
	public TestDAO() {
		try {
			// Ŀ�ؼ� Ǯ
			// Context �������̽� Ÿ������ InitialContext ��ü ���� (Ŀ�ؼ� Ǯ�� ������ ���� JNDI ����)
			Context ctx = new InitialContext();
						
			// lookup(): ��ϵ� naming ���񽺷κ��� �ڿ��� ã������ �� ����ϴ� �޼���
			//"java:comp/env" �� �ش��ϴ� ��ü�� ã�Ƽ� envContext�� ����
			Context envContext = (Context)ctx.lookup("java:/comp/env"); 
			
			//"jdbc/orcl"�� �ش��ϴ� ��ü�� ã�Ƽ� dataFactory�� ����
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e){
			e.printStackTrace();
			System.out.println("DB ���� ����");
		}
	}
		
	/* �ڰ��� ��� �������� */
	public List<LicenseVO> selectAllLicenses() {
		// TODO Auto-generated method stub
		System.out.println("TestDAO.java - selectAllLicenses");
		List<LicenseVO> licensesList = new ArrayList<LicenseVO>();
		
		try {
			LicenseVO licenseVO = null;
			
			con = dataFactory.getConnection();
			String sql = "SELECT license_name, license_abbreviation";
			sql += " FROM test_license";
			System.out.println(sql); // ������ Ȯ���� ���� print
			pstmt = con.prepareStatement(sql); // pstmt�� ������ ���
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery(); // select ���� ����, �� ����� rs�� ����
			System.out.println(rs);
			
			int count=0;
			while(rs.next()) { // ���� Ʃ�÷� Ŀ�� �̵�, ���� ��ġ�� Ʃ���� ���� �ϸ� true, ������ false
				/* DB ����� �� ������ ���� */
				licenseVO = new LicenseVO(); 
				String license_name = rs.getString("license_name");
				String license_abbreviation = rs.getString("license_abbreviation");
				System.out.println(++count+"��°  "+license_name+"  "+license_abbreviation);
				
				/* VO ��ü�� DB ��� set */
				licenseVO.setLicense_name(license_name);
				licenseVO.setLicense_abbreviation(license_abbreviation);
				licensesList.add(licenseVO);
			}
			
			/* ����� DB ���� ��ü���� �������� ���� */
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
	
	/* �ڰ����� �ش��ϴ� �⵵(���⹮��) ��� �������� */
	public List<Date> selectYearsByLicense(String license_name) {
		// TODO Auto-generated method stub
		System.out.println("TestDAO.java - selectYearsByLicense()");
		List<Date> yearsList = new ArrayList<Date>();
		
		try {	
			con = dataFactory.getConnection(); // Ŀ�ؼ� Ǯ
			String sql = "SELECT year_date";
			sql += " FROM test_year";
			sql += " WHERE license_name=?";
			System.out.println(sql); // ������ Ȯ���� ���� print
			pstmt = con.prepareStatement(sql); // pstmt�� ������ ���
			pstmt.setString(1, license_name); // ù��° ?�� ����
			ResultSet rs = pstmt.executeQuery(); // select ���� ����, �� ����� rs�� ����
			
			while(rs.next()) { // ���� Ʃ�÷� Ŀ�� �̵�, ���� ��ġ�� Ʃ���� ���� �ϸ� true, ������ false
				/* DB ����� �� ������ ���� */
				Date year_date = rs.getDate("year_date");
				yearsList.add(year_date);
			}
			
			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return yearsList;
	} // selectYearsByLicense()
	
	
	/* �⵵�� �ش��ϴ� ���� ��� �������� */
	public SubjectVO selectSubjectsByYear(String license_name ,String year_d) {
		// TODO Auto-generated method stub
		System.out.println("TestDAO.java - selectSubjectsByYear()");
		SubjectVO subjectVO = null;
		
		/*��¥ ��ȯ*/
		year_d = year_d.replace("�� ", "-");
		year_d = year_d.replace("�� ", "-");
		year_d = year_d.replace("��", "");
		Date year_date = Date.valueOf(year_d); // Date Ÿ������ ��ȯ
		System.out.println(year_date);
		
		try {	
			con = dataFactory.getConnection(); // Ŀ�ؼ� Ǯ
			
			String sql = "SELECT subject_names, subject_quiznums, subject_total, subject_time";
			sql += " FROM test_subject";
			sql += " WHERE license_name=?";
			sql += " AND subject_revision IN(";
				sql += " SELECT MAX(subject_revision) FROM test_subject";
				sql += " WHERE license_name=?";
				sql += " AND subject_revision < ?";
			sql += ")";
			System.out.println(sql); // ������ Ȯ���� ���� print
			pstmt = con.prepareStatement(sql); // pstmt�� ������ ���
			pstmt.setString(1, license_name); // ù��° ?�� ����
			pstmt.setString(2, license_name); // ù��° ?�� ����
			pstmt.setDate(3, year_date); // ù��° ?�� ����
			ResultSet rs = pstmt.executeQuery(); // select ���� ����, �� ����� rs�� ����
			
			int count=0;
			while(rs.next()) { // ���� Ʃ�÷� Ŀ�� �̵�, ���� ��ġ�� Ʃ���� ���� �ϸ� true, ������ false
				/* DB ����� �� ������ ���� */
				System.out.print(++count+"---");
				String subject_names = rs.getString("subject_names");
				System.out.print(subject_names+"---");
				String subject_quiznums = rs.getString("subject_quiznums");
				System.out.print(subject_quiznums+"---");
				int subject_total = rs.getInt("subject_total");
				System.out.print(subject_total+"---");
				int subject_time = rs.getInt("subject_time");
				System.out.println(subject_time);
				
				/* ��ü�� ����� ��� */
				subjectVO= new SubjectVO();
				subjectVO.setSubject_names(subject_names);
				subjectVO.setSubject_quiznums(subject_quiznums);
				subjectVO.setSubject_total(subject_total);
				subjectVO.setSubject_time(subject_time);
				
			}
			
			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return subjectVO;
	}	// selectAllSubjects()
	
	/* ���蹮�� �������� */
	public List selectTestQuiz(String license_abbreviation ,String year_d, String[] subjectsName) {
		System.out.println("TestDAO.java - selectTestQuiz()");
		
		TestVO quiz = null; // return�� ���� TestVO ����
		List quizList = new ArrayList<TestVO>(); // TestVO ��ü�� ���ε� �ϱ� ���� ArrayList
		
		/*��¥ ��ȯ*/
		year_d = year_d.replace("�� ", "-");
		year_d = year_d.replace("�� ", "-");
		year_d = year_d.replace("��", "");
		Date year_date = Date.valueOf(year_d); // Date Ÿ������ ��ȯ
		System.out.println(year_date);
		
		try {
			//getConnection�޼��带 �̿��ؼ� Ŀ�ؼ� Ǯ�� ���� Ŀ�ؼ� ��ü�� ���� con������ ����
			con = dataFactory.getConnection();
		
			int len = subjectsName.length; // ���� ��
			
			String sql = "SELECT *";
			sql += " FROM TEST_QUIZ";
			sql += " WHERE license_abbreviation=?  AND year_date=?";
			sql += " AND test_subject in (";
			for(int i=0; i<len; i++) { // ���� �� ��ŭ �ݺ�
				sql += "'"+subjectsName[i]+"'";
				if(i != len-1) sql += ",";
				else  sql += ")";
			}
			
			System.out.println(sql); // ������ print
			pstmt = con.prepareStatement(sql); // ������ ���
			pstmt.setString(1, license_abbreviation);
			pstmt.setDate(2, year_date);
			ResultSet rs = pstmt.executeQuery(); // select ���� ����, �� �� ����� rs�� ����, ** (sql) �ִ��� ����
			
			while(rs.next()) {
				
				/* ���� ������� ������ �� ������ ��� */
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
				
				/* ��ü�� �ֱ� */
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
				
				quizList.add(quiz); // testQuizList�� testQuiz ��ü �߰� (�ݺ��ϸ鼭 �ϳ��� �߰�)
			}

			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}

		return quizList;
	} // selectTestQuiz()

	
}