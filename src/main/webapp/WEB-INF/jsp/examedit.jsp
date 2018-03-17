<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/3/14
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.cms.Entity.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    User user = (User) session.getAttribute("user");
    String day = (String)session.getAttribute("today");
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
                    <a href="/login">主页</a>
                </li>
                <li>
                    <a href="#">我的学习<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/coursetable">我的课表</a>
                        </li>
                        <li>
                            <a class="active-menu" href="/examschedule">我的考试倒计时</a>
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
                    <h1 class="page-head-line">我的考试倒计时</h1>
                    <h1 class="page-subhead-line">关注考试 稳扎稳打不用慌！</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            添加考试
                        </div>
                        <div class="panel-body">
                            <form action="/submitexam">
                                <div class="form-group">
                                    <label>考试科目</label>
                                    <input name="examsubject" class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label>考试时间</label>
                                    <input name="date" class="form-control" type="datetime-local">
                                    <p class="help-block"></p>
                                </div>
                                <div class="form-group">
                                    <label>考试考试地点</label>
                                    <input name="place" class="form-control" type="text">
                                    <p class="help-block"></p>
                                </div>
                                <div class="form-group">
                                    <label>考试备注</label>
                                    <textarea name="remark" style="resize:none" class="form-control" rows="3"></textarea>
                                </div>
                                <center><button type="submit" class="btn btn-success">确认添加</button> <a href="/examschedule" class="btn btn-default">返回列表</a> </center>
                            </form>
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