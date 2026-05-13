<%@ page import="java.util.List, com.foodapp.model.User, com.foodapp.model.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("user") == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<User> userList = (List<User>) request.getAttribute("userList");
    List<Order> orderList = (List<Order>) request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - CityBite</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">CityBite Admin</a>
            <a href="logout" class="btn btn-danger">Logout</a>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Admin Dashboard</h2>

        <!-- Add Food Form -->
        <div class="card p-4 mb-4">
            <h4>Add New Food Item</h4>
            <form action="admin" method="post">
                <input type="hidden" name="action" value="addFood">
                <div class="row">
                    <div class="col-md-4">
                        <input type="text" name="name" class="form-control" placeholder="Food Name" required>
                    </div>
                    <div class="col-md-3">
                        <input type="number" step="0.01" name="price" class="form-control" placeholder="Price" required>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="imageUrl" class="form-control" placeholder="Image URL">
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-green">Add</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- Food Items Table with Delete -->
        <h4>All Food Items</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
            // Reuse foodList from MenuServlet? We can fetch again, but for simplicity,
            // we'll also set a "foodList" attribute in AdminServlet.
            List<com.foodapp.model.FoodItem> foodList =
                (List<com.foodapp.model.FoodItem>) request.getAttribute("foodList");
            if(foodList != null) {
                for(com.foodapp.model.FoodItem item : foodList) {
            %>
                <tr>
                    <td><%= item.getId() %></td>
                    <td><%= item.getName() %></td>
                    <td>$<%= String.format("%.2f", item.getPrice()) %></td>
                    <td>
                        <form action="admin" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="deleteFood">
                            <input type="hidden" name="foodId" value="<%= item.getId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
            <%  }
            } %>
            </tbody>
        </table>

        <!-- Users List -->
        <h4>All Users</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                </tr>
            </thead>
            <tbody>
            <% if(userList != null) {
                for(User user : userList) { %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getRole() %></td>
                </tr>
            <%  }
            } %>
            </tbody>
        </table>

        <!-- Orders List -->
        <h4>All Orders</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User</th>
                    <th>Food</th>
                    <th>Quantity</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
            <% if(orderList != null) {
                for(Order order : orderList) { %>
                <tr>
                    <td><%= order.getId() %></td>
                    <td><%= order.getUserName() %></td>
                    <td><%= order.getFoodName() %></td>
                    <td><%= order.getQuantity() %></td>
                    <td><%= order.getOrderDate() %></td>
                </tr>
            <%  }
            } %>
            </tbody>
        </table>
    </div>
</body>
</html>