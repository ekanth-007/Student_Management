<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit Student</title>
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
    <div class="container">
        <h1>Edit Student</h1>
        
        <div class="student-id">
            <h3>Student ID: ${student.id}</h3>
        </div>
        
        <form:form action="/students/update/${student.id}" method="post" modelAttribute="student">
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
            
            <div class="form-actions">
                <button type="submit" class="btn">Update Student</button>
                <a href="/students" class="btn btn-cancel">Cancel</a>
            </div>
        </form:form>
    </div>
</body>
</html>