<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Login Page</title>
    <style>
      body {
        margin: 0;
        padding: 0;
        background-color:#BDBEC2;
        font-family: sans-serif;
        height: 500px;
      }
      body {
        background-position-x: -250px;
        background-image: url('Image/fbg.png');
        background-repeat: no-repeat;
        background-position-y:80px;
        background-size: 80%;
        }
      .container {
        width: 340px;
        margin: 12%;
        margin-left: 50%;
        padding: 50px;
        background: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        transition: all 0.3s ease-in-out;
        height: 340px;
      }
      .container.slide {
        transform: translateX(400px);
        opacity: 0;
      }
      h1 {
        text-align: center;
      }
      .label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
      }
      .email,.password
      {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        border: none;
        background: #f2f2f2;
      }
      #submit{
        background: #4CAF50;
        color: #fff;
        padding: 10px 20px;
        border: 1px solid #4CAF50;
        border-radius: 5px;
        cursor: pointer;
        transition: all 0.6s ease-in-out;
        
      }
      #submit:hover {
        background: #fff;
        color: #4CAF50;
        border-radius: 5px;
        border: 1px solid #4CAF50;
        
      }
      #member {
        text-align: center;
        margin-top: 20px;
        
      }
      #Signup {
        color: #4CAF50;
        font-weight: bold;
        text-decoration: none;
        padding: 5px 10px;
        transition: all 0.6s ease-in-out;
      }
      #Signup:hover {
        color: #fff;
        background: #4CAF50;
        padding: 5px 10px;
        border-radius: 5px;
      }
    </style>
   
  </head>
  <body>
  <%@include file="includes/header.jsp"%>
  
    <div class="container">
      <h1>Login</h1>
      <form method="post" action="login">
        <label class="label" for="email">Email:</label>
        <input type="text" class="email" name="email" required>
        <label class="label"for="password">Password:</label>
        <input type="password" class="password" name="password" required>
        <button id="submit" type="submit">Login</button>
      </form>
      <p id="member">Not a member? <a id="Signup" href="Registration.jsp">Sign up</a></p>
    </div>
  </body>
  <%@include file="includes/footer.jsp"%>
</html>
