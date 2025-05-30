<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="container py-5">
    <h2 class="mb-4">Add New Product</h2>

    <!-- Show message from servlet -->
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <div class="alert alert-info"><%= message %></div>
    <%
        }
    %>

    <form action="AddProductServlet" method="post">
        <div class="mb-3">
            <label>Product ID</label>
            <input type="number" name="productID" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Product Name</label>
            <input type="text" name="productName" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Category</label>
            <input type="text" name="category" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Price</label>
            <input type="number" step="0.01" name="price" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Quantity</label>
            <input type="number" name="quantity" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Add Product</button>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </form>
</body>
</html>
