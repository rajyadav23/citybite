package com.foodapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.dao.FoodItemDAO;
import com.foodapp.dao.OrderDAO;
import com.foodapp.dao.UserDAO;
import com.foodapp.model.FoodItem;

public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null
                || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDAO userDAO = new UserDAO();
        FoodItemDAO foodDAO = new FoodItemDAO();
        OrderDAO orderDAO = new OrderDAO();

        request.setAttribute("userList", userDAO.getAllUsers());
        request.setAttribute("foodList", foodDAO.getAllItems());
        request.setAttribute("orderList", orderDAO.getAllOrders());
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        FoodItemDAO foodDAO = new FoodItemDAO();

        if ("addFood".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String imageUrl = request.getParameter("imageUrl");
            if (imageUrl == null || imageUrl.isEmpty()) {
                imageUrl = "https://via.placeholder.com/150?text=Food";
            }
            FoodItem item = new FoodItem();
            item.setName(name);
            item.setPrice(price);
            item.setImageUrl(imageUrl);
            foodDAO.addItem(item);
        } else if ("deleteFood".equals(action)) {
            int foodId = Integer.parseInt(request.getParameter("foodId"));
            foodDAO.deleteItem(foodId);
        }
        response.sendRedirect("admin");
    }
}