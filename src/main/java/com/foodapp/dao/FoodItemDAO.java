package com.foodapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.foodapp.model.FoodItem;

public class FoodItemDAO {
    private static final Logger LOGGER = Logger.getLogger(FoodItemDAO.class.getName());

    public List<FoodItem> getAllItems() {
        List<FoodItem> list = new ArrayList<>();
        String sql = "SELECT * FROM food_items";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new FoodItem(rs.getInt("id"), rs.getString("name"),
                        rs.getDouble("price"), rs.getString("image_url")));
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error fetching all food items", e);
        }
        return list;
    }

    public FoodItem getItemById(int id) {
        String sql = "SELECT * FROM food_items WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new FoodItem(rs.getInt("id"), rs.getString("name"),
                            rs.getDouble("price"), rs.getString("image_url"));
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error fetching food item by id: " + id, e);
        }
        return null;
    }

    public boolean addItem(FoodItem item) {
        String sql = "INSERT INTO food_items (name, price, image_url) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, item.getName());
            ps.setDouble(2, item.getPrice());
            ps.setString(3, item.getImageUrl());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error adding food item: " + item.getName(), e);
        }
        return false;
    }

    public boolean deleteItem(int id) {
        String sql = "DELETE FROM food_items WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting food item with id: " + id, e);
        }
        return false;
    }
}