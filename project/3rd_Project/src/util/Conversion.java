package util;

import java.sql.Date;
import java.util.ArrayList;

public class Conversion {
	
	/* yyyy�� MM�� dd��(String) => Date */
	public static Date year(String year) {
		year = year.replace("�� ", "-");
		year = year.replace("�� ", "-");
		year = year.replace("��", "");
		Date year_date = Date.valueOf(year); // Date Ÿ������ ��ȯ	
		System.out.println(year_date);
				
		return year_date;
	} // end of year()
	
	/* ���� ��ġ�� */
	public static String combineSubject(String[] subjects) {
		String subject_string ="";
		for(String subject : subjects) {
			subject_string += "/"+subject;
		}
		subject_string = subject_string.substring(1); // �� ���� '/' ����
		System.out.println(subject_string);
		return subject_string;
	} // end of combineSubject()
	
	/* ���� => �ӽô�� */
	public static String tmpAnswer(String[] subjects_range) {
		String test_answer = "";
		for(String sub_range : subjects_range) {
			String[] range = sub_range.split("~");
			for(int n=Integer.parseInt(range[0]); n<=Integer.parseInt(range[1]); n++) {
				test_answer += "/"+n+":0";
			}
		}
		test_answer = test_answer.substring(1);
		return test_answer;
	}
	
	
	
	/* ��� �����ϱ� */
	public static ArrayList<int[]> devideAnswer(String answer_string) {
		if(answer_string == null) { return null; } // null ���� �� ����
		
		System.out.println(answer_string);
		
		String[] rows = answer_string.split("/"); // ex) 1:2:O/2:4:X (��ȣ/���/����)
				
		int rowsLen = rows.length; 
		System.out.println(rowsLen);
		ArrayList<int[]> test_answer = new ArrayList<int[]>();
		
		for(int i=0; i<rowsLen; i++) {
			String tmp[] = rows[i].split(":");
			int tmp3[] = new int[3];
			for(int j=0; j<tmp.length; j++) {
				tmp3[j] = Integer.parseInt(tmp[j]);
			}
			test_answer.add(tmp3);
		}
		
		return test_answer;
	} // end of devideAnswer()
	
	/* ��� ��ġ�� */
	public static String combineAnswer(ArrayList<int[]> test_answer) {		
		String answer_string = "";
		for(int[] answerArr : test_answer) {
			String tmp = "";
			for(int answer : answerArr) {
				tmp += ":"+answer;
			}
			tmp = tmp.replaceFirst(":", "/");
			answer_string += tmp;
		}
		answer_string = answer_string.substring(1);
		System.out.println(answer_string);

		return answer_string;
	} // end of devideAnswer()
	
	/* board_category => title */
	public static String boardCategory(String board_category) {
		String head_title =  null;
		if(board_category == null) {
			return "board_category ����";
		}
		switch (board_category) {
			case "notice_List": head_title = "��������"; break;
			case "community_List": head_title = "���� �Խ���"; break;
			case "question_List": head_title = "���� �Խ���"; break;
		}
		return head_title;
	} // end of boardCategory()
	
}
