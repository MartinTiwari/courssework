<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Extraction.everyproduct"%>
<%@ page import="Model.Products"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Description</title>
<link rel="stylesheet" href="CSS/style.css">
</head>
<%@include file="includes/header.jsp"%>
<body>

    <div class="product">
        <%
            int productId = Integer.parseInt(request.getParameter("productId"));
            everyproduct extractor = new everyproduct();
            Products product = extractor.getProductById(productId);
        %>
        <img src="<%=product.getProductImage()%>" alt="Product Image">
        <div class="product-info">
            <h1 class="product-name"><%=product.getProductName()%></h1>
            <p class="product-price"><%=product.getProductPrice()%></p>
            <p class="product-category"><%=product.getProductCategory()%></p>
            <p class="product-description"><%=product.getProductDescription()%></p>
        </div>
    </div>

    <%@include file="includes/footer.jsp"%>
</body>
</html>
