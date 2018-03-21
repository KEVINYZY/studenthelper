package com.cms.Entity;

public class Inform {
    private String title;
    private String info;
    private String pbox;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getPbox() {
        return pbox;
    }

    public void setPbox(String pbox) {
        this.pbox = pbox;
    }

    @Override
    public String toString() {
        return this.getTitle() + "-" + this.getInfo() + "-";
    }
}
