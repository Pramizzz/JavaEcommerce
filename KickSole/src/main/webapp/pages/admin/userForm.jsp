<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User Management Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="date"], input[type="tel"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        button:hover {
            background-color: #218838;
        }
        .caption {
            text-align: center;
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <c:if test="${user != null}">
        <form action="update" method="post">
    </c:if>
    <c:if test="${user == null}">
        <form action="insert" method="post">
    </c:if>

    <div class="caption">
        <c:if test="${user != null}">
            <h2>Edit User</h2>
        </c:if>
        <c:if test="${user == null}">
            <h2>Add New User</h2>
        </c:if>
    </div>

    <c:if test="${user != null}">
        <input type="hidden" name="id" value="<c:out value='${user.id}' />" />
    </c:if>

    <div class="form-group">
        <label for="name">User Name</label>
        <input type="text" id="name" name="name" value="<c:out value='${user.name}' />" required="required">
    </div>

    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" value="<c:out value='${user.username}' />" required="required">
    </div>

    <div class="form-group">
        <label for="email">User Email</label>
        <input type="text" id="email" name="email" value="<c:out value='${user.email}' />">
    </div>

    <div class="form-group">
        <label for="birthday">Birthday</label>
        <input type="date" id="birthday" name="birthday" value="<c:out value='${user.birthday}' />">
    </div>

    <div class="form-group">
        <label for="phone">Phone</label>
        <input type="tel" id="phone" name="phone" value="<c:out value='${user.phone}' />">
    </div>

    <button type="submit">Save</button>
    </form>
</div>

</body>
</html>
