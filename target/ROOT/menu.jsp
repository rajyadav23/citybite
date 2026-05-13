<%@ page import="java.util.List, com.foodapp.model.FoodItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check session
    if(session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<FoodItem> foodList = (List<FoodItem>) request.getAttribute("foodList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Menu - CityBite</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">CityBite</a>
            <div class="d-flex">
                <a href="cart" class="btn btn-outline-purple me-2">Cart</a>
                <a href="logout" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="mb-4">Our Delicious Menu</h2>
        <div class="row">
            <% for(FoodItem item : foodList) { %>
                <div class="col-md-4 mb-4">
                    <div class="card food-card">
                        <img src="<%= item.getImageUrl() %>" class="card-img-top" alt="<%= item.getName() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= item.getName() %></h5>
                            <p class="card-text">$<%= String.format("%.2f", item.getPrice()) %></p>
                            <form action="cart" method="post">
                                <input type="hidden" name="foodId" value="<%= item.getId() %>">
                                <input type="hidden" name="action" value="add">
                                <div class="d-flex justify-content-between">
                                    <input type="number" name="quantity" value="1" min="1" class="form-control w-50">
                                    <button type="submit" class="btn btn-green">Add to Cart</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>