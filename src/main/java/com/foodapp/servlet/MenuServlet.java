package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.dao.FoodItemDAO;
import com.foodapp.model.FoodItem;

public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FoodItemDAO dao = new FoodItemDAO();
        List<FoodItem> foodList = dao.getAllItems();
        request.setAttribute("foodList", foodList);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}