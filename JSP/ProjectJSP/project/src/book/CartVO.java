package book;

import java.util.Date;

			  // VO : Value Object
public class CartVO { // 장바구니 객체
	
	private String id; //사용자 id 
	private String title; //교재명 
	private int price; //판매가
	private int salePrice; //할인가
	private int quantity; //수량  
	private int amountPrice; //합계액 
	private String imgUrl; //이미지URL
	
	public CartVO() { //기본 생성자

	}
	
	public CartVO(String title, int price, int salePrice, int quantity, int amountPrice) {
		super();
		this.title = title;
		this.price = price;
		this.salePrice = salePrice;
		this.quantity = quantity;
		this.amountPrice = amountPrice;
	}


	// id get/set
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	// title get/set
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	// price get/set
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	
	// salePrice get/set
	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	
	// quantity get/set
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	// amountPrice get/set
	public int getAmountPrice() {
		return amountPrice;
	}

	public void setAmountPrice(int amountPrice) {
		this.amountPrice = amountPrice;
	}
	
	
	// imgUrl get/set
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
}