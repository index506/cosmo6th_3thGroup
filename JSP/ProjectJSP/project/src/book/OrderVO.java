package book;

public class OrderVO { // 주문결제 객체

	private String Orderer; //주문자
	private String name; //이름
	private int phoneNumber; //연락처
	private String address; //주소
	private String shippingDemand; //배송시 요청사항
	private String depositBank; //입금은행
	private String depositNumber; //입금계좌
	
	
	// Orderer get/set 
	public String getOrderer() {
		return Orderer;
	}
	public void setOrderer(String orderer) {
		Orderer = orderer;
	}
	
	// name get/set
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	// phoneNumber get/set
	public int getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	// address get/set
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	// shippingDemand get/set
	public String getShippingDemand() {
		return shippingDemand;
	}
	public void setShippingDemand(String shippingDemand) {
		this.shippingDemand = shippingDemand;
	}
	
	// depositBank get/set
	public String getDepositBank() {
		return depositBank;
	}
	public void setDepositBank(String depositBank) {
		this.depositBank = depositBank;
	}
	
	// depositNumber get/set
	public String getDepositNumber() {
		return depositNumber;
	}
	public void setDepositNumber(String depositNumber) {
		this.depositNumber = depositNumber;
	}
	
}
