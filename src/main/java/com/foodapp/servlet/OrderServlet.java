package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.dao.OrderDAO;
import com.foodapp.model.CartItem;
import com.foodapp.model.Order;
import com.foodapp.model.User;

public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        for (CartItem item : cart) {
            Order order = new Order();
            order.setUserId(user.getId());
            order.setFoodId(item.getFoodId());
            order.setQuantity(item.getQuantity());
            orderDAO.placeOrder(order);
        }

        session.removeAttribute("cart");
        request.getRequestDispatcher("order.jsp").forward(request, response);
    }
}