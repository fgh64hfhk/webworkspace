package com.beans;

public class Order {
	private int orderId;
	private int customerId;
	private String orderDate;
	private OrderDetails[] details;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public OrderDetails[] getDetails() {
		return details;
	}
	public void setDetails(OrderDetails[] details) {
		this.details = details;
	}
}
