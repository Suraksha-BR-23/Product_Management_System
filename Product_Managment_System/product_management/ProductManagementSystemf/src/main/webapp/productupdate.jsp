<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container py-5">
    <h2 class="mb-4">Update Product</h2>

    <% 
        String message = (String) session.getAttribute("message");
        if (message != null) { 
    %>
        <div class="alert alert-info"><%= message %></div>
    <%
        session.removeAttribute("message");
        }
    %>

    <form action="UpdateProductServlet" method="post">
        <div class="mb-3">
            <label>Product ID</label>
            <input type="number" name="productID" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Product Name</label>
            <input type="text" name="productName" class="form-control">
        </div>
        <div class="mb-3">
            <label>Category</label>
            <input type="text" name="category" class="form-control">
        </div>
        <div class="mb-3">
            <label>Price</label>
            <input type="number" step="0.01" name="price" class="form-control">
        </div>
        <div class="mb-3">
            <label>Quantity</label>
            <input type="number" name="quantity" class="form-control">
        </div>
        <button type="submit" class="btn btn-warning">Update</button>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </form>
</body>
</html>
