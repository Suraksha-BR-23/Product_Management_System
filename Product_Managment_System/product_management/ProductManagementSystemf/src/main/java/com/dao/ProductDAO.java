package com.dao;

import java.sql.*;
import java.util.*;
import model.Product;  // Adjust if your package is different

public class ProductDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/yourdb?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "";  // put your actual password here
        return DriverManager.getConnection(url, user, password);
    }

    public boolean addProduct(Product p) throws Exception {
        String sql = "INSERT INTO products (ProductID, ProductName, Category, Price, Quantity) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, p.getProductID());
            ps.setString(2, p.getProductName());
            ps.setString(3, p.getCategory());
            ps.setDouble(4, p.getPrice());
            ps.setInt(5, p.getQuantity());

            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public boolean updateProduct(Product p) throws Exception {
        String sql = "UPDATE products SET ProductName=?, Category=?, Price=?, Quantity=? WHERE ProductID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getCategory());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getQuantity());
            ps.setInt(5, p.getProductID());
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public boolean deleteProduct(int id) throws Exception {
        String sql = "DELETE FROM products WHERE ProductID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public List<Product> getAllProducts() throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setCategory(rs.getString("Category"));
                p.setPrice(rs.getDouble("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                list.add(p);
            }
        }
        return list;
    }

    public List<Product> getProductsByCategory(String category) throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE Category=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, category);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt("ProductID"));
                    p.setProductName(rs.getString("ProductName"));
                    p.setCategory(rs.getString("Category"));
                    p.setPrice(rs.getDouble("Price"));
                    p.setQuantity(rs.getInt("Quantity"));
                    list.add(p);
                }
            }
        }
        return list;
    }

    public List<Product> getProductsAbovePrice(double price) throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE Price > ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDouble(1, price);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt("ProductID"));
                    p.setProductName(rs.getString("ProductName"));
                    p.setCategory(rs.getString("Category"));
                    p.setPrice(rs.getDouble("Price"));
                    p.setQuantity(rs.getInt("Quantity"));
                    list.add(p);
                }
            }
        }
        return list;
    }

    public List<Product> getTopNProducts(int n) throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY Quantity DESC LIMIT ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, n);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductID(rs.getInt("ProductID"));
                    p.setProductName(rs.getString("ProductName"));
                    p.setCategory(rs.getString("Category"));
                    p.setPrice(rs.getDouble("Price"));
                    p.setQuantity(rs.getInt("Quantity"));
                    list.add(p);
                }
            }
        }
        return list;
    }
}
