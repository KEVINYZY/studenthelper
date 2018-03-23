<%@ page import="com.cms.Entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cms.Entity.Coursetable" %><%--
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
    List<Coursetable> coursetables = (List<Coursetable>)session.getAttribute("Coursetable");
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
                        <img src="../../images/user.png" class="img-thumbnail" />
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
                    <a href="#" class="active-menu-top">我的学习<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse in ">
                        <li>
                            <a class="active-menu" href="/coursetable">我的课表</a>
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
                    <h1 class="page-head-line">我的课表</h1>
                    <h1 class="page-subhead-line">看准课表 今天又是元气满满的一天！</h1>
                    <div class="panel-heading">
                        <%=user.getName()%>&nbsp;&nbsp;
                        <%=user.getUsername()%>&nbsp;&nbsp;
                        <%=user.getCollage()%>&nbsp;&nbsp;
                        <%=user.getMajor()%>&nbsp;&nbsp;
                        <%=user.getGrade()%>级
                        <%=user.getClassno()%>班
                    </div>
                    <form action="/submitcoursetable">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th></th>
                                <th>星期一</th>
                                <th>星期二</th>
                                <th>星期三</th>
                                <th>星期四</th>
                                <th>星期五</th>
                                <th>星期六</th>
                                <th>星期日</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(int i = 0; i < 5; i++){
                                    Coursetable coursetable = coursetables.get(i);
                            %>
                            <tr>
                                <td>第<%= 2 * coursetable.getclassNo() - 1%> - <%=2 * coursetable.getclassNo()%>节课</td>
                                <td><textarea name=<%=(i+1) + "Mon"%> style="resize:none"><%=coursetable.getMon()%></textarea></td>
                                <td><textarea name=<%=(i+1) + "Tue"%> style="resize:none"><%=coursetable.getTue()%></textarea></td>
                                <td><textarea name=<%=(i+1) + "Wed"%> style="resize:none"><%=coursetable.getWed()%></textarea></td>
                                <td><textarea name=<%=(i+1) + "Thu"%> style="resize:none"><%=coursetable.getThu()%></textarea></td>
                                <td><textarea name=<%=(i+1) + "Fri"%> style="resize:none"><%=coursetable.getFri()%></textarea></td>
                                <td><textarea name=<%=(i+1) + "Sat"%> style="resize:none"><%=coursetable.getSat()%></textarea></td>
                                <td><textarea name=<%=(i+1) + "Sun"%> style="resize:none"><%=coursetable.getSun()%></textarea></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                        <center><button type="submit" class="btn btn-inverse">提交编辑</button></a>&nbsp;&nbsp;<button class="btn btn-inverse">返回课表</button></center>
                    </form>
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
