package dto;

import java.sql.Date;

public class SubjectVO {
	private int subject_seq; // �����ȣ
    private String subject_names; // ������� �̸�
    private String subject_ranges; // ������� ���� ����
    private String subject_numbers; //  ������� ���� ��
    private int subject_total; // �� ���� ��
    private String subject_time; // ���� �ð�
    private Date subject_revision; // ���� ������
    
	public SubjectVO() {}

	public int getSubject_seq() {
		return subject_seq;
	}

	public void setSubject_seq(int subject_seq) {
		this.subject_seq = subject_seq;
	}

	public String getSubject_names() {
		return subject_names;
	}

	public void setSubject_names(String subject_names) {
		this.subject_names = subject_names;
	}

	public String getSubject_ranges() {
		return subject_ranges;
	}

	public void setSubject_ranges(String subject_ranges) {
		this.subject_ranges = subject_ranges;
	}

	public String getSubject_numbers() {
		return subject_numbers;
	}

	public void setSubject_numbers(String subject_numbers) {
		this.subject_numbers = subject_numbers;
	}

	public int getSubject_total() {
		return subject_total;
	}

	public void setSubject_total(int subject_total) {
		this.subject_total = subject_total;
	}

	public String getSubject_time() {
		return subject_time;
	}

	public void setSubject_time(String subject_time) {
		this.subject_time = subject_time;
	}

	public Date getSubject_revision() {
		return subject_revision;
	}

	public void setSubject_revision(Date subject_revision) {
		this.subject_revision = subject_revision;
	}
	
}
