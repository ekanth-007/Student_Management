<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
        }
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            padding: 20px 0;
        }
        .sidebar-header {
            padding: 20px;
            border-bottom: 1px solid #34495e;
            margin-bottom: 20px;
        }
        .sidebar-header h2 {
            color: white;
            font-size: 20px;
        }
        .sidebar-menu {
            list-style: none;
        }
        .sidebar-menu li {
            margin: 5px 0;
        }
        .sidebar-menu a {
            display: block;
            padding: 12px 20px;
            color: #ecf0f1;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .sidebar-menu a:hover,
        .sidebar-menu a.active {
            background-color: #34495e;
        }
        .sidebar-menu a.active {
            border-left: 4px solid #3498db;
        }
        .main-content {
            margin-left: 250px;
            flex: 1;
            padding: 30px;
        }
        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .btn-logout {
            padding: 8px 16px;
            background: #e74c3c;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn-logout:hover {
            background: #c0392b;
        }
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .card {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .card h3 {
            color: #7f8c8d;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .card .value {
            font-size: 32px;
            font-weight: bold;
            color: #2c3e50;
        }
        .card-icon {
            font-size: 40px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>Student Management</h2>
        </div>
        <ul class="sidebar-menu">
            <li><a href="${pageContext.request.contextPath}/students/dashboard" class="active">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/students/add">Add Student</a></li>
            <li><a href="${pageContext.request.contextPath}/students">Student List</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="content-header">
            <div class="user-info">
                <span>Welcome, <b>${pageContext.request.userPrincipal.name}</b></span>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a>
        </div>

        <h1>Dashboard</h1>

        <div class="dashboard-cards">
            <div class="card">
                <div class="card-icon">📊</div>
                <h3>Total Students</h3>
                <div class="value">${totalStudents}</div>
            </div>
        </div>
    </div>
</body>
</html>

