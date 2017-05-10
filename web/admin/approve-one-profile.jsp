<%@page import="residentData.ProcessData"%>
<%@page import="java.sql.*"%>
<%@page import="dbManager.DbConnectionProvider"%>
<%@page import="java.util.StringTokenizer"%>
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
  
    ProcessData pd = new ProcessData();
        
    pd.getPreEnrolledData(enroll);
    
    response.sendRedirect("admin-home.jsp");
       
 %>