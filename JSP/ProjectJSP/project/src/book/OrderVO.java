package book;

public class OrderVO { // 주문결제 객체

	private String userName; //주문자
	private String name; //이름
	private int phoneNumber; //연락처
	private String address; //주소
	private String shippingDemand; //배송시 요청사항
	private String shippingInput; //직접입력
	private String depositBank; //입금은행
	private String depositNumber; //입금계좌
	private int price; // 총상품금액
	private int allPrice; // 총결제금액
	
	
	
	public String getShippingInput() {
		return shippingInput;
	}
	public void setShippingInput(String shippingInput) {
		this.shippingInput = shippingInput;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		userName = userName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(int phoneNumber) {
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
