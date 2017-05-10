
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
    
    PreparedStatement newReq = con.prepareStatement("select * from newregistereddata where isprocessed = ?");
    newReq.setString(1, "no");
    ResultSet User  = newReq.executeQuery();
    
      

 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniDoc Admin Panel</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/styles.css" rel="stylesheet"> 
        <link href="../css/dashboard.css" rel="stylesheet">
        <link href="../css/material-kit.css" rel="stylesheet">
        <script src="../js/bootstrap.js"></script>  
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <span class="navbar-brand" >UniDoc System</span>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                      <li class="active"><a href="#">Approve New Registrations</a></li>
                      <li><a href="#">View Resident</a></li>
                      <li><a href="#">Mange UIDs</a></li>
                      <li><a href="#">Analytics</a></li>
                      <li><a href="#">Approve E-kyc Provider</a></li>
                      <li><a href="#">Manage E-kyc Providers</a></li>
                    </ul>
                </div>
              <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">UniDoc System Admin Dashboard</h1>

                <h2 class="sub-header"><%out.print(enroll); %></h2>
               
                    <div class="row sub-header">
                        <div class="col-md-offset-1 col-md-6">
                           <ul class="list-inline list-group h1">
                              <li>No of Pending Approval</li>
                              <li>500</li>
                           </ul>  
                        </div>
                        <div class="col-md-2 h1">
                            <span class="btn btn-primary">Approve All Requests</span>
                        </div>
                    </div>
                
                    
              </div>
            </div>
        </div>
</html>
   </body>