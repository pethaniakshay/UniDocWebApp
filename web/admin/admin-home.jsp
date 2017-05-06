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

    out.println(uname);
%>

