<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the current session
    session.invalidate();

    // Redirect to home or login page
    response.sendRedirect(request.getContextPath() + "/pages/customer/login.jsp");
%>
