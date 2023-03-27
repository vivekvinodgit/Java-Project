package com.mvc.beans;

public class ItemBean {
	
	private int ItemId;
	private String ItemName;
	private int catId; //foreign key of category table
	private float itemPrice;
	
	public int getItemId() {
		return ItemId;
	}
	public void setItemId(int itemId) {
		this.ItemId = itemId;
	}
	public String getItemName() {
		return ItemName;
	}
	public void setItemName(String itemName) {
		this.ItemName = itemName;
	}
	public int getcatId() {
		return catId;
	}
	public void setcatId(int catId) {
		this.catId = catId;
	}
	
	public float getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(float itemPrice) {
		this.itemPrice = itemPrice;
	}
	
}
