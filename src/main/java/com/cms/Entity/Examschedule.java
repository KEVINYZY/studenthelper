package com.cms.Entity;

import java.util.Date;

public class Examschedule {
    private String studentid;

    private String examname;

    private String examtime;

    private String remark;
    
    private String examplace;

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid == null ? null : studentid.trim();
    }

    public String getExamname() {
        return examname;
    }

    public void setExamname(String examname) {
        this.examname = examname == null ? null : examname.trim();
    }

    public String getExamtime() {
        return examtime;
    }

    public void setExamtime(String examtime) {
        this.examtime = examtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getExamplace() {
        return examplace;
    }

    public void setExamplace(String examplace) {
        this.examplace = examplace;
    }
}