<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Order Error</title>
</head>
<body>

    <div style="border: 1px solid red; padding: 15px; background-color: #ffe6e6; max-width: 500px; margin: auto; margin-top: 100px;">
        <h3 style="color: red;">Error</h3>
        <p> "Unknown error occurred.</p>

        <form action="<%= request.getContextPath() %>/pages/customer/home.jsp" method="get">
            <button type="submit">OK</button>
        </form>
    </div>

</body>
</html>