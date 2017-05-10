<%@page import="java.sql.*"%>
<%@page import="dbManager.DbConnectionProvider"%>
<%@page import="java.util.StringTokenizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uname=null;
    if (session != null) {
        if (session.getAttribute("uname") != null) {
                uname = (String) session.getAttribute("uname");

        }
        else {
            response.sendRedirect("index.jsp");
        }
    }
    
    Connection con = DbConnectionProvider.getCon();
    
    PreparedStatement newReq = con.prepareStatement("select * from newregistereddata where isprocessed = ?");
    newReq.setString(1, "no");
    ResultSet User  = newReq.executeQuery();
    
    int total=0;
      

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

                <h2 class="sub-header">Section title</h2>
               
                    <div class="row sub-header">
                        <div class="col-md-offset-1 col-md-6">
                           <ul class="list-inline list-group h1">
                              <li>No of Pending Approval</li>
                              <li><%= total %></li>
                           </ul>  
                        </div>
                        <div class="col-md-2 h1">
                            <a href="approve-all.jsp" class="btn btn-primary">Approve All Requests</a>
                        </div>
                    </div>
                
                    <table class="table table-responsive table-hover">
                        <thead>
                            <tr>
                                <th class="text-left">Enroll #</th>
                                <th class="text-left">First Name</th>
                                <th class="text-left">Last Name</th>
                                <th class="text-left">Gender</th>
                                <th class="text-left">Full Profile</th>
                                <th class="text-left">Approve</th>
                                <th class="text-left">Reject</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while (User.next()){  total++;%>
                               
                            <tr>
                                <td class="text-left"><% out.print(User.getInt(34)); %></td>
                                <td class="text-left"><% out.print(User.getString(1)); %></td>
                                <td class="text-left"><% out.print(User.getString(2)); %></td>
                                <td class="text-left"><% out.print(User.getString(2)); %></td>
                                <td class="text-left"><a href="view-unapproved-profile.jsp?enroll=<% out.print(User.getInt(34));%>" class="btn-success btn btn-xs">View Details</a></td>
                                <td class="text-left">
                                    <a href="approve-one-profile.jsp?enroll=<% out.print(User.getInt(34));%>" class="btn-success btn btn-xs">Approve</a>
                                </td>
                                <td><a href="reject-new-user.jsp?enroll=<% out.print(User.getInt(34));%>" class="glyphicon glyphicon-remove text-danger"></a></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>  
              </div>
            </div>
        </div>
    </body>
</html>
   