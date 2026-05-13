<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - CityBite</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
        <div class="card p-5" style="width: 400px;">
            <h3 class="text-center mb-4 text-purple">CityBite Login</h3>
            <form action="login" method="post">
                <div class="mb-3">
                    <input type="email" name="email" class="form-control" placeholder="Email" required>
                </div>
                <div class="mb-3">
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-purple w-100">Login</button>
            </form>
            <p class="mt-3 text-center">Don't have an account? <a href="register.jsp">Register</a></p>
            <% if(request.getAttribute("error") != null) { %>
                <div class="alert alert-danger mt-3"><%= request.getAttribute("error") %></div>
            <% } %>
        </div>
    </div>
</body>
</html>