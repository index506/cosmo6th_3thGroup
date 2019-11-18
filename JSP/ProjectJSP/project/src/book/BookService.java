package book;

import java.util.List;

public class BookService {

	BookDAO bookDAO;

	public BookService() {
		// TODO Auto-generated constructor stub
		bookDAO = new BookDAO();
	}

	public List<BookVO> selectBookLists() {
		// TODO Auto-generated method stub
		
		List<BookVO> bookLists = bookDAO.selectBookLists();
		
		return bookLists;
		
	}
}
