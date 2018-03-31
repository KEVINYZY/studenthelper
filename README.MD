# DMU Student Helper System

## 大连海事大学学生校园助手



## 项目介绍
* IDE ： Intellij IDEA
* 语言：Java
* 数据库：MySQL
* 项目管理：Maven
* 爬虫：Jsoup
* 使用Spring + Spring-MVC + MyBatis整合
* 在用户的登录等地方使用JQuery的$Ajax异步调用


## 主要功能
* 用户的登录
* 设置课程表，首页显示当天课程
* 爬取校园学生通知 <code>http://my.dlmu.edu.cn/student/oaxstz.h</code> 并且显示详情页面
* 设置考试倒计时功能，首页显示前五条考试安排
* 个人备忘录，可在设置首页置顶
* 学生信息的修改，密码修改

---
## 如何使用
* 下载本项目或者使用 <code>git clone https://github.com/Crearns/studenthelper.git</code>命令
* 打开Intellij IDEA - import project - /pom.xml
* 导入database.sql
* 设置Tomcat后即可使用

 