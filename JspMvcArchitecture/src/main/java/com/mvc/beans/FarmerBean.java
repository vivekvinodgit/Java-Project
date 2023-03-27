package com.mvc.beans;

public class FarmerBean {
	
	private int farmerId;
	private String farmerName;
	private String farmerPhoneNumber;
	private String farmerAddress;
	private int itemId;
	private int catId;
	
	public int getFarmerId() {
		return farmerId;
	}
	public void setFarmerId(int farmerId) {
		this.farmerId = farmerId;
	}
	public String getFarmerName() {
		return farmerName;
	}
	public void setFarmerName(String farmerName) {
		this.farmerName = farmerName;
	}
	public String getFarmerPhoneNumber() {
		return farmerPhoneNumber;
	}
	public void setFarmerPhoneNumber(String farmerPhoneNumber) {
		this.farmerPhoneNumber = farmerPhoneNumber;
	}
	public String getFarmerAddress() {
		return farmerAddress;
	}
	public void setFarmerAddress(String farmerAddress) {
		this.farmerAddress = farmerAddress;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}

}
