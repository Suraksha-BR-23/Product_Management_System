package com.servlet;

import com.dao.ProductDAO;
import model.Product;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateProductServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Product p = new Product();
            p.setProductID(Integer.parseInt(request.getParameter("productID")));
            p.setProductName(request.getParameter("productName"));
            p.setCategory(request.getParameter("category"));
            p.setPrice(Double.parseDouble(request.getParameter("price")));
            p.setQuantity(Integer.parseInt(request.getParameter("quantity")));

            ProductDAO dao = new ProductDAO();
            boolean updated = dao.updateProduct(p);

            HttpSession session = request.getSession();
            if (updated) {
                session.setAttribute("message", "Product updated successfully!");
            } else {
                session.setAttribute("message", "Failed to update product.");
            }

            // ✅ Redirect to correct JSP
            response.sendRedirect("productupdate.jsp");

        } catch (Exception e) {
            throw new ServletException("Error updating product", e);
        }
    }

    // Optional: redirect GET to update form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("productupdate.jsp");
    }
}
