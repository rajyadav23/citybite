<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Placed - CityBite</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">CityBite</a>
            <div>
                <a href="menu" class="btn btn-outline-purple me-2">Menu</a>
                <a href="logout" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5 text-center">
        <div class="card p-5">
            <h2 class="text-success">🎉 Order Delivered!</h2>
            <p>Your order has been placed successfully.</p>
            <a href="menu" class="btn btn-green btn-lg">Order More</a>
        </div>
    </div>
</body>
</html>