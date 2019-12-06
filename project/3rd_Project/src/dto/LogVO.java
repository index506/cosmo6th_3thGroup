package dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

public class LogVO {
	private int log_seq; // 로그 시퀀스
    private String license_name; // 자격증 이름
    private String license_abbreviation; // 자격증 약어
    private Date year_date; // 기출년도
    private String[] subjects_name; // 과목들의 이름
    private String[] subjects_range; // 과목들의 범위 (1~20, 21~40,...)
    private String[] subjects_number; //  과목들의 문제수
    private String[] subjects_current; // 과목별 맞은개수
    private ArrayList<int[]> test_answer; // (번호:답안:정답여부)
    private String log_time; // 시험시간 or 남은시간
    private String submityn; // 제출 여부 (Y면 제출, N이면 미제출)
    private String id; // 사용자 Id
    private Timestamp log_date; // Log 생성 시간
    
    public LogVO() {}

	public int getLog_seq() {
		return log_seq;
	}

	public void setLog_seq(int log_seq) {
		this.log_seq = log_seq;
	}

	public String getLicense_name() {
		return license_name;
	}

	public void setLicense_name(String license_name) {
		this.license_name = license_name;
	}

	public String getLicense_abbreviation() {
		return license_abbreviation;
	}

	public void setLicense_abbreviation(String license_abbreviation) {
		this.license_abbreviation = license_abbreviation;
	}

	public Date getYear_date() {
		return year_date;
	}

	public void setYear_date(Date year_date) {
		this.year_date = year_date;
	}

	public String[] getSubjects_name() {
		return subjects_name;
	}

	public void setSubjects_name(String[] subjects_name) {
		this.subjects_name = subjects_name;
	}

	public String[] getSubjects_range() {
		return subjects_range;
	}

	public void setSubjects_range(String[] subjects_range) {
		this.subjects_range = subjects_range;
	}

	public String[] getSubjects_number() {
		return subjects_number;
	}

	public void setSubjects_number(String[] subjects_number) {
		this.subjects_number = subjects_number;
	}

	public String[] getSubjects_current() {
		return subjects_current;
	}

	public void setSubjects_current(String[] subjects_current) {
		this.subjects_current = subjects_current;
	}

	public ArrayList<int[]> getTest_answer() {
		return test_answer;
	}

	public void setTest_answer(ArrayList<int[]> test_answer) {
		this.test_answer = test_answer;
	}

	public String getLog_time() {
		return log_time;
	}

	public void setLog_time(String log_time) {
		this.log_time = log_time;
	}

	public String getSubmityn() {
		return submityn;
	}

	public void setSubmityn(String submityn) {
		this.submityn = submityn;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getLog_date() {
		return log_date;
	}

	public void setLog_date(Timestamp log_date) {
		this.log_date = log_date;
	}
    
}
