<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>

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
        .container {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            margin-bottom: 20px;
        }
        .btn {
            padding: 8px 14px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            display: inline-block;
        }
        .btn-add {
            background: #2196F3;
        }
        .btn-edit {
            background: orange;
            font-size: 12px;
            padding: 5px 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #f2f2f2;
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
            <li><a href="${pageContext.request.contextPath}/students/dashboard">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/students/add">Add Student</a></li>
            <li><a href="${pageContext.request.contextPath}/students" class="active">Student List</a></li>
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

        <div class="container">
            <h1>Student List</h1>

    <c:choose>
        <c:when test="${not empty students}">
            <table>
                <tr>
                    <th>Sr No</th>
                    <th>Student Name</th>
                    <th>Address</th>
                    <th>Phone Number</th>
                    <th>DOB</th>
                    <th>Action</th>
                </tr>

                <c:forEach var="student" items="${students}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${student.firstName} ${student.lastName}</td>
                        <td>${student.address != null ? student.address : 'N/A'}</td>
                        <td>${student.phone != null ? student.phone : 'N/A'}</td>
                        <td>${student.dob != null ? student.dob : 'N/A'}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/students/edit/${student.id}"
                               class="btn btn-edit">
                                Edit
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>

        <c:otherwise>
            <p style="text-align:center;">
                No students found.
                <a href="${pageContext.request.contextPath}/students/add">
                    Add Student
                </a>
            </p>
        </c:otherwise>
    </c:choose>
        </div>
    </div>
</body>
</html>
