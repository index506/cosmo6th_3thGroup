package book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/book/*")
public class AllController extends HttpServlet {
	//   private static final long serialVersionUID = 1L;

	BookVO bookVO; // 교재정보 객체
	CartVO cartVO; // 장바구니 객체
	OrderVO orderVO; // 주문정보 객체
	
	BookService bookService;
	CartService cartService;
	OrderService orderService;
	

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub			

		bookVO = new BookVO();
		cartVO = new CartVO();
		orderVO = new OrderVO();
		
		bookService = new BookService();
		cartService = new CartService();
		orderService = new OrderService();
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request,response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();

		try {
			
			// List<CartVO> cartLists = new ArrayList<CartVO>(); // 여기에 생성하는 이유가 뭔지??
			
			if(action != null && action.equals("/cart.do")) { // 장바구니 화면으로 이동시 수행

				System.out.println("======= cart.do 立ち入り =======");  
				
				ArrayList<CartVO> cartList = cartService.selectCartList();
				// cartLists 리스트에 DB내의 장바구니 리스트를 모두 저장
				
				request.setAttribute("cartList", cartList); 
				// cartLists 객체를 cartList.jsp(장바구니)로 넘긴다.
				// get/set 
				
				nextPage = "/Category/Book/cart.jsp"; // nextPage : 장바구니 화면으로 이동

			} else if (action.equals("/cartDelete.do")) { // 장바구니 화면에서 삭제[X]버튼 클릭시
				
				System.out.println("======= cartDelete.do 立ち入り =======");
				
				int cseq = Integer.parseInt(request.getParameter("cseq"));
				//String id = request.getSession();
				
				cartService.deleteList(cseq);

				nextPage = "/book/cart.do";
				
			} else if (action.equals("/cartUpdate.do")) { // 장바구니 화면에서 [수량] 변경시
				
				System.out.println("======= cartUpdate.do 立ち入り =======");
				
				int cseq = Integer.parseInt(request.getParameter("cseq"));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				int salePrice = Integer.parseInt(request.getParameter("salePrice"));
				
				cartService.updateList(cseq, quantity,salePrice);
				
				nextPage = "/book/cart.do";
				
			} else if (action.equals("/cartInsert.do")) { // [장바구니 담기] 버튼 클릭시
				
				System.out.println("======= cartInsert.do 立ち入り =======");
				
				String message;
				String id = "lee2";  
				String title = request.getParameter("title");
				
				boolean result = cartService.confirmList(id, title);
						
				if(result) { //장바구니에 교재가 존재하지 않을때
					
					int price = Integer.parseInt((request.getParameter("price")));
					int salePrice = Integer.parseInt((request.getParameter("salePrice")));
					int quantity = Integer.parseInt((request.getParameter("quantity")));
					String imgUrl = request.getParameter("imgUrl");
					int amountPrice = salePrice*quantity;
					
					cartVO.setId(id);
					cartVO.setTitle(title);
					cartVO.setPrice(price);
					cartVO.setSalePrice(salePrice);
					cartVO.setQuantity(quantity);
					cartVO.setAmountPrice(amountPrice);
					cartVO.setImgUrl(imgUrl);
					
					cartService.addList(cartVO);
					
					message = "pass";
					
				} else { //장바구니에 교재가 이미 존재할때
					
					message = "fail";
					
				}
				
				request.setAttribute("message", message);
				
				nextPage = "/book/buybook.do";
				
			} else if (action.equals("/buybook.do")) { 
				
				System.out.println("교재구매 立ち入り else if");
				
				ArrayList<BookVO> bookList = bookService.selectBookList();
				request.setAttribute("bookList", bookList);
				
				nextPage = "/Category/Book/buybook.jsp";
				
			
			} else if (action.equals("/order.do")) {  
				
				System.out.println("order.do");
				
				ArrayList<CartVO> cartList = cartService.selectCartList();
				OrderVO orderVO = orderService.selectPrice();
				
				request.setAttribute("cartList", cartList);
				request.setAttribute("orderVO", orderVO);
				
				nextPage = "/Category/Book/order.jsp";
				
			} else if (action.equals("/completed.do")) {  
				
				System.out.println("completed.do");
				
				System.out.println(request.getParameter("depositNumber"));
				System.out.println(request.getParameter("depositBank"));
				System.out.println(request.getParameter("name"));
				System.out.println(request.getParameter("shippingDemand"));
				
				nextPage = "/Category/Book/completed.jsp";
				
			} else {
				
				System.out.println("교재구매 立ち入り else");
				
				ArrayList<BookVO> bookList = bookService.selectBookList();
				request.setAttribute("bookList", bookList);
				
				nextPage = "/Category/Book/buybook.jsp"; 
				
			} 
			
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}


}