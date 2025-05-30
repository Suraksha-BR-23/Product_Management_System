<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Product Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container-main {
            background-color: #ffffff;
            padding: 3rem 4rem;
            margin-top: 5rem;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        h1 {
            color: #343a40;
            font-weight: 600;
            text-align: center;
            margin-bottom: 2rem;
        }

        .btn-group-custom {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .btn-custom {
            padding: 0.75rem;
            font-weight: 500;
            border-radius: 0.5rem;
            color: #fff;
            background-color: #6c757d;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #5a6268;
        }

        @media (min-width: 576px) {
            .btn-group-custom {
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: center;
                gap: 1rem;
            }

            .btn-custom {
                flex: 1 1 calc(50% - 1rem);
                max-width: 220px;
            }
        }
    </style>
</head>
<body>
    <div class="container-main">
        <h1>Product Management System</h1>
        <div class="btn-group-custom">
            <a href="productadd.jsp" class="btn btn-custom">Add Product</a>
            <a href="productupdate.jsp" class="btn btn-custom">Update Product</a>
            <a href="productdelete.jsp" class="btn btn-custom">Delete Product</a>
            <a href="DisplayProductsServlet" class="btn btn-custom">Display Products</a>
            <a href="ReportCriteriaServlet" class="btn btn-custom">Generate Reports</a>
        </div>
    </div>
</body>
</html>
