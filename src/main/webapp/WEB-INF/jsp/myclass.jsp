<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/3/14
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.cms.Entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    User user = (User) session.getAttribute("user");
    String day = (String)session.getAttribute("today");
    List<User> classmenber = (List<User>)session.getAttribute("classmember");
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
    <script src="../../js/jquery-3.2.1.min.js"></script>
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
                        <img src="../../images/user.png" class="img-thumbnail" />
                        <div class="inner-text">
                            <%=user.getName()%>&nbsp;<%=user.getCollage()%>&nbsp;
                            <br />
                            <small><%=user.getGrade()%>级&nbsp;<%=user.getMajor()%>&nbsp;<%=user.getClassno()%>班 <br> <%=day%></small>
                        </div>
                    </div>
                </li>

                <li>
                    <a href="/login">主页</a>
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
                    <a class="active-menu" href="/myclass">我的班级</a>
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
                    <h1 class="page-head-line">我的班级</h1>
                    <h1 class="page-subhead-line">大家的狂欢聚集地</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">我的班级</a>
                                </li>
                                <li class=""><a href="#bbs" data-toggle="tab">班级社区</a>
                                </li>
                                <li class=""><a href="#newtopic" data-toggle="tab">新建主题</a>
                                </li>
                                <li class=""><a href="#mytopic" data-toggle="tab">我的主题</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home">
                                    <div class="col-md-12">
                                        <div class="panel panel-info">
                                            <div class="panel-body" style="padding: 2px;height: 1000px;width: 1715px; ">
                                                <div class="chat-widget-main">
                                                    <%
                                                        User member = null;
                                                        for (int i = 0; i < classmenber.size(); i++) {
                                                            member = classmenber.get(i);
                                                    %>
                                                    <a href="/memberdetail?no=<%=i%>" class="list-group-item"><%=member.getUsername() + "   " +  member.getName() + "   " + member.getSex()%></a>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="bbs">
                                    <div class="col-md-12">
                                        <div class="panel panel-info">
                                            <div class="panel-body" style="padding: 2px;height: 1000px;width: 1715px; ">
                                                <div class="col-md-12">
                                                    <div class="panel normal-table panel-default adjust-border-radius">
                                                        <div class="panel-heading adjust-border">
                                                            <h4>ADVANCE PLAN</h4>
                                                        </div>
                                                        <div class="panel-body">
                                                            <ul class="plan">

                                                            </ul>
                                                        </div> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="newtopic">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="panel panel-info">
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <input class="form-control" id="topictitle" name="topictitle"  placeholder="标题(不多于50字)" type="text">
                                                </div>
                                                <div class="form-group">
                                                    <textarea class="form-control" id="topicdetail" name="topicdetail" style="width: 1680px;height: 770px;resize:none;"></textarea>
                                                </div>
                                                <button onclick="titlecheck()" class="btn btn-success">提交</button><span id="msg" style="color:#F00;font-size:14px;"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="mytopic">
                                    <div class="col-md-12">
                                        <div class="panel panel-info">
                                            <div class="panel-body" style="padding: 2px;height: 1000px;width: 1715px; ">
                                                <div class="col-md-12">
                                                    <div class="panel normal-table panel-default adjust-border-radius">
                                                        <div class="panel-heading adjust-border">
                                                            <h4>ADVANCE PLAN</h4>
                                                        </div>
                                                        <div class="panel-body">
                                                            <ul class="plan">

                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer-sec">
    Copyright &copy; 2018 <a href="http://www.github.com/Crearns" target="_blank" title="">Creams </a>
</div>
<script type="text/javascript">
    function titlecheck() {
        if($("#topictitle").val() == "" || $("#topicdetail").val() == ""){
            $("#msg").text() == "帖子不能为空";
            return false;
        }
        if($("#topictitle").val().length > 50){
            $("#msg").text() == "标题长度多余50字";
            return false;
        }
    }
</script>
</body>
</html>
