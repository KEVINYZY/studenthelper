<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/4/1
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>海大助手 -- 注册</title>
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
<!-- /. NAV SIDE  -->
<div id="page-inner">
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">用户注册</h1>
            <h1 class="page-subhead-line">很感谢使用海大助手，快快加入我们吧！</h1>

        </div>
    </div>
    <!-- /. ROW  -->
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-info">
                <div class="panel-body">
                    <form action="/regestersubmit" method="post" onsubmit="return checksubmit()">
                        <div class="form-group">
                            <label>学号(学号将是您的用户名)</label>&nbsp;&nbsp;<span id="existcheck" style="color:#F00;font-size:14px;text-align: center"></span>
                            <input id="username" onkeyup="existcheck()" name="username" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input id="password" name="password" class="form-control" type="password">
                        </div>
                        <div class="form-group">
                            <label>确认密码</label>
                            <input id="passwordcheck" name="passwordcheck" class="form-control" type="password">
                        </div>
                        <div class="form-group">
                            <label>学生姓名</label>
                            <input id="name" name="name" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>性别</label>
                            <select id="sex" name="sex" class="form-control">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>联系电话</label>
                            <input id="phone" name="phone" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>E-Mail</label>
                            <input id="email" name="email" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>所在学院</label>
                            <input id="collage" name="collage" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>就读专业</label>
                            <input id="major" name="major" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>所在年级</label>
                            <select id="grade" name="grade" class="form-control">
                                <option value="2018">2018</option>
                                <option value="2017">2017</option>
                                <option value="2016">2016</option>
                                <option value="2015">2015</option>
                                <option value="2014">2014</option>
                                <option value="2013">2013</option>
                                <option value="2012">2012</option>
                                <option value="2011">2011</option>
                                <option value="2010">2010</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>班级</label>
                            <select id="classno" name="classno" class="form-control">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div>
                        <span id="msg" style="color:#F00;font-size:14px;text-align: center"></span>
                        <center><button type="submit" class="btn btn-info">提交注册</button></center>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function checksubmit() {
        if($("#username").val() == "" || $("#passwordcheck").val() == "" || $("#password").val() == "" || $("#name").val() == ""
            || $("#collage").val() == "" || $("#major").val() == "" || $("#email").val() == "" || $("#phone").val() == ""){

            $("#msg").text("请填写完整信息");
            return false;
        }
        else {
            $("#msg").text("");
        }
        
        if($("#password").val() != $("#passwordcheck").val()){
            $("#msg").text("两次输入密码不一致，请确认后输入");
            return false;
        }
        else {
            $("#msg").text("");
        }
        
        if($("#existcheck").val() != ""){
            $("#existcheck").text("此学号已存在, 请确认");
            return false;
        }
    }
    
    function existcheck() {
        $.ajax({
            data:{
                username:$("#username").val()
            },
            type:"post",
            dataType:"json",
            url:"/checkusername",
            error: function (data) {
                $("#msg").text("系统错误,请重试");
                $(that).removeClass("processing");
            },
            success: function (response) {
                if(response == "exist"){
                    $("#existcheck").text("此学号已存在, 请确认");
                }
                else{
                    $("#existcheck").text("");
                }
            }
        });
    }
</script>
<div id="footer-sec">
    Copyright &copy; 2018 <a href="http://www.github.com/Crearns" target="_blank" title="">Creams</a>
</div>
</body>
</html>