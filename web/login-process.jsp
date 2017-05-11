<%@page import="webApp.LogInValidator"%>

<%@ page import="dbManager.*" %>

<%    
    boolean status = false;
    String uid= request.getParameter("uid"); 
    String passwd = request.getParameter("password");

    LogInValidator lv = new LogInValidator();
    status = lv.validator(uid, passwd);

    if(status){  
        session = request.getSession(true); // reuse existing
        session.setAttribute("Uid",uid);
        //session.setMaxInactiveInterval(30); // 30 seconds  
        //RequestDispatcher rd = request.getRequestDispatcher("user-home.jsp");
        //rd.forward(request, response);
        %>
        <jsp:forward page="user-home.jsp" />
        <%    
    }  
    else{ 
        %>
        <jsp:forward page="login-error.jsp" />
        <%
    }
%>