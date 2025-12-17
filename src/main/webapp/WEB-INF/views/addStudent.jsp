<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add Student</title>
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
            max-width: 600px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        .btn {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn-cancel {
            background-color: #f44336;
        }
        .form-actions {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 30px;
        }
        .error {
            color: #f44336;
            font-size: 12px;
            margin-top: 5px;
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
            <li><a href="${pageContext.request.contextPath}/students/add" class="active">Add Student</a></li>
            <li><a href="${pageContext.request.contextPath}/students">Student List</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="content-header">
            <div>
                <span>Welcome, <b>${pageContext.request.userPrincipal.name}</b></span>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a>
        </div>

        <div class="container">
            <h1>Add New Student</h1>
            
            <form:form action="${pageContext.request.contextPath}/students/save" method="post" modelAttribute="student">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <form:input path="firstName" id="firstName" required="true" />
                <form:errors path="firstName" cssClass="error" />
            </div>
            
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <form:input path="lastName" id="lastName" required="true" />
                <form:errors path="lastName" cssClass="error" />
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <form:input path="email" id="email" type="email" required="true" />
                <form:errors path="email" cssClass="error" />
            </div>
            
            <div class="form-group">
                <label for="course">Course:</label>
                <form:input path="course" id="course" required="true" />
                <form:errors path="course" cssClass="error" />
            </div>
            
            <div class="form-group">
                <label for="year">Year:</label>
                <form:input path="year" id="year" type="number" min="1" max="5" required="true" />
                <form:errors path="year" cssClass="error" />
            </div>
            
            <div class="form-group">
                <label for="address">Address:</label>
                <form:input path="address" id="address" />
                <form:errors path="address" cssClass="error" />
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <form:input path="phone" id="phone" />
                <form:errors path="phone" cssClass="error" />
            </div>
            
            <div class="form-group">
                <label for="dob">Date of Birth (YYYY-MM-DD):</label>
                <form:input path="dob" id="dob" type="date" />
                <form:errors path="dob" cssClass="error" />
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn">Save Student</button>
                <a href="${pageContext.request.contextPath}/students" class="btn btn-cancel">Cancel</a>
            </div>
            </form:form>
        </div>
    </div>
</body>
</html>