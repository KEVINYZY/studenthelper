<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/3/5
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>海大助手 -- 登录</title>
    <link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Lambent Login Form Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
<h1>海大助手</h1>
<div class="main-agileinfo">
    <h2>登录</h2>
    <form action="##" method="post" id="loginform" onsubmit="return false">
        <input type="text" id="username" name="username" class="name" placeholder="username" required="">
        <input type="password" id="password" name="password" class="password" placeholder="password" required="">
        <span id="msg" style="color:#F00;font-size:14px;"></span><br><br>
        <ul>
            <li>
                <input type="checkbox" id="brand1" value="">
                <label for="brand1"><span></span>记得我</label>
            </li>
        </ul>
        <a href="#">忘记密码?
        </a><br>
        <div class="clear"></div>
        <input type="button" id="submit" value="Login" onclick="login()">
    </form>
</div>
<div class="footer-w3l">
    <p class="agile">Copyright &copy; 2018 <a href="#">Creams</a></p>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
        function login(that) {
            $.ajax({
                data: {
                    username:$("#username").val(),
                    password:$("#password").val()
                },
                type: "post",
                url: "/checklogin",
                dataType: "json",
                error: function (data) {
                    console.log(data);
                    $(that).removeClass("processing");
                },
                success: function (response) {
                    $(that).removeClass("processing");
                    if (response == "error") {
                        $("#msg").text("用户名或密码错误");
                    } else {
                        window.location.href = "/welcome";
                    }
                }
            });
        }
</script>
</body>
</html>