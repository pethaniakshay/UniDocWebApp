<%@page import="residentData.ResidentDataProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title> 
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">   
    </head>
    <body>
        <%
            String uid=null;
            if (session != null) {
                if (session.getAttribute("Uid") != null) {
			uid = (String) session.getAttribute("Uid");
			
		}
                else {
                    response.sendRedirect("index.jsp");
                }
            }   

            
            ResidentDataProvider provider = new ResidentDataProvider(uid);
        %>
         <div class="container-fluid">
            
            <jsp:include page="header.jsp" />  
            <hr>       
            <h1> <%=  provider.getResidentFullName() %> </h1>
            <hr>
                <form action="logout.jsp" method="post">
                    <input type="submit" value="LogOut" class="btn btn-default">
                </form>
            <hr>
            <jsp:include page="footer.jsp" />        
        </div>
    </body>
</html>
