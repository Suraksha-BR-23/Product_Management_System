<%@ page import="java.util.*, model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-muted">Product List</h2>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>

    <%
        List<Product> list = (List<Product>) request.getAttribute("productList");
        if (list != null && !list.isEmpty()) {
    %>
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark text-center">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                </tr>
            </thead>
            <tbody class="table-group-divider">
            <% for (Product p : list) { %>
                <tr>
                    <td><%= p.getProductID() %></td>
                    <td><%= p.getProductName() %></td>
                    <td><%= p.getCategory() %></td>
                    <td>₹<%= p.getPrice() %></td>
                    <td><%= p.getQuantity() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>
    <%
        } else {
    %>
        <div class="alert alert-warning">No products available to display.</div>
    <%
        }
    %>
</body>
</html>
