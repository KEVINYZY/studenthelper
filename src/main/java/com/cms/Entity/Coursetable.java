package com.cms.Entity;

public class Coursetable{
    private String studentid;
    
    private int classNo;
    
    private String mon;

    private String tue;

    private String wed;

    private String thu;

    private String fri;

    private String sat;

    private String sun;

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentID) {
        this.studentid = studentID;
    }

    public int getclassNo() {
        return classNo;
    }

    public void setclassNo(int order) {
        this.classNo = order;
    }

    public String getMon() {
        return mon;
    }

    public void setMon(String mon) {
        this.mon = mon == null ? null : mon.trim();
    }

    public String getTue() {
        return tue;
    }

    public void setTue(String tue) {
        this.tue = tue == null ? null : tue.trim();
    }

    public String getWed() {
        return wed;
    }

    public void setWed(String wed) {
        this.wed = wed == null ? null : wed.trim();
    }

    public String getThu() {
        return thu;
    }

    public void setThu(String thu) {
        this.thu = thu == null ? null : thu.trim();
    }

    public String getFri() {
        return fri;
    }

    public void setFri(String fri) {
        this.fri = fri == null ? null : fri.trim();
    }

    public String getSat() {
        return sat;
    }

    public void setSat(String sat) {
        this.sat = sat == null ? null : sat.trim();
    }

    public String getSun() {
        return sun;
    }

    public void setSun(String sun) {
        this.sun = sun == null ? null : sun.trim();
    }
}