package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.PostVO;

public class BoardDAO {
	/* DB ���� ���� */
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource dataFactory; 
	
	/* ����¡ ��� ���� */
	int page_counts; // �� �������� ����� ������ ��ȣ���� ����
	int post_counts; // �� �������� ����� �Խñ��� ����
	
	public BoardDAO() {
		try {
			/* Ŀ�ؼ� Ǯ
			 * 1. Context �������̽� Ÿ������ InitialContext ��ü ���� (Ŀ�ؼ� Ǯ�� ������ ���� JNDI ����)
			 * 2. "java:comp/env" �� �ش��ϴ� ��ü�� ã�Ƽ� envContext�� ����
			 * 3. "jdbc/orcl"�� �ش��ϴ� ��ü�� ã�Ƽ� dataFactory�� ����
			 */
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e){
			e.printStackTrace();
			System.out.println("DB ���� ����");
		}
	}
	
	public BoardDAO(int page_counts, int post_counts) {
		this();
		this.page_counts = page_counts;
		this.post_counts = post_counts;
	}
		
	/* �۸�� ��ȸ */
	public List<PostVO> selectAllPosts(String board_category, String search_option, String search_value, int now_pnum ) {
		System.out.println("BoardDAO.java - selectAllPosts()");
		List<PostVO> postsList = new ArrayList<PostVO>(); // PostVO ��ü�� ���ε� �ϱ� ���� ArrayList
		int abspage = 1;
		
		try {
			String sql = "SELECT num, title, content, writeDate, readcount, imageName, fileName, id";
			sql += " FROM "+board_category;
			if(!search_value.equals("")) { sql += " WHERE "+search_option+" LIKE '%'||?||'%'";	}
			sql += " ORDER BY num DESC";
			System.out.println(sql);
			
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			if(!search_value.equals("")) { pstmt.setString(1, search_value); }
			rs = pstmt.executeQuery(); // pstmt ���� ������ ���� �� ��� ��ȯ			
						
			/* �ش� �������� �Խñ� list�� ��� */
			abspage = (now_pnum-1)*post_counts + 1; // ���� �������� ù �Խñ� �� ��ȣ ���
			if(rs.next()) { // ��� ����� �����ϸ�
				rs.absolute(abspage); // �ش��ϴ� ������ Ŀ�� ��ġ �̵�
				for(int i=0; i< post_counts; i++) {  // �Խñ� ��� ������ŭ �ݺ�
					/* ����� ��ü�� ��� & List�� add */
					PostVO postVO = new PostVO();
					postVO.setNum(rs.getInt("num"));
					postVO.setTitle(rs.getString("title"));
					postVO.setContent(rs.getString("content"));
					postVO.setWriteDate(rs.getDate("writeDate"));
					postVO.setReadcount(rs.getInt("readcount"));
					postVO.setImageName(rs.getString("imageName")); // null �� �� ����
					postVO.setFileName(rs.getString("fileName")); // null �� �� ����
					postVO.setId(rs.getString("id"));
					postsList.add(postVO); // List�� post ��ü �߰�
					
					if(rs.isLast())	{ break; } // Ŀ���� �������� ��ġ�ϸ� while ���� (�ַ� �� ������ ������ �� ��)
					rs.next();
				} // end of for(int i=0; i< post_counts; i++)
			} // end of if(rs.next)
			
			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}

		return postsList;
	} // end of selectAllPosts()
	
	/* ���� �Խ����� �� ��� ��ȸ */
	public List<PostVO> selectAllQnaPosts(String board_category, String search_option, String search_value, int now_pnum ) {
		System.out.println("BoardDAO.java - selectAllQnaPosts()");
		List<PostVO> postsList = new ArrayList<PostVO>(); // PostVO ��ü�� ���ε� �ϱ� ���� ArrayList
		int abspage = 1;
		
		try {
			/* ������ �ۼ� */
			String sql = "SELECT LEVEL, num, parentNum, title, content";
			sql += ", imageName, fileName, readcount, writeDate, id";
			sql += " FROM " + board_category;
			if(!search_value.equals("")) { sql += " WHERE "+search_option+" LIKE '%'||?||'%'"; }
			sql += " START WITH parentNum = 0";  
			sql += " CONNECT BY PRIOR num = parentNum"; 
			sql += " ORDER SIBLINGS BY num DESC"; // �Խñ� �� �ʿ��� ������� �ҷ����� ����� ����� ������ �Բ� ���ش�.
			System.out.println(sql);
			
			/* DB ����, ���� ���� ��� ��ȯ */
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			if(!search_value.equals("")) {	pstmt.setString(1, search_value);	}
			rs = pstmt.executeQuery(); // pstmt ���� ������ ���� �� ��� ��ȯ
						
			/* �ش� �������� �Խñ� list�� ��� */
			abspage = (now_pnum-1)*post_counts + 1; // ���� �������� ù �Խñ� �� ��ȣ ���
			if(rs.next()) { // ��� ����� �����ϸ�
				rs.absolute(abspage); // �ش��ϴ� ������ Ŀ�� ��ġ �̵�
				for(int i=0; i< post_counts; i++) {  // �Խñ� ��� ������ŭ �ݺ�
					/* ����� ��ü�� ��� & List�� add */
					PostVO postVO = new PostVO();
					postVO.setLevel(rs.getInt("level")); 
					postVO.setNum(rs.getInt("num"));
					postVO.setParentNum(rs.getInt("parentNum"));
					postVO.setTitle(rs.getString("title"));
					postVO.setContent(rs.getString("content"));
					postVO.setWriteDate(rs.getDate("writeDate"));
					postVO.setReadcount(rs.getInt("readcount"));
					postVO.setImageName(rs.getString("imageName"));
					postVO.setFileName(rs.getString("fileName"));
					postVO.setId(rs.getString("id"));
					postsList.add(postVO); // List�� post ��ü �߰�
					if(rs.isLast())	{ break; } // Ŀ���� �������� ��ġ�ϸ� while ���� (�ַ� �� ������ ������ �� ��)
					rs.next();
				} // end of for(int i=0; i< post_counts; i++)
			} // end of if(rs.next)

			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}

		return postsList;
	} // end of selectAllQnAPosts()
		
	/* �� ��ȸ */
	public PostVO selectPost(String board_category, int num) {
		System.out.println("BoardDAO.java - selectPost()");
		PostVO postVO = null;
		
		try {
			/* ������ �ۼ� */
			String sql = "SELECT * FROM " + board_category;
			sql += " WHERE num = ?";
			
			/* DB ����, ���� ����, ��� ��ȯ */
			conn = dataFactory.getConnection(); // Ŀ���� Ǯ�κ��� Ŀ�ؼ� ���
			pstmt = conn.prepareStatement(sql); // ������ ���
			pstmt.setInt(1, num); // ?�� �Ķ���� set 
			ResultSet rs = pstmt.executeQuery(); // select ���� ����, �� �� ����� rs�� ����

			/* �ش� �������� ���� ��ü�� ���� */
			if(rs.next()) { // Ŀ���� ���� Ʃ�� ��ġ�� -> ���� ���� Ȯ��
				/* ����� ��ü�� ��� */
				postVO = new PostVO();
				postVO.setNum(rs.getInt("num"));
				if("question_List".equals(board_category)) { postVO.setParentNum(rs.getInt("parentNum")); } // ���� �Խ����� ���� (�亯���)				
				postVO.setTitle(rs.getString("title"));
				postVO.setContent(rs.getString("content"));
				postVO.setImageName(rs.getString("imageName")); // null �� �� ����
				postVO.setFileName(rs.getString("fileName")); // null �� �� ����
				postVO.setId(rs.getString("id"));
				postVO.setWriteDate(rs.getDate("writeDate"));
				System.out.println("�̹��� ����-"+postVO.getImageName());
			}

			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}

		return postVO;
	} // end of selectPost()
	
	public PostVO[] selectPostPN(String board_category, int num) {
		System.out.println("BoardDAO.java - selectPostPN()");
		PostVO[] postPNArr = new PostVO[2];
		
		try {
			/* ������ �ۼ� */
			
			
			String sql = "SELECT * FROM";
				sql += "(";
					sql += "  SELECT num";
					if(board_category.equals("question_List")) { sql += " ,parentNum"; }
					sql += " ,LAG(num) OVER(ORDER BY num DESC) AS prev_num";
					sql += " ,LAG(title) OVER(ORDER BY num DESC) AS prev_title";
					sql += " ,LEAD(num) OVER(ORDER BY num DESC) AS next_num";
					sql += " ,LEAD(title) OVER(ORDER BY num DESC) AS next_title";
					sql += " FROM " + board_category;
					if(board_category.equals("question_List")) { sql += " WHERE parentNum=0"; }
				sql +=")";
			sql += " WHERE num = ?";
						
			/* DB ����, ���� ����, ��� ��ȯ */
			conn = dataFactory.getConnection(); // Ŀ���� Ǯ�κ��� Ŀ�ؼ� ���
			pstmt = conn.prepareStatement(sql); // ������ ���
			pstmt.setInt(1, num); // �Ķ���� set 
			ResultSet rs = pstmt.executeQuery(); // select ���� ����, �� �� ����� rs�� ����

			/* ������, ������ ���� */
			if(rs.next()) { // Ŀ���� ���� Ʃ�� ��ġ�� -> ���� ���� Ȯ��
				/* ����� ��ü�� ��� */
				PostVO postVOPrev = new PostVO();
				PostVO postVONext = new PostVO();
				postVOPrev.setNum(rs.getInt("prev_num"));
				postVOPrev.setTitle(rs.getString("prev_title"));
				postVONext.setNum(rs.getInt("next_num"));
				postVONext.setTitle(rs.getString("next_title"));
				
				postPNArr[0] = postVOPrev;
				postPNArr[1] = postVONext;
			}

			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}

		return postPNArr;
	}

	/* �� ���� (����, �亯) */
	public int insertPost(String board_category, PostVO postVO) {
		System.out.println("BoardDAO.java - insertPost()");
		System.out.println("parentNum"+postVO.getParentNum());
		try {
			/* ������ �ۼ� */
			String sql = "INSERT INTO " + board_category;
			sql += " (num,";
			if(postVO.getParentNum() > 0) { sql += " parentNum,"; } // �亯 - �θ� ��ȣ
			sql += " title, content, imageName, fileName, id)";
			sql += " VALUES (table_seq";
			if(postVO.getParentNum() > 0) { sql += ",?"; } // �亯 - �θ� ��ȣ
			sql +=  ",? ,?, ?, ?, ?)";
			switch (board_category) { // seq ����
				case "notice_List":
					sql = sql.replace("table_seq", "notice_seq.NEXTVAL");
					break;
				case "community_List":
					sql = sql.replace("table_seq", "commu_seq.NEXTVAL");
					break;
				case "question_List":
					sql = sql.replace("table_seq", "quest_seq.NEXTVAL");
					break;
				default : System.out.println("board_category ���� ��");
					break;
			}
			System.out.println(sql);
			
			/* DB ����, ���� ���� */
			int cnt=0;
			conn = dataFactory.getConnection(); // Ŀ���� Ǯ�κ��� Ŀ�ؼ� ���
			pstmt = conn.prepareStatement(sql); // ������ ���
			if(postVO.getParentNum() > 0) { pstmt.setInt(++cnt, postVO.getParentNum()); } // �亯 - �θ� ��ȣ
			pstmt.setString(++cnt, postVO.getTitle());
			pstmt.setString(++cnt, postVO.getContent());
			pstmt.setString(++cnt, postVO.getImageName());
			pstmt.setString(++cnt, postVO.getFileName());
			pstmt.setString(++cnt, postVO.getId());
			pstmt.executeUpdate(); // select ���� ����, �� �� ����� rs�� ����

			/* ����� DB ���� ��ü���� �������� ���� */
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return selectNewestNum(board_category);
	} // end of insertPost()
	
	/* �� ���� (����) */
	public void updatePost(String board_category, PostVO postVO) {
		System.out.println("BoardDAO.java - updatePost()");
		try {
			/* ������ �ۼ� */
			String sql = "UPDATE " + board_category;
			sql += " SET title=?";
			sql += " , content=?";
			if(isCheck(postVO.getImageName())) sql += " , imageName=?";
			if(isCheck(postVO.getFileName())) sql += " , fileName=?";
			sql += " WHERE num=?";
			System.out.println(sql);

			/* DB ����, ���� ���� */
			int cnt=0;
			conn = dataFactory.getConnection(); // Ŀ���� Ǯ�κ��� Ŀ�ؼ� ���
			pstmt = conn.prepareStatement(sql); // ������ ���
			pstmt.setString(++cnt, postVO.getTitle());
			pstmt.setString(++cnt, postVO.getContent());
			if(isCheck(postVO.getImageName())) { pstmt.setString(++cnt, postVO.getImageName()); }
			if(isCheck(postVO.getFileName())) { pstmt.setString(++cnt, postVO.getFileName()); }
			pstmt.setInt(++cnt, postVO.getNum());
			pstmt.executeUpdate(); // select ���� ����, �� �� ����� rs�� ����

			/* ����� DB ���� ��ü���� �������� ���� */
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
	} // end of updatePost()
	
	/* ���� �̸� ���� ���� üũ */
	private boolean isCheck(String Fname) {
		if (Fname != null && Fname.length() != 0) {
			return true;
		}
		return false;
	}
	
	
	
	public void deletePost(String board_category, int num) {
		System.out.println("BoardDAO.java - deletePost()");
		try {
			/* ������ �ۼ� */
			String query = "DELETE FROM " + board_category;
			query += " WHERE num in (";
			if("question_List".equals(board_category)) { // ���� �Խ��� - �ش� �Խñ� + �亯���� ����
				query += " SELECT num FROM " + board_category;
				query += " START WITH num = ?";
				query += " CONNECT BY PRIOR  num = parentNum )";
			} else { // �ش� �Խñ۸� ����
				query += "?)";
			}
			System.out.println(query);
			
			/* DB ����, ���� ���� */
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			/* ���� */
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // end of deletePost()
	
	/* �ֽ� �� ��ȣ */
	private int selectNewestNum(String board_category) {
		System.out.println("BoardDAO.java - selectNewestNum()");
		int num=0;
		
		try {
			/* ������ �ۼ� */
			String sql = "SELECT max(num)";
			sql += " FROM "+board_category;
			System.out.println(sql);
			
			/* DB ����, ���� ���� */
			conn = dataFactory.getConnection(); // Ŀ���� Ǯ�κ��� Ŀ�ؼ� ���
			pstmt = conn.prepareStatement(sql); // ������ ���
			rs = pstmt.executeQuery(); // select ���� ����, �� �� ����� rs�� ����

			if(rs.next()) { // Ŀ���� ���� Ʃ�� ��ġ�� -> ���� ���� Ȯ��
				num = rs.getInt(1);
				System.out.println("newestNum:"+num);
			}

			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return num;
	} //  end of selectNewestNum()

	public List<Integer> selectConnNums(String board_category, int num) {
		System.out.println("BoardDAO.java - selectConnNums()");
		List<Integer> numList = new ArrayList<Integer>();
		
		try {
			/* ������ �ۼ� */
			String sql = "SELECT num FROM " + board_category;
			sql += " START WITH num = ?";
			sql += " CONNECT BY PRIOR  num = parentNum";
			System.out.println(sql);
			
			/* DB ����, ���� ���� */
			conn = dataFactory.getConnection(); // Ŀ���� Ǯ�κ��� Ŀ�ؼ� ���
			pstmt = conn.prepareStatement(sql); // ������ ���
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); // select ���� ����, �� �� ����� rs�� ����

			while(rs.next()) { // Ŀ���� ���� Ʃ�� ��ġ�� -> ���� ���� Ȯ��
				int connNum = rs.getInt(1);
				numList.add(connNum);
			}

			/* ����� DB ���� ��ü���� �������� ���� */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return numList;
	} // selectConnNums()
	

	/* ����¡ ��ȣ ����� */
	public String pageNumber(String url, String board_category, String search_option, String search_value, int now_pnum) {
		int total_post = totalRecord(board_category, search_option, search_value); // �� �Խñ� ��
		int total_page = total_post / post_counts + 1; // �� ������ �� (�� �Խñ� �� / ������ �� �Խñ� ��)
		String str="";
		
		if(total_post % post_counts == 0) total_page--; // �������� 0�� �� ���� 1�� ��		
		
		if(now_pnum < 1) now_pnum = 1; // ���������� ������ ��ȣ ���� ó�� (1���� ���� ��)
		if(now_pnum > total_page) now_pnum = total_page; // ���������� ������ ��ȣ ���� ó�� (�� ������ ������ Ŭ ��)
			
		int start_pnum = now_pnum - (now_pnum % page_counts) + 1 ; // �� �������� ��µǴ� ��ȣ�� ������
		if((now_pnum % page_counts == 0)) start_pnum = start_pnum - page_counts; // ������ ��� ���� ó��
			
		int end_pnum = start_pnum + (page_counts - 1) ; // �� �������� ��µǴ� ��ȣ�� ����
		
		if(end_pnum > total_page) end_pnum = total_page; // �� ������ ������ ��ȣ ���
		
		
		if(page_counts < start_pnum) { // [<<] [<] (�� ó���� ��� ����)
			str += "<li><a href='"+url+"?now_pnum=1&search_option="+search_option+"&search_value="+search_value+"'>&lt;&lt;</a></li>"; // �� ù ������
			str += "<li><a href='"+url+"?now_pnum="+(start_pnum-1)+"&search_option="+search_option+"&search_value="+search_value+"'>&lt;</a></li>";
		}
		
		for(int i=start_pnum; i<=end_pnum; i++) { // [n] [n+1] [n+2] [n+3] [n+4]
			if(i==now_pnum) {
				str += "<li><span style='color:green'>"+i+"</span></li>";
			} else {
				str += "<li><a href='"+url+"?now_pnum="+i+"&search_option="+search_option+"&search_value="+search_value+"'>"+i+"</a></li>";
			}
		}
		
		if(end_pnum < total_page) { // [>] [>>] (�� �������� ��� ����)
			str += "<li><a href='"+url+"?now_pnum="+(end_pnum+1)+"&search_option="+search_option+"&search_value="+search_value+"'>&gt;</a></li>";
			str += "<li><a href='"+url+"?now_pnum="+(total_page)+"&search_option="+search_option+"&search_value="+search_value+"'>&gt;&gt;</a></li>"; // �� ������ ������
		}	
		
		return str;
	} // end of pageNumber()

	public int totalRecord(String board_category, String search_option,  String search_value) {
		int total_post = 0; // �� �Խñ� ����
		
		String sql = "SELECT count(*) FROM " + board_category;
		if(!search_value.equals("")) {
			sql += " WHERE " + search_option + " LIKE '%'||?||'%'";
		}
		
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			if(!search_value.equals("")) {
				pstmt.setString(1, search_value);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total_post = rs.getInt(1); // ���ڵ� ����
			}
			
			/* ���� */
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return total_post;
	} // end of totalRecord()


}