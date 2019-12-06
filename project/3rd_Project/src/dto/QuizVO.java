package dto;

import java.sql.Date;

public class QuizVO {
	private int quiz_seq;
	private int quiz_num;
	private String quiz_title;
	private String quiz_image;
	private String quiz_1;
	private String quiz_2;
	private String quiz_3;
	private String quiz_4;
	private int quiz_current;
	private int quiz_cnt_wrong;
	private int quiz_cnt_take;
	private String quiz_explanation;
	private String quiz_subject;
	private String license_abbreviation;
	private Date year_date;
	
	public QuizVO() { }

	public int getQuiz_seq() {
		return quiz_seq;
	}

	public void setQuiz_seq(int quiz_seq) {
		this.quiz_seq = quiz_seq;
	}

	public int getQuiz_num() {
		return quiz_num;
	}

	public void setQuiz_num(int quiz_num) {
		this.quiz_num = quiz_num;
	}

	public String getQuiz_title() {
		return quiz_title;
	}

	public void setQuiz_title(String quiz_title) {
		this.quiz_title = quiz_title;
	}

	public String getQuiz_image() {
		return quiz_image;
	}

	public void setQuiz_image(String quiz_image) {
		this.quiz_image = quiz_image;
	}

	public String getQuiz_1() {
		return quiz_1;
	}

	public void setQuiz_1(String quiz_1) {
		this.quiz_1 = quiz_1;
	}

	public String getQuiz_2() {
		return quiz_2;
	}

	public void setQuiz_2(String quiz_2) {
		this.quiz_2 = quiz_2;
	}

	public String getQuiz_3() {
		return quiz_3;
	}

	public void setQuiz_3(String quiz_3) {
		this.quiz_3 = quiz_3;
	}

	public String getQuiz_4() {
		return quiz_4;
	}

	public void setQuiz_4(String quiz_4) {
		this.quiz_4 = quiz_4;
	}

	public int getQuiz_current() {
		return quiz_current;
	}

	public void setQuiz_current(int quiz_current) {
		this.quiz_current = quiz_current;
	}

	public int getQuiz_cnt_wrong() {
		return quiz_cnt_wrong;
	}

	public void setQuiz_cnt_wrong(int quiz_cnt_wrong) {
		this.quiz_cnt_wrong = quiz_cnt_wrong;
	}

	public int getQuiz_cnt_take() {
		return quiz_cnt_take;
	}

	public void setQuiz_cnt_take(int quiz_cnt_take) {
		this.quiz_cnt_take = quiz_cnt_take;
	}

	public String getQuiz_explanation() {
		return quiz_explanation;
	}

	public void setQuiz_explanation(String quiz_explanation) {
		this.quiz_explanation = quiz_explanation;
	}

	public String getQuiz_subject() {
		return quiz_subject;
	}

	public void setQuiz_subject(String quiz_subject) {
		this.quiz_subject = quiz_subject;
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
	
	

	
	
	
}