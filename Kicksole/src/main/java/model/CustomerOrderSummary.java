package model;

import java.sql.Timestamp;

import java.util.List;

public class CustomerOrderSummary {
    private int userId;
    private String customerName;
    private String customerPhone;
    private double totalAmount;
    private String shipping_address;
    private List<ProductPriceInfo> productPrices; 
    private Timestamp createdDate;
    private Timestamp updatedDate;


    public CustomerOrderSummary() {
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCustomerName() {
        return customerName;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }
    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public double getTotalAmount() {
        return totalAmount;
    }
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
    
    

    public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public Timestamp getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Timestamp updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getShipping_address() {
		return shipping_address;
	}

	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}

	public List<ProductPriceInfo> getProductPrices() {
        return productPrices;
    }
    public void setProductPrices(List<ProductPriceInfo> productPrices) {
        this.productPrices = productPrices;
    }
}