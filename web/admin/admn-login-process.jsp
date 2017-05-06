<%@page import="webApp.adminLogInValidtor"%>

<%@ page import="dbManager.*" %>

<%    
    boolean status = false;
    String uname= request.getParameter("uname"); 
    String passwd = request.getParameter("passwd");

    adminLogInValidtor lv = new adminLogInValidtor();
    status = lv.validator(uname, passwd);

    if(status){  
        session = request.getSession(true); // reuse existing
        session.setAttribute("uname",uname);
        session.setMaxInactiveInterval(30); // 30 seconds  
        //RequestDispatcher rd = request.getRequestDispatcher("user-home.jsp");
        //rd.forward(request, response);
        %>
        <jsp:forward page="admin-home.jsp" />
        <%    
    }  
    else{ 
        %>
        <jsp:forward page="admin-login-error.jsp" />
        <%
    }
%>