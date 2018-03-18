<%@ page import="com.cms.Entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.cms.Entity.Examschedule" %><%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/3/7
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    User user = (User) session.getAttribute("user");
    List<String> todaytable = (List<String>)session.getAttribute("todaytable");
    String day = (String)session.getAttribute("today");
    List<Examschedule> examschedules = (List<Examschedule>)session.getAttribute("examschedule");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>海大助手 -- <%=user.getName()%></title>
    <!-- BOOTSTRAP STYLES-->
    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="../../css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="../../css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="../../css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- JQUERY SCRIPTS -->
    <script src="../../js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="../../js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="../../js/jquery.metisMenu.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="../../js/custom.js"></script>
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
            <a class="navbar-brand" href="#">大连海事大学</a>
        </div>
    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <div class="user-img-div">
                        <img src="images/user.png" class="img-thumbnail" />
                        <div class="inner-text">
                            <%=user.getName()%>
                            <br />
                            <small><%=user.getCollage()%>&nbsp;<%=user.getMajor()%> <%=user.getGrade()%>级<%=user.getClassno()%>班 <br> <%=day%></small>
                        </div>
                    </div>
                </li>

                <li>
                    <a class="active-menu" href="/login">主页</a>
                </li>
                <li>
                    <a href="#">我的学习<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/coursetable">我的课表</a>
                        </li>
                        <li>
                            <a href="/examschedule">我的考试倒计时</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">我的社团</a>
                </li>
                <li>
                    <a href="#">我的个人备忘录</a>
                </li>
                <li>
                    <a href="#">校学生通知</a>
                </li>
                <li>
                    <a href="#"><%=user.getName()%><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#">我的个人信息</a>
                        </li>
                        <li>
                            <a href="/logout">注销</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">UI Elements <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#">Tabs & Panels</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">Blank Page</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-head-line">我的主页</h1>
                    <h1 class="page-subhead-line">看看今天有哪些需要关心的事儿吧！</h1>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        我的信息
                    </div>
                    <div class="panel-body">
                        <h4>学校:大连海事大学</h4>
                        <h4>学号:<%=user.getUsername()%></h4>
                        <h4>姓名:<%=user.getName()%></h4>
                        <h4>性别:<%=user.getSex()%></h4>
                        <h4>学院:<%=user.getCollage()%></h4>
                        <h4>专业:<%=user.getMajor()%></h4>
                        <h4>年级:<%=user.getGrade()%>级</h4>
                        <h4>班级:<%=user.getClassno()%>班</h4>
                        <h4>属性:<%=(user.getIdentity() == 1) ? "学生" : "教职工"%></h4>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <i class="fa fa-bell fa-fw"></i>我的通知
                    </div>

                    <div class="panel-body">
                        <div class="list-group">
                            <a href="#" class="list-group-item">
                                3 New Followers
                                <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                Message Sent
                                <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                New Task
                                <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                New Task
                                <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                New Task
                                <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                            </a>
                        </div>
                        <a href="#" class="btn btn-info btn-block">查看全部消息</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        我的今日课表
                    </div>
                    <div class="panel-body">
                        <p class="text-muted">1-2节 08:00-09:35 <%=todaytable.get(0)%></p>
                        <p class="text-muted">3-4节 10:00-11:35 <%=todaytable.get(1)%></p>
                        <p class="text-muted">5-6节 13:30-15:05 <%=todaytable.get(2)%></p>
                        <p class="text-muted">7-8节 15:30-17:05 <%=todaytable.get(3)%></p>
                        <p class="text-muted">9-10节 18:00-19:35 <%=todaytable.get(4)%></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        我的个人备忘录
                    </div>
                    <div class="panel-body">
                        <p class="text-muted">TO BE WRITTEN</p>
                        <p class="text-muted">TO BE WRITTEN</p>
                        <p class="text-muted">TO BE WRITTEN</p>
                        <p class="text-muted">TO BE WRITTEN</p>
                        <p class="text-muted">TO BE WRITTEN</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        我的考试倒计时
                    </div>
                    <div class="panel-body">
                        <%
                            for (int i = 0; i < 5; i++) {
                                Examschedule examschedule = examschedules.get(i);
                        %>
                        <p class="text-muted"><%=i + 1%>.<%=(examschedule == null) ? examschedule.getExamname() + "-" + examschedule.getExamtime() + "-" + examschedule.getExamplace() : "-"%></p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer-sec">
    Copyright &copy; 2018 <a href="#" target="_blank" title="">Creams </a>
</div>





</body>
</html>
