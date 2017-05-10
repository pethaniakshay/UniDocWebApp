<%@page import="residentData.ProcessData"%>
<%@page import="org.apache.tomcat.util.buf.UEncoder"%>
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
                

        }
        else {
            response.sendRedirect("index.jsp");
        }
    }
    
    ProcessData pd = new ProcessData();
    
    Connection con = DbConnectionProvider.getCon();
    
    PreparedStatement newReq = con.prepareStatement("select * from newregistereddata where isprocessed = ?");
    newReq.setString(1, "no");
    ResultSet User  = newReq.executeQuery();
    
    while(User.next()){
        pd.getPreEnrolledData(User.getInt(34)); 
    }
    
    response.sendRedirect("admin-home.jsp");
    
      

 %>
