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

	BookVO bookVO; // �������� ��ü
	CartVO cartVO; // ��ٱ��� ��ü
	OrderVO orderVO; // �ֹ����� ��ü
	
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
			
			// List<CartVO> cartLists = new ArrayList<CartVO>(); // ���⿡ �����ϴ� ������ ����??
			
			if(action != null && action.equals("/cart.do")) { // ��ٱ��� ȭ������ �̵��� ����

				System.out.println("cart.do ء������");  
				
				ArrayList<CartVO> cartLists = new ArrayList<CartVO>();
				cartLists = cartService.viewCartLists(); // cartLists ����Ʈ�� DB���� ��ٱ��� ����Ʈ�� ��� ����
				
				request.setAttribute("cartLists", cartLists); // cartLists ��ü�� cartList.jsp(��ٱ���)�� �ѱ��.
				
				nextPage = "/Category/Book/cart.jsp"; // nextPage : ��ٱ��� ȭ������ �̵�

			} else if (action.equals("/addList.do")){ // [��ٱ��� ���] ��ư Ŭ���� ��� �߰�
				
				System.out.println("/addList.do");
				
				String id = "���ǿ��� id �ޱ�";
				String title = request.getParameter("title"); // ������ title(��ǰ��)�� �޾ƿ´�.
				
				System.out.println(id);
				System.out.println(title);
				
				if(cartService.confirmList(id,title)) { // ���簡 �����ϴ��� ���θ� �Ǻ��ϴ� �޼���
					
				} else { // ���簡 �������� ����, ��ٱ��Ͽ� ����
					
					int quantity = Integer.parseInt(request.getParameter("quantity")); // ������ quantity(����)�� �޾ƿ´�.
					int salePrice = Integer.parseInt(request.getParameter("salePrice")); // ������ salePrice(����)�� �޾ƿ´�
					
					System.out.println(quantity);
					System.out.println(salePrice);
					cartVO.setId(id); // ���ǿ��� �޾ƿ� id�� cartVO ��ü�� �����Ѵ�. 
					cartVO.setTitle(title); // getParameter�� �޾ƿ� title�� cartVO ��ü�� �����Ѵ�.
					cartVO.setQuantity(quantity); // getParameter�� �޾ƿ� quantity�� cartVO ��ü�� �����Ѵ�.
					cartVO.setSalePrice(salePrice);
					cartService.addList(cartVO); // DB�� ����Ʈ�� ����(Insert)
					
				}
				
				nextPage = "/cart/bookList.jsp"; // �ٽ� ���� �������� �̵�
				
			} else if (action.equals("/delList.do")) { // ��ٱ��� ȭ�鿡�� ����[X]��ư Ŭ����
				
				System.out.println("delList.do");
				
				String title = request.getParameter("title");
				
				cartService.delList(title);

				nextPage = "/board/viewCartLists.do";
				
			} else if (action.equals("/updateQuantity.do")) { // ��ٱ��� ȭ�鿡�� ���� �����
				
				System.out.println("updateQuantity.do");
				
				String title = request.getParameter("title");
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				int salePrice = Integer.parseInt(request.getParameter("salePrice"));
				
				cartService.updateQuantity(title, quantity,salePrice);
				
				nextPage = "/board/viewCartLists.do";
				
			} else if (action.equals("/viewOrderPage.do")) { // [�����ϱ�] Ŭ��, order�������� �̵� ��
				
				System.out.println("viewOrderPage.do");
				
				String id = "���ǿ��� �޾ƿ� ID";
				request.setAttribute("id", id); // ���ǿ��� �޾ƿ� id�� order.jsp(�ֹ�����)�� �ѱ��.
				
				nextPage = "/cart/order.jsp";
				// ���ǿ��� id�� �޾ƿ���, �޾ƿ� id�� setAttribute�� �� order.jsp�� �ѱ�� 
				
			} else if (action.equals("/cartConfirm.do")) {
				
				System.out.println("======= cartConfirm.do ء������ =======");
				
				String message;
				String id = "lee2";  
				String title = request.getParameter("title");
				
				boolean result = cartService.confirmList(id, title);
						
				if(result) { //��ٱ��Ͽ� ���簡 �������� ������
					
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
					
					message = "�����Ͻ� ��ǰ�� ��ٱ��Ͽ� �����ϴ�." + "'\n'" + "��ٱ��Ϸ� �̵��Ͻðڽ��ϱ�?";
					
				} else { //��ٱ��Ͽ� ���簡 �̹� �����Ҷ�
					
					message = "�����Ͻ� ��ǰ�� �̹� ��ٱ��Ͽ� �����մϴ�.";
					
				}
				
				nextPage = "/book/buybook.do";
				
			} else if (action.equals("/buybook.do")) { 
				
				System.out.println();
				System.out.println("���籸�� ء������ else if");
				
				ArrayList<BookVO> bookLists = bookService.selectBookLists();
				request.setAttribute("bookLists", bookLists);
				
				nextPage = "/Category/Book/buybook.jsp";
				
			
			} else {
				
				System.out.println("���籸�� ء������ else");
				
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