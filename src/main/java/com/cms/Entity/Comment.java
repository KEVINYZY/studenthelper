package com.cms.Entity;

public class Comment {
    private String studentname;

    private String comment;

    private String topicstudentid;

    private String createtime;

    private String commentstudentid;

    private String commenttime;

    public String getTopicstudentid() {
        return topicstudentid;
    }

    public void setTopicstudentid(String topicstudentid) {
        this.topicstudentid = topicstudentid == null ? null : topicstudentid.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public String getCommentstudentid() {
        return commentstudentid;
    }

    public void setCommentstudentid(String commentstudentid) {
        this.commentstudentid = commentstudentid == null ? null : commentstudentid.trim();
    }

    public String getCommenttime() {
        return commenttime;
    }

    public void setCommenttime(String commenttime) {
        this.commenttime = commenttime == null ? null : commenttime.trim();
    }

    public String getStudentname() {
        return studentname;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname == null ? null : studentname.trim();
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }
}