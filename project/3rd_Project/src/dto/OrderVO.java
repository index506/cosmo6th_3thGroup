package dto;

import java.sql.Date;

public class OrderVO { // 주문결제 객체

	private String id; //아이디 DB
	private String orderName; //받는사람이름 DB
	private String phoneNumber; //연락처 DB
	private String address; //주소 DB
	private String shippingDemand; //배송시 요청사항 DB
	private String depositBank; //입금은행이름 DB
	private String depositNumber; //입금계좌 DB
	private int allPrice; // 총결제금액 DB
	private String imgURL; //이미지 DB
	private String publisher; //출판사 DB
	private String title; //교재명 DB
	private int quantity; //수량 DB
	private String delivery; //배송상태 DB (0:결제확인, 1:배송대기, 2:배송중, 3:배송완료)
	private String userName; //주문자
	private Date indate; //결제날짜
	private int price; // 총상품금액

	
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getShippingDemand() {
		return shippingDemand;
	}
	public void setShippingDemand(String shippingDemand) {
		this.shippingDemand = shippingDemand;
	}
	public String getDepositBank() {
		return depositBank;
	}
	public void setDepositBank(String depositBank) {
		this.depositBank = depositBank;
	}
	public String getDepositNumber() {
		return depositNumber;
	}
	public void setDepositNumber(String depositNumber) {
		this.depositNumber = depositNumber;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAllPrice() {
		return allPrice;
	}
	public void setAllPrice(int allPrice) {
		this.allPrice = allPrice;
	}
	
}
