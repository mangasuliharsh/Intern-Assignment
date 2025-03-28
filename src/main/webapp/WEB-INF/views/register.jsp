<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container">
    <h2>Register</h2>

    <%
        String errorMessage = (String) request.getAttribute("error");
        if (errorMessage != null) {
    %>
    <p style="color: red;"><%= errorMessage %></p>
    <%
        }
    %>

    <form action="/register" method="post">
        <input type="text" name="name" placeholder="Full Name" required><br>
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="password" name="password" placeholder="Password" required><br>

        <select name="role" required>
            <option value="" disabled selected>Select Role</option>
            <option value="STUDENT">Student</option>
            <option value="FACULTY">Faculty</option>
        </select>
        <br>

        <button type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="/student-login">Student Login</a></p>
    <p>Already have an account? <a href="/faculty-login">Faculty Login</a></p>
</div>

</body>
</html>
