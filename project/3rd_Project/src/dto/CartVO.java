package dto;

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
	private int cseq;
	private String publisher;
	
	// private���� �����ϰ� �޼ҵ带 ������� ������ jvm�� ���� �ڵ��Ұŵ� 
	
	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public CartVO() { //�⺻ ������
		
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