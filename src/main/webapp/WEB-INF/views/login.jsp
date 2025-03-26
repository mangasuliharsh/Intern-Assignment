<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container">
    <h2>Login</h2>

    <% 
        String errorMessage = (String) session.getAttribute("error");
        session.removeAttribute("error");
    %>
    <% if (errorMessage != null) { %>
    <p style="color: red;"><%= errorMessage %></p>
    <% } %>

    <form action="/perform-login" method="post">
        <input type="email" name="username" placeholder="Email" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Login</button>
    </form>
    <p>New user? <a href="register">Register</a></p>
</div>
</body>
</html>
