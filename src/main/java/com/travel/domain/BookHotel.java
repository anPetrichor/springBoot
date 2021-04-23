package com.travel.domain;

public class BookHotel {

    private Integer id;//预定id
    private String num;//订单号
    private Integer userId;//用户id
    private Integer hotelId;//酒店id
    private String liveTime;//入住时间
    private String leaveTime;//离开时间
    private Integer peopleCount;//入住人数
    private Double price;//价格
    private Integer status;//状态
    private Integer payType;//支付方式
    private String createTime;//预定创建时间

    private UserInfo userInfo;
    private Hotel hotel;

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getHotelId() {
        return hotelId;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    public String getLiveTime() {
        return liveTime;
    }

    public void setLiveTime(String liveTime) {
        this.liveTime = liveTime;
    }

    public String getLeaveTime() {
        return leaveTime;
    }

    public void setLeaveTime(String leaveTime) {
        this.leaveTime = leaveTime;
    }

    public Integer getPeopleCount() {
        return peopleCount;
    }

    public void setPeopleCount(Integer peopleCount) {
        this.peopleCount = peopleCount;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "BookHotel{" +
                "id=" + id +
                ", num='" + num + '\'' +
                ", userId=" + userId +
                ", hotelId=" + hotelId +
                ", liveTime='" + liveTime + '\'' +
                ", leaveTime='" + leaveTime + '\'' +
                ", peopleCount=" + peopleCount +
                ", price=" + price +
                ", status=" + status +
                ", payType=" + payType +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}
