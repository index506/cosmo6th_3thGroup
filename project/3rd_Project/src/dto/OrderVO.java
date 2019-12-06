package dto;

import java.sql.Date;

public class OrderVO { // �ֹ����� ��ü

	private String id; //���̵� DB
	private String orderName; //�޴»���̸� DB
	private String phoneNumber; //����ó DB
	private String address; //�ּ� DB
	private String shippingDemand; //��۽� ��û���� DB
	private String depositBank; //�Ա������̸� DB
	private String depositNumber; //�Աݰ��� DB
	private int allPrice; // �Ѱ����ݾ� DB
	private String imgURL; //�̹��� DB
	private String publisher; //���ǻ� DB
	private String title; //����� DB
	private int quantity; //���� DB
	private String delivery; //��ۻ��� DB (0:����Ȯ��, 1:��۴��, 2:�����, 3:��ۿϷ�)
	private String userName; //�ֹ���
	private Date indate; //������¥
	private int price; // �ѻ�ǰ�ݾ�

	
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
