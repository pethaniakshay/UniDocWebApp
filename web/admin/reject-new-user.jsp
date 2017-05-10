<%@page import="java.sql.*"%>
<%@page import="dbManager.DbConnectionProvider"%>
<%@page import="java.util.StringTokenizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uname=null;
    int enroll=0;
    if (session != null) {
        if (session.getAttribute("uname") != null) {
                uname = (String) session.getAttribute("uname");
                enroll = Integer.parseInt(request.getParameter("enroll"));

        }
        else {
            response.sendRedirect("index.jsp");
        }
    }
    
    Connection con = DbConnectionProvider.getCon();
    
    PreparedStatement newReq = con.prepareStatement("delete from newregistereddata where pre_enroll = ?");
    newReq.setInt(1, enroll);
    newReq.executeUpdate();
    response.sendRedirect("admin-home.jsp");
    
      

 %>
