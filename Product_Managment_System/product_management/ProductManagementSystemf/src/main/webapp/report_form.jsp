<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Report Criteria</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script>
        function toggleField() {
            const type = document.getElementById("reportType").value;
            const label = document.getElementById("valueLabel");
            if (type === "priceAbove") {
                label.innerText = "Enter Minimum Price";
            } else if (type === "category") {
                label.innerText = "Enter Category";
            } else {
                label.innerText = "Enter N (Top Products)";
            }
        }
        window.onload = toggleField;
    </script>
</head>
<body class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-muted">Select Report Criteria</h2>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>

    <form action="ReportServlet" method="post">
        <div class="mb-3">
            <label for="reportType" class="form-label">Report Type</label>
            <select name="reportType" id="reportType" onchange="toggleField()" class="form-select">
                <option value="priceAbove">Products Above Price</option>
                <option value="category">Products By Category</option>
                <option value="topN">Top N Products</option>
            </select>
        </div>
        <div class="mb-3">
            <label id="valueLabel" for="value" class="form-label">Value</label>
            <input type="text" name="value" id="value" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Generate Report</button>
    </form>
</body>
</html>
