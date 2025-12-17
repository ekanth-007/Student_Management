<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
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
        input[type="number"] {
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
    <div class="container">
        <h1>Add New Student</h1>
        
        <form:form action="/students/save" method="post" modelAttribute="student">
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
                <label for="phone">Phone:</label>
                <form:input path="phone" id="phone" />
                <form:errors path="phone" cssClass="error" />
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn">Save Student</button>
                <a href="/students" class="btn btn-cancel">Cancel</a>
            </div>
        </form:form>
    </div>
</body>
</html>