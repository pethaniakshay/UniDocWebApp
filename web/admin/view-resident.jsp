<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="residentData.ResidentFamilyVisulizer"%>
<%@page import="residentData.ResidentDataProvider"%>
<%@page import="java.sql.*"%>
<%@page import="dbManager.DbConnectionProvider"%>
<%@page import="java.util.StringTokenizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uname=null;
    String ruid=null;
    ruid = request.getParameter("ruid");
    if (session != null) {
        if (session.getAttribute("uname") != null) {
                uname = (String) session.getAttribute("uname");
                
                //if(request.getParameter("ruid") != null){
                    //ruid = request.getParameter("ruid");
                //}
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
                      <li><a href="admin-home.jsp">Approve New Registrations</a></li>
                      <li class="active"><a href="view-resident.jsp">View Resident</a></li>
                      <li><a href="#">Mange UIDs</a></li>
                      <li><a href="#">Analytics</a></li>
                      <li><a href="#">Approve E-kyc Provider</a></li>
                      <li><a href="#">Manage E-kyc Providers</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">UniDoc System Admin Dashboard</h1>
                <h2 class="sub-header">View Resident</h2>

                <div class="row sub-header">
                    <div class="col-md-offset-1 col-md-11">
                        <form class="form-inline" action="view-resident.jsp" method="post">
                        <div class="form-group">
                          <label for="ruid">UID</label>
                          <input type="text" class="form-control" id="ruid" name="ruid" placeholder="Enter UID Here">
                        </div>
                        <button type="submit" class="btn btn-success">Submit</button>
                      </form>
                    </div>
                </div> 
                <% if (ruid != null){
                    ResidentDataProvider provider = new ResidentDataProvider(ruid);
                    ResidentFamilyVisulizer family = new ResidentFamilyVisulizer(ruid);
                    List<ArrayList<String>> banks = new ArrayList<>();
                    banks = provider.getBankaccounts();
                %>

                        <div class="col-md-12 label-primary"><h4>Resident Bio</h4></div>
                        
                        <div class="col-md-6">
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th>Uid</th>
                                        <td><%= ruid %></td>    
                                    </tr>
                                    <tr>
                                        <th>First Name</th>
                                        <td><%= provider.getResidentFirstName()  %></td>    
                                    </tr><tr>
                                        <th>Middle Name</th>
                                        <td><%= provider.getResidentMiddleName() %></td>    
                                    </tr>
                                    <tr>
                                        <th>Last Name</th>
                                        <td><%= provider.getResidentLastName()  %></td>    
                                    </tr>
                                    <tr>
                                        <th>First Gender</th>
                                        <td><%= provider.getResidentGender() %></td>    
                                    </tr>   
                                </table>
                            </div>
                        </div>
                                    
                        <div class="col-md-6">
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th>Birth Date</th>
                                        <td><%= provider.getResidentBirthDate()  %></td>    
                                    </tr>
                                     <tr>
                                        <th>Martial Status</th>
                                        <td><%= provider.getMaritialStatus() %></td>    
                                    </tr>
                                    <tr>
                                        <th>Mobile No</th>
                                        <td><%= provider.getMobile() %></td>    
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td><%= provider.getEmail()%></td>    
                                    </tr>
                                </table>
                            </div>
                        </div>
                                    
                        <div class="col-md-12 label-primary"><h4>Resident Address</h4></div>
                        <div class="col-md-6">
                            <div class="table-responsive">
                                <table class="table" style="border:none">
                                    <tr>
                                        <td style="border:none"><%= provider.getAddressTitle() %></td>
                                    </tr>
                                    <tr>
                                        <td style="border:none"><%= provider.getAddressHouseNo() %></td>
                                    </tr>
                                    <tr>
                                        <td style="border:none"><%= provider.getAddressStreet() %></td>
                                    </tr>
                                    <tr>
                                        <td style="border:none"><%= provider.getAddressArea() %></td>
                                    </tr>
                                    <tr>
                                        <td style="border:none"><%= provider.getAddressVillage() %></td>
                                    </tr>  
                                </table>
                            </div>
                        </div>
                                    
                        <div class="col-md-6">
                            <div class="table-responsive">
                                <table class="table" style="border:none">
                                    <tr>
                                        <td style="border:none"><%= provider.getAddressCity() %></td>
                                    </tr>
                                    <tr>
                                        <td style="border:none"><%= provider.getAddressDistrict() %></td>
                                    </tr>
                                    <tr>
                                        <td style="border:none"><%= provider.getAddressState() %></td>
                                    </tr>
                                    <tr>
                                        <td style="border:none"><%= provider.getAddressCountry() %></td>
                                    </tr>
                                    <tr>
                                        <td style="border:none">Pin Code: <%= provider.getAddressPinCode() %></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="label-primary col-md-4 "><h4>Parents</h4></div>
                        <div class="label-primary col-md-4"><h4>Partner</h4></div>
                        <div class="label-primary col-md-4"><h4>Childs</h4></div>

                        <div class="col-md-4">  
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th style="border: none">Mother</th>
                                        <td style="border: none"><%= family.getMotherFirstName() +" ["+ provider.getMotherUid()+"]" %></td>
                                    </tr>
                                    <tr>
                                        <th style="border: none">Father</th>
                                        <td style="border: none"><%= family.getFatherFirstName()+" ["+ provider.getFatherUid()+"]" %></td>
                                    </tr>

                                </table>
                            </div>
                        </div>
                                    
                        <div class="col-md-4">  
                            <% if("married".equals(provider.getMaritialStatus())) { 
                            %>
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>

                                        <td style="border: none"><%= family.getPartnerFirstName() +" ["+ provider.getUidPartner()+"]" %></td>
                                    </tr>

                                </table>
                            </div>
                                        <% }
                                        else{
                                        %>
                                        <h4><%= provider.getMaritialStatus() %></h4>           
                                        <%
                                        }
                                        %>                
                        </div>
                        
                        <div class="col-md-4">  
                            <div class="table-responsive"> 

                                <%
                                    if(family.getSons() != null && family.getDaughters() != null){
                                        out.print("<h4>No data available </h4");
                                    }
                                    else
                                    {
                                        List<ArrayList<String>> daughts = new ArrayList<>();
                                        List<ArrayList<String>> sons = new ArrayList<>();
                                %>
                                    <table class="table">
                                            <% 
                                                for(ArrayList obj:daughts){

                                                ArrayList<String> temp = obj;
                                                 for(String job : temp){
                                            %>
                                                <tr>
                                                    <th style="border: none">Daughter</th>
                                                    <td style="border: none"><%= job +" ["+ job+"]" %></td>
                                                </tr>   
                                            <% }} %>
                                            <% 
                                                for(ArrayList obj:sons){

                                                ArrayList<String> temp = obj;
                                                 for(String job : temp){
                                            %>
                                                <tr>
                                                    <th style="border: none">Sons</th>
                                                    <td style="border: none"><%= job +" ["+ job+"]" %></td>
                                                </tr>   
                                            <% }} %>
                                     </table>
                                <%  }%>
                            </div>
                        </div>
                        </div>

                        
                        <div class="col-md-12 label-primary"><h4>Bank Accounts</h4></div>
                       
                        <div class="col-md-12">
                            <div class="table-responsive ">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="text-left">#</th>
                                            <th class="text-left">Bank Name</th>
                                            <th class="text-left">Branch</th>
                                            <th class="text-left">IFSC CODE</th>
                                            <th class="text-left">Account Number</th>
                                            <th class="text-left">Account Type</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            int i=0;
                                            for(ArrayList obj : banks){
                                                ArrayList<String> temp = obj;
                                                out.print("<tr><td class=\"text-left\" >"+ ++i +"</td>" );
                                                for(String job : temp){
                                        %>
                                        <td class="text-left"><%=job%></td>
                                        <%
                                                }
                                                out.print("</tr>");
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div> 
                                    
                        <div class="col-md-12 label-primary"><h4>Pan Number</h4></div>
                        
                        <div class="col-md-12">
                            <h3 class="h3"><%= provider.getPANNumber() %></h3>
                        </div>
                       
                        <div class="col-md-12 label-primary"><h4>Eci Id</h4></div>
                        <div class="col-md-12">
                            <h3 class="h3"><%= provider.getEciNumber() %></h3>
                        </div>
                        
                        <div class="col-md-12 label-primary"><h4>Driving Licence</h4></div>
                        <div class="col-md-12">
                            <div class="table-responsive col-md-6">
                                <table class="table">
                                    <tbody>
                                        <tr> 
                                            <th style="border: none">DL No</th>
                                            <td style="border: none"><%= provider.getDrivingLicenceNumber() %></td> 
                                        </tr>
                                        <tr> 
                                            <th style="border: none">DOI</th>
                                            <td style="border: none"><%= provider.getDrivingLicenceDOI() %></td> 
                                        </tr> 
                                        <tr> 
                                            <th style="border: none">CDOI</th>
                                            <td style="border: none"><%= provider.getDrivingLicenceCDOI() %></td> 
                                        </tr>
                                        <tr> 
                                            <th style="border: none">Valid Till</th>
                                            <td style="border: none"><%= provider.getDrivingLicenceExpdate() %></td> 
                                        </tr> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
               <%   }   
               %>   
            </div>                        
        </div>
    </body>
</html>
   