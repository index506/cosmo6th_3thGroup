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
			// Ŀ�ؼ� Ǯ
			// Context �������̽� Ÿ������ InitialContext ��ü ���� (Ŀ�ؼ� Ǯ�� ������ ���� JNDI ����)
			Context ctx = new InitialContext();
						
			// lookup(): ��ϵ� naming ���񽺷κ��� �ڿ��� ã������ �� ����ϴ� �޼���
			// "java:comp/env" �� �ش��ϴ� ��ü�� ã�Ƽ� envContext�� ����
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
		
		String sql = "SELECT license_name, license_abbreviation";
		sql += " FROM test_license";
		
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql); // pstmt�� ������ ���
			rs = pstmt.executeQuery(); // select ���� ����, �� ����� rs�� ��
			
			while(rs.next()) { // ���� Ʃ�÷� Ŀ�� �̵�, ���� ��ġ�� Ʃ���� ���� �ϸ� true, ������ false
				/* DB ����� �� ������ ���� */
				LicenseVO licenseVO = new LicenseVO(); 
				String license_name = rs.getString("license_name");
				String license_abbreviation = rs.getString("license_abbreviation");
				
				/* VO ��ü�� DB ��� set */
				licenseVO.setLicense_name(license_name);
				licenseVO.setLicense_abbreviation(license_abbreviation);
				licensesList.add(licenseVO);
			}
			
			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
				
		return licensesList;
	} // selectAllLicenses()
	
	/* �ڰ����� �ش��ϴ� �⵵(���⹮��) ��� �������� */
	public List<Date> selectYearsByLicense(String license_name) {
		// TODO Auto-generated method stub
		System.out.println("TestDAO.java - selectYearsByLicense()");
		List<Date> yearsList = new ArrayList<Date>();
		
		try {	
			conn = dataFactory.getConnection(); // Ŀ�ؼ� Ǯ
			String sql = "SELECT year_date";
			sql += " FROM test_year";
			sql += " WHERE license_name=?";
			System.out.println(sql); // ������ Ȯ���� ���� print
			pstmt = conn.prepareStatement(sql); // pstmt�� ������ ���
			pstmt.setString(1, license_name); // ù��° ?�� ����
			rs = pstmt.executeQuery(); // select ���� ����, �� ����� rs�� ����
			
			while(rs.next()) { // ���� Ʃ�÷� Ŀ�� �̵�, ���� ��ġ�� Ʃ���� ���� �ϸ� true, ������ false
				/* DB ����� �� ������ ���� */
				Date year_date = rs.getDate("year_date");
				yearsList.add(year_date);
			}
			
			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return yearsList;
	} // selectYearsByLicense()
	
	
	/* �⵵�� �ش��ϴ� ���� ��� �������� */
	public SubjectVO selectSubjectsByYear(String license_name ,String year) {
		// TODO Auto-generated method stub
		System.out.println("TestDAO.java - selectSubjectsByYear()");
		SubjectVO subjectVO = null;
		
		/*��¥ ��ȯ*/
		Date year_date = Conversion.year(year);
		
		try {	
			conn = dataFactory.getConnection(); // Ŀ�ؼ� Ǯ
			
			String sql = "SELECT * FROM test_subject";
			sql += " WHERE license_name=?";
			sql += " AND subject_revision IN(";
				sql += " SELECT MAX(subject_revision) FROM test_subject";
				sql += " WHERE license_name=?";
				sql += " AND subject_revision < ?";
			sql += ")";
			System.out.println(sql); // ������ Ȯ���� ���� print
			pstmt = conn.prepareStatement(sql); // pstmt�� ������ ���
			pstmt.setString(1, license_name); // ù��° ?�� ����
			pstmt.setString(2, license_name); // �ι�° ?�� ����
			pstmt.setDate(3, year_date); // ����° ?�� ����
			rs = pstmt.executeQuery(); // select ������ ����, �� ����� rs�� ����
			
			while(rs.next()) { // ���� Ʃ�÷� Ŀ�� �̵�, ���� ��ġ�� Ʃ���� ���� �ϸ� true, ������ false
				/* DB ����� �� ������ ���� */
				String subject_names = rs.getString("subject_names");
				String subject_ranges = rs.getString("subject_ranges");
				String subject_numbers = rs.getString("subject_numbers");
				int subject_total = rs.getInt("subject_total");
				String subject_time = rs.getString("subject_time");
				
				System.out.println("rs.next:"+subject_numbers);
				
				/* ��ü�� ����� ��� */
				subjectVO= new SubjectVO();
				subjectVO.setSubject_names(subject_names);
				subjectVO.setSubject_ranges(subject_ranges);
				subjectVO.setSubject_numbers(subject_numbers);
				subjectVO.setSubject_total(subject_total);
				subjectVO.setSubject_time(subject_time);
				
				System.out.println(subjectVO.getSubject_numbers());
				
			}
			
			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return subjectVO;
	}	// selectAllSubjects()
	
	
	

}
