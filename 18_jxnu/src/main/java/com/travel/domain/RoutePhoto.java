package com.travel.domain;

public class RoutePhoto {

    private Integer id;//id自增
    private Integer rId;//路线id
    private String url;//路线对应的图片资源

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "RoutePhoto{" +
                "rId=" + rId +
                ", url='" + url + '\'' +
                '}';
    }

}
