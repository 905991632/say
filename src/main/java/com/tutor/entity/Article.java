package com.tutor.entity;

import java.util.Date;

public class Article {
    private Integer id;

    private Integer userid;

    private String title;

    private String content;

    private String picture;

    private Date createtime;

    private Integer commentamount;

    private Integer collectamount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getCommentamount() {
        return commentamount;
    }

    public void setCommentamount(Integer commentamount) {
        this.commentamount = commentamount;
    }

    public Integer getCollectamount() {
        return collectamount;
    }

    public void setCollectamount(Integer collectamount) {
        this.collectamount = collectamount;
    }
}