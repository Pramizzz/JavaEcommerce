package model;

import java.sql.Timestamp;

public class OrderModel {
    private int orderId;
    private int userId;
    private Timestamp orderDate;  
    private String shippingAddress;
    private String status;
    private String paymentMethod;
    private double totalAmount;
    

    public OrderModel() {
    }

    public int getOrderId() {
        return orderId;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public Timestamp getOrderDate() {  
        return orderDate;
    }
    public void setOrderDate(Timestamp orderDate) {  
        this.orderDate = orderDate;
    }
    public String getShippingAddress() {
        return shippingAddress;
    }
    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getPaymentMethod() {
        return paymentMethod;
    }
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    public double getTotalAmount() {
        return totalAmount;
    }
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
    
  
}