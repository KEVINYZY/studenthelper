<%@ page import="com.cms.Entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cms.Entity.Examschedule" %>
<%@ page import="com.cms.Action.TimeCalculator" %>
<%@ page import="com.cms.Entity.Inform" %>
<%--
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
    List<Inform> informs = (List<Inform>) session.getAttribute("informlist");
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
                            <%=user.getName()%>&nbsp;<%=user.getCollage()%>&nbsp;
                            <br />
                            <small><%=user.getGrade()%>级&nbsp;<%=user.getMajor()%>&nbsp;<%=user.getClassno()%>班 <br> <%=day%></small>
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
                    <a href="/memo">我的个人备忘录</a>
                </li>
                <li>
                    <a href="/inform">校学生通知</a>
                </li>
                <li>
                    <a href="#"><%=user.getName()%><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/personalInfo">我的个人信息</a>
                        </li>
                        <li>
                            <a href="/logout">注销</a>
                        </li>
                    </ul>
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
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <a href="/personalInfo">我的信息</a>
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
            <div class="col-md-8">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <i class="fa fa-bell fa-fw"></i>校学生通知
                    </div>

                    <div class="panel-body">
                        <div class="list-group">
                            <%
                                Inform inform = null;
                                for (int i = 0; i < 5; i++){
                                    inform = informs.get(i);
                            %>
                            <a href="/detail?num=<%=i%>" target="_blank" class="list-group-item">
                                <%=inform.getTitle()%>
                                <span class="pull-right text-muted small"><em><%=inform.getInfo()%></em></span>
                            </a>
                            <%
                                }
                            %>
                        </div>
                        <a href="/inform" class="btn btn-info btn-block">查看全部通知</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <a href="/coursetable">我的今日课表</a>
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
            <div class="col-md-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <a href="/examschedule">我的考试倒计时</a>
                    </div>
                    <div class="panel-body">
                        <%
                            int size = examschedules.size();
                            Examschedule examschedule = null;
                            for (int i = 0; i < 5; i++){
                                if(i < size)
                                    examschedule = examschedules.get(i);
                                else
                                    examschedule = null;
                        %>
                        <p style="color: #000000;" class="text-muted"><%=i+1%>.<%=(examschedule == null)? "" : examschedule.getExamname()%> <%=(examschedule == null)? "" : examschedule.getExamplace()%> <%=(examschedule == null)? "" : examschedule.getRemark()%> <%=(examschedule == null)? "" : TimeCalculator.TimeCalculate(examschedule.getExamtime())%></p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-info">
                        <!-- Default panel contents -->
                        <div class="panel-heading">个人备忘录</div>

                        <!-- Table -->
                        <table class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>#</th>
                                <th>Task Name</th>
                                <th>On Date</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="list-group-item-text">
                                <td>1</td>
                                <td><input type="checkbox" value="" /></td>
                                <td>100$ Pending Payment</td>
                                <td>23rd June </td>
                                <td><a href="#" class="btn btn-primary ">Just Done</a></td>
                            </tr>
                            <tr class="list-group-item-text">
                                <td>2</td>
                                <td><input type="checkbox" value="" /></td>
                                <td>200 Messages To Reply</td>
                                <td>10th November </td>
                                <td><a href="#" class="btn btn-success">Pending</a></td>
                            </tr>
                            <tr class="list-group-item-text">
                                <td>3</td>
                                <td><input type="checkbox" value="" /></td>
                                <td>90 Orders To Process</td>
                                <td>2nd December </td>
                                <td><a href="#" class="btn btn-primary">In Process</a></td>
                            </tr>
                            <tr class="list-group-item-text">
                                <td>4</td>
                                <td><input type="checkbox" value="" /></td>
                                <td>100$ Pending Payment</td>
                                <td>23rd June </td>
                                <td><a href="#" class="btn btn-danger">Just Done </a></td>
                            </tr>
                            <tr class="list-group-item-text">
                                <td>5</td>
                                <td><input type="checkbox" value="" /></td>
                                <td>200 Messages To Reply</td>
                                <td>10th November </td>
                                <td><a href="#" class="btn btn-warning">Pending</a></td>
                            </tr>
                            <tr class="list-group-item-text">
                                <td>6</td>
                                <td><input type="checkbox" value="" /></td>
                                <td>90 Orders To Process</td>
                                <td>2nd December </td>
                                <td><a href="#" class="btn btn-info">In Process</a></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
<div id="footer-sec">
    Copyright &copy; 2018 <a href="http://www.github.com/Crearns" target="_blank" title="">Creams</a>
</div>





</body>
</html>
