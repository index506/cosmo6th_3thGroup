package book;

import java.util.Date;

			  // VO : Value Object
public class CartVO { // ��ٱ��� ��ü
	
	private String id; //����� id 
	private String title; //����� 
	private int price; //�ǸŰ�
	private int salePrice; //���ΰ�
	private int quantity; //����  
	private int amountPrice; //�հ�� 
	private String imgUrl; //�̹���URL
	
	public CartVO() { //�⺻ ������

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