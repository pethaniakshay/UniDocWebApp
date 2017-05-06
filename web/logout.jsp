<%
    session = request.getSession(false);
    session.removeAttribute("sesvar");
    session.getMaxInactiveInterval();
    session.invalidate();
    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
    rd.forward(request, response);  
%>
