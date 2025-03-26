<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .sidebar {
            height: 100vh;
            background-color: #2c3e50;
            color: white;
            padding-top: 20px;
        }
        .sidebar a {
            color: #ecf0f1;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .sidebar a:hover {
            color: #3498db;
            transform: translateX(10px);
        }
        .content-area {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 20px;
            margin: 20px;
        }
        .navbar {
            background-color: #34495e;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f3f5;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <i class="fas fa-graduation-cap"></i> Student Management
        </a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="/logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <div class="list-group">
                <a href="/home" class="list-group-item list-group-item-action active">
                    <i class="fas fa-home"></i> Dashboard
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <i class="fas fa-user-graduate"></i> Students
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <i class="fas fa-chalkboard-teacher"></i> Courses
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <i class="fas fa-chart-pie"></i> Reports
                </a>
            </div>
        </div>

        <div class="col-md-10">
            <div class="content-area">
                <h2 class="mb-4">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </h2>

                <!-- Display success/error messages -->
                <c:if test="${not empty success}">
                    <div class="alert alert-success alert-dismissible fade show">
                            ${success}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show">
                            ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Student Registration Form -->
                <div class="row">
                    <div class="col-md-5">
                        <div class="card">
                            <div class="card-header bg-primary text-white">
                                <i class="fas fa-user-plus"></i> Add New Student
                            </div>
                            <div class="card-body">
                                <form action="/addStudent" method="post">
                                    <div class="mb-3">
                                        <label class="form-label">Student Name</label>
                                        <input type="text" name="name" class="form-control" placeholder="Enter student name" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">USN (University Serial Number)</label>
                                        <input type="text" name="usn" class="form-control" placeholder="Enter USN" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save"></i> Register Student
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="card">
                            <div class="card-header bg-success text-white">
                                <i class="fas fa-list"></i> Student List
                            </div>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>USN</th>
                                        <th>Name</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${students}" var="student">
                                        <tr>
                                            <td>${student.usn}</td>
                                            <td>${student.name}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>