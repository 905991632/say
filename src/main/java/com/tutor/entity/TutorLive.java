package com.tutor.entity;

import java.util.Date;

public class TutorLive {
    private Integer id;

    private Integer teacherid;

    private Integer permission;

    private String rtmpurl;

    private String rtmpkey;

    private Date createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(Integer teacherid) {
        this.teacherid = teacherid;
    }

    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
    }

    public String getRtmpurl() {
        return rtmpurl;
    }

    public void setRtmpurl(String rtmpurl) {
        this.rtmpurl = rtmpurl == null ? null : rtmpurl.trim();
    }

    public String getRtmpkey() {
        return rtmpkey;
    }

    public void setRtmpkey(String rtmpkey) {
        this.rtmpkey = rtmpkey == null ? null : rtmpkey.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}