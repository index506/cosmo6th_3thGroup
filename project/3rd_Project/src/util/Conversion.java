package util;

import java.sql.Date;
import java.util.ArrayList;

public class Conversion {
	
	/* yyyy년 MM월 dd일(String) => Date */
	public static Date year(String year) {
		year = year.replace("년 ", "-");
		year = year.replace("월 ", "-");
		year = year.replace("일", "");
		Date year_date = Date.valueOf(year); // Date 타입으로 변환	
		System.out.println(year_date);
				
		return year_date;
	} // end of year()
	
	/* 과목 합치기 */
	public static String combineSubject(String[] subjects) {
		String subject_string ="";
		for(String subject : subjects) {
			subject_string += "/"+subject;
		}
		subject_string = subject_string.substring(1); // 맨 앞의 '/' 제거
		System.out.println(subject_string);
		return subject_string;
	} // end of combineSubject()
	
	/* 과목 => 임시답안 */
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
	
	
	
	/* 답안 분할하기 */
	public static ArrayList<int[]> devideAnswer(String answer_string) {
		if(answer_string == null) { return null; } // null 리턴 후 종료
		
		System.out.println(answer_string);
		
		String[] rows = answer_string.split("/"); // ex) 1:2:O/2:4:X (번호/답안/정답)
				
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
	
	/* 답안 합치기 */
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
			return "board_category 오류";
		}
		switch (board_category) {
			case "notice_List": head_title = "공지사항"; break;
			case "community_List": head_title = "자유 게시판"; break;
			case "question_List": head_title = "질문 게시판"; break;
		}
		return head_title;
	} // end of boardCategory()
	
}

