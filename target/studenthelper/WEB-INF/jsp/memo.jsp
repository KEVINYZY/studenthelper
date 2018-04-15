<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/3/14
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.cms.Entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cms.Entity.Memo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    User user = (User) session.getAttribute("user");
    String day = (String)session.getAttribute("today");
    List<Memo> memoList = (List<Memo>)session.getAttribute("memolist");
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
                        <img src="images/user.png" class="img-thumbnail" />
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
                    <a href="/myclass">我的班级</a>
                </li>
                <li>
                    <a class="active-menu" href="/memo">我的个人备忘录</a>
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
                    <h1 class="page-head-line">我的个人备忘录</h1>
                    <h1 class="page-subhead-line">经常忘事儿? 它能帮你!</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            备忘录
                        </div>
                        <div class="panel-body" style="padding: 2px;height: 502px; ">
                            <div class="chat-widget-main">
                                <%
                                    Memo memo = null;
                                    for (int i = 0; i < memoList.size(); i++) {
                                        memo = memoList.get(i);
                                %>
                                <a onclick="check(<%=i%>)" class="list-group-item"><%=memo.getTitle()%></a>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                备忘录详情&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="add()" class="btn btn-inverse"><i class="glyphicon glyphicon-plus"></i></button>
                            </div>
                            <div class="panel-body" style="padding: 0px;height: 460px;">
                                <div class="chat-widget-main">
                                    <input id="title" placeholder="标题" type="text" style="width: 820px;height: 45px"><br><br>
                                    <textarea id="detail" style="resize:none;height: 325px;width: 820px;"></textarea>
                                    <span id="msg" style="color:#F00;font-size:14px;text-align: center"></span>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="input-group">
                                    置顶首页<input id="home" type="checkbox" name="stick"/>
                                    <span class="input-group-btn">
                                    <button onclick="return submitcheck()" class="btn btn-success" style="width: 110px;" type="button">保存</button>
                                    <button onclick="deletememo()" class="btn btn-danger" style="width: 110px;" type="button">删除</button>
                                </span>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    var select = "-1";
    var title = document.getElementById("title");
    var detail = document.getElementById("detail");
    var ishome = document.getElementById("home");
    
    
    function check(i) {
        select = i;
        $.ajax({
            data: {
                selectnum:select
            },
            type: "post",
            url: "/getselect",
            dataType: "json",
            error: function (data) {
                alert("系统错误 请重试" + data + select);
                $(that).removeClass("processing");
            },
            success: function (response) {
                data = response.split("/*/");
                title.value = data[0];
                detail.value = data[1];
                if(data[2] == "1")
                    ishome.checked = true;
                else
                    ishome.checked = false;
            }
        });
    }

    function add() {
        select = "new";
        ishome.checked = false;
        title.value = "";
        detail.value = "";
    }
    
    function submitcheck() {
        var title = $("#title").val();
        var detail = $("#detail").val();
        var ishome = document.getElementById("home");
        if(select == "-1"){
            $("#msg").text("请选择备忘录再进行编辑" + select);
            return false;
        }
        if (title == "" || detail == "" ) {
            $("#msg").text("请填写完整信息");
            return false;
        }
        if($("#detail").val().length > 1000){
            $("#msg").text("备注长度超过1000字");
            return false;
        }
        $.ajax({
            data:{
                title:$("#title").val(),
                detail:$("#detail").val(),
                select:select,
                home:ishome.checked
            },
            type:"post",
            url:"/submitmemo",
            dataType:"json",
            error:function (data) {
                alert("系统错误 请重试" + data + select);
            },
            success:function (response) {
                if(response == "success"){
                    alert("操作成功");
                    window.location.href = "/memo";
                }
            }
        });
    }
    
    function deletememo() {
        if(select == "-1" || select == "new"){
            $("#msg").text("请选择目标备忘录");
            return false;
        }
        $.ajax({
            data:{
                select:select
            },
            type:"post",
            url:"/deletememo",
            dataType:"json",
            error:function (data) {
                alert("系统错误 请重试" + data + select);
                $(that).removeClass("processing");
            },
            success:function (response) {
                if(response == "success"){
                    alert("操作成功");
                    window.location.href = "/memo";
                }
            }
        });
    }
</script>
<div id="footer-sec">
    Copyright &copy; 2018 <a href="http://www.github.com/Crearns" target="_blank" title="">Creams </a>
</div>

</body>
</html>
