<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Access Denied</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .error-container {
            text-align: center;
            background: white;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
        }
        .error-icon {
            font-size: 80px;
            color: #f44336;
            margin-bottom: 20px;
        }
        h1 {
            color: #333;
            margin-bottom: 10px;
        }
        p {
            color: #666;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        .btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
            margin: 5px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-home {
            background-color: #008CBA;
        }
        .btn-home:hover {
            background-color: #007B9A;
        }
        .btn-login {
            background-color: #666;
        }
        .btn-login:hover {
            background-color: #555;
        }
        .user-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #007BFF;
        }
        .user-info p {
            margin: 5px 0;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">🚫</div>
        <h1>Access Denied</h1>
        
        <div class="user-info">
            <p><strong>User:</strong> ${pageContext.request.userPrincipal.name}</p>
            <p><strong>Requested URL:</strong> ${pageContext.request.requestURI}</p>
            <p><strong>Error Code:</strong> 403 - Forbidden</p>
        </div>
        
        <p>
            You don't have permission to access this page. 
            This area requires special privileges that your account doesn't have.
        </p>
        <p>
            If you believe this is an error, please contact the administrator.
        </p>
        
        <div class="action-buttons">
            <a href="/students" class="btn btn-home">Go to Dashboard</a>
            <a href="/" class="btn">Home Page</a>
            <a href="/logout" class="btn btn-login">Logout</a>
        </div>
    </div>
</body>
</html>