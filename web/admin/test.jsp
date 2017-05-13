<%-- 
    Document   : test.jsp
    Created on : May 13, 2017, 7:15:42 PM
    Author     : Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String ruid = request.getParameter("ruid");
            %>
            <h1><%= ruid%></h1>
    </body>
</html>
