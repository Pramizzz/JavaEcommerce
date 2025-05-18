<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DAO.AddProductDAO" %>
<%@ page import="model.DisplayProductmodel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    AddProductDAO dao = new AddProductDAO();
    out.println("DAO imported successfully");

    DisplayProductmodel p = new DisplayProductmodel();
    out.println("Model imported successfully");
%>

ss</body>
</html>