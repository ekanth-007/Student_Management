<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit Student</title>
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
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        textarea {
            height: 100px;
            resize: vertical;
        }
        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        .form-row .form-group {
            flex: 1;
        }
        .btn {
            padding: 10px 25px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-cancel {
            background-color: #f44336;
        }
        .btn-cancel:hover {
            background-color: #d32f2f;
        }
        .form-actions {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        .error {
            color: #f44336;
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }
        .readonly-field {
            background-color: #f9f9f9;
            color: #666;
            cursor: not-allowed;
        }
        .field-info {
            font-size: 12px;
            color: #777;
            margin-top: 3px;
        }
        .student-id {
            text-align: center;
            background-color: #f8f9fa;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #4CAF50;
        }
        .student-id h3 {
            margin: 0;
            color: #333;
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
            <h1>Edit Student</h1>
            
            <div class="student-id">
                <h3>Student ID: ${student.id}</h3>
            </div>
            
            <form:form action="${pageContext.request.contextPath}/students/update/${student.id}" method="post" modelAttribute="student">
            <form:hidden path="id" />
            
            <div class="form-row">
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
            </div>
            
            <div class="form-group">
                <label for="email">Email Address:</label>
                <form:input path="email" id="email" type="email" required="true" 
                           cssClass="readonly-field" readonly="true" />
                <span class="field-info">Email cannot be changed</span>
                <form:errors path="email" cssClass="error" />
            </div>
            
            <div class="form-row">
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
            </div>
            
            <div class="form-group">
                <label for="address">Address:</label>
                <form:textarea path="address" id="address" />
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
                <button type="submit" class="btn">Update Student</button>
                <a href="${pageContext.request.contextPath}/students" class="btn btn-cancel">Cancel</a>
            </div>
            </form:form>
        </div>
    </div>
</body>
</html>