

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">


        <!-- Title Page-->
        <title>User_Dashboard</title>

        <!-- Fontfaces CSS-->
        <link href="css/font-face.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/theme.css" rel="stylesheet" media="all">

        <style>
            .table-earning thead th{
                background-color: #1a86bbd6;
            }
        </style>

    </head>

    <body class="animsition">
        <div class="page-wrapper">
            <!-- HEADER MOBILE-->
            <header class="header-mobile d-block d-lg-none">
                <div class="header-mobile__bar">
                    <div class="container-fluid">
                        <div class="header-mobile-inner">
                            <a class="logo" href="index.html">
                                <img src="images/admin.png" alt="CoolAdmin" />
                            </a>
                            <button class="hamburger hamburger--slider" type="button">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
                <nav class="navbar-mobile">
                    <div class="container-fluid">
                        <ul class="navbar-mobile__list list-unstyled">
                            <li class="active">
                                <a href="#">
                                    <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- END HEADER MOBILE-->

            <!-- MENU SIDEBAR-->
            <aside class="menu-sidebar d-none d-lg-block">
                 <div class="logo">
                    <a href="#">
                        <!--<img src="" alt="Cool Admin" />-->
                        <h2>Medicalchain</h2>
                    </a>
                </div>
                <div class="menu-sidebar__content js-scrollbar1">
                    <nav class="navbar-sidebar">
                        <ul class="list-unstyled navbar__list">
                            <li class="active">
                                <a href="Scan_QR_Dashboard.jsp">
                                    <i class="far fa-check-square"></i><b>Home</b></a>
                            </li>
                            <li>
                                <a href="Get_FTMI.jsp">
                                    <i class="far fa-check-square"></i><b>GET FTMI</b></a>
                            </li>
                            <li>
                                <a href="Update_FTMI.jsp">
                                    <i class="far fa-check-square"></i><b>Update FTMI</b></a>
                            </li>
                            <li>
                                <a href="Medical_Reports.jsp">
                                    <i class="far fa-check-square"></i><b>Medical Reports</b></a>
                            </li>
                            <li>
                                <a href="FTMI.html">
                                    <i class="far fa-check-square"></i><b>Back To Dash Board</b></a>
                            </li>

                        </ul>
                    </nav>
                </div>
            </aside>
            <!-- END MENU SIDEBAR-->

            <!-- PAGE CONTAINER-->
            <div class="page-container">
                <!-- HEADER DESKTOP-->
                <header class="header-desktop">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="header-wrap">
                               
                                <div class="header-button">


                                    <div class="account-wrap">
                                        <div class="account-item clearfix js-item-menu">
                                           
                                            <div class="content">
                                                <a class="js-acc-btn" href="#">Setting
                                                </a>
                                            </div>
                                            <div class="account-dropdown js-dropdown">
                                                

                                                <div class="account-dropdown__footer">
                                                    <a href="logout.jsp">
                                                        <i class="zmdi zmdi-power"></i>Logout</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- HEADER DESKTOP-->

                <!-- MAIN CONTENT-->

                <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive table--no-card m-b-30">
                                        <table class="table table-borderless table-striped table-earning">
                                            <thead>
                                                <tr>
                                                    <th>SR. NO</th>
                                                    <th>Organization Name</th>
                                                    <th>Organization Address</th>
                                                    <th>Organization Contact</th>
                                                    <th>Organization Mail</th>
                                                    <th class="text-right">Type</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    int count = 1;
                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/GlsJPraYl3", "GlsJPraYl3", "QWoTqG7IK0");
                                                        Statement stmt = con.createStatement();
                                                        ResultSet rs = stmt.executeQuery("select * from Authorized_Organization");
                                                        while (rs.next()) {

                                                            out.print("<tr><td>" + count + "</td>");
                                                            out.print("<td>" + rs.getString(1).toUpperCase() + "</td>");
                                                            out.print("<td>" + rs.getString(2).toUpperCase() + "</td>");
                                                            out.print("<td>" + rs.getInt(3) + "</td>");
                                                            out.print("<td>" + rs.getString(4)+ "</td>");
                                                            out.print("<td>" + rs.getString(5)+ "</td>");
                                                            out.print("</tr>");
                                                            count++;
                                                        }

                                                        rs.close();
                                                        stmt.close();
                                                    } catch (Exception e) {
                                                        out.print(e);
                                                    }


                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright<sup>&#169;</sup>All rights reserved HackErena Thomson Reuters</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Jquery JS-->
        <script src="vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="vendor/slick/slick.min.js">
        </script>
        <script src="vendor/wow/wow.min.js"></script>
        <script src="vendor/animsition/animsition.min.js"></script>
        <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="vendor/circle-progress/circle-progress.min.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="vendor/select2/select2.min.js">
        </script>

        <!-- Main JS-->
        <script src="js/main.js"></script>

    </body>
</html>
