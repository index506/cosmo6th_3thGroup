package dto;

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
	private int cseq;
	private String publisher;
	
	// private으로 정의하고 메소드를 사용하지 않으면 jvm에 의해 자동소거됨 
	
	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public CartVO() { //기본 생성자
		
	}
	
	public CartVO(String title, int price, int salePrice, int quantity, int amountPrice, int cseq, String imgurl, String publisher) {
		
		this.title = title;
		this.price = price;
		this.salePrice = salePrice;
		this.quantity = quantity;
		this.amountPrice = amountPrice;
		this.imgUrl = imgurl;
		this.cseq = cseq;
		this.publisher = publisher;
		
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getAmountPrice() {
		return amountPrice;
	}
	public void setAmountPrice(int amountPrice) {
		this.amountPrice = amountPrice;
	}
	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}	
}