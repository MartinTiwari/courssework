<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<style>
  header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 80px;
    background-color: #ffffff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 0 20px;
  }

  nav ul {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;
  }

  nav li {
    margin-right: 20px;
  }

  nav li:last-child {
    margin-right: 0;
  }

  nav a {
    color: #333333;
    font-size: 16px;
    font-weight: 600;
    text-decoration: none;
    transition: color 0.2s ease-in-out;
  }

  nav a:hover {
    color: #007bff;
  }

  .search form {
    display: flex;
    align-items: center;
  }

  .search input[type="text"] {
    width: 200px;
    height: 30px;
    border: none;
    border-radius: 5px;
    padding: 5px;
    margin-right: 10px;
  }

  .search select {
    height: 30px;
    margin-right: 10px;
    border: none;
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 5px;
  }

  .search button[type="submit"] {
    height: 30px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #ffffff;
    font-size: 16px;
    font-weight: 600;
    padding: 5px 10px;
    cursor: pointer;
    transition: background-color 0.2s ease-in-out;
  }

  .search button[type="submit"]:hover {
    background-color: #0062cc;
  }

  .user a {
    color: #333333;
    font-size: 16px;
    font-weight: 600;
    text-decoration: none;
    margin-left: 20px;
    transition: color 0.2s ease-in-out;
  }

  .user a:hover {
    color: #007bff;
  }
</style>
<body>

<header>
  <div class="logo">
    <img alt="logo" src="Image/logo11.png" style="height: 50px;">
  </div>
  <nav>
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">About Us</a></li>
      <li><a href="#">Contact Us</a></li>
    </ul>
  </nav>
  <div class="search">
    <form>
      <input type="text" placeholder="Search">
      <select>
        <option value="all">All</option>
        <option value="products">Name</option>
        <option value="products">pp</option>
        <option value="products">Na11</option>
      </select>
      <button type="submit">Search</button>
    </form>
  </div>
  <div class="user">
    <c:choose>
      <c:when test="${empty sessionScope.username}">
        <a href="login.jsp">Login</a>
      </c:when>
      <c:otherwise>
        <span>${sessionScope.name}!</span>
        <form action="LogoutServlet" method="get">
  	<button type="submit">Logout</button>
	</form>


      </c:otherwise>
    </c:choose>
  </div>
</header>

</body>
</html>