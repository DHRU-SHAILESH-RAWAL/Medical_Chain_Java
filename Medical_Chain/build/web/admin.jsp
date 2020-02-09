<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Admin</title>
    </head>
    <body>
        <%
            try {
                String name="",pass="";
                String aname = request.getParameter("name");
                String apass = request.getParameter("pass");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/GlsJPraYl3", "GlsJPraYl3", "QWoTqG7IK0");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from Authorized_Organization where name='"+aname+"'");
                if (rs.next()) {
                     name = rs.getString(1);
                     pass = rs.getString(6);
                }
                if (pass.equals(apass)) {
                    RequestDispatcher RD = request.getRequestDispatcher("FTMI.html");
                    RD.forward(request, response);
                } else {
                    out.println("You have entered wrong details please retry again....");
                    RequestDispatcher rd = request.getRequestDispatcher("Admin.html");
                    rd.include(request, response);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
    </body>
</html>
