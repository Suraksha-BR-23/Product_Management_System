package com.servlet;

import com.dao.ProductDAO;
import model.Product;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReportServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String type = request.getParameter("reportType");
            ProductDAO dao = new ProductDAO();
            List<Product> list = null;

            if ("priceAbove".equals(type)) {
                double price = Double.parseDouble(request.getParameter("value"));
                list = dao.getProductsAbovePrice(price);
            } else if ("category".equals(type)) {
                String category = request.getParameter("value");
                list = dao.getProductsByCategory(category);
            } else if ("topN".equals(type)) {
                int n = Integer.parseInt(request.getParameter("value"));
                list = dao.getTopNProducts(n);
            }

            request.setAttribute("reportList", list);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error generating report", e);
        }
    }
}
