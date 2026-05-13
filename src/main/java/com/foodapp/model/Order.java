package com.foodapp.model;

import java.sql.Timestamp;

public class Order {
    private int id;
    private int userId;
    private int foodId;
    private int quantity;
    private Timestamp orderDate;
    // for joined display
    private String userName;
    private String foodName;

    public Order() {}
    public Order(int id, int userId, int foodId, int quantity, Timestamp orderDate, String userName, String foodName) {
        this.id = id; this.userId = userId; this.foodId = foodId; this.quantity = quantity; this.orderDate = orderDate;
        this.userName = userName; this.foodName = foodName;
    }
    // getters & setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getFoodId() { return foodId; }
    public void setFoodId(int foodId) { this.foodId = foodId; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    public String getFoodName() { return foodName; }
    public void setFoodName(String foodName) { this.foodName = foodName; }
}