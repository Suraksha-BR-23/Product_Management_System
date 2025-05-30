<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container py-5">
    <h2 class="mb-4">Delete Product</h2>

    <% 
        String message = (String) session.getAttribute("message");
        if (message != null) { 
    %>
        <div class="alert alert-info"><%= message %></div>
    <%
        session.removeAttribute("message");
        }
    %>

    <form action="DeleteProductServlet" method="get">
        <div class="mb-3">
            <label>Product ID</label>
            <input type="number" name="productID" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-danger">Delete</button>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </form>
</body>
</html>
