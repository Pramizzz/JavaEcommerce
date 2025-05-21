package model;

public class DashboardStats {
    private int totalCategories;
    private int totalBrands;
    private int totalProducts;
    private int totalUsers;
    private int pendingOrders;
    private int shippedOrders;
    private int canceledOrders;
    private int deliveredOrders;
    private String topSellingProduct;
    
	public DashboardStats() {
		
	}

	public int getTotalCategories() {
		return totalCategories;
	}

	public void setTotalCategories(int totalCategories) {
		this.totalCategories = totalCategories;
	}

	public int getTotalBrands() {
		return totalBrands;
	}

	public void setTotalBrands(int totalBrands) {
		this.totalBrands = totalBrands;
	}

	public int getTotalProducts() {
		return totalProducts;
	}

	public void setTotalProducts(int totalProducts) {
		this.totalProducts = totalProducts;
	}

	public int getTotalUsers() {
		return totalUsers;
	}

	public void setTotalUsers(int totalUsers) {
		this.totalUsers = totalUsers;
	}

	public int getPendingOrders() {
		return pendingOrders;
	}

	public void setPendingOrders(int pendingOrders) {
		this.pendingOrders = pendingOrders;
	}

	public int getShippedOrders() {
		return shippedOrders;
	}

	public void setShippedOrders(int shippedOrders) {
		this.shippedOrders = shippedOrders;
	}

	public int getCanceledOrders() {
		return canceledOrders;
	}

	public void setCanceledOrders(int canceledOrders) {
		this.canceledOrders = canceledOrders;
	}

	public int getDeliveredOrders() {
		return deliveredOrders;
	}

	public void setDeliveredOrders(int deliveredOrders) {
		this.deliveredOrders = deliveredOrders;
	}

	public String getTopSellingProduct() {
		return topSellingProduct;
	}

	public void setTopSellingProduct(String topSellingProduct) {
		this.topSellingProduct = topSellingProduct;
	}

	
 
}