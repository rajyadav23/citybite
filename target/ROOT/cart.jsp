<%@ page import="java.util.Map, com.foodapp.model.CartItem, java.util.List, java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double total = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart - CityBite</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">CityBite</a>
            <div class="d-flex">
                <a href="menu" class="btn btn-outline-purple me-2">Menu</a>
                <a href="logout" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Your Cart</h2>
        <% if(cart == null || cart.isEmpty()) { %>
            <p>Your cart is empty. <a href="menu">Browse Menu</a></p>
        <% } else { %>
            <table class="table">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                <% for(CartItem item : cart) {
                    double subtotal = item.getPrice() * item.getQuantity();
                    total += subtotal;
                %>
                    <tr>
                        <td><%= item.getName() %></td>
                        <td>$<%= String.format("%.2f", item.getPrice()) %></td>
                        <td><%= item.getQuantity() %></td>
                        <td>$<%= String.format("%.2f", subtotal) %></td>
                    </tr>
                <% } %>
                </tbody>
            </table>
            <h4>Total: $<%= String.format("%.2f", total) %></h4>
            <form action="order" method="post">
                <button type="submit" class="btn btn-green btn-lg">Place Order</button>
            </form>
        <% } %>
    </div>
</body>
</html>