# DMU Student Helper System


![Langeage](https://img.shields.io/badge/Langeuage-Java-yellow.svg)   ![version](https://img.shields.io/badge/Version-2.0-blue.svg)

## 大连海事大学学生校园助手

<code>2018年4月19日更新 班级功能</code>

## 项目介绍
* IDE ： Intellij IDEA
* 语言：Java
* 数据库：MySQL
* 项目管理：Maven
* 爬虫：Jsoup
* 使用Spring + Spring-MVC + MyBatis整合
* 在用户的登录等地方使用JQuery的$Ajax异步调用
* 前端来自网络


## 主要功能
* 用户的登录
* 设置课程表，首页显示当天课程
* 爬取校园学生通知 <code>http://my.dlmu.edu.cn/student/oaxstz.h</code> 并且显示详情页面
* 设置考试倒计时功能，首页显示前五条考试安排
* 个人备忘录，可在设置首页置顶
* 学生信息的修改，密码修改
* 班级论坛 同一个专业并且同班的同学能在论坛里自由发帖点赞(beta)
* 班级成员系统 能够发现和自己同班的同学 (在设置成公开的情况下)能看到同班同学的资料以及自我介绍

---
## 如何使用
* 下载本项目或者使用 <code>git clone https://github.com/Crearns/studenthelper.git</code>命令
* 打开Intellij IDEA - import project - 选中项目文件夹中的pom.xml
* 导入 src/main/java/com/cms/Mysql/database.sql
* 设置Tomcat后即可使用
* 启动本项目

 ## 项目截图


 ### 登录页面

 ![登录界面](https://i.loli.net/2018/07/18/5b4efb0f8ac8c.png)

 ### 主页

 ![主页](https://i.loli.net/2018/07/18/5b4efb0e1a2a3.png)

 ### 课表编辑

 ![课表编辑](https://i.loli.net/2018/07/18/5b4efb0e15f69.png)

 ### 考试倒计时
 
 ![考试倒计时](https://i.loli.net/2018/07/18/5b4efb0e1400c.png)
 
 ### 班级论坛

 ![班级论坛](https://i.loli.net/2018/07/18/5b4efb0e15e49.png)

 ### 学生通知

 ![学生通知](https://i.loli.net/2018/07/18/5b4efb0e1d188.png)

 ### 备忘录
 
 ![备忘录](https://i.loli.net/2018/07/18/5b4efb0e1219f.png)

 ### 个人信息

 ![个人信息](https://i.loli.net/2018/07/18/5b4efb0e166d2.png)


