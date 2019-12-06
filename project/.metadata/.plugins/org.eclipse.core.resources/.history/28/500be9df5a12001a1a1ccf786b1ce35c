package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.LogVO;
import dto.QuizVO;

public class QuizDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource dataFactory; 
	
	public QuizDAO() {
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
		
	
	/* 시험문제 가져오기 */
	public List<ArrayList<QuizVO>> selectTestQuiz(LogVO logVo) {
		System.out.println("TestDAO.java - selectTestQuiz()");
						
		ArrayList<QuizVO> quizArrayListSubject = null;
		List<ArrayList<QuizVO>> quizList = new ArrayList<ArrayList<QuizVO>>();
				
		try {
			conn = dataFactory.getConnection();
			
			String sql = "SELECT *";
			sql += " FROM TEST_QUIZ";
			sql += " WHERE license_abbreviation=?  AND year_date=?";
			sql += " AND quiz_subject in (";	
			for(int i=0; i< logVo.getSubjects_name().length; i++) { // 과목 수 만큼 반복
				if(i == 0) sql += "?";
				else sql += ",?";
			}
			sql += ")";
			System.out.println(sql); // 쿼리문 print
			
			int cnt = 0;
			pstmt = conn.prepareStatement(sql); // 쿼리문 담기
			pstmt.setString(++cnt, logVo.getLicense_abbreviation());
			pstmt.setDate(++cnt, logVo.getYear_date());
			for(String subName : logVo.getSubjects_name()) pstmt.setString(++cnt, subName); // 과목 개수만큼 set				
			rs = pstmt.executeQuery(); // select 쿼리 실행, 그 후 결과를 rs에 저장, ** (sql) 있는지 주의
			
			String prevSubjectPart = "NULL"; // 이전 과목
			SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
			while(rs.next()) {
				
				/* 쿼리 결과문의 값들을 각 변수에 담기 */
				int quiz_seq = rs.getInt("quiz_seq");
				int quiz_num = rs.getInt("quiz_num");
				String quiz_title = rs.getString("quiz_title");
				String quiz_image = rs.getString("quiz_image");
				String quiz_1 = rs.getString("quiz_1");
				String quiz_2 = rs.getString("quiz_2");
				String quiz_3 = rs.getString("quiz_3");
				String quiz_4 = rs.getString("quiz_4");
				int quiz_current = rs.getInt("quiz_current");
			    int quiz_cnt_wrong = rs.getInt("quiz_cnt_wrong");
			    int quiz_cnt_take = rs.getInt("quiz_cnt_take");
			    String quiz_explanation = rs.getString("quiz_explanation");
			    String quiz_subject = rs.getString("quiz_subject");
			    			   				
				/* 객체에 넣기 */
			    QuizVO quiz = new QuizVO();
				quiz.setQuiz_seq(quiz_seq);
				quiz.setQuiz_num(quiz_num);
				quiz.setQuiz_title(quiz_title);
				if(quiz_image != null)
					quiz.setQuiz_image(logVo.getLicense_abbreviation()+"_"+sdf.format(logVo.getYear_date())+"/"+quiz_image);
				quiz.setQuiz_1(quiz_1);
				quiz.setQuiz_2(quiz_2);
				quiz.setQuiz_3(quiz_3);
				quiz.setQuiz_4(quiz_4);		
				quiz.setQuiz_current(quiz_current);
				quiz.setQuiz_cnt_wrong(quiz_cnt_wrong);
				quiz.setQuiz_cnt_take(quiz_cnt_take);
				quiz.setQuiz_explanation(quiz_explanation);
				quiz.setQuiz_subject(quiz_subject);
				quiz.setLicense_abbreviation(logVo.getLicense_abbreviation());
				quiz.setYear_date(logVo.getYear_date());
				
				
			    /* 과목별로 arrayList에 quiz 객체 추가 */
			    if (!(prevSubjectPart.equals(quiz_subject))) { // [이전 과목의 마지막 문제 -> 다음 과목의 첫 문제]인 순간
			    	if(quizArrayListSubject != null) { // 이전 과목의 quizArrayListSubject ArrayList 객체가 존재 할때
			    		quizList.add(quizArrayListSubject); // quizList에 quizArrayListSubject 추가
			    	}			 
			    	
			    	quizArrayListSubject = new ArrayList<QuizVO>();
			    	prevSubjectPart = quiz_subject;
			    }
				
			    /* quizArrayListSubject에 quiz 객체 추가 (반복하면서 하나식 추가) */
				quizArrayListSubject.add(quiz);
			} 
			quizList.add(quizArrayListSubject); // 마지막 남은 quizArrayListSubject를 quizList에 추가
			
			/* print - quizList(quizArrayListSubject(QuizVO)) */
				for (ArrayList<QuizVO> arrayList : quizList) {
					if(arrayList == null) break;
					System.out.println("--"+arrayList.get(0).getQuiz_subject()+"--");
					for (QuizVO VO : arrayList) {
						System.out.print(VO.getQuiz_num()+"  ");
					}
				}
			
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}

		return quizList;
	} // selectTestQuiz()

	

	public void updateQuizCnt(int quiz_seq) {
		System.out.println("TestDAO.java - updateQuizCnt()");
		
		try {
			conn = dataFactory.getConnection();
			
			/* select - cnt_wrong */
			String sql = "SELECT quiz_cnt_take FROM test_quiz";
			sql += " WHERE quiz_seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quiz_seq);
			rs = pstmt.executeQuery();
			
			int quiz_cnt_take = 0;
			if(rs.next()) {
				quiz_cnt_take = rs.getInt(1)+1;  
			}
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			rs.close();
			pstmt.close();
			
			/* update - cnt_wrong + 1 */
			sql = "UPDATE test_quiz";
			sql += " SET quiz_cnt_take=?";
			sql += " WHERE quiz_seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quiz_cnt_take);
			pstmt.setInt(2, quiz_seq);
			pstmt.executeUpdate();
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
	} // end of updateQuizCnt()
	

	public void updateQuizWrong(int quiz_seq) {
		System.out.println("TestDAO.java - updateQuizWrong()");
		try {
			conn = dataFactory.getConnection();
			
			/* select - cnt_wrong */
			String sql = "SELECT quiz_cnt_wrong FROM test_quiz";
			sql += " WHERE quiz_seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quiz_seq);
			rs = pstmt.executeQuery();
			
			int quiz_cnt_wrong = 0;
			if(rs.next()) {
				quiz_cnt_wrong = rs.getInt(1)+1;  
			}
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			rs.close();
			pstmt.close();
			
			/* update - cnt_wrong + 1 */
			sql = "UPDATE test_quiz";
			sql += " SET quiz_cnt_wrong=?";
			sql += " WHERE quiz_seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quiz_cnt_wrong);
			pstmt.setInt(2, quiz_seq);
			pstmt.executeUpdate();
			
			/* 사용한 DB 실행 객체들을 역순으로 종료 */
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}

	} // end of updateQuizWrong()
	
	
}