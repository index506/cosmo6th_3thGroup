package dto;

import java.sql.Date;

public class BookVO {

	public BookVO() {
		// TODO Auto-generated constructor stub
	}
	public BookVO(String title, int price, int salePrice, String imgURL, String publisher, Date writeDate) {
		this.title = title;
		this.price = price;
		this.salePrice = salePrice;
		this.imgURL = imgURL;
		this.publisher = publisher;
		this.writeDate = writeDate;
	}
	
	private String title;
	private int price;
	private int salePrice;
	private String imgURL;
	private String publisher;
	private Date writeDate;
	
	public String getTitle() {
		return title;
	}
	public int getPrice() {
		return price;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public String getImgURL() {
		return imgURL;
	}
	public String getPublisher() {
		return publisher;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	
}
