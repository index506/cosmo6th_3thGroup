package dto;

import java.sql.Date;

public class MemberVO {
	private String id;
	private String pwd;
	private String name;		
	private String email;
	private String address;
	private String tel;
	private String phone;
	private Date assignDate;
	private int admin;
	
	public Date getAssignDate() {
		return assignDate;
	}
	public void setAssignDate(Date assignDate) {
		this.assignDate = assignDate;
	}
	
	public MemberVO() {
		System.out.println("MemberVO 占쎄문占쎄쉐占쎌쁽 占쎌깈�빊占�");
	}
	public MemberVO(String id, String pwd ) {
		super();
		this.id = id;
		this.pwd = pwd;
		
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
	
}
