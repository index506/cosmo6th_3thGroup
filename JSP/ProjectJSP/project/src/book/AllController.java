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
		System.out.println("action : " + action);

		try {
			
			// List<CartVO> cartLists = new ArrayList<CartVO>(); // 여기에 생성하는 이유가 뭔지??
			
			if(action != null && action.equals("/cart.do")) { // 장바구니 화면으로 이동시 수행

				System.out.println("cart.do 立ち入り");  
				
				ArrayList<CartVO> cartLists = new ArrayList<CartVO>();
				cartLists = cartService.viewCartLists(); // cartLists 리스트에 DB내의 장바구니 리스트를 모두 저장
				
				request.setAttribute("cartLists", cartLists); // cartLists 객체를 cartList.jsp(장바구니)로 넘긴다.
				
				nextPage = "/Category/Book/cart.jsp"; // nextPage : 장바구니 화면으로 이동

			} else if (action.equals("/addList.do")){ // [장바구니 담기] 버튼 클릭시 목록 추가
				
				System.out.println("/addList.do");
				
				String id = "세션에서 id 받기";
				String title = request.getParameter("title"); // 교재의 title(상품명)을 받아온다.
				
				System.out.println(id);
				System.out.println(title);
				
				if(cartService.confirmList(id,title)) { // 교재가 존해하는지 여부를 판별하는 메서드
					
				} else { // 교재가 존재하지 않음, 장바구니에 저장
					
					int quantity = Integer.parseInt(request.getParameter("quantity")); // 교재의 quantity(수량)을 받아온다.
					int salePrice = Integer.parseInt(request.getParameter("salePrice")); // 교재의 salePrice(수량)을 받아온다
					
					System.out.println(quantity);
					System.out.println(salePrice);
					cartVO.setId(id); // 세션에서 받아온 id를 cartVO 객체에 저장한다. 
					cartVO.setTitle(title); // getParameter로 받아온 title를 cartVO 객체에 저장한다.
					cartVO.setQuantity(quantity); // getParameter로 받아온 quantity를 cartVO 객체에 저장한다.
					cartVO.setSalePrice(salePrice);
					cartService.addList(cartVO); // DB에 리스트를 저장(Insert)
					
				}
				
				nextPage = "/cart/bookList.jsp"; // 다시 구매 페이지로 이동
				
			} else if (action.equals("/delList.do")) { // 장바구니 화면에서 삭제[X]버튼 클릭시
				
				System.out.println("delList.do");
				
				String title = request.getParameter("title");
				
				cartService.delList(title);

				nextPage = "/board/viewCartLists.do";
				
			} else if (action.equals("/updateQuantity.do")) { // 장바구니 화면에서 수량 변경시
				
				System.out.println("updateQuantity.do");
				
				String title = request.getParameter("title");
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				int salePrice = Integer.parseInt(request.getParameter("salePrice"));
				
				cartService.updateQuantity(title, quantity,salePrice);
				
				nextPage = "/board/viewCartLists.do";
				
			} else if (action.equals("/viewOrderPage.do")) { // [결제하기] 클릭, order페이지로 이동 시
				
				System.out.println("viewOrderPage.do");
				
				String id = "세션에서 받아온 ID";
				request.setAttribute("id", id); // 세션에서 받아온 id를 order.jsp(주문결제)로 넘긴다.
				
				nextPage = "/cart/order.jsp";
				// 세션에서 id를 받아오고, 받아온 id를 setAttribute한 뒤 order.jsp로 넘기기 
				
			} else if (action.equals("/cartConfirm.do")) {
				
				System.out.println("======= cartConfirm.do 立ち入り =======");
				
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
					
					message = "선택하신 상품이 장바구니에 담겼습니다." + "'\n'" + "장바구니로 이동하시겠습니까?";
					
				} else { //장바구니에 교재가 이미 존재할때
					
					message = "선택하신 상품이 이미 장바구니에 존재합니다.";
					
				}
				
				nextPage = "/book/buybook.do";
				
			} else if (action.equals("/buybook.do")) { 
				
				System.out.println();
				System.out.println("교재구매 立ち入り else if");
				
				ArrayList<BookVO> bookLists = bookService.selectBookLists();
				request.setAttribute("bookLists", bookLists);
				
				nextPage = "/Category/Book/buybook.jsp";
				
			
			} else {
				
				System.out.println("교재구매 立ち入り else");
				
				ArrayList<BookVO> bookLists = bookService.selectBookLists();
				request.setAttribute("bookLists", bookLists);
				
				nextPage = "/Category/Book/buybook.jsp"; 
				
			} 
			
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}


}