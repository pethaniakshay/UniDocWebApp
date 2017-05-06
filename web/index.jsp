<%-- 
    Document   : index
    Created on : Apr 18, 2017, 1:42:07 PM
    Author     : Akshay Pethani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UnidDoc Landing Page</title>
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
    </head>
    <body>
        <div class="container-fluid">    
            <jsp:include page="header.jsp" />  
            <hr>       
            <jsp:include page="user-login.jsp" />
            <hr>
            <jsp:include page="footer.jsp" />        
        </div>
    </body>
</html>
