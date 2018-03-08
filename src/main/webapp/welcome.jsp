<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/3/7
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>home</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <!-- JQUERY SCRIPTS -->
    <script src="js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="js/jquery.metisMenu.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="js/custom.js"></script>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">大连海事大学</a>
        </div>

    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <div class="user-img-div">
                        <img src="img/user.png" class="img-thumbnail" />
                        <div class="inner-text">
                            Jhon Deo Alex
                            <br />
                            <small>Last Login : 2 Weeks Ago </small>
                        </div>
                    </div>

                </li>


                <li>
                    <a class="active-menu" href="index.html"><i class="fa fa-dashboard "></i>主页</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-desktop "></i>UI Elements <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="panel-tabs.html"><i class="fa fa-toggle-on"></i>Tabs & Panels</a>
                        </li>
                        <li>
                            <a href="notification.html"><i class="fa fa-bell "></i>Notifications</a>
                        </li>
                        <li>
                            <a href="progress.html"><i class="fa fa-circle-o "></i>Progressbars</a>
                        </li>
                        <li>
                            <a href="buttons.html"><i class="fa fa-code "></i>Buttons</a>
                        </li>
                        <li>
                            <a href="icons.html"><i class="fa fa-bug "></i>Icons</a>
                        </li>
                        <li>
                            <a href="wizard.html"><i class="fa fa-bug "></i>Wizard</a>
                        </li>
                        <li>
                            <a href="typography.html"><i class="fa fa-edit "></i>Typography</a>
                        </li>
                        <li>
                            <a href="grid.html"><i class="fa fa-eyedropper "></i>Grid</a>
                        </li>


                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-yelp "></i>Extra Pages <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="invoice.html"><i class="fa fa-coffee"></i>Invoice</a>
                        </li>
                        <li>
                            <a href="pricing.html"><i class="fa fa-flash "></i>Pricing</a>
                        </li>
                        <li>
                            <a href="component.html"><i class="fa fa-key "></i>Components</a>
                        </li>
                        <li>
                            <a href="social.html"><i class="fa fa-send "></i>Social</a>
                        </li>

                        <li>
                            <a href="message-task.html"><i class="fa fa-recycle "></i>Messages & Tasks</a>
                        </li>


                    </ul>
                </li>
                <li>
                    <a href="table.html"><i class="fa fa-flash "></i>Data Tables </a>

                </li>
                <li>
                    <a href="#"><i class="fa fa-bicycle "></i>Forms <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">

                        <li>
                            <a href="form.html"><i class="fa fa-desktop "></i>Basic </a>
                        </li>
                        <li>
                            <a href="form-advance.html"><i class="fa fa-code "></i>Advance</a>
                        </li>


                    </ul>
                </li>
                <li>
                    <a href="gallery.html"><i class="fa fa-anchor "></i>Gallery</a>
                </li>
                <li>
                    <a href="error.html"><i class="fa fa-bug "></i>Error Page</a>
                </li>
                <li>
                    <a href="login.html"><i class="fa fa-sign-in "></i>Login Page</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap "></i>Multilevel Link <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#"><i class="fa fa-bicycle "></i>Second Level Link</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-flask "></i>Second Level Link</a>
                        </li>
                        <li>
                            <a href="#">Second Level Link<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="#"><i class="fa fa-plus "></i>Third Level Link</a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-comments-o "></i>Third Level Link</a>
                                </li>

                            </ul>

                        </li>
                    </ul>
                </li>
                <li>
                    <a href="blank.html"><i class="fa fa-square-o "></i>Blank Page</a>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
        </div>
    </div>
</div>
<div id="footer-sec">
    Copyright &copy; 2018.<a href="#" target="_blank" title="">Creams </a>
</div>





</body>
</html>
