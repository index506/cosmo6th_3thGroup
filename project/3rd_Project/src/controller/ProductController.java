package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BookVO;
import dto.CartVO;
import dto.MemberVO;
import dto.OrderVO;
import service.BookService;
import service.CartService;
import service.OrderService;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/book/*")
public class ProductController extends HttpServlet {
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

		try {
			
    		HttpSession session = request.getSession();
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser"); 
			
			if(action != null && action.equals("/cart.do")) { // ��ٱ��� ȭ������ �̵��� ����

				System.out.println("book/cart.do");  
				
				ArrayList<CartVO> cartList = cartService.selectCartList(loginUser.getId());
				
				request.setAttribute("cartList", cartList); 
				
				nextPage = "/Category/Book/cart.jsp"; // nextPage : ��ٱ��� ȭ������ �̵�

			} else if (action.equals("/cartDelete.do")) { // ��ٱ��� ȭ�鿡�� ����[X]��ư Ŭ����
				
				System.out.println("book/cartDelete.do");
				
				int cseq = Integer.parseInt(request.getParameter("cseq"));
				
				cartService.deleteList(cseq);

				nextPage = "/book/cart.do";
				
			} else if (action.equals("/cartUpdate.do")) { // ��ٱ��� ȭ�鿡�� [����] �����
				
				System.out.println("book/cartUpdate.do");
				
				int cseq = Integer.parseInt(request.getParameter("cseq"));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				int salePrice = Integer.parseInt(request.getParameter("salePrice"));
				
				cartService.updateList(cseq, quantity,salePrice);
				
				nextPage = "/book/cart.do";
				
			} else if (action.equals("/cartInsert.do")) { // [��ٱ��� ���] ��ư Ŭ����
				
				System.out.println("book/cartInsert.do");
				
				String message;
				
				int bseq = Integer.parseInt(request.getParameter("bseq"));
				
				boolean result = cartService.confirmList(loginUser.getId(), bseq);
				
				if(result) { //��ٱ��Ͽ� ���簡 �������� ������(�߰�)
					
					String title = request.getParameter("title");
					int price = Integer.parseInt((request.getParameter("price")));
					int salePrice = Integer.parseInt((request.getParameter("salePrice")));
					int quantity = Integer.parseInt((request.getParameter("quantity")));
					String imgUrl = request.getParameter("imgUrl");
					int amountPrice = salePrice*quantity;
					String publisher = request.getParameter("publisher");
					
					cartVO.setId(loginUser.getId());
					cartVO.setTitle(title);
					cartVO.setPrice(price);
					cartVO.setSalePrice(salePrice);
					cartVO.setQuantity(quantity);
					cartVO.setAmountPrice(amountPrice);
					cartVO.setImgUrl(imgUrl);
					cartVO.setPublisher(publisher);
					cartVO.setBseq(bseq);
					
					cartService.addList(cartVO);
					
					message = "pass";
					
				} else { //��ٱ��Ͽ� ���簡 �̹� �����Ҷ�
					
					message = "fail";
					
				}
				
				request.setAttribute("message", message);
				
				nextPage = "/book/buybook.do";
				
			} else if (action.equals("/buybook.do")) { 
				
				System.out.println("book/buybook.do");
				
				ArrayList<BookVO> bookList = bookService.selectBookList();
				request.setAttribute("bookList", bookList);
				
				nextPage = "/Category/Book/buybook.jsp";
			
			} else if (action.equals("/order.do")) {  
				
				System.out.println("book/order.do");
				
				// ���� ȸ������ �ޱ�
				ArrayList<CartVO> cartList = cartService.selectCartList(loginUser.getId()); //��ٱ��� ����Ʈ
				orderVO = orderService.selectPrice(loginUser.getId()); //��ǰ�ݾ�(�ѻ�ǰ�ݾ�,�����αݾ�,�Ѱ����ݾ�)
				orderVO.setUserName(loginUser.getName());
				orderVO.setOrderName(loginUser.getName());
				orderVO.setAddress(loginUser.getAddress());
				orderVO.setPhoneNumber(loginUser.getPhone());
				
				request.setAttribute("cartList", cartList);
				request.setAttribute("orderVO", orderVO);
				
				nextPage = "/Category/Book/order.jsp";
				
			} else if (action.equals("/completed.do")) {  
				
				System.out.println("book/completed.do");
				
				String name = request.getParameter("name"); //�޴»��(orderName)
				String[] phoneNumArray = request.getParameterValues("phoneNumber"); 
											  /*.getParameterValues() : ������ ��ȯ(�迭)
												.getParameter() : ���ϰ� ��ȯ */
				String phoneNumber = ""; //�޴�����ȣ(phoneNumber)
				String address = request.getParameter("address"); //�ּ�(address)
				String shippingDemand = request.getParameter("shippingDemand"); //��۽ÿ�û����(shippingDemand)
				String depositBank = request.getParameter("depositBank"); //�Ա�����(depositBank)
				String depositNumber = request.getParameter("depositNumber"); //�Աݰ���(depositNumber)
				
				orderVO.setId(loginUser.getId()); //���̵�
				orderVO.setOrderName(name); //�޴»��(orderName)
				orderVO.setAddress(address); //�ּ�(address)
				if(shippingDemand.equals("��۽� ��û���� ����")) {
					shippingDemand = null;
				} else if (shippingDemand.equals("�����Է�")) {
					shippingDemand = request.getParameter("shippingInput");
				}
				orderVO.setShippingDemand(shippingDemand); //��۽ÿ�û����(shippingDemand)
				
				orderVO.setDepositBank(depositBank); //�Ա�����(depositBank)
				orderVO.setDepositNumber(depositNumber); //�Աݰ���(depositNumber)
				
				for(int i=0; i<phoneNumArray.length; i++) {
					phoneNumber += phoneNumArray[i];
				}
				orderVO.setPhoneNumber(phoneNumber); //�޴�����ȣ(phoneNumber)
				
				request.setAttribute("orderVO", orderVO);
				
				ArrayList<CartVO> cartList = cartService.selectCartList(loginUser.getId()); //��ٱ��� ����Ʈ
				
				orderService.addOrderList(orderVO,cartList); //orderList���̺� �߰�
				
				cartService.resultChange(loginUser.getId());//result�� �����Լ�
				
				////////////////////////////// cartList
				
				nextPage = "/Category/Book/completed.jsp";
				
			} else {
				
				System.out.println("book/buybook.do");
				
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