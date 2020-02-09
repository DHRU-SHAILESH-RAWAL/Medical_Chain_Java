<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">


        <!-- Title Page-->
        <title>Medical-Reports</title>

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
        <style>
            .profile {
                position: absolute;
                right: 80px;
                height: 250px;
                width: 200px;
                margin-top: 20px;
                border: 2px solid black;
                border-radius: 5px;
            }

            .card-header {
                background-color: #0e62ca;
            }

            .card-header h3 {
                color: #f8f9fa;
                font-weight: lighter;
            }
        </style>
        <!-- Main CSS-->
        <link href="css/theme.css" rel="stylesheet" media="all">



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
                        <ul class="list-unstyled navbar__list">
                            <li class="active">
                                <a href="#">
                                    <i class="far fa-check-square"></i><b>Home</b></a>
                            </li>
                            <li>
                                <a href="FTMI.html">
                                    <i class="far fa-check-square"></i><b>FTMI</b></a>
                            </li>
                            <li>
                                <a href="addsp.html">
                                    <i class="far fa-check-square"></i><b>Scan QR</b></a>
                            </li>
                            <li>
                                <a href="addsp.html">
                                    <i class="far fa-check-square"></i><b>List of Authorized Organizations</b></a>
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
                            <li>
                                <a href="Scan_QR_Dashboard.jsp">
                                    <i class="fas fa-tachometer-alt"></i><b>Home</b></a>
                            </li>
                            <li>
                                <a href="Get_FTMI.jsp">
                                    <i class="far fa-check-square"></i><b>GET_FTMI</b></a>
                            </li>
                            <li>
                                <a href="Update_FTMI.jsp">
                                    <i class="far fa-check-square"></i><b>Update FTMI</b></a>
                            </li>
                            <li  class="active">
                                <a href="Medical_Reports.jsp">
                                    <i class="far fa-check-square"></i><b>Medical Reports</b></a>
                            </li>
                            <li>
                                <a href="FTMI.html">
                                    <i class="far fa-check-square"></i><b>Back to Dashboard</b></a>
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
                                                <a class="js-acc-btn" href="#">Setting</a>
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
                                    <div class="card">
                                        <div class="card-header"><center><h3><b>F</b>irst <b>T</b>ime <b>M</b>edical <b>R</b>eport</h3></center></div>
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h3 class="text-center title-2">FTMI</h3>
                                            </div>



                                            <hr width="100%"><center><label for="cc-number" class="control-label mb-1"><b> Report Maintenance:</b></label></center>
                                            <div class="col-3">
                                                <form>
                                                    <button id="payment-button"
                                                            class="btn btn-lg btn-info btn-block">
                                                        +
                                                        <span id="payment-button-amount">Add Report</span><input type="file" style="display: none"/>
                                                        <span id="payment-button-sending"
                                                              style="display:none;">Sending?</span>
                                                    </button>
                                                </form>
                                            </div><hr><br>
                                            <form>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <embed src="images/Report/1.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/1.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group has-success">
                                                            <embed src="images/Report/2.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/2.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group has-success">
                                                            <embed src="images/Report/3.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/3.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <embed src="images/Report/4.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/4.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <embed src="images/Report/5.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/5.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group has-success">
                                                            <embed src="images/Report/6.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/6.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <embed src="images/Report/1.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/1.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <embed src="images/Report/2.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/2.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group has-success">
                                                            <embed src="images/Report/3.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/3.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <embed src="images/Report/4.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/4.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <embed src="images/Report/5.pdf" width="200px" height="200px" />
                                                            <h5><a href="images/Report/5.pdf" target="_blank">Report View</a></h5>
                                                        </div>
                                                    </div>

                                                </div>
                                                <br>

                                            </form>
                                        </div>
                                    </div>
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
<!-- end document-->