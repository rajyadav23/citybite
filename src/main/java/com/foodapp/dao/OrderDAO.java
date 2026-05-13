package com.foodapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.foodapp.model.Order;

public class OrderDAO {
    private static final Logger LOGGER = Logger.getLogger(OrderDAO.class.getName());

    public boolean placeOrder(Order order) {
        String sql = "INSERT INTO orders (user_id, food_id, quantity) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getFoodId());
            ps.setInt(3, order.getQuantity());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error placing order for user " + order.getUserId(), e);
        }
        return false;
    }

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT o.id, o.user_id, o.food_id, o.quantity, o.order_date, " +
                     "u.name as user_name, f.name as food_name " +
                     "FROM orders o JOIN users u ON o.user_id = u.id " +
                     "JOIN food_items f ON o.food_id = f.id ORDER BY o.order_date DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setFoodId(rs.getInt("food_id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setUserName(rs.getString("user_name"));
                order.setFoodName(rs.getString("food_name"));
                list.add(order);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error fetching all orders", e);
        }
        return list;
    }
}