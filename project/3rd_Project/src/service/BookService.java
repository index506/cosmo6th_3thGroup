package service;

import java.util.ArrayList;

import dao.BookDAO;
import dto.BookVO;

public class BookService {

	BookDAO bookDAO;

	public BookService() {
		// TODO Auto-generated constructor stub
		bookDAO = new BookDAO();
	}

	public ArrayList<BookVO> selectBookList() {
		// TODO Auto-generated method stub
		
		ArrayList<BookVO> bookLists = bookDAO.selectBookList();
		
		return bookLists;
		
	}
}
