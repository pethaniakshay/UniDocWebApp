<%@page import="residentData.ResidentDataProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <title>UniDoc User Profile</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/user-profile.css" rel="stylesheet">
        <link rel="stylesheet" href="css/font-awesome.min.css" >

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/"></script>
    </head>
    <body>
        <nav id="sticker" class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <a class="menu"><i class="fa fa-bars" id="menu_icon"></i></a>
                    <a class="navbar-brand" href="#">
                    <img src="https://www.google.co.in/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png" class="img-responsive" />

                    </a>
                </div><!--navbar-header close-->
                
                <div class="collapse navbar-collapse drop_menu" id="content_details">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-font"></span> About Us</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-heart-empty"></span> Why Choose us</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-phone"></span> What We Do</a></li> 
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Contact Us</a></li>     
                    </ul><!--navbar-right close-->
                </div><!--collapse navbar-collapse drop_menu close-->
            </div><!--container-fluid close-->
        </nav><!--navbar navbar-inverse close-->
        <br>
        <br>
        <br>
        <section>
            <div class="container" style="margin-top: 30px;">
                <div class="profile-head">
                    <div class="col-md- col-sm-4 col-xs-12">
                    <img src="userpics/123412341234.jpg" class="img-responsive" />
                  
                    </div><!--col-md-4 col-sm-4 col-xs-12 close-->

                    <div class="col-md-5 col-sm-5 col-xs-12">
                        <h5><%= provider.getResidentFullName() %></h5>
                        <br/>
           
                        <ul>
                            <li><span class="fa fa-user-circle"></span> <%= uid %></li>
     
                            <li><span class="glyphicon glyphicon-phone"></span> <%= provider.getMobile() %></li>
                            <li><span class="glyphicon glyphicon-envelope"></span> <%= provider.getEmail() %></li>
                        </ul>
                    </div><!--col-md-8 col-sm-8 col-xs-12 close-->
                </div><!--profile-head close-->
            </div><!--container close-->
              <br/>
            <div id="sticky" class="container">

                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-menu">
                    <li>
                        <a href="user-home.jsp">
                        <i class="fa fa-male"></i> Profile
                        </a>
                    </li>
                    <li>
                        <a href="user-address.jsp">
                        <i class="fa fa-address-card"></i> Address
                        </a>
                    </li><li>
                        <a href="user-famliy.jsp">
                        <i class="fa fa-user-plus"></i> <i class="fa fa-user-plus"></i> Family
                        </a>
                    </li>    
                    <li>
                        <a href="user-academic.jsp">
                        <i class="fa fa-graduation-cap"></i> Academic
                        </a>
                    </li>           
                    <li>
                        <a href="user-bank.jsp">
                        <i class="fa fa-bank"></i> Bank
                        </a>
                    </li>
                    <li class="active">
                        <a href="user-dl.jsp">
                        <i class="fa fa-drivers-license"></i> Driving Licence
                        </a>
                    </li>
                    <li>
                        <a href="user-eci.jsp">
                        <i class="fa fa-drivers-license"></i> ECI ID
                        </a>
                    </li>
                    <li>
                        <a href="user-pan.jsp">
                        <i class="fa fa-bank"></i> PAN
                        </a>
                    </li>  
                </ul><!--nav-tabs close-->

                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="profile">
                        <div class="container">
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="pro-title">Driving Licence</h4>
                                </div><!--col-md-12 close-->
                                <div class="col-md-6">
                                    <div class="table-responsive responsiv-table">
                                        <table class="table bio-table">
                                            <tbody>
                                                <tr> 
                                                    <td>DL No</td>
                                                    <td>: <%= provider.getDrivingLicenceNumber() %></td> 
                                                </tr>
                                                <tr> 
                                                    <td>DOI</td>
                                                    <td>: <%= provider.getDrivingLicenceDOI() %></td> 
                                                </tr>
                                                <tr> 
                                                    <td>CDOI</td>
                                                    <td>: <%= provider.getDrivingLicenceCDOI() %></td> 
                                                </tr>
                                                <tr> 
                                                    <td>Valid Till</td>
                                                    <td>: <%= provider.getDrivingLicenceExpdate() %></td> 
                                                </tr> 
                                            </tbody>
                                        </table>
                                    </div><!--table-responsive close-->
                                </div><!--col-md-6 close-->
                                <div class="col-md-6">
                                    <div class="table-responsive responsiv-table">
                                       
                                    </div><!--table-responsive close-->
                                </div><!--col-md-6 close-->
                            </div><!--row close-->
                        </div><!--container close-->
                    </div><!--tab-pane close-->
                </div><!--tab-content close-->
            </div><!--container close-->
        </section><!--section close-->
    </body>
</html>