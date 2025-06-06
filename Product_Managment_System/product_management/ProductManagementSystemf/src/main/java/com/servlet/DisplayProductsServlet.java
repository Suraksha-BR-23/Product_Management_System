// --- DisplayProductsServlet.java ---
package com.servlet;

import com.dao.ProductDAO;
import model.Product;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayProductsServlet")
public class DisplayProductsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DisplayProductsServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ProductDAO dao = new ProductDAO();
            List<Product> list = dao.getAllProducts();
            request.setAttribute("productList", list);
            request.getRequestDispatcher("productdisplay.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error displaying products", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}