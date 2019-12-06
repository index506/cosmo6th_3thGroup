package service;

import java.util.List;

import dao.BoardDAO;
import dto.PostVO;

public class BoardService { // MVC : 컨트롤러
	BoardDAO boardDAO;

	public BoardService() {
		boardDAO = new BoardDAO(5, 10); // page_counts, post_counts
	}
	
	public List<PostVO> listPosts(String board_category, String search_option, String search_value, int now_pnum) {
		System.out.println("BoardService.java - listPost()");
		List<PostVO> postsList = boardDAO.selectAllPosts(board_category, search_option, search_value, now_pnum);
		return postsList;
	}
	
	public List<PostVO> listQnaPosts(String board_category, String search_option, String search_value, int now_pnum) {
		System.out.println("BoardService.java - listPostsQuestion()");
		List<PostVO> postsList = boardDAO.selectAllQnaPosts(board_category, search_option, search_value, now_pnum);
		return postsList;
	}
			
	public PostVO readPost (String board_category,int num) {
		System.out.println("BoardService.java - readPost()");
		PostVO postVO = boardDAO.selectPost(board_category, num);
		return postVO;
	}
	
	public PostVO[] readPostPN(String board_category, int num) {
		System.out.println("BoardService.java - readPostPV()");
		PostVO[] postPNArr = boardDAO.selectPostPN(board_category, num);
		return postPNArr;
	}

	
	public int addPost(String board_category, PostVO postVO) {
		System.out.println("BoardService.java - addPost()");
		int num = boardDAO.insertPost(board_category, postVO);
		return num;
	}

	public void modifyPost(String board_category,PostVO postVO) {
		System.out.println("BoardService.java - addPost()");
		boardDAO.updatePost(board_category, postVO);
	}
	

	public List<Integer> removePost(String board_category, int num) {
		System.out.println("BoardService.java - removePost()");
		List<Integer> numList = boardDAO.selectConnNums(board_category, num);
		boardDAO.deletePost(board_category, num);
		return numList;
	}
	
	public String paging(String url, String board_category, String search_option, String search_value, int now_pnum) {
		String paging = boardDAO.pageNumber(url, board_category, search_option, search_value, now_pnum);
		return paging;
	}

		
}
