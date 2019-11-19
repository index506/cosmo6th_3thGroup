package book;

import java.util.ArrayList;

public class BookService {

	BookDAO bookDAO;

	public BookService() {
		// TODO Auto-generated constructor stub
		bookDAO = new BookDAO();
	}

	public ArrayList<BookVO> selectBookLists() {
		// TODO Auto-generated method stub
		
		ArrayList<BookVO> bookLists = bookDAO.selectBookLists();
		
		return bookLists;
		
	}
}
