

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
        <title>User-Dashboard</title>

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

    </head>

    <body class="animsition">
        <div class="page-wrapper">

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
                                <a href="user_report.jsp">
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
                                    <div class="card">
                                        <div class="card-header"><center><h3><b>F</b>irst <b>T</b>ime <b>M</b>edical <b>R</b>eport</h3></center></div>
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h3 class="text-center title-2">FTMI</h3>
                                            </div>


                                            <%
                                                String name = null;
                                                String address = null;
                                                String email = null;
                                                String dob = null;
                                                String gender = null;
                                                String bloodGroup = null;
                                                int contactNo = 0;
                                                int totalMember = 0;
                                                String allergies = null;
                                                String illness = null;
                                                String pastsur = null;
                                                String immune = null;
                                                session = request.getSession(false);
                                                String n = (String) session.getAttribute("uname");
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/GlsJPraYl3", "GlsJPraYl3", "QWoTqG7IK0");

                                                Statement stmt = con.createStatement();
                                                ResultSet rs = stmt.executeQuery("select * from ftmi_details where name='" + n + "'");
                                                if (rs.next()) {
                                                    name = rs.getString(1);
                                                    address = rs.getString(2);
                                                    contactNo = rs.getInt(3);
                                                    email = rs.getString(4);
                                                    dob = rs.getString(5);
                                                    gender = rs.getString(6);
                                                    bloodGroup = rs.getString(7);
                                                    totalMember = rs.getInt(8);
                                                    allergies = rs.getString(10);
                                                    illness = rs.getString(11);
                                                    pastsur = rs.getString(12);
                                                    immune = rs.getString(13);

                                                }
                                            %>
                                            <hr width="100%"><center><label for="cc-number" class="control-label mb-1"><b><%=name%>'s Personal Details:</b></label></center><hr><br>
                                            <form>
                                                <img class="profile image" src="images/Report/Dhru.png">
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1"><b>Name</b></label>
                                                            <input id="cc-pament" name="name" type="text" value="<%=name%>" class="form-control"
                                                                   aria-required="true" aria-invalid="false" disabled>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group has-success">
                                                            <label for="cc-name" class="control-label mb-1"><b>Address</b></label>
                                                            <input id="cc-name" name="address" type="text"
                                                                   class="form-control cc-name valid" value="<%=address%>" disabled>
                                                            <span class="help-block field-validation-valid"
                                                                  data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <label for="cc-number" class="control-label mb-1"><b>Contact No</b></label>
                                                            <input id="cc-number" name="c-number" type="text" value="<%= contactNo%>"
                                                                   class="form-control" disabled>
                                                            <span class="help-block" data-valmsg-for="cc-number"
                                                                  data-valmsg-replace="true"></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <label for="cc-number" class="control-label mb-1"><b>Email</b> </label>
                                                            <input id="cc-number" name="c-email" type="email" value="<%= email%>"
                                                                   class="form-control cc-number identified visa" disabled>
                                                            <span class="help-block" data-valmsg-for="cc-number"
                                                                  data-valmsg-replace="true"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <label for="cc-number" class="control-label mb-1"><b>DOB</b></label>
                                                            <input id="cc-number" name="dob" type="date"
                                                                   class="form-control cc-number identified visa" value="<%= dob%>" disabled>
                                                            <span class="help-block" data-valmsg-for="cc-number"
                                                                  data-valmsg-replace="true"></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <label for="cc-number" class="control-label mb-1"><b>Gender</b></label>
                                                            <input id="cc-number" name="gender" type="text"
                                                                   class="form-control cc-number identified visa" value="<%= gender%>" disabled>
                                                            <span class="help-block" data-valmsg-for="cc-number"
                                                                  data-valmsg-replace="true"></span>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <label for="cc-number" class="control-label mb-1"><b>Blood Group</b></label>
                                                            <input id="cc-number" name="bloodgroup" type="text"
                                                                   class="form-control cc-number identified visa" value="<%= bloodGroup%>" disabled>
                                                            <span class="help-block" data-valmsg-for="cc-number"
                                                                  data-valmsg-replace="true"></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="form-group">
                                                            <label for="cc-number" class="control-label mb-1"><b>Total Family members</b></label>
                                                            <input id="cc-number" name="total-member" type="text"
                                                                   class="form-control cc-number identified visa" value="<%=totalMember%>" disabled>
                                                            <span class="help-block" data-valmsg-for="cc-number"
                                                                  data-valmsg-replace="true"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>


                                                <hr width="100%">
                                                <div class="form-group">
                                                    <label for="cc-number" class="control-label mb-1"><b>Allergies</b></label>
                                                    <input id="cc-number" name="total-member" type="text"
                                                           class="form-control cc-number identified visa" value="<%=allergies%>" disabled>
                                                    <span class="help-block" data-valmsg-for="cc-number"
                                                          data-valmsg-replace="true"></span>
                                                </div>
                                                <hr width="100%">
                                                <div class="form-group">
                                                    <label for="cc-number" class="control-label mb-1"><b>Illness And Diseases patient Commonly face:</b></label><br>
                                                    <input id="cc-number" name="total-member" type="text"
                                                           class="form-control cc-number identified visa" value="<%=illness%>" disabled>
                                                </div>
                                                <hr width="100%">
                                                <div class="form-group">
                                                    <label for="cc-number" class="control-label mb-1"><b>Past Surgeries:</b></label><br>
                                                    <input id="cc-number" name="total-member" type="text"
                                                           class="form-control cc-number identified visa" value="<%=pastsur%>" disabled>
                                                </div>
                                                <hr width="100%">
                                                <div class="form-group">
                                                    <label for="cc-number" class="control-label mb-1"><b><h4>Click on Yes/No accordingly if you face any of the following symptoms most oftenly:</b></h4></label><br><br>
                                                    <h5>1) Frequent and recurrent pneumonia</h5><br>
                                                    <h5>2) Bronchitis,sinus infections, ear infections, meningitis or skin infections</h5><br>
                                                    <h5>3) Inflammation and infection of internal organs</h5><br>
                                                    <h5>4) Blood disorders, such as low platelet counts or anemia</h5><br>
                                                    <h5>5) Digestive problems, such as cramping, loss of appetite, nausea and diarrhea</h5><br>
                                                    <h5>6) Delayed growth and development</h5><br>
                                                    <h5>7) Autoimmune disorders, such as lupus, rheumatoid arthritis or type 1 diabetes</h5><br>
                                                    <input id="cc-number" name="total-member" type="text"
                                                           class="form-control cc-number identified visa col-2" value="<%=immune%>" disabled>
                                                    <br>
                                                </div>

                                                <div>
                                                    <button id="payment-button" onclick="print()"
                                                            class="btn btn-lg btn-info btn-block">
                                                        <i class="fa fa-lock fa-lg"></i>&nbsp;
                                                        <span id="payment-button-amount">Print</span>
                                                        <span id="payment-button-sending"
                                                              style="display:none;">Sending?</span>
                                                    </button>
                                                </div>
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
