package book;

public class OrderVO { // �ֹ����� ��ü

	private String Orderer; //�ֹ���
	private String name; //�̸�
	private int phoneNumber; //����ó
	private String address; //�ּ�
	private String shippingDemand; //��۽� ��û����
	private String depositBank; //�Ա�����
	private String depositNumber; //�Աݰ���
	
	
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
