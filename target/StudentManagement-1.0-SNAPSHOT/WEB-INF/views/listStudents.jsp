<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
        }
        h1 {
            text-align: center;
        }
        .top-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .btn {
            padding: 8px 14px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn-add {
            background: #2196F3;
        }
        .btn-edit {
            background: orange;
            font-size: 12px;
            padding: 5px 10px;
        }
        .btn-logout {
            background: #777;
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

<div class="container">

    <div class="top-bar">
        <div>
            Welcome,
            <c:choose>
                <c:when test="${pageContext.request.userPrincipal != null}">
                    <b>${pageContext.request.userPrincipal.name}</b>
                </c:when>
                <c:otherwise>
                    Guest
                </c:otherwise>
            </c:choose>
        </div>

        <div>
            <a href="${pageContext.request.contextPath}/students/add" class="btn btn-add">
                Add Student
            </a>

            <c:if test="${pageContext.request.isUserInRole('ADMIN')}">
                <a href="${pageContext.request.contextPath}/admin" class="btn">
                    Admin
                </a>
            </c:if>

            <c:choose>
                <c:when test="${pageContext.request.userPrincipal != null}">
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-logout">
                        Logout
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="btn">
                        Login
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <h1>Student List</h1>

    <c:choose>
        <c:when test="${not empty students}">
            <table>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Course</th>
                    <th>Action</th>
                </tr>

                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.firstName}</td>
                        <td>${student.lastName}</td>
                        <td>${student.email}</td>
                        <td>${student.course}</td>
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

</body>
</html>
