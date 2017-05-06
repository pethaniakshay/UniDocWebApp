<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniDoc Admin LogIn</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/styles.css" rel="stylesheet"> 
        <script src="../js/bootstrap.js"></script>
    </head>
    <body class="adminBody">
        <div class="container-fluid">
            <jsp:include page="/header.jsp" />  
            <hr class="alert-danger">

            <div class="row">
                <div class="col-md-offset-4 col-md-4 adminLogInPanel">
                    <div class="col-md-12 adminLogInPanelHeader">
                        <h2 class="h2">UniDoc Admin LogIn</h2>
                    </div>
                    <div class="col-md-12" style="margin-top: 20px">
                        <form action="admn-login-process.jsp" method="post">
                            <div class="form-group">
                              <label for="uname">User Name</label>
                              <input type="text" class="form-control" id="uname" name="uname" placeholder="User Name">
                            </div>
                            <div class="form-group">
                              <label for="passwd">Password</label>
                              <input type="password" class="form-control" id="passwd" name="passwd" placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-danger btn-block">Log In</button>
                        </form>
 
                    </div>
                    
                </div>
            </div>
            <jsp:include page="/footer.jsp" />
        </div>    
    </body>
</html>
