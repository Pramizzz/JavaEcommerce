<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <style>
        .success-box {
            background-color: #e6ffe6;
            border: 2px solid #00cc00;
            padding: 20px;
            border-radius: 8px;
            width: 60%;
            margin: 50px auto;
            text-align: center;
            font-family: Arial, sans-serif;
        }
        .success-box p {
            color: #006600;
            font-size: 18px;
        }
        .success-box button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #00cc00;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        .success-box button:hover {
            background-color: #009900;
        }
    </style>
</head>
<body>

<%
    String successMessage = (String) session.getAttribute("orderSuccessMessage");
    if (successMessage != null) {
%>
    <div class="success-box" id="successBox">
        <p><%= successMessage %></p>
   <form action="<%= request.getContextPath() %>/pages/customer/home.jsp" method="get">

            <button type="submit">OK</button>
        </form>
    </div>
<%
        session.removeAttribute("orderSuccessMessage");
    }
%>


</body>
</html>