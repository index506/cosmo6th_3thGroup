package test.testSelect;

import java.sql.Date;

public class SubjectVO {
	private int subject_num; // �����ȣ
    private String subject_names; // ������� �̸�
    private String subject_quiznums; // ������� ���� ����
    private int subject_total; // �� ���� ��
    private int subject_time; // ���� �ð�
    private Date subject_revision; // ���� ������
    
    
    /* ������ */
	public SubjectVO() {}
	
	public SubjectVO(int subject_num, String subject_names, String subject_quiznums, int subject_total, int subject_time,
			Date subject_revision) {
		super();
		this.subject_num = subject_num;
		this.subject_names = subject_names;
		this.subject_quiznums = subject_quiznums;
		this.subject_total = subject_total;
		this.subject_time = subject_time;
		this.subject_revision = subject_revision;
	}
	
	/* getter/setter */
	public int getSubject_num() {
		return subject_num;
	}

	public void setSubject_num(int subject_num) {
		this.subject_num = subject_num;
	}

	public String getSubject_names() {
		return subject_names;
	}

	public void setSubject_names(String subject_names) {
		this.subject_names = subject_names;
	}

	public String getSubject_quiznums() {
		return subject_quiznums;
	}

	public void setSubject_quiznums(String subject_nums) {
		this.subject_quiznums = subject_nums;
	}

	public int getSubject_total() {
		return subject_total;
	}

	public void setSubject_total(int subject_total) {
		this.subject_total = subject_total;
	}

	public int getSubject_time() {
		return subject_time;
	}

	public void setSubject_time(int subject_time) {
		this.subject_time = subject_time;
	}

	public Date getSubject_revision() {
		return subject_revision;
	}

	public void setSubject_revision(Date subject_revision) {
		this.subject_revision = subject_revision;
	}
    
    
	
}
