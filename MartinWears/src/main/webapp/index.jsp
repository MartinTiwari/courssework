<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Extraction.everyproduct"%>
<%@ page import="Model.Products"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Ecommerce</title>
    <link rel="stylesheet" href="CSS/css.css">
    <style>
      /*Product Card*/

.product_main{
    position: relative;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 70px;
    padding: 0%;
   	margin-left: 40px;

  }
  .product-card {
    width: 280px;
    border: 1px solid #ccc;
    padding: 10px;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 10px;
  }
  .product-card img {
    width: 100%;
    height: 200px;
  }
  .product-name {
    font-size: 24px;
    margin-top: 10px;
    margin-bottom: 5px;
    position: static;
    width:100%
  }
  .product-category {
    font-size: 16px;
    color: #888;
    margin-bottom: 10px;
    width:100%;
    position: static;
  }
  .product-price{
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
    width:100%
  }
  .add-to-cart-btn, .description-btn {
    padding: 10px;
    font-size: 18px;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 5px;
    position: static;
  }

  .add-to-cart-btn:hover, .description-btn:hover {
    background-color: #0056b3;
  }
  .add_desc_btn{
    display: flex;
  }
    </style>
</head>

<body>
<%
// Get the cookie array from the request object
Cookie[] cookies = request.getCookies();

// Check if the cookies array is not null and has at least one cookie
if (cookies != null && cookies.length > 0) {
    // Loop through the cookies array to find the "name" cookie
    for (Cookie cookie : cookies) {
        if ("name".equals(cookie.getName())) {
            // Get the value of the "name" cookie
            String name = cookie.getValue();
            
            // Start the session and set the "username" attribute
            HttpSession userSession = request.getSession();
            session.setAttribute("username", name);
        }
    }
}

// Get all products from the database
everyproduct ep = new everyproduct();
List<Products> products = ep.getAllProducts();
%>

<%@include file="includes/header.jsp"%>
<div id="Index_Pic">
    <div id="Index_pic2">
        <img id="pic_div1" src="Image/pic3.png">
    </div>
    <div id="Index_pic1">
        <img id="pic_div2" src="Image/pic1.png">
    </div>
</div>

<div id="text">
    <h1>WEAR 'E<span style="color: rgb(255, 255, 255)">M ALL</span></h1>
</div>
<div id="text-2">
    <h1>LACE 'EM ON</h1>
    <div style="background-color: rgb(0, 0, 0); color: rgb(255, 255, 255); height: 20%; width: 190%; text-align: center; border-radius: 0%; margin-left: -38%; padding: auto; text-shadow: 1px 1px 2px rgb(69, 69, 69), 0 0 25px rgb(156, 153, 153), 0 0 5px rgb(255, 255, 255);">
        <h1>Life Is Better With Sneakers.</h1>
    </div>
</div>

<div class="product_main">
    <% for (Products product : products) { %>
        <div class="product-card">
            <img src="<%=product.getProductImage()%>" alt="Product Image">
            <h2 class="product-name"><%=product.getProductName()%></h2>
            <p class="product-category"><%=product.getProductCategory()%></p>
            <p class="product-price"><%=product.getProductPrice()%></p>
            <form action="add-to-cart.jsp" method="post">
                <input type="hidden" name="productId" value="<%=product.getProductId()%>">
                <button type="submit" class="add-to-cart-btn">Add to Cart</button>
            </form>
            <form action="ProductDescription.jsp" method="get">
                <input type="hidden" name="productId" value="<%=product.getProductId()%>">
                <button type="submit" class="description-btn">Description</button>
            </form>
        </div>
    <% } %>
</div>

<%@include file="includes/footer.jsp"%>

</body>
</html>
