<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .menu {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }
        .btn {
            padding: 12px 24px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-login {
            background-color: #008CBA;
        }
        .btn-login:hover {
            background-color: #007B9A;
        }
        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
            text-align: center;
        }
    </style>
</head>
<body>
    <c:choose>
        <c:when test="${pageContext.request.userPrincipal != null}">
            <!-- If user is already logged in, redirect to dashboard -->
            <c:redirect url="${pageContext.request.contextPath}/students/dashboard" />
        </c:when>
        <c:otherwise>
            <div class="container">
                <h1>Welcome to Student Management System</h1>
                
                <c:if test="${not empty success}">
                    <div class="success-message">
                        ${success}
                    </div>
                </c:if>
                
                <div class="menu">
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-login">Login</a>
                    <a href="${pageContext.request.contextPath}/register" class="btn">Register</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</body>
</html>